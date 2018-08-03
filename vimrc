set autoindent
set softtabstop=2
set shiftwidth=2
set number
syntax on
set hlsearch
set splitright

inoremap <silent> jj <ESC>
nnoremap <silent><C-e> :NERDTreeToggle<CR>

nnoremap <C-h> :split<CR> :GoDef<CR>
nnoremap <C-k> :vsp<CR> :GoDef<CR>
nnoremap <C-\[>  :pop<CR>
set nocompatible
filetype plugin indent off

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'cohama/lexima.vim'
Plug 'fatih/vim-go'

call plug#end()

filetype plugin indent on
set clipboard=unnamed,autoselect
set background=dark

" Go Setting
autocmd FileType go setl tabstop=8 expandtab shiftwidth=8 softtabstop=8
autocmd BufWritePre *.go :GoImports

" common
autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufWritePre * set binary noeol

" Leader
let mapleader = "\<Space>"
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)


let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1