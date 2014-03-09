" Pathogen load
filetype off

call pathogen#infect()    " Pathogen plugin (https://github.com/tpope/vim-pathogen)
call pathogen#helptags()

set nocompatible          " We're running Vim, not Vi!
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

" Indentation - use hard TAB only (display it as 4 spaces)
set tabstop=4 shiftwidth=4 noexpandtab

" autocmd Filetype scala setlocal tabstop=4 shiftwidth=4 noexpandtab
autocmd Filetype ruby setlocal tabstop=4 shiftwidth=4 noexpandtab

autocmd Filetype java setlocal tabstop=4 shiftwidth=4 expandtab
autocmd Filetype groovy setlocal tabstop=4 shiftwidth=4 expandtab
autocmd Filetype javascript setlocal tabstop=4 shiftwidth=4 expandtab
autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2 expandtab

autocmd BufNewFile,BufRead *.tab set filetype=sql
autocmd BufNewFile,BufRead *.vw set filetype=sql
autocmd BufNewFile,BufRead *.mv set filetype=sql
autocmd BufNewFile,BufRead *.tps set filetype=sql
autocmd BufNewFile,BufRead *.tpb set filetype=sql

" augroup myfiletypes
	" Clear old autocmds in group
	" autocmd!
	" Autoindent & line numbers on
	" autocmd FileType ruby,eruby,yaml,sql set ai number
" augroup END

" Add recently accessed projects menu (project plugin)
set viminfo^=!

set ruler   " Ruler on
set number  " Line numbers on
set nowrap  " Don't wrap lines

set colorcolumn=80 " Vertucal line at column 80

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

set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}
set rulerformat=%15(%c%V\ %p%%%)
"set rulerformat=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}


set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs


if has('gui_running')
    set background=dark
	" set guifont=Ubuntu\ Mono\ for\ Powerline\ 12
	" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
	set guifont=Inconsolata\-dz\ for\ Powerline\ 11
	" set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 11
	" set guifont=Monaco\ for\ Powerline\ 10
	" set guifont=Letter\ Gothic\ Line\ for\ Powerline\ 12
else
	set t_Co=256
	set background=dark
	let g:solarized_termcolors=256
endif

syntax enable
let g:solarized_visibility = "low"
colorscheme solarized
set list

let g:Powerline_symbols = 'fancy'

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

" Window splitting
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Helper functions (mostly experimental ones)
function! FileTime()
  let ext=tolower(expand("%:e"))
  let fname=tolower(expand('%<'))
  let filename=fname . '.' . ext
  let msg=""
  let msg=msg." ".strftime("(Modified %b,%d %y %H:%M:%S)",getftime(filename))
  return msg
endfunction

function! CurTime()
  let ftime=""
  let ftime=ftime." ".strftime("%b,%d %y %H:%M:%S")
  return ftime
endfunction

" Python mode plugin
" Enable pymode indentation
let g:pymode_indent = 0
let g:pymode_folding = 0
let g:pymode_lint = 0

" gundo 
nnoremap <F5> :GundoToggle<CR>

