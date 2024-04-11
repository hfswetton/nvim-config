set termguicolors

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

highlight ColorColumn ctermbg=9 "display ugly bright red bar at color column number

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

" dashboard-nvim
"Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvimdev/dashboard-nvim'

" lspsaga
Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvimdev/lspsaga.nvim'

" vim-floaterm
Plug 'voldikss/vim-floaterm'

" tokyonight
Plug 'folke/tokyonight.nvim'

" GitHub Copilot
"Plug 'github/copilot.vim'

call plug#end()
