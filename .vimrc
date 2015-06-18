set nocompatible
set history=700

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

set cindent

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros  good performance config
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax enable
syntax on

colorscheme desert
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Map <Space> to / search and Ctrl-<Space> to ? backwards search
map <space> /
map <c-space> ?

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
" Remember info about open buffers on close
set viminfo^=%

" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

" Remap VIM 0 to first non-blank character
map 0 ^


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
