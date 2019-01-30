set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Enable variable name autocompletion
Plugin 'Valloric/YouCompleteMe'

" follow these steps to get YouCompleteMe workingi as instructed here
" https://vi.stackexchange.com/questions/7470/how-to-install-youcompleteme-with-clang-completer-offline
" cd ~/.vim/bundle
" git clone https://github.com/Valloric/YouCompleteMe.git
" cd YouCompleteMe
" git submodule update --init --recursive
" ./install.sh --clang-completer
" TODO: this should be done in Ansible


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


set ruler		" show the cursor position all the time
set hlsearch            " set highlighted search
set autowrite           " turn on autosave.
set number              " show line numbers
syntax on               " enable syntax highlighting

" Force cursor to be 'near' center of the screen after scrolling down.
set scrolljump=15

" Color column #81 in red
set colorcolumn=81
hi ColorColumn ctermbg=red guibg=red
" set textwidth=80        " automatic new line when we cross character limit

" Set tab settings appropriate for source code editing.
" use 2 spaces to represent tab
set tabstop=2
" number of spaces to use for auto indent
set shiftwidth=2
" enter spaces when tab is pressed
set expandtab

" force YouCompleteMe auto-complete window go away when we are done with it
let g:ycm_autoclose_preview_window_after_completion=1


" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
