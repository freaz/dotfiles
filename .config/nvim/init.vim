call plug#begin()

" Basics
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'

call plug#end()

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
