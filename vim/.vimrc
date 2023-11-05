setlocal noswapfile
set bufhidden=hide
colorscheme default
set number
set cursorline
set noruler
set shiftwidth=2
set softtabstop=2
set tabstop=2
set nobackup
set autochdir
set backupcopy=yes
set hlsearch
set noerrorbells
set novisualbell
set t_vb=
set magic
set smartindent
set backspace=indent,eol,start
set cmdheight=1
set laststatus=2
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%)
set foldenable
set foldmethod=syntax
set foldcolumn=0
setlocal foldlevel=1
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
