" colorscheme nord
" colorscheme onedark
colorscheme tokyonight

" highlight Visual guibg=#434C5E gui=bold
" highlight Search guifg=#C678DD guibg=#4C566A gui=bold
" highlight TabLineSel guifg=#282C34 guibg=#61AFEF gui=bold
" highlight CursorLineNr guifg=#61AFEF gui=bold
" " highlight VertSplit guifg=#61AFEF

" " highlight Comment guifg=#7f848e gui=bold
" highlight Comment guifg=#7f848e
" highlight Function gui=bold
" highlight Conditional gui=bold
" highlight Repeat gui=bold
" highlight Label gui=bold
" highlight Operator gui=bold
" highlight Keyword gui=bold
" highlight Exception gui=bold
" highlight Include gui=bold
" highlight Define gui=bold
" highlight Macro gui=bold
" highlight PreCondit gui=bold
" highlight StorageClass gui=bold
" highlight Structure gui=bold
" highlight Typedef gui=bold
" highlight Tag gui=bold

highlight Visual guibg=#434C5E
highlight Search guifg=#C678DD guibg=#4C566A
highlight TabLineSel guifg=#282C34 guibg=#61AFEF
highlight CursorLineNr guifg=#61AFEF

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
