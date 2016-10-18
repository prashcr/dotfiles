" Vim-Plug
call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
" Emmet for vim
Plug 'mattn/emmet-vim', { 'for': 'html' }
" Auto-insert closing quote/paren/brace
Plug 'jiangmiao/auto-pairs'
" JavaScript highlighting
Plug 'othree/yajs', { 'for': 'javascript' }
" Async linter
Plug '~/code/ale'
" Python
Plug 'klen/python-mode', { 'for': 'python' }
" TypeScript syntax
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
" TypeScript completion
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
" Git diff symbols
Plug 'airblade/vim-gitgutter'
" Pandoc syntax
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown.pandoc' }
" Autocomplete
" Plug 'Valloric/YouCompleteMe'
" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Vimperator syntax highlighting
Plug 'vimperator/vimperator.vim', { 'for': 'vimperator' }

call plug#end()

" Turn off vi compatibility
set nocompatible
" Syntax highlighting
syntax enable
" Use OSX clipboard
set clipboard=unnamed
" Enable mouse selection
set mouse=a
" Swap : and ;
nnoremap ; :
nnoremap : ;
" Map , as leader
let mapleader=","
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
let base16colorspace=256 " Access colors in 256 colorspace
set t_Co=256
set background=dark
colorscheme base16-tomorrow-night

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set fileformats=unix,dos,mac
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs
set smarttab
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
" Linebreak on 120 characters
set linebreak
set textwidth=120
set autoindent
set smartindent
set wrap

" Filetype specific
autocmd Filetype markdown set textwidth=0
augroup pandoc_syntax
  au! BufNewFile,BufFilePRe,BufRead *.pdc set filetype=markdown.pandoc
augroup END


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
      \   'javascript': ['eslint'],
      \}
let g:ale_sign_column_always = 1

" Help ftplugin/ruby.vim because it gets confused by RVM
if !empty($MY_RUBY_HOME)
  let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/ruby/site_ruby/*'),"\n"),',')
endif

" Turn off pandoc syntax conceal
let g:pandoc#syntax#conceal#use = 0

let g:gitgutter_override_sign_column_highlight = 0
highlight LineNr ctermbg=NONE
highlight StatusLine ctermbg=NONE ctermfg=darkgrey
highlight SignColumn ctermbg=NONE
highlight GitGutterAdd ctermbg=NONE
highlight GitGutterChange ctermbg=NONE
highlight GitGutterDelete ctermbg=NONE
highlight GitGutterChangeDelete ctermbg=NONE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-toggle paste mode for xterm
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
