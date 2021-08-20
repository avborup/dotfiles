call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-surround'
Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language specific
Plug 'PProvost/vim-ps1'
Plug 'cespare/vim-toml'
Plug 'pangloss/vim-javascript'
Plug 'uiiaoo/java-syntax.vim'

call plug#end()

colorscheme gruvbox

set number
set relativenumber

" Indentation settings
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" File type specific indentation spacings
autocmd FileType javascript set tabstop=2 softtabstop=2
autocmd FileType javascript set shiftwidth=2

set noswapfile
set undodir=$HOME/.nvim/undodir
set undofile

set incsearch

set colorcolumn=80,100,120
set nowrap

let mapleader = " "

" Automatically insert closing string, brace etc. ( -> ()
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O
inoremap {<CR> {<CR>}<ESC>O

" Keybinds to copy to and paste from clipboard (Windows only has one clipboard)
vnoremap <leader>y "*y
nnoremap <leader>p "*p

" Keybinds to navigate splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Shorthand for accesing vertical resize command
nnoremap <leader>vr :vertical resize 

" I have to press Shift to insert a colon, so it happens far too often that I
" write W rather than w and Q rather than q.. So let's map those to w and q..
command W :w
command Q :q

" On Danish keyboards, Æ is where the : is on US keyboards
nnoremap æ :

" Sets search for ripgrep to project root
if executable('rg')
    let g:rg_derive_root='true'
endif

" Open fzf with Ctrl + p
nnoremap <C-p> :Files<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files'

" Use tab and shift-tab to navigate coc completions. Enter to use completion.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Show docs
nnoremap <leader>d :call CocAction('doHover')<CR>
" Jump to definition
nnoremap <leader>gd :call CocAction('jumpDefinition')<CR>

" Add a space between // and the actual comment content in JS files
autocmd FileType javascript let g:NERDSpaceDelims = 1

" Compile and run Rust project in vertical split (only active in Rust files)
autocmd FileType rust nnoremap<buffer> <leader>tr :vs <bar> :wincmd l <bar> term cargo run<CR>

" Run python program with terminal output in vertical split. If main.py exists
" in the current directory, run that - otherwise run the currently open file.
function! RunPythonProgram()
   if filereadable('main.py')
       let pyfile = 'main.py'
   else
       " @% means the current file
       let pyfile = @%
   endif

   echo 'Running' pyfile
   execute 'vs | wincmd l | term python' pyfile
endfunction

" Keybind for running python program (only active in python files)
autocmd FileType python nnoremap<buffer> <leader>tr :call RunPythonProgram()<CR>

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
