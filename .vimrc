call plug#begin()

" List plugins here

Plug 'neoclide/coc.nvim'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'valloric/MatchTagAlways'
Plug 'kqito/vim-easy-replace'
Plug 'terryma/vim-smooth-scroll'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'

call plug#end()


" For indentLine
let g:matchup_matchparen_enabled = 1
let g:matchup_matchparen_offscreen = {'method': 'popup'}
let g:indentLine_char = '¦'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_color_term = 239

" For coc
set encoding=UTF-8
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

:set number
au VimEnter *  NERDTree

colorscheme desert

set hlsearch                     " Highlight searched string occurrences
hi CocFloating ctermbg=DarkGrey  " Floating menu bg color
hi CocMenuSel ctermbg=Blue       " Menu selection bg color
hi CocSearch ctermfg=Cyan        " Text color of the matching text
