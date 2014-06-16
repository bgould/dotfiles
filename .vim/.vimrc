" 256 colors
let &t_Co = 256
" enable colors -- google 'enable colors in vim using putty' or something like that
if &term =~ "xterm"
  " restore screen after quitting
  let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
  let &t_te = "\<Esc>[?47l\<Esc>8"
  if has("terminfo")
    let &t_Sf = "\<Esc>[3%p1%dm"
    let &t_Sb = "\<Esc>[4%p1%dm"
  else
    let &t_Sf = "\<Esc>[3%dm"
    let &t_Sb = "\<Esc>[4%dm"
  endif
endif

execute pathogen#infect()

let g:SuperTabDefaultCompletionType = "<c-p>"

" use this for high contrast if preferred
" let g:zenburn_high_Contrast=1
colors zenburn

set showmode

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
nnoremap j gj
nnoremap k gk

" eclim settings
let g:EclimProjectTreeAutoOpen=1
let g:EclimProjectTreeAutoOpenProjects="CURRENT"

" navigate splits more easily
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" more natural split opening
set splitbelow
set splitright

