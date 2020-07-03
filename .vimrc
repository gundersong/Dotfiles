syntax on

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set backspace=indent,eol,start
set hls!

let mapleader = " "
let NERDTreeShowHidden=1
let g:multi_cursor_exit_from_visual_mode=1
let g:multi_cursor_exit_from_insert_mode=1

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gruvbox-community/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kevinoid/vim-jsonc'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

colorscheme gruvbox

set background=dark
set t_Co=256
let g:javascript_plugin_flow = 1

" NERDTree split on right
set splitright

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
 endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

" autoformat
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Nerdtree - open fzf files in wondow
nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ?"\<c-w>\<c-w>" : '').":FZF\<cr>"
nnoremap <silent> <expr> <Leader><S-F> (expand('%') =~ 'NERD_tree' ?"\<c-w>\<c-w>" : '').":GGrep\<cr>"

" Git grep with FZF
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nnoremap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart<CR>
nmap <leader>gf :NERDTreeFind<CR>

nnoremap q b
inoremap <C-c> <esc> :noh<CR>
vnoremap <C-c> :noh<CR><esc>
nnoremap <C-c> <esc>
nnoremap <S-e> <End>
nnoremap <S-q> <Home>
nnoremap <C-x> :q<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-b> :NERDTreeFind<CR>

