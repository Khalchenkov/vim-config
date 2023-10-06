" Basic configs
set number
set ruler
set relativenumber
set tabstop=4
set shiftwidth=4
syntax enable
set mouse=a
set updatetime=300
set nowritebackup
set foldmethod=syntax
set pumheight=25
set nowrap
set scrolloff=8
set hidden
set whichwrap+=<,>,h,l
set incsearch
set nobackup
set noswapfile
set mousemodel=popup
set switchbuf=useopen
set ttyfast
set colorcolumn=80
set cursorline
set iminsert=0
set nocompatible
set t_Co=256
set mousehide
set linebreak
set smarttab
set expandtab
set softtabstop=4
set autoindent

" cursor
let &t_SI = "\e[0 q"
let &t_EI = "\e[2 q"

" Leader
let mapleader = " "

nmap qq :q<cr>
nmap <leader>w :w!<cr>
nmap <leader>qq :bd<cr>
nmap <leader>qa :bufdo bd<cr>
nmap <leader><right> :bnext<cr>
nmap <leader><left> :bprevious<cr>

" Moving string
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" window navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" delete with Alt + d
imap <A-d> <del>

" Escape
imap qw <esc>
vmap qw <esc>
imap <C-s> <esc>

" Find
nmap <leader>ff :Files<cr>
nmap <leader>fl :Lines<cr>
nmap <leader>/ :BLines<cr>
nmap <leader>fb :Buffers<cr>

" NERDTree
map <F2> :NERDTreeToggle<CR>

" Rust hotkey
nmap <leader>rf :RustFmt<cr>

" настройки Vim-Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

call plug#begin('~/.vim/plugged')

"---------=== Code/project navigation ===-------------
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"------------------=== Other ===----------------------
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug '907th/vim-auto-save'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"--------------=== Snippets support ===---------------
Plug 'honza/vim-snippets'

"---------------=== Languages support ===-------------
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

call plug#end()

" Auto save
let g:auto_save = 1

" coc plug
let g:coc_global_extensions=[
    \'coc-json',
    \'coc-tsserver',
    \'coc-rust-analyzer',
    \'coc-css',
    \'coc-html',
    \'coc-xml',
    \'coc-yaml',
    \'coc-toml',
    \'coc-markdownlint',
    \'coc-clangd',
    \'coc-pyright',
    \'coc-go',
    \'coc-snippets',
    \]

"   JS, TS, Json
"    \
"    \'coc-json',
"    \'coc-tsserver',
"   Rust
"    \
"    \'coc-rust-analyzer',
"   HTML, CSS
"    \
"    \'coc-css',
"    \'coc-html',
"   XML, YAML, TOML, Markdown
"    \
"    \'coc-xml',
"    \'coc-yaml',
"    \'coc-toml',
"    \'coc-markdownlint',
"   C/C++
"    \
"    \'coc-clangd',
"   Python
"    \
"    \'coc-pyright',
"   Golang
"    \
"    \'coc-go',
"   Snippets
"    \
"    \'coc-snippets',

" Coc-config
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Remap <C-down> and <C-up> to scroll float windows/popups
nnoremap <silent><nowait><expr> <C-down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" ColorScheme
set bg=dark
colorscheme PaperColor

" Colors for messages in code
set termguicolors
hi CocErrorHighlight guibg=#6f1313 guifg=white
