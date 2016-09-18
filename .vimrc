" Vim-Plug
call plug#begin('~/.vim/plugged')

" Oceanic Next colorscheme
Plug 'mhartington/oceanic-next'
" Emmet for vim
Plug 'mattn/emmet-vim', { 'for': 'html' }
" Auto-insert closing quote/paren/brace
Plug 'jiangmiao/auto-pairs'
" JavaScript highlighting
Plug 'othree/yajs', { 'for': 'javascript' }
" Async linter
Plug 'w0rp/ale', { 'for': 'javascript' }

call plug#end()

" Turn off vi compatibility
set nocompatible

" Use OSX clipboard
set clipboard=unnamed

" Enable mouse selection
set mouse=a

" Enable filetype plugins
filetype plugin on
filetype indent on

" Give shift key a rest
map ; :

" Wild menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Relative line numbers
set relativenumber

" Search highlighting
set hlsearch
" incremental search (like web browsers)
set incsearch
" Ignore case when searching
set ignorecase
" Be smart about cases while searching
set smartcase
" Reset search
nnoremap <silent> \ :let @/=""<CR>
" Turn on magic for regexp
set magic

" Don't redraw while executing macros for better performance
set lazyredraw

" Theme
syntax enable
colorscheme OceanicNext
set t_Co=256
set background=dark
let g:oceanic_next_terminal_italic = 1
let g:oceanic_next_terminal_bold = 1
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set fileformats=unix,dos,mac

" Use spaces instead of tabs
set expandtab
" Be smart when using tabs
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Linebreak on 120 characters
set linebreak
set textwidth=120
set autoindent
set smartindent
set wrap

" Filetype specific
autocmd Filetype html,css,javascript set tabstop=2|set shiftwidth=2|set expandtab
autocmd Filetype markdown set textwidth=0

" Auto-toggle paste mode for xterm
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Always show the status line
set laststatus=2
" Bare-bones statusline based on ruler
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Asynchronous Lint Engine
let g:ale_linters = {
\   'javascript': ['eslint']
\}

" Help ftplugin/ruby.vim because it gets confused by RVM
if !empty($MY_RUBY_HOME)
 let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/ruby/site_ruby/*'),"\n"),',')
endif
