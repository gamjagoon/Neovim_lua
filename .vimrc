syntax on
set mouse=a
set noerrorbells
set showmatch
set nofoldenable
set expandtab
set list
set listchars=tab:\|-,eol:$
set backspace=indent,eol,start
set ts=4 softtabstop=4
set shiftwidth=4
set nowrap
set splitbelow splitright
set hlsearch
set incsearch
set scrolloff=20
set hidden
set nobackup
set ai
set si
set noswapfile
set nowritebackup
set updatetime=300
set relativenumber
set number
set wildmenu

nnoremap <silent> <Leader>id :e ~/.vimrc<cr>

set clipboard=unnamedplus

" ctag search
set tags+=./tags
nnoremap <silent> gd :vsp <CR>:exec("tag ".expand("<cword>"))<cr>
nnoremap <silent> cb :bn<bar>bd#<cr>:bp<cr>

" window max-min
nnoremap <silent> <space>m <c-w>\|
nnoremap <silent> <space>, <c-w>=

nnoremap <Leader><Space> :nohl<cr>

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'asdfasdf/Vim-buftabline'
call plug#end()

let g:buftabline_numbers = 2
let g:buftabline_plug_max = 12
nnoremap <space>1 <Plug>BufTabLine.Go(1)
nnoremap <space>2 <Plug>BufTabLine.Go(2)
nnoremap <space>3 <Plug>BufTabLine.Go(3)
nnoremap <space>4 <Plug>BufTabLine.Go(4)
nnoremap <space>5 <Plug>BufTabLine.Go(5)
nnoremap <space>6 <Plug>BufTabLine.Go(6)
nnoremap <space>7 <Plug>BufTabLine.Go(7)
nnoremap <space>8 <Plug>BufTabLine.Go(8)
nnoremap <space>9 <Plug>BufTabLine.Go(9)
nnoremap <space>10 <Plug>BufTabLine.Go(10)

nnoremap <space>e :NERDTreeToggle<CR>
