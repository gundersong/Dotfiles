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
set undodir=/.vim/undodir
set undofile
set incsearch
set backspace=indent,eol,start

let mapleader = " "

set colorcolumn=100
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
nnoremap <leader>gd <Plug>(coc-definition)
nnoremap <leader>gy <Plug>(coc-type-definition)
nnoremap <leader>gi <Plug>(coc-implementation)
nnoremap <leader>gr <Plug>(coc-references)
nnoremap <leader>rr <Plug>(coc-rename)
nnoremap <leader>g[ <Plug>(coc-diagnostic-prev)
nnoremap <leader>g] <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nnoremap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart<CR>
nnoremap <leader>gf :NERDTreeFind<CR>

inoremap <C-c> <esc>

nnoremap E <End>
nnoremap q b
nnoremap <C-f> :Files<CR>
nnoremap <C-b> :NERDTreeFind<CR>

" Map cmd-shift-f to git grep search
nnoremap <C-S-F> :GGrep<CR>
