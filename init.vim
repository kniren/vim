" ------------------------------------------------------------------
"
"     .vimrc
"     Author: Alex Sánchez <kniren@gmail.com>
"     Source: https://github.com/kniren/vim/blob/master/vimrc
"
" ------------------------------------------------------------------

" ------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/vim-plug'                                      " Plugin manager
Plug 'ctrlpvim/ctrlp.vim'                                     " Fuzzy-finder file navigator
Plug 'kniren/ether'                                           " My vim colorscheme
Plug 'scrooloose/nerdcommenter'                               " Commentator. Use <leader>c<space> in visual
Plug 'scrooloose/nerdtree'                                    " Project tree navigator.
Plug 'tpope/vim-surround'                                     " Handy surround plugin
Plug 'airblade/vim-gitgutter'                                 " Git symbols on your gutter
Plug 'terryma/vim-multiple-cursors'                           " Multi-cursors.
Plug 'jiangmiao/auto-pairs'                                   " Autoclose parentheses and brackets
Plug 'majutsushi/tagbar'                                      " Tag searcher
Plug 'tpope/vim-fugitive'                                     " Git integration in vim
Plug 'godlygeek/tabular'                                      " OCD helper.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Completion engine
Plug 'SirVer/ultisnips'                                       " Snippets support
Plug 'kniren/vim-snippets'                                    " My personal snippets.
Plug 'jreybert/vimagit'                                       " Magit for vim
Plug 'jremmen/vim-ripgrep'                                    " A better code finder (Grep, Ack)
Plug 'Chiel92/vim-autoformat'                                 " Autoformatting for clang-format compatible languages
Plug 'rhysd/vim-clang-format'                                 " Different autoformat
Plug 'ervandew/supertab'                                      " Better TAB usage for completion
Plug 'tikhomirov/vim-glsl'                                    " Syntax data for OpenGL shading language
Plug 'christoomey/vim-tmux-navigator'                         " Seamless navigation between vim and tmux
Plug 'zchee/deoplete-clang'                                   " Code completion for C family languages
Plug 'ludovicchabant/vim-gutentags'                           " Ctags/Gtags generation
Plug 'sjl/gundo.vim'                                          " Vim history navigator
Plug 'skywind3000/asyncrun.vim'                               " Run commands asynchronously
Plug 'junegunn/goyo.vim'                                      " Distraction free writing.
Plug 'junegunn/limelight.vim'                                 " Dimming text paragraph, best used with goyo.
Plug 'reedes/vim-lexical'                                     " Better spell checker facilities
Plug 'reedes/vim-wordy'                                       " Lightweight check for common words missuse
call plug#end()

" ------------------------------------------------------------------
" Basic Options
" ------------------------------------------------------------------

" Basics
set encoding=utf-8
set hidden
set history=1000
set undolevels=1000
set title
set backspace=indent,eol,start
set ruler
set number
set scrolloff=4
set lazyredraw
set noshowmode
set showcmd
set gdefault
set cursorline
set showmatch
set mouse=a
syntax on
set autoread
syntax sync minlines=256 " start highlighting from 256 lines backwards
set synmaxcol=300

" Custom Statusline
function! StatuslineMode()
    let l:currentMode = mode()
    if  l:currentMode == 'n'
        hi User1 ctermbg=0 cterm=bold
        return '  ' . 'N' . ' '
    elseif  l:currentMode == 'r'
        hi User1 ctermbg=1 cterm=bold
        return '  ' . 'R' . ' '
    elseif l:currentMode == 'i'
        hi User1 ctermbg=4 cterm=bold
        return '  ' . 'I' . ' '
    elseif l:currentMode == 'v'
        hi User1 ctermbg=6 cterm=bold
        return '  ' . 'V' . ' '
    else
        hi User1 ctermbg=0 cterm=bold
    endif
    return '  ' . '»' . ' '
endfunction
set statusline=%#User1#
set statusline+=%{StatuslineMode()}
set statusline+=%*
set statusline+=\ %t
function! Fugitive()
    try
        let sl = fugitive#head()
    catch
        return ''
    endtry

    if sl == ''
        return ''
    endif
    return ' » ' . sl
endfunction
set statusline+=%{Fugitive()}
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=%l,%c
set statusline+=\ \«\ %L
set statusline+=\ \«\ %P\ %#User1#\ %Y\ %*

" Indentation Options
set autoindent
set copyindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smarttab

" Wrapping and Formatting Options
set nowrap
set linebreak
set textwidth=82
set formatoptions=qrn1
set colorcolumn=85
if has('win32')
    set fileformat=unix
    set fileformats=unix,dos
elseif has('unix')
    set fileformats=unix,dos,mac
endif
set formatoptions+=1
set laststatus=2
set listchars=eol:¬,extends:>,precedes:<

" Search Options
set ignorecase
set smartcase
set incsearch
set hlsearch

" Wildmenu Completion Options
set wildmode=longest,list,full
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class

" Backup, Swap and Undofile
set nobackup
set noswapfile
set nomodeline
set undofile
if exists('+undofile')
    if isdirectory($HOME . '/.vimtmp') == 0
        :silent !mkdir -p ~/.vimtmp > /dev/null 2>&1
    endif
    set undodir=~/.vimtmp//
    set undofile
endif

" ------------------------------------------------------------------
" Key mappings
" ------------------------------------------------------------------

" Remap leader key to ',' instead of '\'
let mapleader=","
let maplocalleader="_"

" Source vim config
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" In insert mode substitute ctrl-c with esc
inoremap <C-c> <Esc>

" Scroll the viewport faster with <C-e> and <C-y>
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Open and move through splits
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h :split<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move up and down on the completion menu
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" Resize splits
nnoremap <Left> 5<C-w><
nnoremap <Right> 5<C-w>>
nnoremap <Up> 5<C-w>+
nnoremap <Down> 5<C-w>-

" Page displacement with JK
vnoremap J 5j
vnoremap K 5k
nnoremap J 5j
nnoremap K 5k
nnoremap H ^
nnoremap L $

" Folding
nnoremap <Space> za
vnoremap <Space> za
set foldlevelstart=99

" Focus on current fold
nnoremap <leader>z zMzvzz
map <c-f> <c-f>

" Common typos
nnoremap ; :
nnoremap ñ :
nnoremap Ñ :
nnoremap :Q :q
nnoremap :W :w
nnoremap :Wq :wq
nnoremap :WQ :wq

" Show Hidden Chars (Eol, Tab)
nnoremap <leader>l :set list!<cr>

" Spell checking
nnoremap <silent> <leader>s :set spell!<cr>

" Save the current file as superuser
cmap w!! w !sudo tee % >/dev/null

" Clear selections
nnoremap <silent> <bs> :noh<cr>:call clearmatches()<cr>

" Reselecting pasted buffer
nnoremap <silent> <leader>V V']

" Easy parentheses and brackets navigation
map <tab> %

" Autocenter the screen when searching or jumping to paragraph
nnoremap n nzzzv<cr>
nnoremap N Nzzzv<cr>
nnoremap } }zz
nnoremap { {zz

" Fix movement when wrapping is set
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Clean trailing whitespace
nnoremap <leader><leader><leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z :echo 'Trailing whitespace removed'<cr>

" Clean windows carriage return
nnoremap <leader><leader><leader>r :%s/\r\(\n\)/\1/g<cr> :echo 'Windows carriage return removed'<cr>

" Copy and paste from the system clipboard
vnoremap <C-c> "+y
inoremap <C-v> <Esc>"+pi

" Force file update if it has changed
nnoremap <leader>u :checktime<cr>:GitGutter<cr>:echo 'File updated'<cr>

" Autoformat file
nnoremap <leader><leader>f ix<ESC>x:undojoin \| Autoformat<CR>

" ------------------------------------------------------------------
" Appearance
" ------------------------------------------------------------------

" Appearance Basic Settings
set fillchars+=vert:│
try
    set background=dark
    colorscheme ether
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry

" Disable error bell
set visualbell
set noerrorbells
set t_vb=

" ------------------------------------------------------------------
" Functions
" ------------------------------------------------------------------

" Show syntax highlighting groups for word under cursor
nmap <leader>hi :call <SID>SynStack()<cr>
function! <SID>SynStack()
    if !exists('*synstack')
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Custom text for foldings
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
    return line . '…' . repeat(' ',fillcharcount) . '            '
endfunction
set foldtext=MyFoldText()

" Keep the relative size of the splits when resizing
au VimResized * exe 'normal! \<c-w>='

" Visual Mode */# from Scrooloose
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<cr>//<cr><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<cr>??<cr><c-o>

" Pretty-print json blob.
"   Run on quickfix window
nnoremap <leader>jf :AsyncRun! -raw python -m json.tool %<cr>
vnoremap <leader>jf :AsyncRun! -raw python -m json.tool<cr>
"   Run on current buffer
nnoremap <leader><leader>jf :%!python -m json.tool<cr>
vnoremap <leader><leader>jf :!python -m json.tool<cr>

" ------------------------------------------------------------------
" Filetype specific options
" ------------------------------------------------------------------

" Vim
augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker foldmarker=--¬,-¬
augroup END

" C
augroup ft_c
    au!
    au FileType c setlocal foldmethod=marker foldmarker={,}
augroup END

" C/CPP
augroup ft_cpp
    au!
    let g:gutentags_enabled = 1
    set makeprg=ninja\ -C\ build
    let g:clang_format#code_style = 'google'
    noremap <leader>f :ClangFormat<cr>
    " Deoplete-clang
    if has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
            let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
            let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'
        else
            " Linux clang path goes here
            let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
            let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
        endif
    endif
    " Setup make commands for quickfix window.
    au FileType cpp nnoremap <buffer> <leader><leader>l :AsyncRun -cwd=<root> clang-tidy -quiet -checks="-*,bugprone-*,cert-*,clang-analyzer-*,cppcoreguidelines-*,misc-*,modernize-*,mpi-*,performance-*,readability-*,hicpp-*,cert-*,-cppcoreguidelines-pro-type-reinterpret-cast,-cppcoreguidelines-pro-bounds-constant-array-index,-cppcoreguidelines-pro-bounds-pointer-arithmetic,-readability-implicit-bool-conversion,-hicpp-signed-bitwise" -p=<root>/build <root>/src/*<cr>
    au FileType cpp nnoremap <buffer> <leader><leader><leader>l :AsyncRun -cwd=<root> cppcheck --project=<root>/build/compile_commands.json --enable=all<cr>
    au FileType cpp nnoremap <buffer> <F5> :AsyncRun -cwd=<root> mkdir -p build && cd build && cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Release && cd .. && ninja -C build<cr>
    au FileType cpp nnoremap <buffer> <F6> :AsyncRun -cwd=<root> mkdir -p build && cd build && cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Debug && cd .. && ninja -C build<cr>
    au FileType cpp nnoremap <buffer> <F7> :AsyncRun -cwd=<root> -raw cd build && ninja && CTEST_OUTPUT_ON_FAILURE=TRUE ninja test<cr>
augroup END

" Java
augroup ft_java
    au!
    au FileType java setlocal foldmethod=marker foldmarker={,}
augroup END

" Python
augroup ft_python
    au!
    au FileType python setlocal foldmethod=indent
augroup END

" Markdown
augroup ft_markdown
    au!
    au BufNewFile,BufRead *.md*own setlocal filetype=markdown foldlevel=1
    au FileType markdown setlocal nonumber nocursorline
    au FileType markdown setlocal textwidth=90
    au FileType markdown setlocal wrap
    function! AddMarkdownSyntax()
        syn region markdownIdDeclaration matchgroup=markdownLinkDelimiter start="^ \{0,3\}!\=\[" end="\]:" oneline keepend nextgroup=markdownUrl skipwhite
        syn match markdownUrl "\S\+" nextgroup=markdownUrlTitle skipwhite contained
        syn region markdownUrl matchgroup=markdownUrlDelimiter start="<" end=">" oneline keepend nextgroup=markdownUrlTitle skipwhite contained
        syn region markdownUrlTitle matchgroup=markdownUrlTitleDelimiter start=+"+ end=+"+ keepend contained
        syn region markdownUrlTitle matchgroup=markdownUrlTitleDelimiter start=+'+ end=+'+ keepend contained
        syn region markdownUrlTitle matchgroup=markdownUrlTitleDelimiter start=+(+ end=+)+ keepend contained
        syn region markdownLinkText matchgroup=markdownLinkTextDelimiter start="!\=\[\%(\_[^]]*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" nextgroup=markdownLink,markdownId skipwhite contains=@markdownInline,markdownLineStart
        syn region markdownLink matchgroup=markdownLinkDelimiter start="(" end=")" contains=markdownUrl keepend contained
        syn region markdownId matchgroup=markdownIdDelimiter start="\[" end="\]" keepend contained
        syn region markdownAutomaticLink matchgroup=markdownUrlDelimiter start="<\%(\w\+:\|[[:alnum:]_+-]\+@\)\@=" end=">" keepend oneline
    endfunction
    call AddMarkdownSyntax()
    au FileType markdown nnoremap <buffer> <F5> :<C-u>NextWordy<cr>
augroup END

" Golang
augroup ft_go
    au FileType go set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
    au FileType go nnoremap <leader>e :GoErrCheck<cr>
augroup END

" Git
augroup ft_gitcommit
    au!
    au Filetype gitcommit setlocal spell textwidth=80
augroup END

" Tex
au BufNewFile,BufRead *.tex setlocal filetype=tex
augroup ft_tex
    au!
    au Filetype tex setlocal spell
    au Filetype tex setlocal wrap
augroup END

" ------------------------------------------------------------------
" Plugins specific options
" ------------------------------------------------------------------

" NERDTree
let NERDTreeShowHidden=1
nnoremap <F1> :NERDTreeToggle<cr>

" CtrlP
let g:ctrlp_extensions = ['tag']
nnoremap <silent> <leader>lj :CtrlPBuffer<cr>
nnoremap <silent> <leader>mr :CtrlPMRU<cr>
nnoremap <silent> <leader>MR :CtrlPMRU<cr>
nnoremap <silent> <leader>t :CtrlPTag<cr>
if executable('rg')
    let g:ctrlp_user_command = 'rg --files %s'
    let g:ctrlp_use_caching = 0
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_switch_buffer = 'et'
endif

" UltiSnips
let g:UltiSnipsExpandTrigger='<c-y>'
let g:UltiSnipsJumpForwardTrigger='<c-y>'
let g:UltiSnipsJumpBackwardTrigger='<c-b>'

" Vim Multiple Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-f>'
let g:multi_cursor_prev_key='<C-d>'
let g:multi_cursor_skip_key='<C-h>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_select_all_word_key = '<leader><C-f>'

" vim-go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c :GoCoverageBrowser<cr>
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>dh <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>i  <Plug>(go-info)
let g:go_term_mode = 'split'
let g:go_term_enabled = 1
let g:go_term_height = 20
let g:go_term_width = 20
let g:go_fmt_command = 'goimports'
let g:go_doc_keywordprg_enabled= 0

" Open/Close the Tagbar window
nnoremap <F2> :TagbarToggle <cr>

" Tabularize
nnoremap <silent> <leader><leader>t :Tabularize /
vnoremap <silent> <leader><leader>t :Tabularize /

" Ripgrep
let g:rg_command = 'rg --vimgrep -S'

" Deoplete
call deoplete#enable()
set completeopt=menu
set completeopt-=preview

" Supertab
let g:SuperTabDefaultCompletionType = '<c-n>'

" Gutentags
let g:gutentags_cache_dir = '~/.ctagscache'
let g:gutentags_enabled = 0

" Gundo
nnoremap <F3> :GundoToggle<cr>

" AsyncRun
let g:asyncrun_open = 10
let g:asyncrun_status = "stopped"
augroup QuickfixStatus
    au! BufWinEnter quickfix setlocal
                \ statusline=%t\ [%{g:asyncrun_status}]\ %{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P
augroup END
nnoremap <F4> :call asyncrun#quickfix_toggle(10)<cr>
let g:asyncrun_auto = "make"

" Goyo
let g:goyo_width = 100
let g:goyo_height = "90%"
let g:goyo_linenr = 0
function! s:goyo_enter()
    Limelight
    set background=dark
    colorscheme ether
    try
        call AddMarkdownSyntax()
    catch
    endtry
endfunction
function! s:goyo_leave()
    Limelight!
    set background=dark
    colorscheme ether
    try
        call AddMarkdownSyntax()
    catch
    endtry
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
nnoremap <F8> :Goyo<cr>
nnoremap <F9> :Limelight!!<cr>

" Limelight
let g:limelight_conceal_ctermfg = 240

" Magit
nnoremap <leader><leader>m :Magit<cr>

" Lexical
"   Insert mode keybindings:
"     C-X s   -> Spellcheck search
"     C-X C-T -> Thesaurus search
"     C-X C-K -> Dictionary search

"   These are the _Normal_ mode commands:
"     * `]s`  - Move to next misspelled word after the cursor.
"     * `[s`  - Like `]s` but search backwards
"     
"   With the following key mappings you can use Visual mode selection to select the
"   characters (including whitespace). Otherwise the word under the cursor is used.
"   
"     * `zg`  - Mark as a good word
"     * `zw`  - Like `zg` but mark the word as a wrong (bad) word.
"     * `zug` - Unmark as good word
"     * `zuw` - Unmark as wrong (bad) word 
"     
"     * `z=`  - For the word under/after the cursor suggest correctly spelled words
"     * `1z=` - Use the first suggestion, without prompting
"     * `.`   - Redo - repeat last word replacement
"     
"     * `:spellr` - Repeat the replacement done by `z=` for all matches with the
"       replaced word in the current window
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
augroup END
let g:lexical#thesaurus = ['~/.config/nvim/spell/thesaurus.txt',]
let g:lexical#spellfile = ['~/.config/nvim/spell/en.utf-8.add',]
set thesaurus+=~/.config/nvim/spell/thesaurus.txt
