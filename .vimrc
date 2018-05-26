call plug#begin('~/.vim/bundle')
Plug 'shougo/vimproc', {'do': 'make'}	" Async
Plug 'tpope/vim-sensible'		" Sensible defaults
Plug 'w0rp/ale'				" lint
Plug 'Raimondi/delimitMate'		" auto-completion for brackets and such
Plug 'flazz/vim-colorschemes'		" A nice collection of colorschemes
Plug 'tpope/vim-surround'		" Change surroundings (cs, ds)
Plug 'tpope/vim-commentary'		" (un)Comment (gcc, gc)
Plug 'tpope/vim-eunuch'			" UNIX-like commands
Plug 'ap/vim-css-color'			" CSS color support
Plug 'airblade/vim-gitgutter'		" Git integration
Plug 'ludovicchabant/vim-gutentags'	" Tag management
Plug 'scrooloose/nerdtree'		" Nerdtree (bloat)
Plug 'sjl/gundo.vim'			" Gundo (bloat)
Plug 'vim-airline/vim-airline'		" Status bar bloat
Plug 'vim-airline/vim-airline-themes'	" more bloat
Plug 'christoomey/vim-tmux-navigator'	" tmux integration
Plug 'pandark/42header.vim'		" 42 Header
call plug#end()
" Vim 8.1 debug
packadd termdebug			" gdb term integration
let g:termdebug_wide = 1
set mouse=a

" color scheme
colorscheme badwolf
let g:airline_theme='badwolf'
set background=dark

" airline unicode fix
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = 'lr'

" tmpfiles
set noswapfile
set undofile
set undodir=$HOME/.vim/undo

" 42 indent style
filetype plugin indent on
autocmd Filetype c setlocal sw=4 sts=4 ts=4 noexpandtab
autocmd Filetype cpp setlocal sw=4 sts=4 ts=4 noexpandtab
autocmd Filetype sh setlocal sw=4 sts=4 ts=8 expandtab
autocmd Filetype python setlocal sw=4 sts=4 ts=8 expandtab

" 42 comment style
autocmd FileType c setlocal comments=sr:/*,mb:**,ex:*/

" Header filetype fix
autocmd BufRead,BufNewFile *.h,*.c set filetype=c

" Useful display stuff
match ErrorMsg '\%>80v.\+' " warn after 80 col
set list
set listchars=trail:~,extends:>,tab:▸·
set relativenumber
autocmd InsertEnter * :set number norelativenumber " dynamic relativenumber
autocmd InsertLeave * :set relativenumber nonumber

" Header key
nmap <f1> :FortyTwoHeader<CR>

" Omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Gutentags
let g:gutentags_cache_dir = '~/.vim/tags'
let g:gutentags_ctags_exclude = ['*.md', '*.txt']

" NERDdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.o$', '\.a$', '\.so$']

" Gundo
map <f5> :GundoToggle<CR>

" ALE
let g:ale_c_clang_options='-std=c89 -Wall -Wextra -Wpedantic -Iinclude -Iincludes -Ilibft -Ilibft/includes -I..libft/includes'
let g:ale_c_gcc_options = g:ale_c_clang_options
let g:ale_linters = {'c': ['gcc']}
