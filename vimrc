"Plugins:
"nerdtree
"vim-colors-solarized
"vim-fugitive
"vim-rails


set nocompatible "do not emulate vi

call pathogen#infect()
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

set backspace=indent,eol,start
set linespace=0 "no vertical space between lines (measured in pixels)
set number "display line numbers
set showmatch "show closing punctuation
filetype plugin indent on "load settings for specific filetypes (including indent)
set mouse=a "mouse support for terminal vim
set whichwrap=b,s,h,l,<,>,[,] "wrap navigation keys to next line
set spell "spellcheck
set foldenable
set hidden
set title
set scrolloff=3 "keeps more space around cursor when near edge of screen
runtime macros/matchit.vim

set guifont=Inconsolata:h18 "font and type size

"tab and indent 
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set softtabstop=2
set smartindent

if has('cmdline_info')
  set ruler "show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) "improved ruler
  set showcmd "show partial commands in status line and selected characters/lines in visual mode
endif

"Autocomplete command line with <tab>
set wildmenu
set wildmode=list:longest,full

" Search
set hls "highlight search matches
set incsearch "search for text as you enter it
set ignorecase "ignore case in searches

"color scheme settings
syntax enable
set background=dark
colorscheme solarized

if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

"remappings

"no shift required to enter command in normal mode
nnoremap ; :

"yank from cursor to end of line with Y, consistent with C and D
noremap Y y$
