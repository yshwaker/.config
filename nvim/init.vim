"-------------------------------------------------------------------------------
" Prerequisite
"-------------------------------------------------------------------------------
" - install `fzf` and `ripgrep` via package manager
" - install Node.js for coc.vim


"-------------------------------------------------------------------------------
" General
"-------------------------------------------------------------------------------

set nocompatible " Use vim rather than vi
set number
set encoding=utf-8
syntax enable
set title

" Tab and Indent
set autoindent " Auto indent for new line
set smartindent 
filetype on  " File type detection
filetype plugin on  " Loading the plugin files for specific file types
filetype indent on " use indent rule per filetype. Stored like `~/.vim/indent/python.vim`


" Searching
set hlsearch
set incsearch " Real-time search
set ignorecase " Ignore case when searching
set smartcase " Override ignorecase when typing upper case
set showmatch " Temporarily jump the the other bracket when one bracket is inserted

" Display
if has('termguicolors')
  set termguicolors
endif
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
set list
set list lcs=trail:·,tab:»· " show · for trailing white space

set mouse=a " Enable mouse
set scrolloff=5 " Minimum lines to keep above or under the cursor

" Others
set nobackup " don't create corresponding backup file
set fileencodings=utf-8,gb18030,cp936,big5 " Set the encode

" Window movement
" switch window if exists, split window if not
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>



"-------------------------------------------------------------------------------
" Vim Plug
"-------------------------------------------------------------------------------
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Color Scheme
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/forest-night'

Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sleuth' " decide the space/tab automatically
Plug 'editorconfig/editorconfig-vim'

call plug#end()

"-------------------------------------------------------------------------------
" Theme
"-------------------------------------------------------------------------------
colorscheme forest-night
set cursorline

"-------------------------------------------------------------------------------
" FZF
"-------------------------------------------------------------------------------
set rtp+=/usr/local/opt/fzf " inter macos homebrew location
set rtp+=/opt/homebrew/opt/fzf " arm macos homebrew location

" == keybindings
nnoremap <C-p> :GFiles<CR>
nnoremap <C-o> :Buffers<CR>
nnoremap <C-f> :Rg! 
" open selected file in different ways
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" --layout top-down list
" --preview syntax highlight
let $FZF_DEFAULT_OPTS="--layout reverse --preview 'bat'"

"-------------------------------------------------------------------------------
" Coc
"-------------------------------------------------------------------------------
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']


