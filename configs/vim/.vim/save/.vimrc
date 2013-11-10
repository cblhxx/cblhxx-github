"wangshu changes begin
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
"set laststatus=2 "always show the status line
"set path=. ",~/QCOM_GP_296I,~/QCOM_GP_296I/hardware/qcom/camera,~/QCOM_GP_296I/frameworks/base/services/camera/libcameraservice

let g:LookupFile_TagExpr = string('/mnt/disk/wKF30064/myProject/filenametags') "string('/mnt/disk/wKF30064/QCOM_GP_296I/filenametags')

nmap <F7> :cn<cr>   " �л�����һ�����
nmap <F6> :cp<cr>   " �л�����һ�����
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

" ������������ϼ��м���,����<C-_>��Ҫ���ϰ���һ����,������Ļ
" �ͻص�nomal״̬��
" <C-_>s�İ������Ȱ�"Ctrl+Shift+-",Ȼ��ܿ��ٰ�"s"
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-->g :cs find g <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-->c :cs find c <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-->t :cs find t <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-->e :cs find e <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-->f :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <C-->i :cs find i <C-R>=expand("<cfile>")<cr><cr> :cw<cr>
nmap <C-->d :cs find d <C-R>=expand("<cword>")<cr><cr> :cw<cr>

"wangshu changes end

"��ɫ�� �ڵ��̱������
" To use it, copy it to
"     for Unix and OS/2: ~/.vimrc
"             for Amiga: s:.vimrc
" for MS-DOS and Win32: $VIM\_vimrc
"           for OpenVMS: sys$login:.vimrc
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
finish
endif
" VMS ϵͳ���Զ����������ļ�����������ѱ���ȥ���������ļ���Ϊԭ���ļ������~
if has("vms")
set nobackup
else
set backup
endif
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")
" δ֪
" Don't use Ex mode, use Q for formatting
"map Q gq
" δ֪
" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp
" ���ն�֧����ɫ����������gui�汾ʱ�򿪸����������ؼ��ʸ���
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
" Win32 ��������
"set encoding=cp936
" Win32 ��������
"set encoding=cp936
" UNIX ��������
set encoding=euc-cn
set fileencoding=gbk
" ��ɫ����
colors darkblue
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" allow backspacing over everything in insert mode
"set backspace=indent,eol,start
" ���� Backspace �� Delete �����̶ȣ�backspace=2 ��û���κ�����
set backspace=2
" ����������ʷ����Ϊ50��
set history=50
" ���õ�ǰ���λ��
set ruler
" ������ĩβ����֮ǰ��ʾ����
set showcmd
" Make command line two lines high
set ch=1
" ������������Ϊ��ǰ����
set incsearch
" ��ʾTAB��
set list
set listchars=tab:>-,trail:-
" ����·������ <C-W>f ���������漰�˲���
" ���� windows ��̣�path ����Ϊ����
" set path=.,"C:\Program Files\Microsoft Visual Studio\vc98\Include",,
" ���� UNIX ��̣�path ����Ϊ����
" set path=.,/usr/include,/usr/include/qt,,
" ���� Vim �ȳ����� UNIX ��ʽ�ڳ��� MS-DOS ��ʽ
set fileformats=unix,dos
" �������Դ�Сд
"set ignorecase
" �����к�
set nu!
" �򿪲�ͬ�����ļ����е�����
"filetype indent on
" �Ʊ��TAB��ȣ����ּ���
set tabstop=8
" ��TAB�趨Ϊ�ո�
set softtabstop=4
" ָ����һ���������ո���
set cindent shiftwidth=4
" ��Cע���и����ַ���
let c_comment_strings=1
" �رձ���
"set nobackup
" ���ñ���Ŀ¼
"set backupdir=~/.vim/backup
" �����ǰĿ¼�Ҳ���tags�ļ���������һ��Ŀ¼����
"set tags=./tags,./../tags,./*/tags,~/tags
"set tags=~/QCOM_GP_296I/TAGS
"map <F12> :runtime syntax/2html.vim<CR>
" �����������
"unmap <C-x>
"map <C-x> "+x<CR>
"imap <C-x> <Esc>"+x<CR>i
" ���帴������
"unmap <C-c>
"map <C-c> "+y<CR>
"imap <C-c> <Esc>"+y<CR>i
" ����ճ������
"unmap <C-v>
"map <C-v> "+gp<CR>
"imap <C-v> <Esc>"+gp<CR>i
" ���峷������
"unmap <C-z>
"map <C-z> u
"imap <C-z> <Esc>ui
" �༭ģʽ�� Ctrl+o ��������
"unmap <C-o>
"imap <C-o> <Esc>o
" Ctrl+a ȫѡ
"map <C-a> ggVG
"imap <C-a> <Esc>ggVGi
" Ctrl+s �����ļ�
"unmap <C-s>
"map <C-s> :w<CR>
"imap <C-s> <Esc>:w<CR>i
"cmap <C-s> :w<CR>

map <C-q> :q<CR>
imap <C-q> <Esc>:q<CR>i
"map <F11> <C-W>w
" �����ʶ�
nmap <F12> :w !festival --tts &
nmap <F11> :!killall festival&<CR>
" �������tags�Ľű�
"map ,t :Tlist<CR>
"map ,te :TagExplorer<CR>
" �������project�Ľű�
map ,P :Project ./.vimprojects<CR>
" �趨 TagExplorer ����
"let TE_Include_File_Pattern = '[Mm]akefile\(\..*\)\?\|.*\.c\(pp\)\?$\|.*\.h$\|.
" ���뵱ǰ�༭���ļ���Ŀ¼
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
