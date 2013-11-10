"wangshu changes begin
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2 "always show the status line
"set path=. ",~/QCOM_GP_296I,~/QCOM_GP_296I/hardware/qcom/camera,~/QCOM_GP_296I/frameworks/base/services/camera/libcameraservice

"let g:LookupFile_TagExpr = string('~/current/filenametags') "string('/mnt/disk/wKF30064/QCOM_GP_296I/filenametags')


let g:LookupFile_TagExpr = string('./filenametags') "string('/mnt/disk/wKF30064/QCOM_GP_296I/filenametags')

set pastetoggle=<F2>
nmap <F7> :cn<cr>   " ........
nmap <F6> :cp<cr>   " ........
nmap <F8> \m
nmap <F9> :FufBufferTag<cr>
nmap \lf :LUTags<cr>
nmap \ff :FufFile<cr>
nmap \lb :LUBufs<cr>
nmap \lw :LUWalk<cr>
nmap \o  :FufBufferTag<cr>
nmap []  ][%
nmap ls  :ls<cr>

nmap tn  :tabn<cr>
nmap tp  :tabp<cr>

set mouse=a

set tags=tags
"set tags=~/current/tags

"set statusline+=%F
"set laststatus=2

filetype plugin on

" set grepprg=gid

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
cs add ./cscope.out
"cs add ~/current/cscope.out
set cscopequickfix=s-,c-,d-,i-,t-,e-
"set cscopetag

" ...........,..<C-_>.........,....
" ...nomal...
" <C-_>s......"Ctrl+Shift+-",......"s"
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<cr><cr> :cw<cr>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<cr><cr> :cw<cr>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<cr><cr> :cw<cr>

"wangshu changes end

"... .......
" To use it, copy it to
"     for Unix and OS/2: ~/.vimrc
"             for Amiga: s:.vimrc
" for MS-DOS and Win32: $VIM\_vimrc
"           for OpenVMS: sys$login:.vimrc
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
finish
endif
" VMS ...................................~
" if has("vms")
" set nobackup
" else
" set backup
" endif
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")
" ..
" Don't use Ex mode, use Q for formatting
"map Q gq
" ..
" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp
" ............gui...............
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
" Win32 ....
"set encoding=cp936
" Win32 ....
"set encoding=cp936
" UNIX ....
set encoding=euc-cn
set fileencoding=gbk
" ....
" colors darkblue
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" allow backspacing over everything in insert mode
"set backspace=indent,eol,start
" .. Backspace . Delete ......backspace=2 .......
set backspace=2
" .........50.
set history=50
" ........
set ruler
" .............
set showcmd
" Make command line two lines high
set ch=1
" ...........
set incsearch
" ..TAB.
set list
set listchars=tab:>-,trail:-
" ...... <C-W>f .........
" .. windows ...path .....
" set path=.,"C:\Program Files\Microsoft Visual Studio\vc98\Include",,
" .. UNIX ...path .....
" set path=.,/usr/include,/usr/include/qt,,
" .. Vim .... UNIX ..... MS-DOS ..
set fileformats=unix,dos
" .......
"set ignorecase
" ....
set nu!
" .............
"filetype indent on
" ...TAB.......
"set tabstop=8
" .TAB.....
"set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
" ...........
set cindent shiftwidth=4
" .C........
let c_comment_strings=1
" ....
"set nobackup
" ......
"set backupdir=~/.vim/backup
" .........tags............
"set tags=./tags,./../tags,./*/tags,~/tags
"set tags=~/QCOM_GP_296I/TAGS
"map <F12> :runtime syntax/2html.vim<CR>
" ......
"unmap <C-x>
"map <C-x> "+x<CR>
"imap <C-x> <Esc>"+x<CR>i
" ......
"unmap <C-c>
map <C-c> "+y<CR>
imap <C-c> <Esc>"+y<CR>i
" ......
"unmap <C-v>
map <C-v> "+gp<CR>
imap <C-v> <Esc>"+gp<CR>i
" ......

" Use vv to do what CTRL-V used to do
noremap vv <C-v>

" Use CTRL-S for saving, also in Insert mode
"noremap <C-S>		:update<CR>
"vnoremap <C-S>		<C-C>:update<CR>
"inoremap <C-S>		<C-O>:update<CR>

" ......
"unmap <C-z>
"map <C-z> u
"imap <C-z> <Esc>ui
" ..... Ctrl+o ....
"unmap <C-o>
"imap <C-o> <Esc>o
" Ctrl+a ..
"map <C-a> ggVG
"imap <C-a> <Esc>ggVGi
" Ctrl+s ....
"unmap <C-s>
"map <C-s> :w<CR>
"imap <C-s> <Esc>:w<CR>i
"cmap <C-s> :w<CR>

"map qq :q<CR>
"imap qq <Esc>:q<CR>i

" ....
nmap <F12> :w !festival --tts &
nmap <F11> :!killall festival&<CR>
" ....tags...
"map ,t :Tlist<CR>
"map ,te :TagExplorer<CR>
" ....project...
map ,P :Project ./.vimprojects<CR>
" .. TagExplorer ..
"let TE_Include_File_Pattern = '[Mm]akefile\(\..*\)\?\|.*\.c\(pp\)\?$\|.*\.h$\|.
" ............
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

