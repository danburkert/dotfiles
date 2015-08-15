""" Vim Configuration

set nocompatible " Set baseline options to vim defaults instead of vi defaults.

" Plugins:
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'cespare/vim-toml'
Plug 'cstrahan/vim-capnp'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Lokaltog/powerline'
Plug 'phildawes/racer'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
call plug#end()

filetype indent on " Enable filetype specific indent rules.
filetype plugin on " Enable filetype plugins.
syntax on          " Enable syntax highlighting.

set hidden " Allow abandoned buffers to be hidden instead of unloaded.
set shell=/bin/bash

set clipboard=unnamed " Set the system clipboard to the default yank and paste register.

"" Expected backspace behaviour
set backspace=indent,eol,start

"" Lines
set colorcolumn=101 " highlight the 101st column
set number          " Display line numbers
set nowrap          " turn off line wrapping
set wrapmargin=0    " turn off line wrapping in insert mode
set textwidth=80    " 80 character lines

"" Indentation
set shiftwidth=2  " Number of spaces to use for each step of (auto)indent.
set shiftround    " Round indent to multiple of 'shiftwidth'.
set softtabstop=2 " Number of spaces that a <Tab> counts for while performing editing operations.
set expandtab     " In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set tabstop=4     " Number of spaces that a <Tab> in the file counts for.
set autoindent    " Copy indent from the current line when starting a new line.
set smarttab      " When on, a <Tab> in front of a line inserts blanks according to shiftwidth.
set smartindent   " Do smart autoindenting when starting a new line.

"" Whitespace
set list                            " Display unprintable characters in 'listchars'.
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅ " Strings to use in 'list' mode.

"" Searching
set incsearch  " While typing a search command, show where the pattern matches so far.
set hlsearch   " When there is a previous search pattern, highlight all of its matches.
set ignorecase " Ignore the case of normal characters in search.
set smartcase  " Override the 'ignorecase' option if the search pattern contains upper case characters.

"" Folding
"set foldmethod=indent  " Fold based on indent.
"set foldnestmax=3      " Deepest fold is 3 levels.
"set nofoldenable       " Don't fold by default.

"" Comand Line
set wildmode=list:longest " Complete longest common string, then list (similar to bash)
set wildmenu
set wildignore=*.o,*.obj,*.class

"" Remappings
" Toggle search highlighting
nnoremap <Leader>hs :nohlsearch<CR>
" Switch from insert to normal mode.
:inoremap jk <esc>

"" Movement
set scrolloff=5       " Minimal number of screen lines to keep above and below cursor.
set sidescrolloff=10  " Minimal number of screen columns to keep to the left and right of the cursor if 'nowrap' is set.
set sidescroll=5      " Minimal number of columns to scroll horizontally.
set virtualedit=block " Allow cursor to move beyond the end of the line in visual block mode.
set showmatch         " When a bracket is inserted, briefly highlight the matching one.
set matchtime=2       " Tenths of a second to show the matching bracket, when 'showmatch' is set.
set nostartofline     " Keep the cursor in the same column when moving between lines, if possible.

"" Files
set autoread  " Automatically read changed files
set autowrite " Write the contents of a modified file when switching buffers.

"" Theme
set background=dark
colorscheme solarized
set guifont=Inconsolata-dz\ for\ Powerline:h16
set t_Co=256 " Number of colors.
set title " When on, the title of the window will be set.

"" Mouse settings
set mouse=a         " Enable the use of the mouse.
set ttymouse=xterm2 " Use mouse scrolling in terminal window

set exrc   " Enable per-directory .vimrc files.
set secure " Disable unsafe commands in local .vimrc files.

augroup position
  " Jump to last cursor position when opening a file, except for commit log entries.
  autocmd BufReadPost * call SetCursorPosition()
  function! SetCursorPosition()
    if &filetype !~ 'commit\c'
      if line("'\"") > 0 && line("'\"") <= line("$")
        exe "normal! g`\""
        normal! zz
      endif
    end
  endfunction
augroup END

""" Plugin Configuration

"" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2   " Always show the statusline.
set encoding=utf-8 " Necessary to show Unicode glyphs.
set noshowmode

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

"" ctrlp
set wildignore+=*/tmp/*,*/target/*,*.so,*.swp,*.zip,*/.git/*,*/out/*,*/output/*,*/build/*,*/thirdparty/*,/*Testing/*,/*CMakeFiles/*
nnoremap <silent> <C-m> <ESC>:CtrlPMRU<CR>
nnoremap <silent> <C-b> <ESC>:CtrlPBuffer<CR>
nnoremap <silent> <C-l> <ESC>:CtrlPLine<CR>
nnoremap <silent> <leader>t <ESC>:CtrlPTag<CR>

""" Language Configuratoin

"" Rust

" let g:syntastic_rust_rustc_args = "--no-trans -L target -L target/deps --test"

let g:racer_cmd="~/src/rust/racer/target/release/racer"
let $RUST_SRC_PATH="/home/dcb/src/rust/rust/src/"

augroup rust
  autocmd!
  autocmd FileType rust :call LoadRustTags()
  autocmd FileType rust set shiftwidth=4  " Number of spaces for each tab in autoindent (<< and >>)
  autocmd FileType rust set softtabstop=4 " Number of columns inserted by tab key
  autocmd FileType rust set tabstop=4     " Number of spaces for each tab.  Affect how text is displayed
augroup END

function! LoadRustTags()
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

"" Prose
augroup prose
  autocmd!
  autocmd filetype text setlocal wrap
  autocmd filetype markdown setlocal wrap
  autocmd filetype text :iabbrev <buffer> -- —
  autocmd filetype markdown :iabbrev <buffer> -- —
augroup END
