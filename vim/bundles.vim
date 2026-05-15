filetype off
" ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
if &compatible
  set nocompatible
endif

" already configured in pre-bundle.vim
"set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" modifies it below like pre-bundle.vim
"if dein#load_state("$HOME/.cache/dein")
"  call dein#begin("$HOME/.cache/dein")
if dein#load_state(g:dein_base)
  call dein#begin(g:dein_base)

  " already configured in pre-bundle.vim
  "call dein#add("$HOME/.cache/dein/repos/github.com/Shougo/dein.vim")

  "
  " plugins go here:
  "
  " visualizeing ... colorscheme, statusline, bufferline
  call dein#add('ghifarit53/tokyonight-vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('ap/vim-buftabline')
  "call dein#add('')

  " customizing ... tig
  "call dein#add('Shougo/unite.vim')
  "call dein#add('Shougo/neomru.vim')
  call dein#add('iberianpig/tig-explorer.vim')
  "call dein#add('vim-scripts/taglist.vim')
  "call dein#add('tpope/vim-fugitive.vim')
  "call dein#add('thnica/vim-quickrun.vim')

  " supporting langs
  "call dein#add('prabirshrestha/vim-lsp')
  "call dein#add('rust-lang/rust.vim')
  "call dein#add('fatih/vim-go')

  "
  call dein#end()
  call dein#save_state()
endif

" check the unused plugins, cleanup the plugins and rebuild a runtimepath cache
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

" attempt to determine the type of a file based on its name and possibly its
" contents. use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on

" enable syntax highlighting
syntax enable

" uncommnet if you want to install not-installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

