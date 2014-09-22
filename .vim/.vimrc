let &t_Co = 256

execute pathogen#infect()

let g:SuperTabDefaultCompletionType = "<c-p>"

let g:solarized_termcolors=256

" use this for high contrast if preferred
let g:zenburn_high_Contrast=0
colors zenburn

set number
set showmode
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" set number
set showcmd
set cursorline
set wildmenu
set showmatch
set ruler
set incsearch
set autoindent
set backspace=indent,eol,start " backspace through anything

syntax on
filetype indent on

set incsearch
set hlsearch

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
" nnoremap j gj
" nnoremap k gk

" eclim settings
let g:EclimProjectTreeAutoOpen=1
let g:EclimProjectTreeAutoOpenProjects="CURRENT"

" UltiSnips settings
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui  = '#09AA08'
let g:indentLine_char = '|'

let delimitMate_expand_cr = 1

" CtrlP configuration
let g:ctrlp_map = '<leader>t'
set wildignore+=*/target/*
let g:ctrlp_use_caching=0

" navigate splits more easily
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" more natural split opening
" set splitbelow
" set splitright

autocmd Filetype make setlocal noexpandtab
