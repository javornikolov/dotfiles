call pathogen#infect()    " Pathogen plugin (https://github.com/tpope/vim-pathogen)
call pathogen#helptags()

set nocompatible          " We're running Vim, not Vi!
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

" Indentation - use hard TAB only (display it as 4 spaces)
set tabstop=4 shiftwidth=4 noexpandtab

augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" Autoindent & line numbers on
	" autocmd FileType ruby,eruby,yaml,sql set ai number
	autocmd Filetype java setlocal tabstop=4 shiftwidth=4 expandtab
	autocmd Filetype python setlocal tabstop=4 shiftwidth=4 expandtab
	autocmd Filetype groovy setlocal tabstop=4 shiftwidth=4 expandtab
	autocmd Filetype javascript setlocal tabstop=4 shiftwidth=4 expandtab
	autocmd Filetype php setlocal tabstop=4 shiftwidth=4 expandtab
	autocmd Filetype ruby,eruby,cucumber setlocal tabstop=2 shiftwidth=2 expandtab
	autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 expandtab
	autocmd Filetype terraform setlocal tabstop=2 shiftwidth=2 expandtab
	autocmd BufNewFile,BufRead *.tab set filetype=sql
	autocmd BufNewFile,BufRead *.vw set filetype=sql
	autocmd BufNewFile,BufRead *.mv set filetype=sql
	autocmd BufNewFile,BufRead *.tps set filetype=sql
	autocmd BufNewFile,BufRead *.tpb set filetype=sql
	autocmd BufNewFile,BufRead buildfile set filetype=ruby
	autocmd BufNewFile,BufRead *.pp set filetype=ruby
	autocmd BufNewFile,BufRead *.gradle set filetype=groovy
augroup END

" Add recently accessed projects menu (project plugin)
set viminfo^=!

set hidden

set ruler   " Ruler on
set number  " Line numbers on

set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set showmatch     " set show matching parenthesis

set nowrap        " Don't wrap lines
set list          " Show spaces, tabs, new-lines

set encoding=utf-8 " Necessary to show Unicode glyphs

" Tab and End of line characters
" set listchars=tab:▸\ ,eol:¬
set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

let g:RspecBin = "rspec"
" let g:RspecSplitHorizontal = 0

let g:pandoc_no_folding = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Background and Color scheme (solarized)
"
if has('gui_running')
	set background=dark
	" set guifont=Ubuntu\ Mono\ for\ Powerline\ 11
else
	set t_Co=256
	set background=dark
	let g:solarized_termcolors=256
endif

syntax enable
let g:solarized_visibility = 'low'
colorscheme solarized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Powerline
set laststatus=2   " Always show the statusline
" let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
" let g:Powerline_symbols = 'fancy'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""" Turn off swap
set directory=~/.backup//
set backupdir=~/.backup//

" set noswapfile
" Automatically create .backup directory, writable by the group.
" if filewritable("~") && ! filewritable("$backupdir")
"	silent execute '!umask 002; mkdir "$backupdir"'
" endif

" indenting text
vnoremap < <gv
vnoremap > >gv

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Terraform
let g:terraform_align=1
