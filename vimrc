call pathogen#infect()    " Pathogen plugin (https://github.com/tpope/vim-pathogen)
call pathogen#helptags()

set nocompatible          " We're running Vim, not Vi!
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml set ai tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
augroup END

" Add recently accessed projects menu (project plugin)
set viminfo^=!

set ruler   " Ruler on
" set number  " Line numbers on

set hidden

set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set showmatch     " set show matching parenthesis

let g:RspecBin = "rspec"
" let g:RspecSplitHorizontal = 0

let g:pandoc_no_folding = 1
