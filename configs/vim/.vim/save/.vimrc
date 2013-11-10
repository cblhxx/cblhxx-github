"wangshu changes begin
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
"set laststatus=2 "always show the status line
"set path=. ",~/QCOM_GP_296I,~/QCOM_GP_296I/hardware/qcom/camera,~/QCOM_GP_296I/frameworks/base/services/camera/libcameraservice

let g:LookupFile_TagExpr = string('/mnt/disk/wKF30064/myProject/filenametags') "string('/mnt/disk/wKF30064/QCOM_GP_296I/filenametags')

nmap <F7> :cn<cr>   " 切换到下一个结果
nmap <F6> :cp<cr>   " 切换到上一个结果
nmap <F8> \m
nmap <F9> :FufBufferTag<cr>
nmap \lf :LUTags<cr>
nmap \lb :LUBufs<cr>
nmap \lw :LUWalk<cr>
nmap \o  :FufBufferTag<cr>
nmap []  ][%
nmap ls  :ls<cr>

"set tags=./tags
"set tags=/mnt/disk/wKF30064/myProject/tags

filetype plugin on

set grepprg=gid

""""""""""""""""""""""""""""""
" lookupfile setting
" """"""""""""""""""""""""""""""
 let g:LookupFile_MinPatLength = 4               
 let g:LookupFile_PreserveLastPattern = 0       
 let g:LookupFile_PreservePatternHistory = 1    
 let g:LookupFile_AlwaysAcceptFirst = 1        
 let g:LookupFile_AllowNewFiles = 0           
" let g:LookupFile_TagExpr = '"./filenametags"'

"--------------------------------------------------------------------------------
" cscope
"--------------------------------------------------------------------------------
"cs add ~/QCOM_GP_296I/cscope.out ~/QCOM_GP_296I
cs add ~/myProject/cscope.out
set cscopequickfix=s-,c-,d-,i-,t-,e-
"set cscopetag

" 按下面这种组合键有技巧,按了<C-_>后要马上按下一个键,否则屏幕
" 就回到nomal状态了
" <C-_>s的按法是先按"Ctrl+Shift+-",然后很快再按"s"
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-->g :cs find g <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-->c :cs find c <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-->t :cs find t <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-->e :cs find e <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-->f :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <C-->i :cs find i <C-R>=expand("<cfile>")<cr><cr> :cw<cr>
nmap <C-->d :cs find d <C-R>=expand("<cword>")<cr><cr> :cw<cr>

"wangshu changes end

"配色三 黑底绿标加亮字
" To use it, copy it to
"     for Unix and OS/2: ~/.vimrc
"             for Amiga: s:.vimrc
" for MS-DOS and Win32: $VIM\_vimrc
"           for OpenVMS: sys$login:.vimrc
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
finish
endif
" VMS 系统会自动产生备份文件，所以这里把备份去掉，备份文件名为原来文件名后加~
if has("vms")
set nobackup
else
set backup
endif
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")
" 未知
" Don't use Ex mode, use Q for formatting
"map Q gq
" 未知
" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp
" 当终端支持颜色或者运行着gui版本时打开高亮及搜索关键词高亮
if &t_Co > 2 || has("gui_running")
syntax on
set hlsearch
endif
" Only do this part when compiled with support for autocommands.
if has("autocmd")
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
augroup END
else
set autoindent                " always set autoindenting on
endif " has("autocmd")
" Win32 简体中文
"set encoding=cp936
" Win32 简体中文
"set encoding=cp936
" UNIX 简体中文
set encoding=euc-cn
set fileencoding=gbk
" 颜色主题
colors darkblue
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" allow backspacing over everything in insert mode
"set backspace=indent,eol,start
" 设置 Backspace 和 Delete 的灵活程度，backspace=2 则没有任何限制
set backspace=2
" 设置命令历史行数为50行
set history=50
" 设置当前光标位置
set ruler
" 在命令末尾输完之前显示命令
set showcmd
" Make command line two lines high
set ch=1
" 设置搜索方向为向前搜索
set incsearch
" 显示TAB健
set list
set listchars=tab:>-,trail:-
" 设置路径，在 <C-W>f 等命令中涉及此参数
" 对于 windows 编程，path 可设为如下
" set path=.,"C:\Program Files\Microsoft Visual Studio\vc98\Include",,
" 对于 UNIX 编程，path 可设为如下
" set path=.,/usr/include,/usr/include/qt,,
" 告诉 Vim 先尝试用 UNIX 格式在尝试 MS-DOS 格式
set fileformats=unix,dos
" 搜索忽略大小写
"set ignorecase
" 先是行号
set nu!
" 打开不同类型文件特有的缩近
"filetype indent on
" 制表符TAB宽度，保持兼容
set tabstop=8
" 将TAB设定为空格
set softtabstop=4
" 指定下一级的缩近空格数
set cindent shiftwidth=4
" 在C注释中高亮字符串
let c_comment_strings=1
" 关闭备份
"set nobackup
" 设置备份目录
"set backupdir=~/.vim/backup
" 如果当前目录找不到tags文件，则向上一级目录查找
"set tags=./tags,./../tags,./*/tags,~/tags
"set tags=~/QCOM_GP_296I/TAGS
"map <F12> :runtime syntax/2html.vim<CR>
" 定义剪切命令
"unmap <C-x>
"map <C-x> "+x<CR>
"imap <C-x> <Esc>"+x<CR>i
" 定义复制命令
"unmap <C-c>
"map <C-c> "+y<CR>
"imap <C-c> <Esc>"+y<CR>i
" 定义粘贴命令
"unmap <C-v>
"map <C-v> "+gp<CR>
"imap <C-v> <Esc>"+gp<CR>i
" 定义撤销命令
"unmap <C-z>
"map <C-z> u
"imap <C-z> <Esc>ui
" 编辑模式下 Ctrl+o 插入新行
"unmap <C-o>
"imap <C-o> <Esc>o
" Ctrl+a 全选
"map <C-a> ggVG
"imap <C-a> <Esc>ggVGi
" Ctrl+s 保存文件
"unmap <C-s>
"map <C-s> :w<CR>
"imap <C-s> <Esc>:w<CR>i
"cmap <C-s> :w<CR>

map <C-q> :q<CR>
imap <C-q> <Esc>:q<CR>i
"map <F11> <C-W>w
" 语音朗读
nmap <F12> :w !festival --tts &
nmap <F11> :!killall festival&<CR>
" 用于浏览tags的脚本
"map ,t :Tlist<CR>
"map ,te :TagExplorer<CR>
" 用于浏览project的脚本
map ,P :Project ./.vimprojects<CR>
" 设定 TagExplorer 环境
"let TE_Include_File_Pattern = '[Mm]akefile\(\..*\)\?\|.*\.c\(pp\)\?$\|.*\.h$\|.
" 进入当前编辑的文件的目录
" autocmd BufEnter * exec "cd %:p:h"

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

nnoremap <silent> <F3> :Grep<CR>

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"set tags=tags;
"set autochdir
