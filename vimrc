""" Vim Configuration
set nocompatible " Behave like vim, not vi

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required.
Bundle 'gmarik/vundle'

" Plugins:
Bundle 'Lokaltog/powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bitc/lushtags'
Bundle 'cespare/vim-toml'
Bundle 'cstrahan/vim-capnp'
Bundle 'derekwyatt/vim-scala'
Bundle 'elzr/vim-json'
Bundle 'godlygeek/tabular'
Bundle 'guns/vim-clojure-static'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'majutsushi/tagbar'
Bundle 'paredit.vim'
Bundle 'phildawes/racer'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/vitality.vim'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'rust-lang/rust.vim'

filetype plugin on " Enable filetype plugins
filetype indent on " Enable filetype specific indent rules
syntax on " Enable syntax highlighting

"" Buffer behaviour
set hidden " Allow changed buffers to be in back ground

"" System copy / paste
set clipboard=unnamed

"" Expected backspace behaviour
set backspace=indent,eol,start

"" Lines
set number " Display line numbers
set nowrap " turn off line wrapping

"" Indentation
set shiftwidth=2 " Number of spaces for each tab in autoindent (<< and >>)
set softtabstop=2 " Number of columns inserted by tab key
set expandtab " Use spaces instead of tabs
set tabstop=2 " Number of spaces for each tab.  Affect how text is displayed
set autoindent " Copy indent from current line when starting a new line
set smarttab " Set tab width to shiftwidth on start of line tab insert

"" Whitespace
set list " Show newlines, tabs
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅ " Change displayed symbols

"" Searching
set incsearch " Find matches while still typeing
set hlsearch " Highlight matches by default
set ignorecase " Ignore case on searches...
set smartcase " unless searching for a capital

"" Folding
"set foldmethod=indent " Fold based on indent
"set foldnestmax=3 " Deepest fold is 3 levels
"set nofoldenable " Don't fold by default

"" Comand Line
set wildmode=list:longest " Complete longest common string, then list (similar to bash)
set wildmenu
set wildignore=*.o,*.obj,*.class

"" Remappings
" yank from cursor to EOL with Y, consistent with C and D
noremap Y y$
" Toggle search highlighting
nnoremap <Leader>hs :nohlsearch<CR>

"" Movement
set scrolloff=5 " set vertical scroll space around cursor
set sidescrolloff=7 " set horizontal scroll space around cursor
set sidescroll=1 " scroll horizontally by 1 column at a time
set virtualedit=block " Let cursor move past last char in visual block mode
set showmatch " Briefly jump to a parent when it's balanced...
set matchtime=2 " for only .2 seconds
set nostartofline " Don't jump to start of line with movements

"" Files
set autoread " Automatically read changed files

"" Theme
set background=dark
colorscheme solarized
set guifont=Inconsolata-dz\ for\ Powerline:h16 "Font
set t_Co=256 " Tell terminal to use 256 colors
set title " Turn on title bar support

"" Mouse settings
set mouse=a " Enable mouse
set ttymouse=xterm2 " Use mouse scrolling in terminal window

set exrc   " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files

""" Plugin Configuration

"" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode

"" Haskell-mode
let g:haddock_browser="open"
let g:haddock_browser_callformat="%s %s"
let g:ghc="/usr/local/Cellar/ghc/7.4.2/"

let g:haddock_docdir="/usr/local/Cellar/ghc/7.4.2/share/doc/ghc/html/"
let g:haddock_indexfiledir="~/.vim/"
au BufEnter *.hs compiler ghc

"" Clojure
let g:clojure_align_multiline_strings=1 " Align multiline strings to 1 column right of opening quote
au BufNewFile,BufRead *.edn set filetype=clojure

"" Rainbow Parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"" Tagbar
nmap <Leader>t :TagbarToggle<CR>

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'c:classes',
        \ 'C:case-classes',
        \ 'O:case-objects',
        \ 'm:methods'
    \ ]
\ }

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds'     : [
        \ 'f:function',
        \ 'T:types',
        \ 'm:types',
        \ 'm:modules',
        \ 'm:consts',
        \ 'm:traits',
        \ 'm:impls',
        \ 'm:macros'
    \ ],
    \ 'sro'      : '::'
\ }

"" ctrlp
set wildignore+=*/tmp/*,*/target/*,*.so,*.swp,*.zip,*/.git/*,*/out/*,*/output/*     " MacOSX/Linux

""" Autocommands
if has("autocmd")
  augroup vimrcEx
  "jump to last cursor position when opening a file
  ""dont do it when writing a commit log entry
  autocmd BufReadPost * call SetCursorPosition()
  function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
      if line("'\"") > 0 && line("'\"") <= line("$")
        exe "normal! g`\""
        normal! zz
      endif
    end
  endfunction

  augroup END
endif

"" Syntastic
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['java', 'scala'] }

"" Scala
hi scalaNew gui=underline
hi scalaMethodCall gui=italic
hi scalaValName gui=underline
hi scalaVarName gui=underline

"" Rust

if has("autocmd")
  autocmd FileType rust :call LoadRustTags()
endif

let g:syntastic_rust_rustc_args = "--no-trans -L target -L target/deps --test"

:autocmd FileType rust set shiftwidth=4 " Number of spaces for each tab in autoindent (<< and >>)
:autocmd FileType rust set softtabstop=4 " Number of columns inserted by tab key
:autocmd FileType rust set tabstop=4 " Number of spaces for each tab.  Affect how text is displayed

function LoadRustTags()
  let rust_home=$HOME . "/src/rust/rust"
  if isdirectory(rust_home)
    let rust_tags=rust_home . "/TAGS.vi"
    if filereadable(rust_tags)
      exec "setlocal tags+=".rust_tags
    else
      echo rust_tags." missing. Create it with `cd ".rust_home."; ./configure; make TAGS.vi`. Standard library ctags will be unavailable."
    endif
  else
    echo "Rust source not found in ".rust_home.". Standard library ctags will be unavailable."
  endif
endfunction
