set encoding=utf-8
set t_Co=256  " set color
syntax on

" Some server have issues with backup files
set nobackup
set nowritebackup

" Set cursor type
let &t_SI = "\e[6 q"  " Insert Mode
let &t_EI = "\e[2 q"  " Everything else

" Remap leader key
let mapleader = " "

set number
set relativenumber
set nowrap
set incsearch
set nohlsearch
set signcolumn=yes
set expandtab
set shiftwidth=4
set softtabstop=4

" Key bindings for Tab navigation
map <C-T><up>    :tabr<cr>
map <C-T><down>  :tabl<cr>
map <C-T><left>  :tabp<cr>
map <C-T><right> :tabn<cr>

" Save file using leader
nnoremap <leader>w :w<cr>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Autocomplete () bracket
inoremap ( ()<left>
inoremap <expr> ) getline('.')[col('.')-1]==')' ? '<c-g>U<right>' : ')'

" Autocomplete [] bracket
inoremap [ []<left>
inoremap <expr> ] getline('.')[col('.')-1]==']' ? '<c-g>U<right>' : ']'

" Autocomplete {} bracket
inoremap { {}<left>
inoremap <expr> } getline('.')[col('.')-1]=='}' ? '<c-g>U<right>' : '}'
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Press jj to exit insert mode
inoremap jj <ESC>

" FZF keybinding
nnoremap <leader>o :FZF -m<cr>
nnoremap <leader>p :FZF -m --preview bat\ --color=always\ --style=numbers\ {}<cr>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Plugins
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

" IMPORTANT: for gruvbox to work, colorscheme command
" has to be after Plug 'morhetz/gruvbox'
" Use gruvbox colorscheme
colorscheme gruvbox

" Use gruvbox dark (or light)
set background=dark

" Make the contrast hard (or soft, medium)
let g:gruvbox_contrast_dark = 'hard'

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction

