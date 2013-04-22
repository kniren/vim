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
"    Pathogen and Powerline "--¬
filetype off
call pathogen#infect()
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
filetype plugin indent on
"-¬
"    Statusline "--¬
"set statusline=%t
"set statusline+=\ %m
"set statusline+=\ %r
"set statusline+=%=
"set statusline+=\ %{strlen(&fenc)?&fenc:'none'}
"set statusline+=\ \«\ %{&ff}
"set statusline+=\ \«\ %c,
"set statusline+=\ %l\ \«\ %L
"set statusline+=\ \«\ %P
"set statusline+=\ %y
"        Powerline Mode ... Engage!
set rtp+=/home/alex/.vim/bundle/powerline/powerline/bindings/vim
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
let maplocalleader="_"
"-¬
"    Quickly edit/reload "--¬
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap <silent> <leader>ex :e ~/.xmonad/xmonad.hs<CR>
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
"    Ctrl-P MRU and Buffer management"--¬
nnoremap <silent> <leader>lj :CtrlPBuffer<CR>
nnoremap <silent> <leader>mr :CtrlPMRU<CR>
nnoremap <silent> <leader>MR :CtrlPMRU<CR>
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
nnoremap <leader>z zMzOzz
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
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>
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
"    Autocenter the screen when searching or jumping to paragraph"--¬
nnoremap n nzz
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
"    Tagbar "--¬
nnoremap <F5> :TagbarToggle<CR>
nnoremap <F6> :TagbarTogglePause<CR>
nnoremap <leader>T :TagbarOpenAutoClose<CR>
"-¬
"    Clean trailing whitespace"--¬
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z
"-¬
"    Visual select until the end of the line without newline character"--¬
nnoremap vv ^vg_
"-¬

"  +---------------------------------------------------------------+
"-¬
" Appearance "--¬
"  +---------------------------------------------------------------+
"
"    Appearance Basic Settings "--¬
set fillchars+=vert:│
set background=dark
if has("win32")
    set guifont=Ubuntu_Mono:h10:cANSI
elseif has("unix")
    set guifont=Ubuntu\ Mono\ 13
endif

if (&t_Co <= 8)
    colorscheme default
elseif (!has('gui_running'))
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
"    Autosave in GUI when focus is lost"--¬
au FocusLost * :wa
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
let g:LustyJugglerSuppressRubyWarning = 1
let g:neocomplcache_enable_at_startup = 1
au BufEnter *.hs compiler ghc
let g:haddock_browser="/usr/bin/google-chrome"


"  +---------------------------------------------------------------+
"-¬
"
" ------------------------------------------------------------------
