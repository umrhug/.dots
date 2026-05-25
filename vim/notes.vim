" ====================================================================
" 1. 共通設定（保存先と高速検索エンジンの指定）
" ====================================================================
let g:notes_dir = expand('~/.notes/')

" bash環境で最も高速かつ画面を汚さないgrep設定
if executable('rg')
  let &grepprg = 'rg --vimgrep --smart-case'
else
  let &grepprg = 'grep -nH'
endif

" ====================================================================
" 2. 日付ファイルを開く・一覧から選ぶコマンド
" ====================================================================
command! -nargs=? OpenNote call s:open_note_file(<q-args>)
command! NoteList call s:note_list_and_search()

function! s:open_note_file(argv)
  let l:date = empty(a:argv) ? strftime('%Y%m%d') : a:argv
  let l:filepath = g:notes_dir . l:date . '.md'
  if !isdirectory(g:notes_dir) | call mkdir(g:notes_dir, 'p') | endif
  execute 'edit ' . l:filepath
endfunction

function! s:note_list_and_search()
  if !isdirectory(g:notes_dir) | return | endif
  let l:files = split(globpath(g:notes_dir, '*.md'), "\n")
  call reverse(sort(l:files))
  if empty(l:files) | echo "Not found a file" | return | endif

  let l:display_list = []
  let l:n = 1
  for l:file in l:files
    let l:filename = fnamemodify(l:file, ':t')
    let l:first_line = get(readfile(l:file, '', 1), 0, '(No Contents)')
    call add(l:display_list, printf("[%d] %s - %s", l:n, l:filename, l:first_line))
    let l:n += 1
  endfor

  echo join(l:display_list, "\n")
  """"let l:choice = input('開く番号、または [/検索キーワード] を入力: ')
  let l:choice = input('Input the number to open, or search the keyword [/keyword]: ')
  if empty(l:choice) | return | endif

  if l:choice[0] ==# '/'
    call s:search_note(l:choice[1:])
    return
  endif

  let l:n = str2nr(l:choice) - 1
  if l:n >= 0 && l:n < len(l:files)
    execute 'edit ' . l:files[l:n]
  endif
endfunction

" ====================================================================
" 3. 【bash対応】画面ログを残さない高速検索処理
" ====================================================================
function! s:search_note(keyword)
  if empty(a:keyword) | return | endif
  
  " 1. silent! で外部bashへの出力を完全にシャットアウト
  """execute 'silent! grep! ' . shellescape(a:keyword) . ' ' . g:notes_dir . '*.md'
  execute 'silent! vimgrep! /' . a:keyword . '/j  ' . g:notes_dir . '*.md'
  
  " 2. 外部コマンド実行直後に画面を強制再描画（これでゴミが完全に消えます）
  redraw!

  if empty(getqflist())
    """echo "マッチするファイルが見つかりませんでした: " . a:keyword
    echo "Not found the files including the keyword: " . a:keyword
  else
    copen
  endif
endfunction

" ====================================================================
" 4. ポップアッププレビュー & キーマッピング（Enterで決定、qで閉じる）
" ====================================================================
augroup QfPreviewAndMap
  autocmd!
  autocmd FileType qf autocmd CursorMoved <buffer> nested call s:qf_popup_preview()
  autocmd FileType qf autocmd BufWinLeave <buffer> call s:close_popup_preview()
  autocmd FileType qf nnoremap <buffer> <CR> :call <SID>qf_accept()<CR>
  autocmd FileType qf nnoremap <buffer> q :call <SID>qf_cancel()<CR>
augroup END

let s:preview_winid = 0

function! s:qf_popup_preview()
  call s:close_popup_preview()
  let l:qf_list = getqflist()
  let l:n = line('.') - 1
  if l:n >= 0 && l:n < len(l:qf_list)
    let l:item = l:qf_list[l:n]
    let l:lines = getbufline(l:item.bufnr, 1, '$')
    if empty(l:lines) && filereadable(bufname(l:item.bufnr))
      let l:lines = readfile(bufname(l:item.bufnr))
    endif
    if !empty(l:lines)
      let l:start = max([0, l:item.lnum - 4])
      let l:end = min([len(l:lines) - 1, l:item.lnum + 2])
      if has('nvim')
      	let l:opts = {'relative':'cursor', 'row':1, 'col':0, 'width':40, 'height':5, 'border':'single'}
      	let l:buf = nvim_create_buf(v:false, v:true)
      	call nvim_buf_set_lines(l:buf, 0, -1, v:true, l:lines[l:start : l:end])
      	call nvim_open_win(l:buf, v:true, l:opts)
      else
	let s:preview_winid = popup_atcursor(l:lines[l:start : l:end], {
      	      \ 'pos': 'botleft',
      	      \ 'line': 'cursor-1',
      	      \ 'col': 'cursor',
      	      \ 'border': [],
      	      \ 'borderchars': ['-','|','-','|','+','+','+','+'],
      	      \ })
	endif
    endif
  endif
endfunction

function! s:close_popup_preview()
  if s:preview_winid > 0 | call popup_close(s:preview_winid) | let s:preview_winid = 0 | endif
endfunction

function! s:qf_accept()
  let l:qf_list = getqflist()
  let l:n = line('.') - 1
  if l:n >= 0 && l:n < len(l:qf_list)
    let l:item = l:qf_list[l:n]
    if l:item.bufnr > 0
      call s:close_popup_preview()
      cclose
      execute 'edit +' . l:item.lnum . ' ' . bufname(l:item.bufnr)
    endif
  endif
endfunction

function! s:qf_cancel()
  call s:close_popup_preview()
  cclose
endfunction
