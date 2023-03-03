"---------GENERAL SETTINGS------------

"Set compatibility to Vim only.
set nocompatible
set nolist
set rnu

"Helps force plug-ins to load correctly when it is turned back on below.
filetype on

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" Set the maximum text width to 79 characters
set textwidth=79
set formatoptions=tcqrn1

" Use 4 spaces instead of TAB character
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Shared clipboard
set clipboard=unnamedplus

" Automatically refresh current file
set autoread

" ---------------PLUGINS--------------------
"
"Plugin autoinstalling
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Syntax highlighting and autocompletion
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

"File search and navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'

"Editor interface and theming
Plug 'dracula/vim',{'as':'dracula'}
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'yggdroot/indentline'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Debugging, refactoring and version control
Plug 'puremourning/vimspector'
Plug 'tpope/vim-dispatch'

"Formating languages
Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

"Laravel
Plug 'tpope/vim-dispatch'            
Plug 'tpope/vim-projectionist'       
Plug 'noahfrederick/vim-composer'    
Plug 'noahfrederick/vim-laravel'

call plug#end()

"---------- PLUGIN VARIABLES---------------
"
let g:airline_powerline_fonts = 1
let g:coc_global_extensions = [ 'coc-tsserver' ]
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Color scheme
colorscheme dracula

" Font
set guifont=DroidSansMono\ Nerd\ Font\ 12

" vim-markdown
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_conceal = 0

" latex
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

"-----------NAVIGATION KEYMAPS-------------
"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Move 1 more lines up or down in normal and visual selection modes.
vnoremap J :m '>+1<CR>gv=gv
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"Autosave folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"Search shortcuts
let mapleader = " "
noremap <leader>w :w<cr>
noremap <leader>gs :CocSearch
noremap <leader>fs :Files<cr>
noremap <leader><cr> <cr><c-w>h:q<cr>

"NERDTree
noremap <leader>n :NERDTreeToggle<cr>
noremap <leader>r :NERDTreeRefreshRoot<cr>
let NERDTreeShowHidden=1

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
noremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>
    
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
