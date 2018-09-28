" PLUGINS
"====================

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/plugged')
Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'benekastah/neomake'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'Olical/vim-enmasse'
Plug 'chrisbra/Colorizer'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'jaawerth/neomake-local-eslint-first'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
Plug 'moll/vim-node'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()


"Vim snippets
"================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
map <leader>sp :UltiSnipsEdit<cr>



"Prettier
"==============
let g:prettier#config#single_quote = 'true'
let g:prettier#config#semi = 'true'



"Deoplete
"========================
let g:deoplete#enable_at_startup = 1


set termguicolors

set background=dark

"The Fix for Slow Scrolling in VIM
"set lazyredraw
"set synmaxcol=128
"syntax sync minlines=256

"set ttyfast
"set cul!
"set relativenumber


let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>




"==========
"Tagbar
"================
"
nmap <F8> :TagbarToggle<CR>


"================
"Commenter
"==================
vmap <silent>/ <Plug>NERDCommenterToggle



"==============
"Indent line
"=============

let g:indentLine_setColors = 1
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceChar = '.'


if (has("termguicolors"))
    set termguicolors
endif



let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"



"ColorScheme
colorscheme base16-material-palenight

filetype plugin indent on
call plug#end()

" User Ag where possible
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif


"====================
" SETUP
"====================

"Mouse
set mouse=a mousemodel=popup

" Space as a Leader
let mapleader = "\<Space>"
" Use Vim features, not Vi
set nocompatible
" Use UTF-8 by default
set encoding=utf-8
set fileencoding=utf-8


" More natural split locations

set splitright
set splitbelow
set clipboard=unnamed
" Remove backup files
set nobackup
set nowritebackup
set noswapfile

syntax enable

" Always show status line
set laststatus=2
" Show the cursor position
set ruler
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Enable fuzzy find
set path+=**
" Show tab completion menu
set wildmenu
" Start scrolling before reaching the bottom
set scrolloff=1
set sidescrolloff=5

" Allow color schemes to do bright colors without forcing bold
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
    set t_Co=16
endif



"##############################################################################
" Airline
"##############################################################################
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep= ''
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#buffers_label = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L :%c'

" Jump to buffer with index number.
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9



"##############################################################################
" Neomake
"##############################################################################
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
autocmd BufWritePost,BufEnter * Neomake


"##############################################################################
" Better WhiteSpace
"##############################################################################
autocmd BufEnter * EnableStripWhitespaceOnSave


"SAVE
nmap <leader>w :w!<cr>

"init.vim save
augroup autosourcing
    autocmd!
    autocmd BufWritePost init.vim source %
augroup END


"NERDTREE

let NERDTreeShowHidden=1
nnoremap <C-W> :NERDTreeClose<CR><C-W>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>



"====================
" NUMBERING
"====================

" Set relative line numbers...
set relativenumber
" ...but absolute numbers on the current line (hybrid numbering)
set number
" Numbers that lead with 0 are decimal not octal
set nrformats-=octal

"====================
" REMAPS
"====================

" `jj` and `jk` to throw you into normal mode from insert mode
inoremap jj <Esc>
inoremap jk <Esc>

"====================
" SEARCHING
"====================

" Highlight current line
set cursorline
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" This unsets the 'last search pattern' register by hitting return
nmap <esc><esc> :noh<CR>


"====================
" INDENTATION
"====================

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent

set showmatch
set mat=2



"================
map bd :bd<cr>
map qq :q!<cr>
map sq :wq!<cr>


"====================
" FZF
"====================

if executable('fzf')
    nnoremap <leader>f :Files<cr>
    nnoremap <leader>g :GFiles<cr>
    nnoremap <leader>b :Buffers<cr>
end


