" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')      

" Use release branch (Recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" rust fmt
" Plug 'alx741/vim-rustfmt'
" instant.nvim
" Plug 'jbyuki/instant.nvim'
" zoxide
" Plug 'nanotree/zoxide.vim'
" Add fzf plug in
" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'

highlight IndentBlanklineChar guifg=#222222 gui=nocombine
hi CocHintSign guifg=#383838

" Initialize plugin system
call plug#end()

highlight Pmenu guibg=gray guifg=black

" set username
let g:instant_username = "lunar-mining"

" bookmarks color
let g:highlightMarks_colors = ['#422943']

highlight IndentBlanklineChar guifg=#222222 gui=nocombine
hi CocHintSign guifg=#383838
hi! CocUnusedHighlight guibg=NONE guifg=#bbbbbb
hi FgCocErrorFloatBgCocFloating guifg=White guibg=Black

syntax on

" size of hard tabs
set ts=4
" size of soft tabs
set sw=4
" use soft tabs
set et
" treat X spaces like a tab
set sts=4

" 24 bit colors
set tgc

" when moving up or down, don't move cursor left or right
set nostartofline

" tab to jump between brackets and braces
nnoremap <tab> %
vnoremap <tab> %

" cursor can go anywhere on screen :)
set virtualedit=all
set ruler
set splitright
set splitbelow

" persistant undo
set undofile
set undodir=/tmp
set numberwidth=3
" turn on default indent for filetype
filetype indent on
" enable mouse for resizing splits
set mouse=a

set relativenumber
" but also show current lineno
set number

map <C-J> <C-w>j
map <C-K> <C-w>k
map <C-H> <C-w>h
map <C-L> <C-w>l

" quick recording type qq, then Q to do it
nnoremap Q @q

" remove annoying help
map <f1> <nop>

" make highlighted searches disappear
nmap <C-N> :noh <CR>
imap <f1> <nop>

" disable bad habit
inoremap <DOWN> <nop>
inoremap <UP> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" scroll buffer without moving cursor
nnoremap <DOWN> <C-E>
nnoremap <UP> <C-Y>
nnoremap <left> <nop>
nnoremap <right> <nop>

" peek up/down
map <pageup> zb5<c-e>
map <pagedown> zt5<c-y>
map <end> zz

" 80 chars max
set tw=80
autocmd FileType text setlocal tw=0
autocmd FileType markdown setlocal tw=0
autocmd FileType rst setlocal tw=0
set cc=+1
hi ColorColumn guibg=black

" completion to be like bash
set wildmode=list:longest

" do not continue comments when I press enter
set formatoptions-=cro

" use arrow keys to switch buffers
map <right> :tabn<cr>
map <left> :tabp<cr>
" speed up esc
set ttimeoutlen=50

" jump to end and start of lines shortcuts
no 0 ^
no - $

" set my leader to backspace
let mapleader="\<bs>"

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" fzf commands
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>

" use escape in the terminal
au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
au! FileType fzf tunmap <buffer> <Esc>
" when opening new terminal, auto enter insert mode
autocmd TermOpen * startinsert
" when switching to terminal, automatically enter insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" map keys to switch out of terminal
tnoremap <C-J> <C-\><C-n><C-w>j
tnoremap <C-K> <C-\><C-n><C-w>k
tnoremap <C-H> <C-\><C-n><C-w>h
tnoremap <C-L> <C-\><C-n><C-w>l

" jump to definitions with coc
"" see also :h coc-action-jumpDefinition
"nmap <silent> gc :call CocAction('jumpDefinition')<CR>zt
"nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>zt
"nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<CR>zt
"nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<CR>zt
"nmap go <c-o>zz

" live preview of substitutions
set icm=nosplit
" no need to specify /g for every regex substitution
set gdefault

" Q mapping for macros
nnoremap Q @q

" show files in normal style like file browser
let g:netrw_liststyle = 2
" no banner for file browser!
let g:netrw_banner = 0
" hide dot files
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex

" reload my marks when i load a new file
let g:mwAutoLoadMarks=1

"" disable annoying grey column on left opened by CoC
"set signcolumn=no
"
"" Use K for show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if &filetype == 'vim'
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction

" remember cursor position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" hide noisy symbols
hi NoisySymbols guifg=#aaaaaa
autocmd FileType rust syn match NoisySymbols '[;{}\[\]:(),]'

au BufNewFile,BufRead,BufReadPost *.zk set syntax=zk

" map : 
nnoremap <Space> :
vnoremap <Space> :

"disable bad habit in insert mode
augroup SeriouslyNoInsertArrows
autocmd!
autocmd InsertEnter * inoremap <Up> <nop>
autocmd InsertEnter * inoremap <Down> <nop>
augroup END

" cursor can go anywhere on screen
set virtualedit=all

" size of hard tabs
set ts=4
"size of soft tabs
set sw=4
"use soft tabs
set et
"treat X spaces like a tab
set sts=4

" make highlighted searches disappear
nmap <C-N> :noh <CR>

" test column
" set tw=60
" set cc=+1
" hi ColorColumn guibg=green
" imap <f1> <nop>

"disable line wrapping for txt files
autocmd FileType text setlocal tw=0
autocmd FileType markdown setlocal tw=0

" open new files relative to the current buffer
set autochdir

" color menu
hi Pmenu guibg=#222526 guifg=white

" change keyword to cyan
hi Statement guifg=#00FFFF

" change line numbers to cyan
hi LineNr guifg=#00FFFF

" change line numbers to cyan
hi CursorLineNr guifg=#00FFFF

set title
set titlestring=%{hostname()}\ \ %F\ \ %{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}
