set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Native settings
filetype plugin on
au TextYankPost * silent! lua vim.highlight.on_yank()

" Load vim-plug
call plug#begin('~/.config/nvim/plugged')

" Plugins
Plug 'neovim/nvim-lspconfig'
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'neomake/neomake'  "Possibly not needed due to LSP
Plug 'mg979/vim-visual-multi'
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
Plug 'ryanoasis/vim-devicons'  "Should always be last!

call plug#end()

" COQ settings
" let g:coq_settings = { 'auto_start': 'shut-up' }

" jedi-vim settings
let g:jedi#completions_enabled = 1  " not needed if using COQ
let g:jedi#use_splits_not_buffers = "right"  " open go-to function in split, not new buffer

" Neomake settings
"let g:neomake_python_enabled_makers = ['flake8']
"call neomake#configure#automake('w')

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

" NERDTree settings
nnoremap <C-t> :NERDTreeToggle<CR>
"Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Settings for vim-nerdtree-syntax-highlight
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" neovim LSP configuration
lua require('lua_config')


" Enable tab/shift-tab to cycle completion options
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"
"let g:completion_enable_fuzzy_match = 1
"set completeopt=menuone,noinsert,noselect
