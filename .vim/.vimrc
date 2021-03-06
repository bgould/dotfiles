let &t_Co = 256

execute pathogen#infect()

" put backup and swap files in different directory
set directory=~/tmp

" do not show stupid q: window
map q: :q

let g:go_fmt_command = "goimports"

" vim-go tutorial
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

autocmd FileType go nmap <Leader>i <Plug>(go-imports)

autocmd FileType go nmap <C-O> <Plug>(go-imports)

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let g:go_auto_sameids = 1

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" use this for high contrast if preferred
let g:zenburn_high_Contrast=1
colors zenburn
set guifont=Source\ Code\ Pro\ Medium\ 9

"" set number
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
" set ruler
set incsearch
set backspace=indent,eol,start " backspace through anything

" integrate with the system clipboard
set clipboard=unnamedplus

"set laststatus=2 " always show the status line
"":set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

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
"set omnifunc=syntaxcomplete#Complete
"let g:EclimCompletionMethod = 'omnifunc'
"nnoremap <C-S-o> :JavaImportOrganize<CR>
" imap <C-Space> <C-X><C-O>
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
set splitbelow
set splitright

" don't use spaces for tabs in makefiles
autocmd Filetype make setlocal noexpandtab

" shortcut to toggle the nerdtree menu
" nnoremap <leader>t :NERDTreeTabsToggle<CR>

" shortcut to clear CtrlP caches
nnoremap <leader>p :CtrlPClearAllCaches<CR>

let g:tmux_navigator_no_mappings = 1
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
  nnoremap <silent> <C-a>h :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-a>j :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-a>k :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-a>l :call TmuxOrSplitSwitch('l', 'R')<cr>
endif


" =================== vim-airline ========================

let g:airline_theme='zenburn'
let g:airline_powerline_fonts = 1

" set to use powerline fonts when not in a ssh session
let g:remoteSession = ($STY == "")
if !g:remoteSession
  let g:airline_powerline_fonts = 1
endif

