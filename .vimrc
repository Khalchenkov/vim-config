" Basic configs
set number
set relativenumber
set tabstop=4
set shiftwidth=4
syntax enable
set mouse=a
let mapleader = " "
set t_vb=
set visualbell t_vb=
set novisualbell
set updatetime=300
set nowritebackup
set foldmethod=syntax

" cursor
let &t_SI = "\e[0 q"
let &t_EI = "\e[2 q"

set nowrap
set scrolloff=8
set hidden
set whichwrap+=<,>,h,l

nmap qq :q<cr>
nmap <leader>w :w!<cr>
nmap <leader>qq :bd<cr>
nmap <leader>qa :bufdo bd<cr>
nmap <leader><right> :bnext<cr>
nmap <leader><left> :bprevious<cr>
nmap <leader>b :Buffers<cr>

" window navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" navigation in insert
imap <A-h> <left>
imap <A-j> <down>
imap <A-k> <up>
imap <A-l> <right>

" delete with Alt + d
imap <A-d> <del>

imap qw <esc>
vmap qw <esc>
imap <C-s> <esc>
nmap <leader>f :Files<cr>
nmap <leader>l :Lines<cr>

" Rust hotkey
nmap <leader>rf :RustFmt<cr>

set incsearch
set nobackup
set nowb
set noswapfile
set mousemodel=popup
tab sball
set switchbuf=useopen
map <F2> :NERDTreeToggle<CR>
set ttyfast
set colorcolumn=79
set cursorline
set iminsert=0

set nocompatible              " be iMproved, required

" настройки Vim-Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" let Vundle manage Vundle, required
"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

"Plugin 'VundleVim/Vundle.vim'

call plug#begin('~/.vim/plugged')

"---------=== Code/project navigation ===-------------
Plug 'scrooloose/nerdtree'            " Project and file navigation
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'majutsushi/tagbar'              " Class/module browser

"------------------=== Other ===----------------------
Plug 'vim-airline/vim-airline'              " Lean & mean status/tabline for vim
Plug 'flazz/vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug '907th/vim-auto-save'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}

"--------------=== Snippets support ===---------------
Plug 'honza/vim-snippets'             " snippets repo

"---------------=== Languages support ===-------------
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

call plug#end()                       " required
filetype on
filetype plugin on
filetype plugin indent on

" vim-auto-save
let g:auto_save = 1

" Auto save
let g:prettier#autoformat = 1
let g:prettier#autoformat_enabled = 0

" Rust
let g:syntastic_rust_checkers=['cargo']
let g:rust_cargo_avoid_whole_workspace=1
let g:rust_cargo_check_all_targets=1
let g:rust_cargo_check_all_features=1
let g:rust_cargo_check_examples=1
let g:rust_cargo_check_tests=1
let g:rust_cargo_check_benches=1
let g:rust_keep_autopairs_default=1
let g:rust_clip_command = 'xclip -selection clipboard'



let g:ale_linters = {'rust': ['analyzer']}
if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \ })
endif

if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \ })
endif

if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \   'initialization_options': {
        \     'cargo': {
        \       'buildScripts': {
        \         'enable': v:true,
        \       },
        \     },
        \     'procMacro': {
        \       'enable': v:true,
        \     },
        \   },
        \ })
endif
let g:ale_rust_analyzer_executable=1
let g:ale_rust_analyzer_config=1
let g:ale_rust_cargo_use_check=1
let g:ale_rust_cargo_check_all_targets=1
let g:ale_rust_cargo_check_tests=1
let g:ale_rust_cargo_check_examples=1
let g:ale_rust_cargo_default_feature_behavior=1
let g:ale_rust_cargo_include_features=1
let g:ale_rust_cargo_avoid_whole_workspace=1
let g:ale_rust_cargo_use_clippy=1
let g:ale_rust_cargo_clippy_options=1
let g:ale_rust_cargo_target_dir=1
let g:ale_rust_rls_executable=1
let g:ale_rust_rls_toolchain=1
let g:ale_rust_rls_config=1
let g:ale_rust_rustc_options=1
let g:ale_rust_ignore_error_codes=1
let g:ale_rust_ignore_secondary_spans=1
let g:ale_rust_rustfmt_options=1
let g:ale_rust_rustfmt_executable=1

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

" Настройки табов для Python, согласно рекоммендациям
set smarttab
set expandtab "Ставим табы пробелами
set softtabstop=4 "4 пробела в табе
" Автоотступ
set autoindent

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

" Moving string
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Включаем 256 цветов в терминале, мы ведь работаем из иксов?
" Нужно во многих терминалах, например в gnome-terminal
set t_Co=256

" Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py,*.rs normal m`:%s/\s\+$//e ``

syntax on "Включить подсветку синтаксиса

let g:coc_disable_startup_warning = 1

set nu "Включаем нумерацию строк
set mousehide "Спрятать курсор мыши когда набираем текст
set termencoding=utf-8 "Кодировка терминала
" Удобное поведение backspace
set backspace=indent,eol,start
" Вырубаем черточки на табах
set showtabline=1

" Переносим на другую строчку, разрываем строки
set linebreak

" Вырубаем .swp и ~ (резервные) файлы
set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251

set clipboard=unnamed
set ruler

" ColorScheme
set bg=dark
colorscheme PaperColor

" Colors for messages in code
set termguicolors
hi CocErrorHighlight guibg=#6f1313 guifg=white
