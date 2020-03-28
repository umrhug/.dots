filetype off

"Start dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state("$HOME/.cache/dein")
  call dein#begin("$HOME/.cache/dein")

  " Let dein manage dein
  " Required:
  call dein#add("$HOME/.cache/dein/repos/github.com/Shougo/dein.vim")

  " Add or remove your plugins here like this:
  """call dein#add('Shougo/neosnippet.vim')
  """call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
""  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
 
  call dein#add('vim-scripts/taglist.vim')
  call dein#add('tpope/vim-fugitive')

  call dein#add('cocopon/iceberg.vim')
  call dein#add('itchyny/lightline.vim')

  call dein#add('thinca/vim-quickrun')

""  call dein#add('davidhalter/jedi-vim')

  call dein#add('rust-lang/rust.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

