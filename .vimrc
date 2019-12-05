" vim:set ts=2 sts=2 sw=2 tw=0:
"
scriptencoding utf-8


source $HOME/.vim/bundles.vim


" color scheme
set background=dark
color iceberg

" highlight current line
au WinLeave * set nocursorline " nocursorcolumn
au WinEnter * set cursorline   " cursorcolumn
set cursorline                 " cursorcolumn

"
" search
"
set ignorecase
set smartcase
set incsearch
set hlsearch
nmap     <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap <silent> gh :let @/=''<CR>
"set highlight     " conflict with highlight current line
"
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

"
" editor settings
"
set history=1000
set nocompatible
set nofoldenable
set confirm
set backspace=indent,eol,start
set t_Co=256
set mouse=a
set report=0
set scrolloff=5
set showcmd
set title
set cmdheight=2
set laststatus=2
set showmatch
set matchtime=2
set matchpairs+=<:>
"set relativenumber

"
" display
"
set list
"set listchars=tab:.\ ,trail:_,extends:<
set listchars=tab:≫-,trail:-,extends:≫,precedes:«,nbsp:%,eol:↲
set number
set nowrap

"
" backup & swap
"
set nowritebackup
set nobackup
set noswapfile

"
" default indentation
"
set autoindent
set smartindent   " indent when
set tabstop=4     " tab width
set softtabstop=4 " backspace
set shiftwidth=4  " indent width
set textwidth=79
set smarttab
set expandtab     " expand tab to spaces

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120

"
" syntax support
"
""augroup MyAutoCmd
""    autocmd!
""augroup end

""autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep,copen
""autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c
""autocmd MyAutoCmd FileType qf      nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L

"
" configuration unite.vim
"
if has_key(dein#get(), 'unite.vim')
  let g:unite_enable_start_insert=0
  let g:unite_source_history_yank_enable=1

  call unite#filters#sorter_default#use(["sorter_word"])

  noremap <silent> ,ub :<C-u>Unite buffer<CR>
  noremap <silent> ,uy :<C-u>Unite history/yank<CR>
  noremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  noremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
  noremap <silent> ,um :<C-u>Unite file_mru<CR>
  noremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
  noremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
endif

"
" configuration taglist.vim
"
if has_key(dein#get(), 'taglist.vim')
  set tags=./.tags,./tags,.tags,tags
  let Tlist_Ctags_Cmd = 'ctags'
  let Tlist_Show_One_File = 1
  let Tlist_Use_Right_Window = 0
  let Tlist_Exit_OnlyWindow = 1

  map <silent> <Leader>l :TlistToggle<CR>
  nnoremap <c-j>    :vsp<CR>       :exec("tjump " . expand('<cword>'))<CR>
  nnoremap <c-k>    :split<CR>     :exec("tjump " . expand('<cword>'))<CR>
  map <c-\>         :tab split<CR> :exec("tag " . expand('<cword'))<CR>
  map <leader><c-\> :vsp<CR>       :exec("tag " . expand('<cword'))<CR>
endif

"
" configuration vim-fugitive.vim
"
if has_key(dein#get(), 'vim-fugitive')
  nmap <silent> ,gs :<C-u>Gstatus<CR>
  nmap <silent> ,gd :<C-u>Gdiff<CR>
  nmap <silent> ,gb :<C-u>Gblame<CR>
  nmap <silent> ,gl :<C-u>Glog<CR>
endif

"
" configuration vim-quickrun
"
if has_key(dein#get(), 'vim-quickrun')
  let g:quickrun_no_default_key_mappings = 1
  let &l:ef = '%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m'
"              \ 'outputter/quickfix/errorformat' : '%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m',
  let g:quickrun_config   = {}
  let g:quickrun_config._ = {
              \ 'runner'                         : 'system',
              \ 'outputter'                      : 'error',
              \ 'outputter/error/success'        : 'buffer',
              \ 'outputter/error/error'          : 'quickfix',
              \ 'outputter/buffer/into'          : 1,
              \ 'outputter/buffer/split'         : '',
              \ 'outputter/quickfix/into'        : 1,
              \ 'outputter/quickfix/errorformat' : &l:ef,
              \}
  for [keybind,cmd] in items({
              \ '<Leader>r' : '',
              \ '<Leader>i' : '<input',
              \})
      execute 'nnoremap <silent>' keybind ':QuickRun' cmd '-mode n<CR>'
      execute 'vnoremap <silent>' keybind ':QuickRun' cmd '-mode v<CR>'
  endfor
  nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_session() : '<C-c>'
endif

"
" keybind and macro
"
inoremap jj <Esc>

nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

nnoremap [q :cprevious<CR>
nnoremap ]q :cnext and macro<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>

nnoremap j  gj
nnoremap gj j
nnoremap k  gk
nnoremap gk k
nnoremap J  gJ
nnoremap gJ J

map gb :ls<CR>:buf
map db :ls<CR>:bdel

nmap n  nzz
nmap N  Nzz
nmap *  *zz
nmap #  #zz
nmap g* g*zz
nmap g# g#zz

nnoremap <C-]> g<C-]>

imap <c-x> <DEL>
imap <c-a> <HOME>
imap <c-e> <END>
imap <c-l> <RIGHT>
imap <c-j> <DOWN>
imap <c-k> <UP>
imap <c-h> <LEFT>

imap {} {}<LEFT>
imap () ()<LEFT>
imap [] []<LEFT>
imap <> <><LEFT>
imap "" ""<LEFT>
imap '' ''<LEFT>

