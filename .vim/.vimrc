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

" integrate with the system clipboard
set clipboard=unnamedplus

set laststatus=2 " always show the status line
:set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

syntax on
filetype indent on
filetype plugin on

set incsearch
set hlsearch

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" switch tabs without a leading 'g' key
nnoremap t gt
nnoremap T gT

" eclim settings
set omnifunc=syntaxcomplete#Complete
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

" more natural split opening
" set splitbelow
" set splitright

" don't use spaces for tabs in makefiles
autocmd Filetype make setlocal noexpandtab

" shortcut to toggle the nerdtree menu
nnoremap <leader>t :NERDTreeTabsToggle<CR>

" shortcut to clear CtrlP caches
nnoremap <leader>p :CtrlPClearAllCaches<CR>

" tmux integration
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction
  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

let delimitMate_expand_cr = 1

