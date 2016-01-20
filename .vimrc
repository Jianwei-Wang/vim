
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

map <space> /                     "Map <Space> to / search

map <c-space> ?                   "Ctrl-<Space> to ? backwards search

map 0 ^                           "Remap VIM 0 to first non-blank character

map <silent> <leader>ss :source ~/.vimrc<cr>    "Fast reloading of the .vimrc

map <silent> <leader>ee :e ~/.vimrc<cr>         "Fast editing of .vimrc

nmap <leader>w :w!<cr>            "Fast saving

nmap <leader>q :q<cr>             "Fast quit

nmap <leader>wq :wq<cr>           "Fast saving and quit

nmap <leader>sl :set list<cr>     "Fast set list

nmap <leader>nl :set nolist<cr>   "Fast set nolist

nmap <leader>sn :set nu!<cr>      "Fast show or hide line number

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

" cscope setting ...
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
"Some users may want to keep the regular tag behavior and have a different
"shortcut to access :cstag.  For example, one could map Ctrl-_  (underscore)
"to :cstag with the following command: >

    map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-/>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>

    " Using 'CTRL-spacebar' then a search type makes the vim window
    " split horizontally, with search result displayed in
    " the new window.

    nmap <C-_>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-_>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-_>d :scs find d <C-R>=expand("<cword>")<CR><CR>

    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one

    nmap <C-_><C-_>s
        \:vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_><C-_>g
        \:vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_><C-_>c
        \:vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_><C-_>t
        \:vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_><C-_>e
        \:vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_><C-_>i
        \:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-_><C-_>d
        \:vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif
