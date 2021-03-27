"insert mode inside quotes
inoremap " ""<esc>i

"insert mode inside arrow brackets
inoremap < <><esc>i 

"insert mode after open brackets
inoremap ( ()<esc>i

"esc to exit terminal mode
tnoremap <Esc> <C-\><C-n>

"makes windows mouse adjustable
set mouse=a 

"add line numbering
set number

"set python version
set pyxversion=3

"set tab to 4
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" open new vertical splits on the right, (horizontal) splits below
set splitright
set splitbelow

"turns off bad habits
inoremap <DOWN> <nop>
inoremap <UP> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" scroll buffer without moving cursor
nnoremap <DOWN> <C-E>
nnoremap <UP> <C-Y>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Q mapping for macros
nnoremap Q @q

" map : 
nnoremap <Space> :
vnoremap <Space> :

map <C-J> <C-w>j
map <C-K> <C-w>k
map <C-H> <C-w>h
map <C-L> <C-w>l

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

" 80 chars max
set tw=80
set cc=+1
hi ColorColumn guibg=black
imap <f1> <nop>

" completion to be like bash
set wildmode=list:longest

" use arrow keys to switch buffers
map <right> gt
map <left> gT

"end and start of line shortcuts
no 0 ^
no - $

"disable line wrapping for txt files
autocmd FileType text setlocal tw=0
autocmd FileType markdown setlocal tw=0

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')      

" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'commit': 'ce448a6'}

" Initialize plugin system
call plug#end()

" open new files relative to the current buffer
set autochdir

" highlight on search
set icm=nosplit

" set 24-bit color
set tgc
hi Pmenu guibg=#222526 guifg=white

" set relative number
set number relativenumber

" autoload for pism
autocmd BufRead *.pism call SetPismOptions()
function SetPismOptions()
    set syntax=pism
    source /home/narodnik/src/sapvi/scripts/pism.vim
endfunction

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
