-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")
-- NOTE: the 4th argument in the map function can be a table i.e options but its most likely un-needed so dont worry about it

vim.cmd([[
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
nmap <leader>v :source ~/.config/nvim/init.vim<cr>
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
nnoremap C "_C
nnoremap s "_s
nnoremap S "_S
nnoremap Y y$
nmap j gj
nmap k gk
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
nnoremap Q <Nop>
nmap ; :
vnoremap < <gv
vnoremap > >gv
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
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
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
set splitbelow
set splitright
nnoremap <S-left> :vertical resize -5<cr>
nnoremap <S-right> :vertical resize +5<cr>
nnoremap <S-up> :resize +5<cr>
nnoremap <S-down> :resize -5<cr>
nnoremap = <C-w>=
cnoremap <C-v> <C-r>+
imap <C-v> <C-r>+
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
nnoremap Q qw
nnoremap K @w
]])

-- Install plugins
local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
  use {
    "akinsho/toggleterm.nvim"
  }

end)

-- toggleterm.nvim
require("toggleterm").setup {
    open_mapping = [[<c-\>]],
    direction = 'vertical',
    size = 50,
    border = 'curved',
    insert_mappings = true,
    shade_terminals = true,
    shading_factor = '1',
    close_on_exit = false
}
vim.cmd([[
set tabstop=4
set softtabstop=4
set shiftwidth=4
]])

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event','cmd' fields)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough
