let &t_Co = 256

execute pathogen#infect()

" put backup and swap files in different directory
set directory=~/tmp

" use this for high contrast if preferred
let g:zenburn_high_Contrast=1
colors zenburn
set guifont=Source\ Code\ Pro\ Medium\ 11

set number
set showmode
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set colorcolumn=80
set showcmd
set cursorline
set wildmenu
set showmatch
set ruler
set incsearch
set autoindent
set backspace=indent,eol,start " backspace through anything

autocmd BufNewFile src/*/java/*.java call InsertJavaPackage()
function! InsertJavaPackage()
  let filename = expand("%")
  let filename = substitute(filename, "\.java$", "", "")
  let dir = getcwd() . "/" . filename
  let dir = substitute(dir, "^.*\/src\/.*\/java\/", "", "")
  let dir = substitute(dir, "\/[^\/]*$", "", "")
  let dir = substitute(dir, "\/", ".", "g")
  let filename = substitute(filename, "^.*\/", "", "")
  let dir = "package " . dir . ";"
  let result = append(0, dir)
  let result = append(1, "}")
  let result = append(1, "")
  let result = append(1, "")
  let result = append(1, "")
  let result = append(1, "public class " . filename . " {")
  let result = append(1, " */")
  let result = append(1, " * @author bcg")
  let result = append(1, " * ")
  let result = append(1, "/*")
  let result = append(1, "")
endfunction

syntax on
filetype indent on
filetype plugin on

set omnifunc=syntaxcomplete#Complete

set incsearch
set hlsearch

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

nnoremap t gt
nnoremap T gT

" eclim settings
let g:EclimCompletionMethod = 'omnifunc'
nnoremap <C-S-o> :JavaImportOrganize<CR>
imap <C-Space> <C-X><C-O>
imap <C-@> <C-Space>

" UltiSnips settings
" let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" vertical line indentation
let g:indentLine_color_term = 239 
let g:indentLine_color_gui  = '#333333'
let g:indentLine_char = '|'
        
let delimitMate_expand_cr = 1

" navigate splits more easily
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" more natural split opening
" set splitbelow
" set splitright

autocmd Filetype make setlocal noexpandtab
