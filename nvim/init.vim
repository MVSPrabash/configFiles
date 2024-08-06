let mapleader = ","

syntax on
set number
set relativenumber
set autoindent
set noexpandtab
set mouse=a
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set encoding=UTF-8


call plug#begin()

Plug 'https://github.com/preservim/nerdtree'		" NerdTree
Plug 'https://github.com/vim-airline/vim-airline'	" Status bar
Plug 'https://github.com/ryanoasis/vim-devicons'	" Developer Icons
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme

" Telescope for search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

" coc nvim for auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tree Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()



" Retro color Scheme
":colorscheme jellybeans
":colorscheme pablo
:colorscheme gruvbox

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>


" Nerd Tree Key Binding
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>


" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" Coc.nvim
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
:set completeopt-=preview " For No Previews
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" " Enable coc.nvim for C/C++
" let g:coc_global_extensions = ['coc-ccls']

" " Specify the path to compile_commands.json
" let g:coc_config_home = '~/.config/nvim/coc-settings.json'


" nasm file type for asm files
au BufRead,BufNewFile *.asm set filetype=nasm
