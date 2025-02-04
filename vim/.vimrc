set g:mapleader ' '
set g:maplocalleader ' '

set splitright
set splitbelow
set noshowmode
set noruler
set expandtab
set cursorline
set breakindent
set scrolloff=5
set copyindent
set smartindent
set cindent
set number
set relativenumber
set numberwidth=3
set ignorecase
set infercase
set smartcase
set noswapfile
set clipboard+=unnamedplus
set foldlevelstart=99
set updatetime=400
set timeoutlen=500
set ttimeoutlen=10
set wildignorecase
set pumheight=15
set tabstop=2
set shiftwidth=2
set virtualedit+=block

set list
set listchars+=trail:·

set stc='%=%l%s'

nmap x "_x
vmap x "_x
nmap X "_X
vmap X "_X
nmap c "_c
vmap c "_c
nmap C "_C
vmap C "_C
nmap s "_s
vmap s "_s
nmap S "_S
vmap S "_S

nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <A-[> <C-w><
nmap <A-]> <C-w>>
nmap <A-,> <C-w>-
nmap <A-.> <C-w>+
nmap <A--> <cmd>resize | vertical resize<cr>
nmap <leader>tn <cmd>tabnew<cr>
nmap <leader>ts <cmd>tab split<cr>
nmap <leader>tc <cmd>silent! tabclose<cr>

nmap <C-x>[ <cmd>vnew | vertical resize -20 | term<cr>
nmap <C-x>] <cmd>new | resize -10 | term<cr>

nmap <Esc> <cmd>nohlsearch<cr>

imap <C-l> <cmd>normal! zz<cr>

nmap <A-/> <cmd>let cur_col = col('.')<cr>yyp:call cursor('.', cur_col)<cr>

nmap j gj
nmap k gk

xmap <A-j> :move '>+1<cr>gv-gv
xmap <A-k> :move '>-2<cr>gv-gv

vmap < <gv
vmap > >gv

nmap <C-x>k :bdelete 
nmap <C-x>c <cmd>confirm qa<cr>

imap <C-s> <cmd>silent! write<cr>
nmap <C-s> <cmd>silent! write<cr>
xmap <C-s> <cmd>silent! write<cr>
smap <C-s> <cmd>silent! write<cr>

cmap <C-n> <Down>
cmap <C-p> <Up>
cmap <C-f> <Right>
cmap <C-b> <Left>
cmap <C-a> <Home>
cmap <C-e> <End>

cmap %c <C-R>=expand('%:p:~:h')<cr>
cmap %p <C-R>=expand('%:p:~')<cr>

tmap <A-Esc> <C-\><C-n>
tmap <A-h> <C-\><C-n><C-w>h
tmap <A-j> <C-\><C-n><C-w>j
tmap <A-k> <C-\><C-n><C-w>k
tmap <A-l> <C-\><C-n><C-w>l
