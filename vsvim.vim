set number
set relativenumber
call plug#begin()
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'machakann/vim-highlightedyank'

set encoding=UTF-8
call plug#end()
nnoremap <space> <Nop>
vnoremap <space> <Nop>
let mapleader="\<space>"
nnoremap <C-d> <C-d> zz
nnoremap <C-u> <C-u> zz
tnoremap <C-n> <C-\> <C-n>
nnoremap <silent> <leader>p "+p  
nnoremap <silent> <leader>y "+y 
nnoremap <silent> <leader>P "+P  
nnoremap <silent> <leader>Y "+Y 
nnoremap <silent> <leader>yy "+yy 
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Usando VSCode Neovim
if exists('g:vscode')
    " VSCode extension
    " Tabs dentro del split actual
    nnoremap <C-k> :call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>
    nnoremap <C-j> :call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>

    " Mover tab a otro split
    nnoremap <S-l> :call VSCodeNotify('workbench.action.moveEditorToNextGroup')<CR>
    nnoremap <S-h> :call VSCodeNotify('workbench.action.moveEditorToPreviousGroup')<CR>

    " Cambiar entre splits
    nnoremap <C-l> :call VSCodeNotify('workbench.action.focusRightGroup')<CR>
    nnoremap <C-h> :call VSCodeNotify('workbench.action.focusLeftGroup')<CR>

    " Explorador lateral
    nnoremap <C-t> :call VSCodeNotify('workbench.view.explorer')<CR>
else
    " ordinary Neovim
endif

lua << EOF
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<silent><leader>d", [["_dP]])
EOF

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=700})
augroup END

