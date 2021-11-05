let mapleader = " "

" leader key bindings
nmap <leader><leader> :w<cr>
nmap <C-_> gcc
xmap <C-_> gc
nmap \ gcc
xmap \ gc
nmap <leader>/ gcc
xmap <leader>/ gc

nmap <leader>a ggVG
nmap <leader>b :call RunPythonFile()<cr>
nmap <C-b> :call RunPythonFile()<cr>


if has("unix")
    nmap <leader>v :source ~/.config/nvim/init.vim<cr>
elseif has("win32")
    nmap <leader>v :source ~\AppData\Local\nvim\init.vim<cr>
endif

nnoremap <C-s> :w<cr>
nmap <C-a> ggVG
nnoremap <A-a> <C-a>

nnoremap U <C-r>

nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
nnoremap x "_x
nnoremap X "_X
nnoremap c "_c

nnoremap Y y$

" nmap j gj
" nmap k gk
nmap j gj
nmap k gk

" nmap <Up> gk
" nmap <Down> gj
noremap <up> <nop>
noremap <down> <nop>

nmap pn <esc>o<esc>p

nnoremap <Left> ^
nnoremap <Right> $

nmap d<Left> d^
nmap d<Right> d$

nmap y<Left> y^
nmap y<Right> y$

nmap c<Left> c^
nmap c<Right> c$

vnoremap <left> ^
vnoremap <right> $

" imap <left> <C-o>^
" imap <right> <C-o>$

" disable  ex mode
nnoremap Q <Nop>

nmap ; :

" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

" clear highlighted results after a search
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" disable help (f1)
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" " disable trying to find man page entry (K)
" nnoremap K <Nop>
" xnoremap K <Nop>

" center cursor on movements like `j`, `k`, `G` and `n`, `N`
" set scrolloff=999
" nnoremap j jzz
" nnoremap k kzz

" nnoremap <Down> jzz
" nnoremap <Up> kzz

" nnoremap G Gzz

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" nnoremap { {zz
" nnoremap } }zz

" splits
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Open new split panes to right and bottom
set splitbelow
set splitright

" resize splits
nnoremap <S-left> :vertical resize -5<cr>
nnoremap <S-right> :vertical resize +5<cr>
nnoremap <S-up> :resize +5<cr>
nnoremap <S-down> :resize -5<cr>
nnoremap = <C-w>=

" paste in command mode
cnoremap <C-v> <C-r>+

" paste in insert mode
imap <C-v> <C-r>+

" hjkl like movements in insert mode
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

" imap <up> <nop>
" imap <down> <nop>

" imap jk <esc>
" imap jj <esc>


nnoremap Q qw
nnoremap K @w
