" ------------------------------------------------------------------
"
"     .vimrc
"     Author: Alex Sánchez <kniren@gmail.com>
"     Source: https://github.com/kniren/vim/blob/master/vimrc
"
" ------------------------------------------------------------------
"
" ------------------------------------------------------------------
"
" Basic Options "--¬
"  +---------------------------------------------------------------+
"
"    Vundle "--¬
set nocompatible " required
filetype off     " required
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"        Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'sjl/clam.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'kniren/darkmirror'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/gundo.vim'
Plugin 'Shougo/neocomplcache'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/goyo.vim'

" Snippets
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'

call vundle#end()            " required
filetype plugin indent on    " required
"-¬
"    Basics "--¬
set encoding=utf-8
set hidden
set history=1000
set undolevels=1000
set title
set backspace=indent,eol,start
set ruler
set nonumber
set scrolloff=4
set lazyredraw
set noshowmode
set showcmd
set gdefault
set cursorline
set foldmethod=marker
set foldmarker=--¬,-¬
set showmatch
set mouse=a
syntax on
"-¬
"    Statusline "--¬
set statusline=\ \»\  
set statusline+=%t
if exists("*fugitive#head")
    set statusline+=\ %{fugitive#head()}
endif
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=\ %{strlen(&fenc)?&fenc:'none'}
set statusline+=\ \«\ %{&ff}
set statusline+=\ \«\ %c,
set statusline+=%l\ \«\ %L
set statusline+=\ \«\ %P
set statusline+=\ %y\ 

" Change the status line color depending on the mode we are on
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=7 ctermbg=0
  elseif a:mode == 'r'
    hi statusline ctermfg=5 ctermbg=0
  else
    hi statusline ctermfg=1 ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=8 ctermbg=15


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
set nowrap
set linebreak
set textwidth=82
set formatoptions=qrn1
set colorcolumn=85
if has("win32")
    set fileformat=unix
    set fileformats=unix,dos
elseif has("unix")
    set fileformats="unix,dos,mac"
endif
set formatoptions+=1
set laststatus=2
set listchars=eol:¬,extends:>,precedes:<
"-¬
"    Search Options "--¬
set ignorecase
set smartcase
set incsearch
set hlsearch
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
"    Opens/Close the NERD Tree "--¬
nnoremap <F2> :NERDTreeToggle<CR>
"-¬
"    Opens/Close Gundo window "--¬
nnoremap <F3> :GundoToggle <cr>
"-¬
"    Enable/Disable paste mode "--¬
set pastetoggle=<F4>
"-¬
"    Remap leader key to ',' instead of '\' "--¬
let mapleader=","
let maplocalleader="_"
"-¬
"    Quickly edit/reload "--¬
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
nnoremap <Left> 5<C-w><
nnoremap <Right> 5<C-w>>
nnoremap <Up> 5<C-w>+
nnoremap <Down> 5<C-w>-
"-¬
"    Makes posible the use of python/perl regex in vim "--¬
nnoremap / /\v
vnoremap / /\v
"-¬
"    Easy insert mode exit "--¬
set timeout timeoutlen=500 ttimeoutlen=500
inoremap <silent> jj <Esc>
"-¬
"    Ctrl-P MRU, Tag and Buffer management"--¬
nnoremap <silent> <leader>lj :CtrlPBuffer<CR>
nnoremap <silent> <leader>mr :CtrlPMRU<CR>
nnoremap <silent> <leader>MR :CtrlPMRU<CR>
nnoremap <silent> <leader>p :CtrlPTag<CR>
"-¬
"    Page displacement with JK "--¬
vnoremap J 5j
vnoremap K 5k
nnoremap J 5j
nnoremap K 5k
nnoremap H ^
nnoremap L $
"-¬
"    Folding "--¬
nnoremap <Space> za
vnoremap <Space> za
"-¬
"    Focus on current fold "--¬
nnoremap <leader>z zMzvzz
"-¬
"    Common typos "--¬
nnoremap ; :
nnoremap :Q :q
nnoremap :W :w
nnoremap :Wq :wq
nnoremap :WQ :wq
"-¬
"    Show Hidden Chars (Eol, Tab) "--¬
nnoremap <leader>l :set list!<CR>
"-¬
"    Tab navigation "--¬
nnoremap <leader>tn :bnext<CR>
nnoremap <leader>tp :bprev<CR>
"-¬
"    Buffer navigation "--¬
nnoremap <leader><leader>n :bnext<CR>
nnoremap <leader><leader>p :bprev<CR>
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
"    Tabularize "--¬
nnoremap <silent> <leader>t :Tabularize /
vnoremap <silent> <leader>t :Tabularize /
"-¬
"    Clear selections "--¬
nnoremap <silent> <bs> :noh<cr>:call clearmatches()<cr>
nnoremap <silent> :C :let @/=""<cr>
"-¬
"    Reselecting pasted buffer "--¬
nnoremap <silent> <leader>V V']
"-¬
"    Easy parentheses and brackets navigation "--¬
map <tab> %
"-¬
"    Toggle neocompletion"--¬
nnoremap <leader><leader>c :NeoComplCacheToggle<cr>
"-¬
"    Show errors (Syntastic) "--¬
nnoremap <leader>e :Errors<cr>
nnoremap <leader>syntax :SyntasticCheck<cr>
"-¬
"    Autocenter the screen when searching or jumping to paragraph "--¬
nnoremap n nzzzv:call PulseCursorLine()<cr>
nnoremap N Nzzzv:call PulseCursorLine()<cr>
nnoremap } }zz
nnoremap { {zz
"-¬
"    Fix movement when wrapping is set"--¬
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
"-¬
"    Shell escape and filter the current buffer"--¬
nnoremap <silent> <leader>sh :%!<space>
"-¬
"    Clam bindings"--¬
nnoremap ! :Clam<space>
vnoremap ! :ClamVisual<space>
"-¬
"    Clean trailing whitespace"--¬
nnoremap <leader><leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z
"-¬
"    Visual select until the end of the line without newline character"--¬
nnoremap vv ^vg_
"-¬
"    Copy and paste from the system clipboard "--¬
vnoremap <C-c> "+y
inoremap <C-v> <Esc><F4>"+p<F4>i
"-¬
"    Paste last yanked text "--¬
nnoremap <leader>p "0p
"-¬
"    Yank and past from buffer [1-5] "--¬
nnoremap <leader>1p "1p
nnoremap <leader>2p "2p
nnoremap <leader>3p "3p
nnoremap <leader>4p "4p
nnoremap <leader>5p "5p
vnoremap <leader>1y "1y
vnoremap <leader>2y "2y
vnoremap <leader>3y "3y
vnoremap <leader>4y "4y
vnoremap <leader>5y "5y
"-¬
"    Enable Goyo for distraction free writting "--¬
nnoremap <leader>g :Goyo<CR>
"-¬

"  +---------------------------------------------------------------+
"-¬
" Appearance "--¬
"  +---------------------------------------------------------------+
"
"    Appearance Basic Settings "--¬
set fillchars+=vert:│
set background=dark

try
    colorscheme darkmirror
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry

if (&t_Co <= 8)
    colorscheme default
elseif (!has('gui_running'))
    set t_Co=256
endif

if has("win32")
    set guifont=Ubuntu_Mono:h10:cANSI
endif

let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
    let macvim_skip_colorscheme = 1
    try
        colorscheme darkmirror
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
    endtry
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
    return line . '…' . repeat(" ",fillcharcount) . '            '
endfunction
set foldtext=MyFoldText()
"-¬
"    Keep the relative size of the splits when resizing "--¬
au VimResized * exe "normal! \<c-w>="
"-¬
"    Highlight Word "--¬
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n)
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction


nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
"-¬
"    Visual Mode */# from Scrooloose "--¬

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>
"-¬
"    Escape insert mode immediately "--¬
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
    augroup END
endif
"-¬
"    Pulse cursor line when next search element  "--¬
function! PulseCursorLine()
    let current_window = winnr()

    windo set nocursorline
    execute current_window . 'wincmd w'

    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine guibg=#2a2a2a ctermbg=233
    redraw
    sleep 20m

    hi CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    hi CursorLine guibg=#3a3a3a ctermbg=237
    redraw
    sleep 20m

    hi CursorLine guibg=#444444 ctermbg=239
    redraw
    sleep 20m

    hi CursorLine guibg=#3a3a3a ctermbg=237
    redraw
    sleep 20m

    hi CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    hi CursorLine guibg=#2a2a2a ctermbg=233
    redraw
    sleep 20m

    execute 'hi ' . old_hi

    windo set cursorline
    execute current_window . 'wincmd w'
endfunction
"-¬
"
"  +---------------------------------------------------------------+
"-¬
" Filetype specific options "--¬
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
    au FileType markdown setlocal textwidth=70
augroup END
"-¬
"    Mail "--¬
augroup ft_mail
    au!
    au FileType mail setlocal nonumber spell
    au FileType mail let g:neocomplcache_enable_at_startup = 0
augroup END
"-¬
"
"  +---------------------------------------------------------------+
"-¬
" Plugins specific options "--¬
"  +---------------------------------------------------------------+

let NERDTreeShowHidden=1
let g:ctrlp_extensions = ['tag']
let g:neocomplcache_enable_at_startup = 1
" Ultisnips
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" Goyo
function! GoyoBefore()
  colorscheme darkmirror
endfunction
function! GoyoAfter()
  colorscheme darkmirror
endfunction
let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]

"  +---------------------------------------------------------------+
"-¬
"
" ------------------------------------------------------------------

