set nocompatible
set autoindent
set hlsearch
set incsearch
set number
set cursorline
set showmatch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set t_Co=256
set visualbell
set noerrorbells
set nobackup
set noswapfile
set mouse=a

" https://tutsplus.com/lesson/a-few-more-vim-settings/
set scrolloff=10
set linebreak
set wildmenu
set undofile

onoremap w iw

nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
" END https://tutsplus.com/lesson/a-few-more-vim-settings/

" STATUS LINE ON STEROIDS
" https://github.com/vgod/vimrc/blob/master/vimrc
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

let mapleader = ","

call pathogen#infect()

:colorscheme molokai

syntax enable

filetype plugin on
filetype indent on
"if has('autocmd')
"endif


nmap <C-V> "+gP
imap <C-V> <ESC><C-V>
vmap <C-C> "+y
map <f2> :NERDTreeToggle<CR>
inoremap <leader><tab> <C-X><C-O>

" No array keys, brah
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>


" SUPER RETAB
" For converting indented spaces to tabs
" To use: visually select block, then enter Tab2Space or Space2Tab as commands
" Source: http://vim.wikia.com/wiki/Super_retab
:command! -range=% -nargs=0 Tab2Space execute "<line1>,<line2>s/^\\t\\+/\\=substitute(submatch(0), '\\t', repeat(' ', ".&ts."), 'g')"
:command! -range=% -nargs=0 Space2Tab execute "<line1>,<line2>s/^\\( \\{".&ts."\\}\\)\\+/\\=substitute(submatch(0), ' \\{".&ts."\\}', '\\t', 'g')"

" COLOR column and preveting code wrapping
set tw=85 fo+=t
if exists('&colorcolumn')
  set colorcolumn=+1
else
  au BufWinEnter * 
  \ let w:m2=matchadd('ErrorMsg', '\%>85v.\+', -1)
endif


function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction


" From https://tutsplus.com/lesson/autocommands
" autocmd event pattern command

" Format HTML on load
autocmd BufRead,BufWritePre *.html normal gg=G

