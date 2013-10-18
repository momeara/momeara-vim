" Originally from:
" Thomas R. N. Jansson 2006


" Use 256 colors
set t_Co=256

" Turns on syntax highlighting 
syntax on 

" Set the syntax color scheme 
"colorscheme railscasts

" Optimize the colors to a dark background
"set background=dark

" Use all the bells and whistles of Vim compared to vi
set nocompatible

" The leader key is a namespace for shortcuts
let mapleader = ","


" Highlight searches 
set hlsearch

"While typing a search command, show where the pattern, as it was typed so far,
"matches.  
set incsearch

" If a search only contains small chars it Vim ignores cases and if the search
" contains large chars Vim will search for the case-sensitive string
set smartcase

" When a bracket is inserted, briefly jump to the matching one. 
set showmatch

" Wrap lines when they reach 79 characters
"set textwidth=79
set textwidth=0
set nowrap

" Make backups in to the following folders
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp

" Show the line and column number of the cursor position
set ruler

"Set terminal title to Vim + filename
set title

" Show (partial) command in the last line of the screen.
set showcmd

" Set history to 1000 lines
set history=1000

" Set undolevels to 1000 lines
set undolevels=1000

" No annoying blinking or noise
"set vb t_vb=
set novisualbell 
set noerrorbells 

" Indicates a fast terminal connection.
set ttyfast

" show some autocomplete options in status bar
set wildmenu
set wildmode=longest:full

" don't close buffers, just hide them
set hidden

""sets the printing device to cp01
"set pdev=cp01 

" Printing options such syntax and paper size 
"set printoptions=paper:A4,syntax:y

" spaces instead of tabs
 set expandtab
" Tabs are 2 characters
set tabstop=2
" vim see 4 spaces as a tabstops and helps deleting them fast. 
set softtabstop=2

" guess indentation based on previous lines
set autoindent

" copy the previous indention on autoindenting
set copyindent

" autoindent uses 2 characters
set shiftwidth=2
" smartindent tried to indent based on filetype 
set smartindent

" Expand the command line using tab
set wildchar=<Tab>

"#When on, a <Tab> in front of a line inserts blanks according to
"'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.  A
"<BS> will delete a 'shiftwidth' worth of space at the start of the
"line.
set smarttab

" Allows backspace over anything in insert mode
set backspace=indent,eol,start

" allows the cursor to move freely
set virtualedit=all




"""""""""""""""
"" Shortcuts
""""""""""""""

" Remember that ZZ will save and quit
" Correct typos
command! Q  quit
command! W  write
command! Wq wq 
command! Shell ConqueTerm bash


" If, for instance, you want your text to be nicely formatted in paragraphs
" with no more than 78 characters on each line, then you could simply use it
" as:
" set formatprg=par\ -w78
" The formatprg option in Vim tells it which program to use for formatting of
" the text when one of the gq commands is used. Notice that the space between
" the program name and its option is escaped with a backslash.
"map <F6> {!}par
"nmap <F11> 1G=G<cr>  

" Remap ctrl-] to Enter and ctrl-T to esc to make help sane.
":au filetype help :nnoremap <buffer><CR> <c-]>
":au filetype help :nnoremap <buffer><BS> <c-T>

" Move freely in wrapped lines
"imap <silent> <Down> <C-o>gj
"imap <silent> <Up> <C-o>gk
"nmap <silent> <Down> gj
"nmap <silent> <Up> gk




""""""""""""""""""
"" Filetypes
""""""""""""""""""

" allow filebased indentation 
filetype indent on

" i.e. opens the latex-suite when a .tex file is opened. 
filetype plugin on

" makes vim capable of guessing based on the filetype 
filetype on

" http://wiki.python.org/moin/ViImproved
autocmd BufRead,BufNewFile *.py syntax on 
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Treat all files ending on .USER.INPUT as tcl scripts 
"au BufNewFile,BufRead *.USER.INPUT set filetype=tcl




"""""""""""""""
"" Spellchecking
""""""""""""""

"if v:version > 700
"    "Sets in-line spellchecking
"    set spell 
"
"    " Set local language 
"    setlocal spell spelllang=en_us
"    "setlocal spell spelllang=da
"endif




""""""""""""""""""""""""""""""""""""""""""""""""""
" Tell vim to remember certain things when we exit
" http://vim.wikia.com/wiki/VimTip80
""""""""""""""""""""""""""""""""""""""""""""""""""

"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
"set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
"augroup JumpCursorOnEdit
" au!

" autocmd BufReadPost *
" \ if expand("<afile>:p:h") !=? $TEMP |
" \ if line("'\"") > 1 && line("'\"") <= line("$") |
" \ let JumpCursorOnEdit_foo = line("'\"") |
" \ let b:doopenfold = 1 |
" \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
" \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
" \ let b:doopenfold = 2 |
" \ endif |
" \ exe JumpCursorOnEdit_foo |
" \ endif |
" \ endif
" " Need to postpone using "zv" until after reading the modelines.
" autocmd BufWinEnter *
" \ if exists("b:doopenfold") |
" \ exe "normal zv" |
" \ if(b:doopenfold > 1) |
" \ exe "+".1 |
" \ endif |
" \ unlet b:doopenfold |
" \ endif

 
 
 
""""""""""""""""""
"" Latex-suite
""""""""""""""""""

" These settings are needed for latex-suite
"filetype indent on
"filetype plugin on
"filetype on
"let g:tex_flavor='latex'
"set grepprg=grep\ -nH\ $*
"let g:Tex_Folding=0
"set iskeyword+=:
"vim-addons install latex-suite
"usr/share/vim/vim71/debian.vim needs to be hacked so that 
"/var/share/vim/addons and not /var/lib/vim/addons
"

""""""""""""""""
" Use pathogen to easily modify the runtime path to include all
" " plugins under the ~/.vim/bundle directory
call pathogen#infect()
call pathogen#helptags()
