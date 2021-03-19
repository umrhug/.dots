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

""call dein#add('Shougo/deoplete.nvim')
""if !has('nvim')
""  call dein#add('roxma/nvim-yarp')
""  call dein#add('roxma/vim-hug-neovim-rpc')
""endif
""let g:deoplete#enable_at_startup = 1

  " Add or remove your plugins here like this:
  """call dein#add('Shougo/neosnippet.vim')
  """call dein#add('Shougo/neosnippet-snippets')
  """call dein#add('Shougo/unite.vim')
  """call dein#add('Shougo/neomru.vim')
""  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
 
  """call dein#add('vim-scripts/taglist.vim')
  """call dein#add('tpope/vim-fugitive')

"  call dein#add('cocopon/iceberg.vim')
"  call dein#add('itchyny/lightline.vim')

  call dein#add('tomasr/molokai')
  call dein#add('joshdick/onedark.vim')
  call dein#add('110y/vim-buftabline')

  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('110y/vim-airline-theme-simplest')
  let g:airline_theme='simplest'

  """call dein#add('thinca/vim-quickrun')

""  call dein#add('davidhalter/jedi-vim')

  call dein#add('rust-lang/rust.vim')
  call dein#add('fatih/vim-go')

  "
  call dein#add('iberianpig/tig-explorer.vim')

  " python language server
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('prabirshrestha/async.vim')

  "call map(dein#check_clean(), "delete(v:val, 'rf')")
  "call dein#recache_runtimepath()

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

