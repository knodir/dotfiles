" From vimrc_example.vim:
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set textwidth=80
set nu
set splitright
set splitbelow

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
  autocmd FileType text setlocal textwidth=70

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END
else
  set autoindent
endif " has("autocmd")
" End From vimrc_example.vim

" Personal configurations:

" Set quick command mode from normal mode.
map ; :

" Set quick save from command mode.
map S ;w<enter>

" Set quick visual folder browsing.
map T ;edit ./<enter>

" Enable the syntax highlighting on enabled terminals.
if &t_Co > 1
   syntax enable
endif

" Enable incremental search.
set incsearch

" Enable fast window switching.
map t ;wincmd 

" Force cursor to be 'near' center of the screen after scrolling down.
set scrolljump=15

" Buffer manipulation commands
map H ;tabp<enter>
map L ;tabn<enter>
map F ;tab

set hlsearch

" Turn on autosave.
set autowrite

" Turn on paren high-lighting.
set showmatch

" use console mouse
set mouse=a

" use cursor line highlighting
if version >= 700
	"set cursorline
endif

" map f11/12 keys to forward-back in quick-fix
map <F11> ;cp<enter>
map <F12> ;cn<enter>

" Color column #81 in lightgrey
set colorcolumn=81
hi ColorColumn ctermbg=red guibg=red

" Set tab settings appropriate for source code editing.
" use 2 spaces to represent tab
set tabstop=2
" number of spaces to use for auto indent
set shiftwidth=2
" enter spaces when tab is pressed
set expandtab

" alignment command
map B mzgqap`z

"set nocompatible              " be iMproved, required
filetype off                  " required

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='50,\"100,:30,%,n~/.viminfo

" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:neocomplete#enable_at_startup = 1

" we want to tell the syntastic module when to run
" we want to see code highlighting and checks when  we open a file
" but we don't care so much that it reruns when we close the file
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
let g:syntastic_go_checkers = []

" disable preview mode to prevent new window opening with documentation
set completeopt=menu
