if has("unix")
    :source ~/.config/nvim/plugins.vim
    :source ~/.config/nvim/plugins-settings.vim
    :source ~/.config/nvim/keymaps.vim
elseif has("win32")
    :source ~\AppData\Local\nvim\plugins.vim
    :source ~\AppData\Local\nvim\plugins-settings.vim
    :source ~\AppData\Local\nvim\keymaps.vim
    :source ~\AppData\Local\nvim\windows-related-config.vim
endif

" -----

set nocompatible
set t_Co=256
set encoding=UTF-8
set nobackup
set nowritebackup
set noswapfile
set cmdheight=2
set updatetime=300
filetype plugin indent on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set mouse=a
set noshowmode " already shown by statusline
set clipboard=unnamedplus
" show matching brackets/parenthesis
" set showmatch
" Don’t reset cursor to start of line when moving around.
set nostartofline
set wildmenu
set wildmode=longest:full,full
set lazyredraw
set hidden

" -----

set wrap
set linebreak

" -----

set number relativenumber
set visualbell
set t_vb=
set noerrorbells
set tm=500
set ttimeoutlen=50
set title
set confirm
set foldcolumn=1
set foldmethod=indent

set cursorline


function! RunPythonFile()
    :w
    :exec '!python.exe' shellescape(@%, 1)
endfunction

function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "="
endfunction

set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set ai
set si

set hlsearch
set ignorecase
set smartcase
set incsearch

syntax enable
syntax on

set shortmess=I
set shortmess+=a
set shortmess+=F
set shortmess+=c

set autoread
au FocusGained,BufEnter * checktime

set matchpairs+=<:>

set ruler

set backspace=indent,eol,start
set whichwrap+=<,>,h,l

set encoding=utf-8

" -----

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Allow comments in json
autocmd FileType json set filetype=jsonc

" autocomplete closing tags for html
" autocmd FileType html inoremap <buffer> > ></<C-x><C-o><C-y><C-o>%<CR><C-o>O

" set default filetype for new file as `.md`
autocmd BufEnter * if &filetype == "" | setlocal ft=markdown | endif


" https://github.com/plasticboy/vim-markdown/issues/126
au filetype markdown set formatoptions+=ro
au filetype markdown set comments=b:*,b:-,b:+,b:1.,n:>

" open `:help` as a vertical split
" autocmd FileType help wincmd L

" open `:help` in a new tab
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'

" enable relative line numbers in normal mode, and regular line numbers in insert mode
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" markdown folding
au! BufEnter *.md setlocal foldexpr=MarkdownLevel()
au! BufEnter *.md setlocal foldmethod=expr

" format python file on save
" autocmd FileType python BufWritePre :Black
autocmd BufWritePre *.py Black

" -----

set laststatus=2

let g:vimsyn_embed = 'l' " get lua syntax highlighting in vimscript

" -----

" colorscheme nord
colorscheme onedark
" colorscheme material

highlight Visual guibg=#434C5E gui=bold
highlight Search guifg=#C678DD guibg=#4C566A gui=bold
highlight TabLineSel guifg=#282C34 guibg=#61AFEF gui=bold
highlight CursorLineNr guifg=#61AFEF gui=bold
" highlight VertSplit guifg=#61AFEF

" highlight Comment guifg=#7f848e gui=bold
highlight Comment guifg=#7f848e
highlight Function gui=bold
highlight Conditional gui=bold
highlight Repeat gui=bold
highlight Label gui=bold
highlight Operator gui=bold
highlight Keyword gui=bold
highlight Exception gui=bold
highlight Include gui=bold
highlight Define gui=bold
highlight Macro gui=bold
highlight PreCondit gui=bold
highlight StorageClass gui=bold
highlight Structure gui=bold
highlight Typedef gui=bold
highlight Tag gui=bold

" function! Tabline() abort
"     let l:line = ''
"     let l:current = tabpagenr()

"     for l:i in range(1, tabpagenr('$'))
"         if l:i == l:current
"             let l:line .= '%#TabLineSel#'
"         else
"             let l:line .= '%#TabLine#'
"         endif

"         let l:label = fnamemodify(
"             \ bufname(tabpagebuflist(l:i)[tabpagewinnr(l:i) - 1]),
"             \ ':t'
"         \ )

"         let l:line .= '%' . i . 'T' " Starts mouse click target region.
"         let l:line .= '  ' . l:label . '  '
"     endfor

"     let l:line .= '%#TabLineFill#'
"     let l:line .= '%T' " Ends mouse click target region(s).

"     return l:line
" endfunction

" set tabline=%!Tabline()

" function bufferline#highlight#setup()
"     let bg_current  = s:bg(['Normal'], '#61AFEF')
" endfunct

" Pmenu
" highlight Pmenu guifg=#434C5E

" Pmenu		Popup menu: normal item.
" PmenuSel	Popup menu: selected item.
" PmenuSbar	Popup menu: scrollbar.
" PmenuThumb	Popup menu: Thumb of the scrollbar.

" -----
