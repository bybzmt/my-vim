" install bundles
if filereadable(expand("~/.vim/vimrc.bundles"))
    source ~/.vim/vimrc.bundles
endif


set nocompatible
filetype plugin indent on
" 开启语法高亮
syntax on

" 修改leader键
let mapleader = ','
let g:mapleader = ','

"leader键捷键超时时间
set timeoutlen=2000

" history存储容量
set history=2000
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI
" 取消备份。 视情况自己改
set nobackup
" 关闭交换文件
"set noswapfile
" 突出显示当前列
"set cursorcolumn
" 突出显示当前行
"set cursorline
" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=
" 鼠标暂不启用, 键盘党....
"set mouse-=a
" 启用鼠标
set mouse=a
" Hide the mouse cursor while typing
"set mousehide
" change the terminal's title
set title
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set t_vb=
set tm=500

" Remember info about open buffers on close
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================

" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" set winwidth=79

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" 显示行号
set number
" 取消换行
"set nowrap

" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2


" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun
let g:DisableAutoPHPFolding = 1

" 缩进配置
" Smart indent
set smartindent
" 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent

" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
"set shiftround

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

" 00x增减数字时使用十进制
set nrformats=


"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
"set fileencodings=ucs-bom,utf-8,big5,cp936,gb18030,cp932,euc-jp,euc-kr,latin1
set fileencodings=ucs-bom,utf-8,shift-jis,gb18030,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

"==========================================
" others 其它设置
"==========================================
" vimrc文件修改之后自动加载, windows
autocmd! bufwritepost _vimrc source %
" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %

" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore+=*.swp,*.bak,*.pyc,*.class,.svn
set wildignore+=*.o,*~,*.pyc,*.class

" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" quickfix window  s/v to open in split window,  ,gd/,jd => quickfix window => open it
autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K

" command-line window
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>


" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================

" F1 废弃这个键,防止调出系统帮助
noremap <F1> <Esc>"

" F2 切换:行号开/行号关/相对行号
function! HideNumber()
    if (&number == 0)
        set number
        set norelativenumber
    elseif (&relativenumber == 1)
        set nonumber
        set norelativenumber
    else
        set relativenumber number
    endif
endfunc
nnoremap <F2> :call HideNumber()<CR>

" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>

" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>

" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" tab切换
" map <leader>th :tabfirst<cr>
" map <leader>tl :tablast<cr>

" map <leader>tj :tabnext<cr>
" map <leader>tk :tabprev<cr>
" map <leader>tn :tabnext<cr>
" map <leader>tp :tabprev<cr>

" map <leader>te :tabedit<cr>
" map <leader>td :tabclose<cr>
" map <leader>tm :tabm<cr>

" normal模式下切换到确切的tab
" noremap <leader>1 1gt
" noremap <leader>2 2gt
" noremap <leader>3 3gt
" noremap <leader>4 4gt
" noremap <leader>5 5gt
" noremap <leader>6 6gt
" noremap <leader>7 7gt
" noremap <leader>8 8gt
" noremap <leader>9 9gt
" noremap <leader>0 :tablast<cr>

" 新建tab  Ctrl+t
" nnoremap <C-t>     :tabnew<CR>
"nnoremap <C-w>     :tabclose<CR>
" inoremap <C-t>     <Esc>:tabnew<CR>

noremap <C-[> :pop<CR>

"在新标签打开tag
noremap <C-p> <c-w><c-]><c-w>T

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

"==========================================
" Theme Settings  主题设置
"==========================================

" Set extra options when running in GUI mode
if has("gui_running")
    if has("gui_gtk")
        " set guifont=YaHei\ Consolas\ Hybrid\ 11
        set guifont=Monaco\ 11
    else
        " set guifont=YaHei_Consolas_Hybrid:h11
        set guifont=Monaco:h11
    endif

    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guioptions=a

    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd

	"设置窗口大小
	set lines=28
	set columns=120
else
    set t_Co=256
endif


"theme主题
"set background=dark
"set t_Co=256

"colorscheme evening
"colorscheme solarized
"colorscheme molokai
"colorscheme desert
colorscheme morning


" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

au FileType php call PHPFuncList()
function PHPFuncList()
    " tab相关变更
    " 设置Tab键的宽度        [等同的空格个数]
    set tabstop=4
    " 每一次缩进对应的空格数
    set shiftwidth=4
    " 按退格键时可以一次删掉 4 个空格
    set softtabstop=4

    set dictionary-=~/.vim/dic/php.dic dictionary+=~/.vim/dic/php.dic
    set complete-=k complete+=k
endfunction

au FileType javascript call JavascriptFuncList()
function JavascriptFuncList()
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
    set expandtab
endfunction

