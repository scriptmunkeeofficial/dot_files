" VIm Config file by ScriptMunkee

let s:cpo_save = &cpo
set cpo&vim

" Plugin settings
set encoding=UTF-8

" vim-plug
" Auto Install of vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Navigators
Plug 'christoomey/vim-tmux-navigator'           " Vim + Tmux - Love

" Developmnet Helpers
Plug 'mattn/emmet-vim'                          " Snippets
Plug 'ludovicchabant/vim-gutentags'             " Ctags generator
Plug 'tomtom/tcomment_vim'                      " Toggle Comments
Plug 'tpope/vim-fugitive'                       " Git actions
Plug 'tpope/vim-surround'                       " Help surround text
Plug 'sheerun/vim-polyglot'                     " Language syntax mappings
Plug 'robbles/logstash.vim'
Plug 'Yggdroot/indentLine'                      " Visually see indents
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'                   " Git integrations

" Vim UI Enhancements
Plug 'vim-airline/vim-airline'                  " Vim statusline generator
Plug 'vim-airline/vim-airline-themes'           " Airline Themes
Plug 'ryanoasis/vim-devicons'                   " Adds icons

" Themes
Plug 'dim13/smyck.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'

" Auto Completion and More
" Plug 'dense-analysis/ale'                      " ALE (Asynchronous Lint Engine) is a plugin providing linting
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense engine


" Exta tools
Plug 'jmckiern/vim-shoot', { 'do': '\"./install.py\" chromedriver' }

call plug#end()

" Keyboard mappings
map <F7> mzgg=G`z
nmap gg=J :%!python -m json.tool
" nnoremap <C-b> :ls<CR>:b<Space>

" Vim general settings
filetype plugin indent on
syntax on
syntax enable
set number                      " always show line numbers
set t_Co=256                    " Set terminal colours
set nocompatible                " drop backwards compatibility for newer features
set showmode
set nowrap
set autoread                    " auto-read if file is changed externally
set mouse=a                     " adding mouse support
set clipboard=unnamed           " support for copy/paste with reattach-touser-namespace

" Search settings
set hlsearch                    " highlight search results
set incsearch                   " Show search matches typed
set smartcase                   " ignore case if search pattern is all lowercase,
set ignorecase                  " ignore case when searching

" tab settings
" set tabstop=4                   " a tab is four spaces
" set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
" set shiftwidth=4                " number of spaces to use for autoindenting
set smarttab
set smartindent
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set expandtab                   " expand tabs by default (overloadable per file type later)
set tags=tags
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode

"
" Theme Settings
"
" set background=dark
if exists('+termguicolors')
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
endif

" To make tabs more readable, the label only contains the tail of the file
" name and the buffer modified flag.
set guitablabel=%M%t

" colorscheme nord                      " color scheme source https://github.com/arcticicestudio/nord-vim
" colorscheme evening
" colorscheme synthwave84
" colorscheme smyck
" colorscheme hybrid                     " color scheme source https://github.com/w0ng/vim-hybrid
" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1      " Remove this line if using the default palette.
"colorscheme gruvbox
colorscheme slate

" Making the gutter numbers brighter with hybrid
highlight LineNr guifg=gray

" iTerm color palettes
" https://raw.githubusercontent.com/w0ng/dotfiles/master/iterm2/hybrid.itermcolors
" https://raw.githubusercontent.com/w0ng/dotfiles/master/iterm2/hybrid-reduced-contrast.itermcolors

if has('gui_running')
" set guifont=Anonymous\ Pro\ Regular:h12
" set guifont=Source\ Code\ Pro\ for\ Powerline:h12
" set guifont=RobotoMono\ Nerd\ Font:h12
" set guifont=JetBrains\ Mono\ Regular:h12
  set guifont=LiterationMono\ Nerd\ Font:h13
endif

"
" Plugin Configs
" 

" Airlines configuration
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
" let g:airline_theme='murmur'
" let g:airline_theme='tomorrow'
let g:airline_theme='distinguished'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#fugitiveline#enabled = 1   " vim-fugative
let g:airline#extensions#gutentags#enabled = 1      " Gutentags support
let g:airline#extensions#coc#enabled = 1            " Coc Support

" Map the leader key to a comma.
 let mapleader = ','

" Gutentags configuration
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git', ]
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '__pycache__', 'python-version', 'pytest-cache', 'venv', '.venv',
      \ 'node_modules',
      \ 'build', '.DS_Store', '.gradle', 'out', 'classes',
      \ 'dist', '.vscode',
      \ '*sites/*/files/*', 'bin', 'bower_components',
      \ 'cache', 'compiled', 'docs', 'example', 'bundle', 'vendor',
      \ 'tmp', 'coverage', 'results', 'logs', '*.md',
      \ '*-lock.json', '*.lock', '*bundle*.js', '*build*.js', '.*rc*',
      \ '*.json', '*.min.*', '*.map', '*.bak', '*.zip',
      \ '*.pyc', '*.class', '*.sln', '*.Master', '*.csproj', '*.tmp',
      \ '*.csproj.user', '*.cache', '*.pdb', 'tags*', 'cscope.*',
      \ '*.css', '*.less', '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

" Vim-Polyglot Settings
let g:javascript_plugin_jsdoc = 1

set cmdheight=2
set updatetime=500

" COC Settings
set signcolumn=yes

" Autocomplete configuations
" User <cr> to confirm completion
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Code navigation configurations
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

" Fzf configuration
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Ag<Cr>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
" nnoremap <silent> <leader>o :BTags<CR>
" nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>

" nnoremap <C-b> :Buffers<Cr>
let g:fzf_history_dir = '~/.local/share/fzf-history'


" Global default options
"

" Send print jobs to Preview.app.  This does not delete the temporary ps file
" that is generated by :hardcopy.
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error


" This is so that HIG Cmd and Option movement mappings can be disabled by
" adding the line
"   let macvim_skip_cmd_opt_movement = 1
" to ~/.vimrc.
if !exists("macvim_skip_cmd_opt_movement")
    no   <D-Left>       <Home>
    no!  <D-Left>       <Home>
    no   <M-Left>       <C-Left>
    no!  <M-Left>       <C-Left>

    no   <D-Right>      <End>
    no!  <D-Right>      <End>
    no   <M-Right>      <C-Right>
    no!  <M-Right>      <C-Right>

    no   <D-Up>         <C-Home>
    ino  <D-Up>         <C-Home>
    no   <M-Up>         {
    ino  <M-Up>         <C-o>{

    no   <D-Down>       <C-End>
    ino  <D-Down>       <C-End>
    no   <M-Down>       }
    ino  <M-Down>       <C-o>}

    ino  <M-BS>         <C-w>
    ino  <D-BS>         <C-u>
endif " !exists("macvim_skip_cmd_opt_movement")


" This is so that the HIG shift movement related settings can be enabled by
" adding the line
"   let macvim_hig_shift_movement = 1
" to ~/.vimrc.
if exists("macvim_hig_shift_movement")
    " Shift + special movement key (<S-Left>, etc.) and mouse starts insert mode
    set selectmode=mouse,key
    set keymodel=startsel,stopsel

    " HIG related shift + special movement key mappings
    nn   <S-D-Left>     <S-Home>
    vn   <S-D-Left>     <S-Home>
    ino  <S-D-Left>     <S-Home>
    nn   <S-M-Left>     <S-C-Left>
    vn   <S-M-Left>     <S-C-Left>
    ino  <S-M-Left>     <S-C-Left>

    nn   <S-D-Right>    <S-End>
    vn   <S-D-Right>    <S-End>
    ino  <S-D-Right>    <S-End>
    nn   <S-M-Right>    <S-C-Right>
    vn   <S-M-Right>    <S-C-Right>
    ino  <S-M-Right>    <S-C-Right>

    nn   <S-D-Up>       <S-C-Home>
    vn   <S-D-Up>       <S-C-Home>
    ino  <S-D-Up>       <S-C-Home>

    nn   <S-D-Down>     <S-C-End>
    vn   <S-D-Down>     <S-C-End>
    ino  <S-D-Down>     <S-C-End>
endif " exists("macvim_hig_shift_movement")


" Restore the previous value of 'cpoptions'.
let &cpo = s:cpo_save
unlet s:cpo_save
