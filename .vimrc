" CHEAT: Install vundle `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts=1 " Use installed powerline symbol fonts
let g:airline#extensions#tabline#enabled = 1 " Enable tabline for easy buffer switching
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.DS_Store'] " Array of regexs for files to be ignored
let NERDTreeShowHidden=1 " Show hidden files by default
let NERDTreeChDirMode=2 " This will change CWD whenever tree root is changed
let NERDTreeShowBookmarks=1
Plugin 'tpope/vim-fugitive'
Plugin 'mbbill/undotree'
let g:undotree_SetFocusWhenToggle = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


syntax enable " Switch syntax highlighting on

" Set colour theme to solarized - dark
set background=dark
colorscheme solarized


set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set expandtab " tabs are spaces


"set guifont=Source\ Code\ Pro\ for\ Powerline:h12 " Set font to Input size 12
set guifont=Input:h12
set number " Show line numbers
set cursorline " highlight current line
filetype plugin indent on " Enable file type detection and do language-dependent indenting.
set wildmenu " visual autocomplete for command
set lazyredraw " redraw only when we need to.
set laststatus=2 " Show status line when < 2 buffers open
set listchars=tab:▸\ ,eol:¬ " Show invisble characters(tab and eol)
set list
set number " show absolute line number on current line
set relativenumber " show relative line numbers everywhere else


set incsearch " search as characters are entered
set hlsearch " highlight matches

" Move temp files into a central folder to avoid clutter
" Taken from http://blog.mattcrampton.com/post/86216925656/move-vim-swp-files
" CHEAT: create required directories `mkdir -p ~/.vim/{backup_files,swap_files,undo_files}`
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//


" Use Vim settings, rather than Vi settings (much better!).
" This is technically not necessary as this is implied by having a vimrc file
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

nnoremap <leader><space> :nohlsearch<cr>

" Toggle nerdtree as drawer for 1 window and netrw style for more then 1
" This is to help avoid ambiguity around which window file will be opened in
function! ToggleExplorer()
        " If a secondary tree is open in current window then return to
        " previous buffer
        if exists("b:NERDTreeType") && b:NERDTreeType ==# "secondary" && b:NERDTreePreviousBuf != -1
                exec "buffer " . b:NERDTreePreviousBuf
        " winbufnr returns a negative when specified window does not exist
        " If no more then 1 window excluding NERDTree open then toggle tree
        elseif winbufnr(2) < 0 || (g:NERDTree.GetWinNum() > -1 && winbufnr(3))
                execute ':NERDTreeToggle'
        else
        " Otherwise open tree in current window
                execute ':edit .'
        endif
endfunction
command! -nargs=0 ToggleExplorer :call ToggleExplorer()
nnoremap <leader>t :ToggleExplorer<cr>


nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>evs :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>u :UndotreeToggle<cr>

