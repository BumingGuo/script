" Vim-Plug
call plug#begin('~/.config/nvim/plugged')

" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'violet'
let g:airline_powerline_fonts = 1

" 缩进线
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '▏'
"
" 自动补全括号
Plug 'Raimondi/delimitMate'
Plug 'luochen1990/rainbow'      " 彩虹括号
let g:rainbow_active = 1

" 格式对齐
Plug 'godlygeek/tabular'
vmap t :Tabularize /

" 快速代码注释
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims  = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
nmap cc <plug>NERDCommenterToggle
vmap cc <plug>NERDCommenterToggle

" 插入代码段
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'auxetic/vim-snippets', { 'branch': 'liuxu' }  " 'honza/vim-snippets'

" 快速移动
Plug 'easymotion/vim-easymotion'
nmap <Leader>a <Plug>(easymotion-overwin-line)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Syntastic
" Plug 'vim-syntastic/syntastic', { 'for': [ 'tex', 'fortran' ] }
" let g:syntastic_fortran_compiler=''
" let g:syntastic_tex_checkers=['']
" let g:syntastic_cuda_nvcc_args=' -arch=sm_35'
" let g:syntastic_check_on_wq=0
" let g:syntastic_error_symbol='x'
" let g:syntastic_warning_symbol='*'
" nnoremap <Leader>c :SyntasticCheck<cr>
" nnoremap <Leader>r :SyntasticReset<cr>

" C/C++
Plug 'roxma/ncm-clang', { 'for': ['c', 'c++']}

" Julia
Plug 'JuliaEditorSupport/julia-vim'
let g:default_julia_version = '0.6'
" Plug 'Shougo/deoplete.nvim',                { 'for': ['julia'] }
" Plug 'JuliaEditorSupport/deoplete-julia',   { 'for': ['julia'] }
" let g:deoplete#enable_at_startup = 1

" LaTex
Plug 'lervag/vimtex'
let g:tex_conceal = ""
let g:vimtex_view_general_viewer = 'evince'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:tex_flavor = 'latex'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]
let g:signify_disable_by_default = 1
nnoremap <f1> :SignifyToggle<cr>

call plug#end()

colorscheme desert
set guicursor=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设定默认解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

" 显示行号
set nu

" history文件中需要记录的行数
set history=100

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 与windows共享剪贴板
set clipboard+=unnamed

" 侦测文件类型
"^filetype on

" 载入文件类型插件
"^filetype plugin on

" 为特定文件类型载入相关缩进文件
"^filetype indent on

" 保存全局变量
set viminfo+=!

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 高亮字符，让其不受100列限制
" :highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
" :match OverLength '\%101v.*'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 不要备份文件（根据自己需要取舍）
"set nobackup

" 不要生成swap文件，当buffer被丢弃的时候隐藏它
"setlocal noswapfile
"set bufhidden=hide

" 字符间插入的像素行数目
set linespace=0

" 增强模式中的命令行自动完成操作
set wildmenu

" 在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=1

" 不让vim发出讨厌的滴滴声
set noerrorbells

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5

" 在搜索的时候忽略大小写
set ignorecase

" 如果搜索的单词含有大写字母，则区分大小写
set smartcase

" 不要高亮被搜索的句子（phrases）
set hlsearch
map <Space> :nohl<cr>

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
"set incsearch

" 输入:set list命令是应该显示些啥？
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 不要闪烁
set novisualbell

" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime("%d/%m/%y\ -\ %H:%M")}

" 当前行加粗
set cursorline
hi CursorLine term=bold cterm=bold guibg=DarkGrey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动格式化
set formatoptions=tcrqn

" 继承前一行的缩进方式，特别适用于多行注释
" set autoindent

" 为C程序提供自动缩进
set smartindent

" 使用C样式的缩进
set cindent
set cinkeys="0),:,0#,!^F,o,O,e"

" 制表符为4
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 不要用空格代替制表符
"set noexpandtab

" 不要换行
set nowrap

" 在行和段开始处使用制表符
"set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 键绑定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl + s 保存文件
noremap  <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" 粘贴模式
set pastetoggle=<F12>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fortran
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let fortran_free_source=1
let fortran_have_tabs=1
"let fortran_more_precise=1
let fortran_do_enddo=1
let fortran_fold=1
let fortran_indent_more=1
set expandtab
set fdm=indent
set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cuda, julia
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.cu		setf cuda
au BufNewFile,BufRead *.cuh		setf cuda
au BufNewFile,BufRead *.jl		setf julia

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" latex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.tex set tabstop=2
au BufNewFile,BufRead *.tex set softtabstop=2
au BufNewFile,BufRead *.tex set shiftwidth=2
au BufNewFile,BufRead *.bib set tabstop=2
au BufNewFile,BufRead *.bib set softtabstop=2
au BufNewFile,BufRead *.bib set shiftwidth=2

" 保存文件时去除行尾空格
autocmd FileType c,cpp,python,fortran,rust,sh,tex autocmd BufWritePre <buffer> :%s/\s\+$//e
" 光标移动到文件关闭时的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" scroll left
map  <C-h> 10zh
imap <C-h> <ESC>10zhi
map  <C-l> 10zl
imap <C-l> <ESC>10zli
