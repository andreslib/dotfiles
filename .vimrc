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
iabbrev waht what
iabbrev tehn then

" Create [''] in Python (Dataframe) and i between
noremap <leader>[ a['']<esc>hi

" Wrap word in "" 
noremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Escape
inoremap jk <esc>

" Open NERDTree
noremap <Leader>f :NERDTreeToggle<Enter>

" Comment in Python
" autocmd FileType python nnoremap <buffer> <localleader>com I#<esc>

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
" Plugin 'greghor/vim-pyShell'
" Plugin 'julienr/vim-cellmode'

" vim-slime and IPython
Plugin 'jpalardy/vim-slime', { 'on_ft': 'python' }
Plugin 'hanschen/vim-ipython-cell'


" Conda - Vim
" Plugin 'cjrh/vim-conda'

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Define tmux as default for vim-slime
let g:slime_target = "tmux"

" fix paste issues
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without
" asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

"------------------------------------------------------------------------------
"" ipython-cell configuration
"------------------------------------------------------------------------------
" Keyboard mappings. <Leader> is \ (backslash) by default

" map <Leader>s to start IPython
nnoremap <Leader>s :SlimeSend1 ipython --matplotlib<CR>

" map <Leader>r to run script
nnoremap <Leader>r :IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
nnoremap <Leader>R :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
nnoremap <Leader>c :IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
nnoremap <Leader>l :IPythonCellClear<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend

" map <Leader>p to run the previous command
nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>Q to restart ipython
nnoremap <Leader>Q :IPythonCellRestart<CR>

" map <Leader>d to start debug mode
nnoremap <Leader>d :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
nnoremap <Leader>q :SlimeSend1 exit<CR>


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

