:lua require('plugins-settings')

" nerdtree
" nmap \ :NERDTreeToggle<CR>
" let NERDTreeShowHidden=1

" nvim-tree.lua
let g:nvim_tree_side = 'left'
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '__pycache__'  ]
let g:nvim_tree_hide_dotfiles = 0
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_symlink_arrow = ' -> '
nnoremap <C-n> :NvimTreeToggle<CR>

" nnn.vim
" nnoremap <C-n> :NnnPicker %:p:h<CR>

" telescope.nvim
nnoremap <C-p> <cmd>Telescope find_files<cr>


" -----

" highlighted yank
let g:highlightedyank_highlight_duration = 100

" -----

let g:indent_guides_enable_on_vim_startup = 1
" let g:jedi#use_tabs_not_buffers = 1
let g:rainbow_active = 1
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#environment_path = "python.exe"
let g:airline_theme='onedark'
" let g:airline_theme='one'
let g:onedark_termcolors=256

" -----

" better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:better_whitespace_guicolor='darkred'
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:better_whitespace_filetypes_blacklist=[]

" -----

" coc.nvim
let g:coc_global_extensions = ['coc-pyright', 'coc-pairs', 'coc-json', 'coc-sh', 'coc-tsserver', 'coc-html']


if has("win32")
    let g:coc_node_path = 'G:\\Shyam\\Program Files\\Node\\node-v16.10.0-win-x64\\node.exe'
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"     if (index(['vim','help'], &filetype) >= 0)
"         execute 'h '.expand('<cword>')
"     else
"         call CocAction('doHover')
"     endif
" endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

let b:coc_pairs_disabled = ['<']

" -----

" hexokinase
let g:Hexokinase_highlighters = [ 'virtual' ]

let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript', 'json']

" -----

" indentline
let g:indentLine_concealcursor = ""
let g:indentLine_setConceal = 0

" -----

" vim-closetag
