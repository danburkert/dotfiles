""" Vim Configuration

set nocompatible " Set baseline options to vim defaults instead of vi defaults.

" Plugins:
call plug#begin('~/.vim/plugged')

Plug 'godlygeek/tabular'
Plug 'iCyMind/NeoSolarized'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'uarun/vim-protobuf'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

filetype indent on " Enable filetype specific indent rules.
filetype plugin on " Enable filetype plugins.
syntax on          " Enable syntax highlighting.

set hidden " Allow abandoned buffers to be hidden instead of unloaded.
set clipboard=unnamed " Set the system clipboard to the default yank and paste register.
set backspace=indent,eol,start " Expected backspace behavior

"" Lines
set colorcolumn=101 " highlight the 101st column
set number          " Display line numbers
set ruler           " Display line and column number in status
set nowrap          " turn off line wrapping
set wrapmargin=0    " turn off line wrapping in insert mode
set textwidth=100   " 100 character lines

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

"" Remappings
" Toggle search highlighting
nnoremap <Leader>hs :nohlsearch<CR>
" Switch from insert to normal mode.
inoremap jk <esc>
" Use 'jk'; break the Ctrl-C habit.
noremap <C-c> <Esc>
" Disable ex mode.
nnoremap Q <Nop>

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
set termguicolors
set background=light
colorscheme NeoSolarized
set guifont=FiraCode\ Nerd\ Font
set title " When on, the title of the window will be set.

"" Mouse settings
if !has('nvim')
    set mouse=a         " Enable the use of the mouse.
    set ttymouse=xterm2 " Use mouse scrolling in terminal window
endif

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

"" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='light'

"" Rainbow Parentheses
let g:rainbow#max_level = 16
let g:rainbow#blacklist = [248]
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']]
au Syntax * RainbowParentheses

"" Comand Line
set wildmode=list:longest " Complete longest common string, then list (similar to bash)
set wildmenu
set wildignore+=*/tmp/*,*/target/*,*.obj,*.class,*.o,*.so,*.swp,*.zip,*/.git/*,*/out/*,*/output/*,*/build/*,*/thirdparty/*,*/Testing/*,*/CMakeFiles/*

"" FZF
" Emulate ctrlp as a fuzzy file finder.
nnoremap <C-p> :FZF<CR>

" https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --vimgrep '.shellescape(<q-args>), 1, <bang>0)

" CTRL-G to grep for the word under the cursor.
nnoremap <C-g> :Find <C-R><C-W><CR>

"" RipGrep
if executable("rg")
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"" CoC
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <C-i> <Plug>(coc-definition)
nmap <C-t> <Plug>(coc-type-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


""" Language Configuration

"" Rust

augroup rust
  autocmd!
  autocmd FileType rust set shiftwidth=4  " Number of spaces for each tab in autoindent (<< and >>)
  autocmd FileType rust set softtabstop=4 " Number of columns inserted by tab key
  autocmd FileType rust set tabstop=4     " Number of spaces for each tab.  Affect how text is displayed
augroup END

"" Prose
augroup prose
  autocmd!
  autocmd FileType text setlocal wrap
  autocmd FileType markdown setlocal wrap
  "autocmd FileType text :iabbrev <buffer> -- —
  "autocmd FileType markdown :iabbrev <buffer> -- —
augroup END

"" git
augroup git
  autocmd!
  autocmd FileType gitcommit setlocal textwidth=72
augroup END

"" Disable the buggy SQL autocomplete plugin.
let g:omni_sql_no_default_maps = 1

"" asm=nasm
let g:asmsyntax = 'nasm'
