" ------------------------------------------------------------------
"
"     .vimrc 
"     Author: Alex Sánchez <kniren@gmail.com>
"     Source: https://github.com/kniren/vim/vimrc
"
" ------------------------------------------------------------------
"
" ------------------------------------------------------------------
"
" Basic Options "--¬
"  +---------------------------------------------------------------+
"
"    Pathogen and Powerline "--¬
filetype off
call pathogen#infect()
let g:Powerline_symbols = 'fancy'
"-¬
"    Basics "--¬
set encoding=utf-8
set nocompatible
set hidden
set history=1000
set undolevels=1000
set title
set backspace=indent,eol,start
set ruler
set number
set scrolloff=4
set lazyredraw
set showmode
set showcmd
set gdefault
set cursorline
set foldmethod=marker
set foldmarker=--¬,-¬
set showmatch
set mouse=a
syntax on
filetype plugin indent on
"-¬
"    Statusline "--¬
set statusline=%t
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=\ %y
set statusline+=\|\ %{strlen(&fenc)?&fenc:'none'}
set statusline+=\ \|\ %{&ff}
set statusline+=\ \|\ %c,
set statusline+=\ %l\ \|\ %L
set statusline+=\ \|%P
"-¬
"    Indentation Options "--¬
set autoindent
set copyindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround 
set smarttab
"-¬
"    Wrapping and Formatting Options "--¬
set wrap
set linebreak
set textwidth=82
set formatoptions=qrn1
set colorcolumn=85
set fileformats="unix,dos,mac"
set formatoptions+=1
set laststatus=2
set listchars=eol:¬,extends:>,precedes:<
"-¬
"    Search Options "--¬
set ignorecase
set smartcase
set incsearch
set nohlsearch
"-¬
"    Wildmenu Completion Options "--¬
set wildmode=longest,list,full
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class
"-¬
"    Backup, Swap and Undofile "--¬
set nobackup
set noswapfile
set nomodeline
set undofile
if exists("+undofile")
  if isdirectory($HOME . '/.vimtmp') == 0
    :silent !mkdir -p ~/.vimtmp > /dev/null 2>&1
  endif
  set undodir=~/.vimtmp//
  set undofile
endif
"-¬
"
"  +---------------------------------------------------------------+
"-¬
" Key mappings "--¬
"  +---------------------------------------------------------------+
"
"    Enable/Disable paste mode "--¬
set pastetoggle=<F2>
"-¬
"    Opens/Close Gundo window "--¬
nnoremap <F3> :GundoToggle <cr>
"-¬
"    Opens/Close the NERD Tree "--¬
nnoremap <F4> :NERDTreeToggle<CR>
"-¬
"    Remap leader key to ',' instead of '\' "--¬
let mapleader=","
"-¬
"    Quickly edit/reload the vimrc file "--¬
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
"-¬
"    Scroll the viewport faster with <C-e> and <C-y> "--¬
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
"-¬
"    Open and move through splits "--¬
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h :split<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"-¬
"    Resize splits "--¬
nnoremap <c-left> 5<C-w><
nnoremap <c-right> 5<C-w>>
nnoremap <c-up> 5<C-w>+
nnoremap <c-down> 5<C-w>-
"-¬
"    Makes posible the use of python/perl regex in vim "--¬
nnoremap / /\v
vnoremap / /\v
"-¬
"    Easy insert mode exit "--¬
inoremap jj <Esc>
"-¬
"    Ctrl-P MRU and Buffer management"--¬
nnoremap <silent> <leader>lj :CtrlPBuffer<CR>
nnoremap <silent> <leader>mr :CtrlPMRU<CR>
nnoremap <silent> <leader>MR :CtrlPMRU<CR>
"-¬
"    Page displacement with JK and marker jump with HL "--¬
nnoremap J 10j
nnoremap K 10k
nnoremap H ['
nnoremap L ]'
"-¬
"    Folding "--¬
nnoremap <Space> za
vnoremap <Space> za
"-¬
"    Focus on current fold "--¬
nnoremap <leader>z zMzvzz 
"-¬
"    I don't want to miss my command key! "--¬
nnoremap ; :
"-¬
"    Easy Copy & Paste to the clipboard "--¬
vnoremap <C-c> "+y
nnoremap <C-v> "+p
"-¬
"    Show Hidden Chars (Eol, Tab) "--¬
nnoremap <leader>l :set list!<CR>
"-¬
"    Tab navigation "--¬
nnoremap <leader>n :tabnext<CR>
nnoremap <leader>p :tabprev<CR>
"-¬
"    Buffer navigation "--¬
nnoremap <leader><leader>n :bnext<CR>
nnoremap <leader><leader>p :bprev<CR>
"-¬
"    Bubbling text "--¬
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv
"-¬
"    Spell checking "--¬
nnoremap <silent> <leader>s :set spell!<CR>
"-¬
"    Align text "--¬
nnoremap <leader>Al :left<cr>
nnoremap <leader>Ar :right<cr>
nnoremap <leader>Ac :center<cr>
vnoremap <leader>Al :left<cr>
vnoremap <leader>Ar :right<cr>
vnoremap <leader>Ac :center<cr>
""-¬
"    Save the current file as superuser "--¬
cmap w!! w !sudo tee % >/dev/null
"-¬
"
"  +---------------------------------------------------------------+
"-¬
" Appearance "--¬
"  +---------------------------------------------------------------+
"
"    Appearance Basic Settings "--¬
set background=dark
set guifont=Ubuntu\ Mono\ 13
if (!has('gui_running'))
    set t_Co=256
    colorscheme darkmirror
else
    colorscheme darkmirror
endif
"-¬
"    Remove menu bars, toolbox and scrollbars in GVIM "--¬
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
"-¬
"    Disable error bell "--¬
set visualbell 
set noerrorbells
set t_vb=
"-¬
"    Plugins specific options "--¬
let NERDTreeShowHidden=1
let g:LustyJugglerSuppressRubyWarning = 1
"-¬
"
"  +---------------------------------------------------------------+
"-¬
" Functions "--¬
"  +---------------------------------------------------------------+
"
"    Show syntax highlighting groups for word under cursor"--¬
nmap <leader>hi :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
"-¬
"    Bracket completion"--¬
inoremap {     {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
"-¬
"    Parentheses completion"--¬
inoremap (       ()<Left>
inoremap <expr>  ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

inoremap [       []<Left>
inoremap <expr>  ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
"-¬
"    Strip the newline from the end of a string "--¬
function! Chomp(str)
    return substitute(a:str, '\n$', '', '')
endfunction
"-¬
"    Custom text for foldings"--¬
function! MyFoldText()
    let line = getline(v:foldstart)
    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth
    let foldedlinecount = v:foldend - v:foldstart
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '"--', ' ', 'g')
    let line = substitute(line, '¬', ' ', 'g')
    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '   '
endfunction
set foldtext=MyFoldText()
"-¬
"    Autosave in GUI when focus is lost"--¬
au FocusLost * :wa
"-¬
"    Keep the relative size of the splits when resizing "--¬
au VimResized * exe "normal! \<c-w>="
"-¬
"
"  +---------------------------------------------------------------+
"-¬
" Filetype-specific"--¬
"  +---------------------------------------------------------------+
"
"    C "--¬
augroup ft_c
    au!
    au FileType c setlocal foldmethod=marker foldmarker={,}
augroup END
"-¬
"    CSS "--¬
augroup ft_css
    au!
    au FileType css setlocal foldmethod=marker foldmarker={,}
augroup END
"-¬
"    Java "--¬
augroup ft_java
    au!
    au FileType java setlocal foldmethod=marker foldmarker={,}
augroup END
"-¬
"    Python "--¬
augroup ft_python
    au!
    au FileType python setlocal foldmethod=indent
augroup END
"-¬
"    Markdown "--¬
augroup ft_markdown
    au!
    au BufNewFile,BufRead *.m*down setlocal filetype=markdown foldlevel=1
    au FileType markdown setlocal nonumber nocursorline
augroup EN
"-¬
"
"  +---------------------------------------------------------------+
"-¬
"
" ------------------------------------------------------------------
