set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')


" Vim settings and behaviour
Plug 'sjl/vitality.vim'
Plug 'tpope/vim-sensible'
" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" JSON with Comments 
Plug 'kevinoid/vim-jsonc'
" syntax linter
Plug 'scrooloose/syntastic'
" Better filetree
Plug 'scrooloose/nerdtree'
" Display tags in window
Plug 'preservim/tagbar'
" fuzzy search
Plug 'kien/ctrlp.vim'
" EditorConfig plugin for Vim http://editorconfig.org
Plug 'editorconfig/editorconfig-vim'
" A Vim plugin which shows a git diff in the gutter
Plug 'airblade/vim-gitgutter'
" Emmet
Plug 'mattn/emmet-vim'
" Languages
Plug 'kylef/apiblueprint.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'dag/vim-fish'
Plug 'hashivim/vim-terraform'
Plug 'rust-lang/rust.vim'

call plug#end()

" Appearance
language en_US.UTF-8
syntax on

set termguicolors
set showmode
set hidden " Handle multiple buffers better
set number " Show line numbers
set title
set mouse=a
set shortmess=Ia
set cmdheight=2 " Give more space for displaying messages.
set signcolumn=number " Always show the signcolumn

" TextEdit might fail if hidden is not set.
set hidden

" Keybindings
set backspace=indent,eol,start

" Formatting
set tabstop=2 " Use 4 spaces to a tab
set shiftwidth=2 " As above
set expandtab " Expand tabs into spaces

" Completion
set complete=.,w,b,u,t,i
set completeopt=menu
set wildmenu " Better completion in the CLI
set wildmode=longest:full,full " Completion settings

" Editing
set showmatch
set matchtime=3
set shortmess+=c
set updatetime=300

" Search
set hlsearch " Highlight all search matches
set incsearch " Highlight matches as you type
set ignorecase
set smartcase " Be case-sensitive if expression contains a capital letter

" Backup
set nobackup
set nowritebackup

"Copy copy register to OS X general pasteboard
function! PBCopy()
  call system("pbcopy", getreg(""))
endfunction

" Paste from OS X general pasteboard to copy register
function! PBPaste()
  call setreg("", system("pbpaste"))
endfunction

" By the power of https://github.com/sjl/vitality.vim, copies and pastes
" " to the OS X pasteboard when switching between vim and other windows
" " (even in tmux)
autocmd FocusLost * :call PBCopy()
autocmd FocusGained * :call PBPaste()

" Key mapping
nmap <C-o> :NERDTreeFocus<cr>
nmap <C-i> :TagbarToggle<cr>

" Working with tabs
nnoremap <C-l> :tabn<cr>
nnoremap <C-h> :tabp<cr>
nnoremap <C-c> :tabnew<cr>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Rust
let g:rustfmt_autosave = 1
