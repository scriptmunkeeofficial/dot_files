" VIm Config file by ScriptMunkee

let s:cpo_save = &cpo
set cpo&vim

" Plugin settings
set encoding=UTF-8
" set nobackup
" set nowritebackup

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
Plug 'tpope/vim-rhubarb'                        " Github extension
Plug 'tpope/vim-surround'                       " Help surround text
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'airblade/vim-gitgutter'                   " Git integrations
Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'                     " Language syntax mappings
Plug 'robbles/logstash.vim'
Plug 'wuelnerdotexe/vim-astro'                  " Astro synctax highlighting
Plug 'prisma/vim-prisma'                        " Prisma ORM syntax highlighting
Plug 'ap/vim-css-color'
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'tpope/vim-unimpaired'                     " Mapper for [ commands
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install --frozen-lockfile --production',
      \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

" Vim UI Enhancements
Plug 'vim-airline/vim-airline'                  " Vim statusline generator
Plug 'vim-airline/vim-airline-themes'           " Airline Themes
Plug 'ryanoasis/vim-devicons'                   " Adds icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Themes
Plug 'dim13/smyck.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

" Auto Completion and More
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense engine

" Exta tools

call plug#end()

" Keyboard mappings
" Map the leader key to a comma.
let mapleader = ','

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
" set tags=expand('~/.cache/vim/ctags/'),tags
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
setlocal spell 
setlocal spelllang=en_us

"
" Theme Settings
"
set background=dark
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
" colorscheme slate

" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1      " Remove this line if using the default palette.
" colorscheme hybrid                     " color scheme source https://github.com/w0ng/vim-hybrid

" let g:gruvbox_guisp_fallback = "fg"
" let g:gruvbox_italic=1
" let g:gruvbox_improved_warnings=1
" let g:gruvbox_improved_strings=1
" colorscheme gruvbox
colorscheme dracula

" Gitgutter configurations
highlight LineNr guifg=gray
" Jump between hunks
nmap <Leader>gn <Plug>(GitGutterNextHunk)  " git next
nmap <Leader>gp <Plug>(GitGutterPrevHunk)  " git previous

if has('gui_running')
  " set guifont=Anonymous\ Pro\ Regular:h12
  " set guifont=Source\ Code\ Pro\ for\ Powerline:h12
  " set guifont=RobotoMono\ Nerd\ Font:h12
  " set guifont=JetBrains\ Mono\ Regular:h12
  " set guifont=LiterationMono\ Nerd\ Font:h14
  set guifont=AnonymicePro\ Nerd\ Font\ Mono:h14
endif

"
" Plugin Configs
" 

" Airlines configuration
set laststatus=2
" let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline_detect_spelllang=0
" let g:airline_theme='murmur'
" let g:airline_theme='tomorrow'
" let g:airline_theme='distinguished'
let g:airline_theme='kolor'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline#extensions#fugitiveline#enabled = 1   " vim-fugative
let g:airline#extensions#gutentags#enabled = 1      " Gutentags support
let g:airline#extensions#coc#enabled = 1            " Coc Support

" Gutentags configuration
set statusline+=%{gutentags#statusline()}
let g:gutentags_ctags_auto_set_tags = 1
let g:gutentags_add_default_project_roots = 0
let g:gutentags_enabled_dirs = ['~/dev/']
let g:gutentags_project_root = ['pyproject.toml','requirements.txt', 'package.json', '.git', '.svn']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg', '.Trash',
      \ '__pycache__', 'python-version', 'pytest-cache', 'venv', '.venv',
      \ 'node_modules', '.nvim',
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

" vim-markdown Settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_fenced_languages = ['php', 'py=python', 'js=javascript', 'bash=sh', 'viml=vim']
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 0

" NERDTree Settings
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeFind<CR>
let g:NERDTreeMouseMode=3
let g:NERDTreeShowHidden=1
" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif

set cmdheight=2

" CoC Settings
set signcolumn=yes
set updatetime=500

" Autocomplete configuations
" Use <cr> to confirm completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() : "\<C-g>u\<CR>"

" user <tab> to navigate completion list
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" use <tab> to trigger completion and navigate to the next complete item
" function! CheckBackspace() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
"
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
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end


" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ?  coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ?  coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ?  "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ?  "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ?  coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ?  coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" fzf configuration
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Ag<Cr>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>

" nnoremap <C-b> :Buffers<Cr>
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Bookmark configuration
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

" Pritter configuration
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
" let g:prettier#quickfix_auto_focus = 0

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
