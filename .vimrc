filetype plugin indent on
syntax enable

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif


call plug#begin('~/.vim/plugged')
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'flazz/vim-colorschemes'
	Plug 'vim-airline/vim-airline'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'vim-airline/vim-airline-themes'	
	Plug 'tpope/vim-fugitive'
	Plug 'w0rp/ale'
	Plug 'Ashkettle/rainbow'
	Plug 'jiangmiao/auto-pairs'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_enable_branch=1
let g:airline_powerline_fonts=1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='bubblegum'

"set statusline+=%#warningmsg#
"set statusline+=%*

let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1

au FileType js,javascript call rainbow#load()

call plug#end()



map <c-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : ".",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "-",
    \ "Dirty"     : "X",
    \ "Clean"     : "!",
    \ "Unknown"   : "?"
    \ }

colorscheme candyman

"Sensible Settings..."
set nocompatible
set encoding=utf-8
set listchars=trail:.,tab:>\ ,eol:$
set lazyredraw
set laststatus=2
set incsearch hlsearch
set nonumber
set backspace=indent,eol,start
set nostartofline
set autoread
set scrolloff=3
set ignorecase smartcase
set showmode showcmd
set shortmess+=I
set hidden
set history=1000
set complete-=i completeopt=menu
set splitright splitbelow
set display+=lastline
set foldenable foldmethod=syntax foldlevelstart=99
set ttimeoutlen=50
set switchbuf=useopen
set mouse=a
set number



" better backup, swap, and undo storage
set noswapfile
set backup
set undofile

set backupdir=~/.vim/dirs/backup
set undodir=~/.vim/dirs/undo

if !isdirectory(&backupdir)
	call mkdir(&backupdir, "p")
endif

if !isdirectory(&undodir)
	call mkdir(&undodir, "p")
endif

autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=0 expandtab
set clipboard=unnamedplus

"easy window navigation
nnoremap <silent> <c-l> <c-w>l
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-k> <c-w>k

"easy buffer navigation
nnoremap <silent> <c-e> :bnext<CR>
nnoremap <silent> <c-d> :bd<CR>
