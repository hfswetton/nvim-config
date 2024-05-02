set termguicolors
au TextYankPost * silent! lua vim.highlight.on_yank()

" *** Config from https://neovim.io/doc/user/nvim.html#nvim-from-vim ***
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" *** Config from https://www.davidspencer.xyz/posts/neovim-as-an-ide-python/ ***
syntax on                       "syntax highlighting, see :help syntax
filetype plugin indent on       "file type detection, see :help filetype
set number                      "display line number
set relativenumber              "display relative line numbers
set path+=**                    "improves searching, see :help path
set noswapfile                  "disable use of swap files
set wildmenu                    "completion menu
set backspace=indent,eol,start  "ensure proper backspace functionality
set undodir=~/.cache/nvim/undo  "undo ability will persist after exiting file
set undofile                    "see :help undodir and :help undofile
set incsearch                   "see results while search is being typed, see :help incsearch
set smartindent                 "auto indent on new lines, see :help smartindent
set ic                          "ignore case when searching
set colorcolumn=80              "display color when line reaches pep8 standards
set expandtab                   "expanding tab to spaces
set tabstop=4                   "setting tab to 4 columns
set shiftwidth=4                "setting tab to 4 columns
set softtabstop=4               "setting tab to 4 columns
set showmatch                   "display matching bracket or parenthesis
set hlsearch incsearch          "highlight all pervious search pattern with incsearch

"highlight ColorColumn ctermbg=9 "display ugly bright red bar at color column number

" Keybind Ctrl+l to clear search
nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>

" When python filetype is detected, F5 can be used to execute script
autocmd FileType python nnoremap <buffer> <F5> :w<cr>:exec '!clear'<cr>:exec '!python3' shellescape(expand('%:p'), 1)<cr>

" *** Plugins ***
" uses vim-plug script located at ~/.local/share/nvim/site/autoload/plug.vim
call plug#begin()

" nvim-tree
Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'

" vim-surround
Plug 'tpope/vim-surround'

" nvim-cokeline
Plug 'nvim-lua/plenary.nvim'        " Required for v0.4.0+
Plug 'nvim-tree/nvim-web-devicons' " If you want devicons
Plug 'willothy/nvim-cokeline'

" feline
Plug 'feline-nvim/feline.nvim'

" nvim-lspconfig
" See https://microsoft.github.io/language-server-protocol/implementors/servers/ for possible LSPs
Plug 'neovim/nvim-lspconfig'

" fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

" dashboard-nvim
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvimdev/dashboard-nvim'

" nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" lspsaga
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvimdev/lspsaga.nvim'

" vim-floaterm
Plug 'voldikss/vim-floaterm'

" tokyonight
Plug 'folke/tokyonight.nvim'

" [from hw-tp-fed]
Plug 'jiangmiao/auto-pairs'
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
Plug 'sbdchd/neoformat'

" vim-easymotion
Plug 'easymotion/vim-easymotion'

" sneak.vim
Plug 'justinmk/vim-sneak'

" vim-visual-multi
Plug 'mg979/vim-visual-multi'

" vim-commentary
Plug 'tpope/vim-commentary'

" vim-indent-object
Plug 'michaeljsmith/vim-indent-object'

" GitHub Copilot
"Plug 'github/copilot.vim'

call plug#end()

" ***FloaTerm plugins***
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

" Neoformat settings
augroup fmt  " Run formatter on save
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1

" SimpylFold settings
let g:SimpylFold_docstring_preview = 1

" Enable tab/shift-tab to cycle completion options
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"
"let g:completion_enable_fuzzy_match = 1
"set completeopt=menuone,noinsert,noselect
