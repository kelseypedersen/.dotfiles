" ***** YOU GOT THIS *****
"
" New Of the Week
" Goyo
" Limelight

" ADD the :e leader command
" ADD the rename.vim
" ADD set autowrite - to save buffers
" ADD the git diff window thing
" Add command for fuzzy finding and opening remote branches in git
" Add leader * - to search for the word under your prompt
" Add Goyo for reading/writing in vim
" Reopen file at the same place when you reopen it
" vimcasts is a good resource
" use vimtutor

" ===================== PLUGINS =====================
call plug#begin()
Plug 'airblade/vim-gitgutter'               " Show + or - for line changes
Plug 'ajh17/VimCompletesMe'                 " Autocomplete from tab key
Plug 'godlygeek/tabular'                    " Must come before vim-markdown
Plug 'janko-m/vim-test'                     " Run tests from commandline
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Download and build FZF - the command line utility
Plug 'junegunn/fzf.vim'                     " File search for vim
Plug 'junegunn/goyo.vim'                    " Distraction free writing
Plug 'junegunn/limelight.vim'               " Hyperfocus-writing, darken non-focused font
Plug 'mhartington/oceanic-next'             " Color theme
Plug 'mhinz/vim-grepper'                    " Searching for words
Plug 'milkypostman/vim-togglelist'          " Show & hide the search results
Plug 'mxw/vim-jsx'                          " JSX syntax in React/Javascript
Plug 'pangloss/vim-javascript'              " Javascript syntax
Plug 'plasticboy/vim-markdown'              " Syntax highlighting for markdown
Plug 'scrooloose/nerdtree'                  " Show file structure in left rail
Plug 'styled-components/vim-styled-components' " Styled components syntax
Plug 'tpope/vim-endwise'                    " Ruby - Auto add 'end' to do/if in Ruby
Plug 'tpope/vim-fugitive'                   " Use git commands in Vim
Plug 'tpope/vim-rails'                      " Ruby - Projectionist settings
Plug 'tpope/vim-unimpaired'                 " Bracket mappings for a lot of random things
Plug 'Xuyuanp/nerdtree-git-plugin'          " Show git status flags in Nerdtree
call plug#end()

" ===================== GENERAL =====================
set backspace=indent,eol,start " ... Add regular backspace
set encoding=utf-8 " ............... Required
set fileformat=unix " .............. Standard fileformat
set nocompatible " ................. Required
set spell spelllang=en_us " ........ US English spellcheck
let g:vim_markdown_folding_disabled = 1 " Remove folding in markdown

" ===================== VISUAL ====================
" +++++ colors +++++
colorscheme OceanicNext " .......... Set color theme to OceanicNext
set t_Co=256 " ..................... Needed for color theme
set termguicolors " ................ Needed for color theme
syntax on

" +++++ indentation +++++
filetype plugin indent on
set autoindent " ................... Keep indentation of previous line
set expandtab " .................... Tab in insert mode produces the correct number of spaces
set shiftwidth=2 " ................. Number of columns text indented with << or >>
set smartindent " .................. Indent matches style of the file
set softtabstop=2 " ................ Use 2 columns for tab in insert mode
set tabstop=2 " .................... Tab appears 2 spaces

" +++++ position +++++
set number " ....................... Display line numbers on left-hand side
set ruler " ........................ Display line and column position

set gdefault " ..................... All matches in replace on one line are substituted
set hidden " ....................... Keep undo history for background buffers
set ignorecase " ................... Insensitive case searching
set laststatus=2 " ................. Display status line
set linebreak
set nolist
set noundofile
set scrolloff=3
set showcmd " ...................... Show partial commands in last line
set showmode " ..................... Show mode in last line
set smartcase
set ttyfast " ...................... Faster scrolling
set wildmenu " ..................... Command line completion
set wildmode=list:longest " ........ Command line complettion
set wrap " ......................... Wrap lines
nnoremap / /\v
vnoremap / /\v
noremap <tab> %
vnoremap <tab> %
set formatoptions=qrn1

" ===================== NAVIGATION ====================
runtime macros/matchit.vim " ...... Jump to keyword pairs with '%' key

" +++++ reminders +++++
map <Left> :echo "No! Use H"<cr>
map <Right> :echo "No! Use L"<cr>
map <Up> :echo "No! Use K"<cr>
map <Down> :echo "No! Use J"<cr>

" +++++ NERDTree config +++++
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1 " ........ Show dot files in nerdtree
" Use control + n to toggle NERDTree open and closed
map <C-n> :NERDTreeToggle<CR>

" ==================== SEARCH ====================
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
" Use control + p for fuzzy finder
nnoremap <C-p> :<C-u>FZF<CR>
" Use control + b for buffers
nnoremap <C-b> :<C-u>Buffers<CR>
nnoremap <C-g> :<C-u>GFiles?<CR>

set incsearch " .................... Use / to search in file
set showmatch " .................... Highlight matches
set hlsearch
set rtp+=/usr/local/opt/fzf

" +++++ global find and replace +++++
let mapleader = "\<Space>"
nnoremap <leader>fr :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <leader>frc :%s/\<<C-r><C-w>\>//gc<Left><Left>

" Using grepper
let g:grepper       = {}
let g:grepper.tools = ['grep', 'git', 'rg']
let g:grepper.simple_prompt = 1
"runtime plugin/grepper.vim
let g:grepper.rg = { 'grepprg': 'rg -H --no-heading --vimgrep --sort-files' }
"let g:grepper.quickfix      = 0

" Search for the current word
nnoremap <Leader>* :Grepper -tool rg -cword -noprompt<CR>
" backwards compatible from my old setup
nnoremap \| :Grepper -tool rg<CR>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" ===== WHITESPACE =====
 fun! StripTrailingWhitespace() " Remove whitespace on save
  if exists('b:noStripWhitespace')  " b:noStripeWhitespace variable not set
    return
  endif
  %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()
autocmd FileType markdown let b:noStripWhitespace=1

" ===================== TEST  =====================
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let test#strategy = "basic"

