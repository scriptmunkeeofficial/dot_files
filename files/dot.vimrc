" System gvimrc file for MacVim


" Make sure the '<' and 'C' flags are not included in 'cpoptions', otherwise
" <CR> would not be recognized.  See ":help 'cpoptions'".
let s:cpo_save = &cpo
set cpo&vim

" Plugin settings
set encoding=UTF-8

" vim-plug
call plug#begin('~/.vim/plugged')

" Navigators
Plug 'christoomey/vim-tmux-navigator'           " Vim + Tmux - Love
Plug 'scrooloose/nerdtree'                      " Folder/File Navigator
Plug 'ctrlpvim/ctrlp.vim'                       " Quick Finder
Plug 'majutsushi/tagbar'                        " Tag viewer

" Developmnet Helpers
Plug 'mattn/emmet-vim'                          " Snippets
Plug 'ludovicchabant/vim-gutentags'             " Ctags generator
Plug 'tomtom/tcomment_vim'                      " Toggle Comments
Plug 'tpope/vim-fugitive'                       " Git actions
Plug 'tpope/vim-surround'                       " Help surround text
Plug 'sheerun/vim-polyglot'                     " Language syntax mappings
Plug 'robbles/logstash.vim'
Plug 'Yggdroot/indentLine'                      " Visually see indents
"Plug 'plugin/surround-vim'                      " Wrap/Replace openings/closings
"Plug 'airblade/vim-gitgutter'                   " Git integrations

" Vim UI Enhancements
Plug 'vim-airline/vim-airline'                  " Vim statusline generator
Plug 'vim-airline/vim-airline-themes'           " Airline Themes
Plug 'Xuyuanp/nerdtree-git-plugin'              " Add git markers
Plug 'ryanoasis/vim-devicons'                   " Adds icons
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " vim-devicons buddy
Plug 'vwxyutarooo/nerdtree-devicons-syntax'     " nerdtree highlighting

" Themes
Plug 'artanikin/vim-synthwave84'
Plug 'dim13/smyck.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'w0ng/vim-hybrid'

" Auto Completion and More
" Plug 'dense-analysis/ale'                      " ALE (Asynchronous Lint Engine) is a plugin providing linting
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense engine

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
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=4                " number of spaces to use for autoindenting
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
set background=dark
if exists('+termguicolors')
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
endif

" colorscheme nord                      " color scheme source https://github.com/arcticicestudio/nord-vim
" colorscheme evening
" colorscheme synthwave84
" colorscheme smyck

"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1      " Remove this line if using the default palette.
colorscheme hybrid                     " color scheme source https://github.com/w0ng/vim-hybrid

" iTerm color palettes
" https://raw.githubusercontent.com/w0ng/dotfiles/master/iterm2/hybrid.itermcolors
" https://raw.githubusercontent.com/w0ng/dotfiles/master/iterm2/hybrid-reduced-contrast.itermcolors

if has('gui_running')
" set guifont=Anonymous\ Pro\ Regular:h12
" set guifont=Source\ Code\ Pro\ for\ Powerline:h12
" set guifont=RobotoMono\ Nerd\ Font:h12
" set guifont=JetBrains\ Mono\ Regular:h12
  set guifont=LiterationMono\ Nerd\ Font:h12
endif

"
" Plugin Configs
" 

" Airlines configuration
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_theme='murmur'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#fugitiveline#enabled = 1   " vim-fugative
let g:airline#extensions#gutentags#enabled = 1      " Gutentags support
let g:airline#extensions#coc#enabled = 1            " Coc Support

" NerdTree Config
" nmap <C-t> :NERDTreeToggle<cr>
nnoremap <Leader>t :NERDTreeToggle<cr>          " open NERDTree
nnoremap <silent> <Leader>v :NERDTreeFind<cr>   " Find the file
let g:NERDTreeMouseMode=3
let NERDTreeAutoDeleteBuffer = 1    " delete files from buffer upon delete
let NERDTreeShowHidden=1            " show hidden files
let NERDTreeMinimalUI = 1
" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '-'

" CtrlP configurations
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|results'
nnoremap <leader>. :CtrlPTag<cr>

" Gutentags configuration
" set statusline+=%{gutentags#statusline()}

" Tagbar
nmap <F8> :TagbarToggle<cr>

" Vim-Polyglot Settings
let g:javascript_plugin_jsdoc = 1
" Coc Settings & Extensions
" let g:coc_global_extensions = {
"     coc-css,
"     coc-json,
"     coc-tsserver,
"     coc-phpls,
"     coc-html,
"     coc-python
"     coc-git
" }

set cmdheight=2
set updatetime=500
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Completion Tab Navigation
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <buffer> <leader>gd <Plug>(coc-definition)
nmap <buffer> <leader>gr <Plug>(coc-references)
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Global default options
"

" To make tabs more readable, the label only contains the tail of the file
" name and the buffer modified flag.
set guitablabel=%M%t

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
