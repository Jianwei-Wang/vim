" Setting up Vundle - the vim plugin bundler
" Reference: http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/

    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set nocompatible              " be iMproved, required
    filetype off                  " required
    set rtp+=~/.vim/bundle/vundle/
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'

    "Add your bundles here, below are examples:
"    Plugin 'Syntastic' "uber awesome syntax and errors highlighter
"    Plugin 'altercation/vim-colors-solarized' "T-H-E colorscheme
"    Plugin 'https://github.com/tpope/vim-fugitive' "So awesome, it should be illegal

    if iCanHazVundle == 0
        echo "Installing Vundles, please ignore key map error messages"
        echo ""
        :PluginInstall
    endif

    call vundle#end()
    "must be last
    filetype plugin indent on " load filetype plugins/indent settings

" Setting up Vundle - the vim plugin bundler end

set nocompatible                  "Use vim settings, rather than Vi settings

set history=700                   "keep 700 lines of command line history

set backspace=indent,eol,start    "allow backspacing over everything in insert mode

set cindent

set wildmenu                      "Turn on the WiLd menu

set wildignore=*.o,*~,*.pyc       "Ignore compiled files

set ruler                         "Always show current position

set cmdheight=1                   "Height of the command bar

set ignorecase                    "Ignore case when searching

set smartcase                     "When searching try to be smart about cases

set hlsearch                      "Highlight search results

set incsearch                     "Makes search act like search in modern browsers

set lazyredraw                    "Don't redraw while executing macros  good performance config

set magic                         "For regular expressions turn magic on

set showmatch                     "Show matching brackets when text indicator is over them

set mat=2                         "How many tenths of a second to blink when matching brackets

set background=dark

set encoding=utf8                 "Set utf8 as standard encoding and en_US as the standard language

set ffs=unix,dos,mac              "Use Unix as the standard file type

set viminfo^=%                    " Remember info about open buffers on close

set laststatus=2                  "Always show the status line

set number                        "show line number
"hide line number
"set nonu
"show or hide line number
"set nu!

set autoindent                    "auto indent 自动缩进

set listchars=tab:>-,trail:$      "set list: show tab as >------- and trail space as $

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

filetype on                       "Enable filetype plugins

filetype plugin on

filetype indent on

syntax enable                     "Enable syntax highlighting

syntax on

"Available color styles in /usr/share/vim/vim74/colors/
colorscheme desert                "Change color style

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
"Map <Space> to / search
map <space> /
"Ctrl-<Space> to ? backwards search
map <c-space> ?
"Remap VIM 0 to first non-blank character
map 0 ^
"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
"Fast saving
nmap <leader>w :w!<cr>
"Fast quit
nmap <leader>q :q<cr>
"Fast saving and quit
nmap <leader>wq :wq<cr>
"Fast set list
nmap <leader>sl :set list<cr>
"Fast set nolist
nmap <leader>nl :set nolist<cr>
"Fast show or hide line number
nmap <leader>sn :set nu!<cr>

"set splite screen size adjust shortcuts
nmap <C-h> :vertical resize +1<CR>
nmap <C-l> :vertical resize -1<CR>
nmap <C-j> :resize -1<CR>
nmap <C-k> :resize +1<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"record the last edit place. 记忆上次编辑位置
"if .viminfo access permission as follow:
"-rw------- 1 root root 4558 2011-12-09 13:58 ./.viminfo
"only root user can go to the last edit place.
"solution:
"sudo chmod a+w ./.viminfo
"sudo chmod a+r ./.viminfo
autocmd BufReadPost *
        \ if line("'\"")>0&&line("'\"")<=line("$") |
        \    exe "normal g'\"" |
        \ endif
