call pathogen#infect()    " Pathogen plugin (https://github.com/tpope/vim-pathogen)
call pathogen#helptags()

set nocompatible          " We're running Vim, not Vi!
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

" Indentation - use hard TAB only (display it as 4 spaces)
set tabstop=4 shiftwidth=4 noexpandtab

" augroup myfiletypes
	" Clear old autocmds in group
	" autocmd!
	" Autoindent & line numbers on
	" autocmd FileType ruby,eruby,yaml,sql set ai number
" augroup END

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

" Tab and End of line characters
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

