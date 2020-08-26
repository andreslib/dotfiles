set nocompatible              " required
filetype off                  " required

let mapleader = ","
let maplocalleader = ","

syntax on

" Edit .vimrc quickly "<leader>ev
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source .vimrc immediately
nnoremap <leader>sv :source $MYVIMRC<cr>

" Abbreviations
iabbrev @@  andreslib@gmail.com
iabbrev what what
iabbrev then then

" Wrap word in "" 
noremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Esacape
inoremap jk <esc>

" Comment in Python
autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" 
" Auto complete
" Bundle 'Valloric/YouCompleteMe'

" Color scheme
Plugin 'flazz/vim-colorschemes'

" Auto-indentation
Plugin 'vim-scripts/indentpython.vim'

" Simply Fold
Plugin 'tmhedberg/SimpylFold'

" Vim TMUX integration
Plugin 'christoomey/vim-tmux-navigator'

" Vim - TMUX
Plugin 'benmills/vimux'
Plugin 'greghor/vim-pyShell'
Plugin 'julienr/vim-cellmode'

" Conda - Vim
" Plugin 'cjrh/vim-conda'

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Load specific color scheme
colorscheme darkspectrum 

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix

" press <F9> to execute the current buffer with python (from
" https://stackoverflow.com/questions/18948491/running-python-code-in-vim
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>

" ipython-shell
noremap <leader>ss :call StartPyShell()<CR>
noremap <leader>ssk :call StopPyShell()<CR>

" code execution
nnoremap <leader>l  :call PyShellSendLine()<CR>
noremap <silent> <C-n> :call RunTmuxPythonCell(0)<CR>
noremap <C-a> :call RunTmuxPythonAllCellsAbove()<CR>
