" vim:set ts=2 sts=2 sw=2 tw=0:
"
scriptencoding utf-8

"
" import bundle plugins defines
"
source $HOME/.vim/bundles.vim


" color scheme
set background=dark
"color koehler
"color onedark
color molokai

set shortmess+=I
set formatoptions+=mMt

" highlight current line
au WinLeave * set nocursorline " nocursorcolumn
au WinEnter * set cursorline	 " cursorcolumn
set cursorline					 " cursorcolumn

"
" search
"
set incsearch
set ignorecase
set smartcase
set wrapscan
set hlsearch
nmap	 <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap <silent> gh :let @/=''<CR>
"set highlight		 " conflict with highlight current line
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
set listchars=tab:.\ ,trail:-,extends:≫,precedes:«,nbsp:%,eol:↲
set nonumber
set nowrap
set splitright

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
set copyindent
set preserveindent
set smartindent		" indent when
set tabstop=8		" tab width
set softtabstop=8	" backspace
set shiftwidth=8	" indent width
set textwidth=79
set smarttab
set noexpandtab		" expand tab to spaces

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType go     setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

let mapleader = "\<Space>"

"
" syntax support
"
""augroup MyAutoCmd
""		autocmd!
""augroup end

""autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep,copen
""autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c
""autocmd MyAutoCmd FileType qf			 nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L

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

	map <silent> <Leader>l	:TlistToggle<CR>
	nnoremap <c-j>		:vsp<CR>	:exec("tjump " . expand('<cword>'))<CR>
	nnoremap <c-k>		:split<CR>	:exec("tjump " . expand('<cword>'))<CR>
	map <c-\>		:tab split<CR>	:exec("tag " . expand('<cword'))<CR>
	map <leader><c-\> :vsp<CR>		:exec("tag " . expand('<cword'))<CR>
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
"				 \ 'outputter/quickfix/errorformat' : '%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m',
	let g:quickrun_config	= {}
	let g:quickrun_config._ = {
				\ 'runner'				: 'system',
				\ 'outputter'				: 'error',
				\ 'outputter/error/success'		: 'buffer',
				\ 'outputter/error/error'		: 'quickfix',
				\ 'outputter/buffer/into'		: 1,
				\ 'outputter/buffer/split'		: '',
				\ 'outputter/quickfix/into'		: 1,
				\ 'outputter/quickfix/errorformat'	: &l:ef,
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
" configuration vim-buftabline
"
if has_key(dein#get(), 'vim-buftabline')
	set hidden
	let g:buftabline_indicators = 1
	nnoremap <silent> <C-n> :bnext<CR>
	nnoremap <silent> <C-p> :bprev<CR>
endif

"
" configuration tig-explorer
"
if has_key(dein#get(), 'tig-explorer.vim')
	nnoremap <Leader>T		:TigOpenCurrentFile<CR>
	nnoremap <Leader>t		:TigOpenProjectRootDir<CR>
	nnoremap <Leader>g		:TigGrep<CR>
	nnoremap <Leader>r		:TigGrepResume<CR>
	nnoremap <Leader>g y	:TigGrep<Space><C-R>"<CR>
	nnoremap <Leader>cg		:<C-u>:TigGrep<Space><C-R><C-W><CR>
	nnoremap <Leader>b		:TigBlame<CR>

	let g:tig_explorer_use_builtin_term = 0
endif

"
" configuration vim-lsp
"
if has_key(dein#get(), 'vim-lsp')
	let g:lsp_log_verbose = 0
	let g:lsp_log_file = expand('~/.cache/tmp/vim-lsp.log')

	augroup MyLsp
		autocmd!
		if executable('pyls')
			autocmd User lsp_setup call lsp#register_server({
				\	'name': 'pyls',
				\	'cmd': { server_info -> ['pyls'] },
				\	'whitelist': ['python'],
				\	'workspace_config': {'pyls': {'plugins': {
				\		'pycodestyle': {'enabled': v:false},
				\		'jedi_definition': {'follow_imports': v:true, 'follow_builtin_imports': v:true},}}}
				\})
			autocmd FileType python call s:configure_lsp()
		endif
	augroup END

	function! s:configure_lsp() abort
		setlocal omnifunc=lsp#complete
		nnoremap <buffer> <C-j> :<C-u>LspDefinition<CR>
		nnoremap <buffer> gd    :<C-u>LspDefinition<CR>
		nnoremap <buffer> gD    :<C-u>LspReferences<CR>
		nnoremap <buffer> gs    :<C-u>LspDocumentSymbol<CR>
		nnoremap <buffer> gS    :<C-u>LspWorkspaceSymbol<CR>
		nnoremap <buffer> gQ    :<C-u>LspDocumentFormat<CR>
		vnoremap <buffer> gQ    :LspDocumentRangeFormat<CR>
		nnoremap <buffer> K     :<C-u>LspHover<CR>
		nnoremap <buffer> <F1>  :<C-u>LspImplementation<CR>
		nnoremap <buffer> <F2>  :<C-u>LspRename<CR>
	endfunction

	let g:lsp_diagnostics_enabled = 0
endif

"
" import keybind and macro defines
"
source $HOME/.dots/.vim/keybind.vim

