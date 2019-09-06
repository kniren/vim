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
Plug 'scrooloose/nerdtree'                                    " Project tree navigator
Plug 'tpope/vim-surround'                                     " Handy surround plugin
Plug 'terryma/vim-multiple-cursors'                           " Multi-cursors
Plug 'Raimondi/delimitMate'                                   " Autoclose parentheses and brackets
Plug 'majutsushi/tagbar'                                      " Tag searcher
Plug 'godlygeek/tabular'                                      " OCD helper
Plug 'ncm2/ncm2'                                              " NCM2 (Lightweight completion engine for neovim)
Plug 'roxma/nvim-yarp'                                        " NCM2: Required
Plug 'ncm2/ncm2-bufword'                                      " NCM2: Completion from buffer
Plug 'ncm2/ncm2-path'                                         " NCM2: Completion from file path
Plug 'ncm2/ncm2-pyclang'                                      " NCM2: Clang completion
Plug 'ncm2/ncm2-jedi'                                         " NCM2: Python completion
Plug 'ncm2/ncm2-ultisnips'                                    " NCM2: Ultisnips completion
Plug 'ncm2/ncm2-markdown-subscope'                            " NCM2: Code block detection in markdown files
Plug 'ncm2/ncm2-rst-subscope'                                 " NCM2: Code block detection in rst files
Plug 'dense-analysis/ale'                                     " Async linter
" Plug 'lervag/vimtex'                                         " LaTeX tooling for vim
Plug 'SirVer/ultisnips'                                       " Snippets support
Plug 'kniren/vim-snippets'                                    " My personal snippets
Plug 'tpope/vim-fugitive'                                     " Git integration in vim
Plug 'airblade/vim-gitgutter'                                 " Git symbols on your gutter
Plug 'jreybert/vimagit'                                       " Magit for vim
Plug 'junegunn/gv.vim'                                        " Git log viewer
Plug 'jremmen/vim-ripgrep'                                    " A better code finder (Grep, Ack)
Plug 'Chiel92/vim-autoformat'                                 " Autoformatting for clang-format compatible languages
Plug 'rhysd/vim-clang-format'                                 " Different autoformat
Plug 'ervandew/supertab'                                      " Better TAB usage for completion
Plug 'christoomey/vim-tmux-navigator'                         " Seamless navigation between vim and tmux
Plug 'ludovicchabant/vim-gutentags'                           " Ctags/Gtags generation
Plug 'sjl/gundo.vim'                                          " Vim history navigator
Plug 'skywind3000/asyncrun.vim'                               " Run commands asynchronously
Plug 'junegunn/goyo.vim'                                      " Distraction free writing
Plug 'junegunn/limelight.vim'                                 " Dimming text paragraph, best used with goyo
Plug 'reedes/vim-lexical'                                     " Better spell checker facilities
Plug 'reedes/vim-wordy'                                       " Lightweight check for common words missuse
Plug 'rust-lang/rust.vim'                                     " Rust plugins and tooling
Plug 'sheerun/vim-polyglot'                                   " Massive syntax pack for muliple languages
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
set textwidth=79
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
set listchars=eol:¬,extends:>,precedes:<,nbsp:.,trail:.,tab:>·,space:.

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
" Custom Statusline
" ------------------------------------------------------------------
function! StatuslineMode()
    let l:currentMode = mode()
    if  l:currentMode == 'n'
        hi vimStatuslineMode ctermfg=8 ctermbg=0 cterm=bold
        return '  ' . 'N' . ' '
    elseif  l:currentMode == 'r'
        hi vimStatuslineMode ctermfg=0 ctermbg=1 cterm=bold
        return '  ' . 'R' . ' '
    elseif l:currentMode == 'i'
        hi vimStatuslineMode ctermfg=0 ctermbg=4 cterm=bold
        return '  ' . 'I' . ' '
    elseif l:currentMode == 'v'
        hi vimStatuslineMode ctermfg=0 ctermbg=6 cterm=bold
        return '  ' . 'V' . ' '
    endif
    hi vimStatuslineMode ctermfg=8 ctermbg=0 cterm=bold
    return '  ' . '»' . ' '
endfunction

function! Status(winnum)
    hi vimStatuslineFilename          ctermbg=0 ctermfg=7 cterm=bold
    hi vimStatuslineCurrentLine       ctermbg=0 ctermfg=7 cterm=bold
    hi vimStatuslineSeparator         ctermbg=0 ctermfg=8 cterm=bold
    hi vimStatuslineTotalLines        ctermbg=0 ctermfg=7 cterm=bold
    hi vimStatuslineScrollPercentage  ctermbg=0 ctermfg=7 cterm=bold
    hi vimStatuslineFileType          ctermbg=0 ctermfg=7 cterm=bold

    let active = a:winnum == winnr()
    let stat = ''

    " Vim active mode
    if active
        let stat .= '%#vimStatuslineMode#'
    endif
    let stat .= '%{StatuslineMode()}'
    let stat .= '%*'

    " File name
    if active
        let stat .= '%#vimStatuslineFilename#'
    endif
    let stat .= ' %t '

    " Modified/status flags
    let stat .= '%m'
    let stat .= '%r'

    let stat .= ' %= ' " Left side separator

    " Line count
    if active
        let stat .= '%#vimStatuslineCurrentLine#'
    endif
    let stat .= ' %l,%c%*'

    " Separator
    if active
        let stat .= '%#vimStatuslineSeparator#'
    endif
    let stat .= ' «%*'

    " Number of total lines
    if active
        let stat .= '%#vimStatuslineTotalLines#'
    endif
    let stat .= ' %L%*'

    " Separator
    if active
        let stat .= '%#vimStatuslineSeparator#'
    endif
    let stat .= ' «%*'

    " Scrolling percentage
    if active
        let stat .= '%#vimStatuslineScrollPercentage#'
    endif
    let stat .= ' %P%*'

    if exists('s:git_branches')
        let git_branch = get(s:git_branches, a:winnum-1, '')
        if !empty(git_branch)
            " Separator
            if active
                let stat .= '%#vimStatuslineSeparator#'
            endif
            let stat .= ' «%*'

            " Current branch in this repository.
            if active
                let stat .= '%#vimStatuslineGitStatus#'
            endif
            let stat .= ' ' . git_branch . '%*'
        endif
    endif
    let stat .= ' '
    return stat
endfunction

function! s:RefreshStatus()
    for nr in range(1, winnr('$'))
        call setwinvar(nr, '&statusline', '%!Status(' . nr . ')')
    endfor
endfunction

function! s:UpdateGitStatus()
    let all = ''
    let s:git_branches = []
    for nr in range(1, winnr('$'))
        let bufdir = fnamemodify(bufname(winbufnr(nr)), ':p:h')
        if isdirectory(bufdir)
            let current_branch =  system('cd ' . bufdir . '&& git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d "\n"')
        else
            let current_branch = ''
        endif
        let all .= '*' . current_branch . '* '
        call add(s:git_branches, current_branch)
    endfor

    let git_path = finddir('.git/..', expand('%:p:h').';')
    if isdirectory(git_path)
        let git_status = system('cd ' . git_path . ' && git diff --quiet --ignore-submodules HEAD &>/dev/null && echo "dirty"')
        if len(git_status) == 0
            " Dirty
            hi vimStatuslineGitStatus ctermbg=0 ctermfg=1 cterm=bold
        elseif len(system('cd ' . git_path . ' && git ls-files --others --exclude-standard')) != 0
            " Untracked
            hi vimStatuslineGitStatus ctermbg=0 ctermfg=5 cterm=bold
        else
            " Clean
            hi vimStatuslineGitStatus ctermbg=0 ctermfg=2 cterm=bold
        endif
    else
        hi vimStatuslineGitStatus ctermbg=0 ctermfg=7 cterm=bold
    endif
endfunction

augroup status
    au!
    au VimEnter,WinEnter,BufWinEnter * call <SID>RefreshStatus()
    au VimEnter,WinEnter,BufWinEnter,BufWritePost * call <SID>UpdateGitStatus()
augroup END

" ------------------------------------------------------------------
" Key mappings
" ------------------------------------------------------------------

" Remap leader key to ',' instead of '\'
let mapleader=","
let maplocalleader="\\"

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

" Move to the next/previous git modified section
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gp <Plug>(GitGutterPrevHunk)

" Resize splits
nnoremap <Left> 5<C-w><
nnoremap <Right> 5<C-w>>
nnoremap <Up> 5<C-w>+
nnoremap <Down> 5<C-w>-

" Page displacement with JK
vnoremap J 5j
vnoremap K 5k
vnoremap H 10h
vnoremap L 10l
nnoremap J 5j
nnoremap K 5k
nnoremap H 10h
nnoremap L 10l

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
nnoremap <leader>f ix<ESC>x:undojoin \| Autoformat<CR>

" Emacs-like navigation on insert mode
inoremap <M-b> <C-o>b
inoremap <M-f> <C-o>w
inoremap <M-d> <C-o>dw
inoremap <M-w> <C-o>db

" Magit
nnoremap <leader>gs :Magit<cr>

" Git viewer (GV)
nnoremap <leader>gl :GV<cr>

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
    let g:clang_format#detect_style_file = 1
    let g:ncm2_pyclang#database_path = [
                \ 'compile_commands.json',
                \ 'build/compile_commands.json'
                \ ]

    if has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
            let g:ncm2_pyclang#library_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
        else
            let g:ncm2_pyclang#library_path = '/usr/lib/libclang.so'
        endif
    endif

    " C/CPP mappings
    au FileType cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>
    au FileType cpp nnoremap <buffer> <leader>f :ClangFormat<cr>
    au FileType cpp nnoremap <buffer> <leader><leader>l :AsyncRun -cwd=<root> clang-tidy -quiet -checks="-*,bugprone-*,cert-*,clang-analyzer-*,cppcoreguidelines-*,misc-*,modernize-*,mpi-*,performance-*,readability-*,hicpp-*,cert-*,-cppcoreguidelines-pro-type-reinterpret-cast,-cppcoreguidelines-pro-bounds-constant-array-index,-cppcoreguidelines-pro-bounds-pointer-arithmetic,-readability-implicit-bool-conversion,-hicpp-signed-bitwise" -p=<root>/build <root>/*/src/*/*.cpp<cr>
    au FileType cpp nnoremap <buffer> <leader><leader><leader>l :AsyncRun -cwd=<root> cppcheck --project=<root>/build/compile_commands.json --enable=all<cr>
    au FileType cpp nnoremap <buffer> <F5> :AsyncRun -cwd=<root> mkdir -p build && cd build && cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Release && cd .. && ninja -C build<cr>
    au FileType cpp nnoremap <buffer> <F6> :AsyncRun -cwd=<root> mkdir -p build && cd build && cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Debug && cd .. && ninja -C build<cr>
    au FileType cpp nnoremap <buffer> <F7> :AsyncRun -cwd=<root> -raw cd build && ninja && CTEST_OUTPUT_ON_FAILURE=TRUE ninja test<cr>
augroup END

" Rust
augroup ft_rust
    au!
    au FileType rust nnoremap <buffer> <leader>f :RustFmt<cr>
    au FileType rust nnoremap <buffer> <leader>r :Cargo run<cr>
    au FileType rust nnoremap <buffer> <F5> :Cargo build --release<cr>
    au FileType rust nnoremap <buffer> <F6> :Cargo build<cr>
    au FileType rust nnoremap <buffer> <F7> :Cargo test<cr>
    au FileType rust nnoremap <buffer> <leader>e :Cargo check<cr>
    au FileType rust nnoremap <buffer> <leader>t :RustTest<cr>

    let g:rustfmt_autosave = 1

    if has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
            " macOS
            let g:rust_clip_command = 'pbcopy'
        else
            " Linux
            let g:rust_clip_command = 'xclip -selection clipboard'
        endif
    endif
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
    let g:go_term_mode = 'split'
    let g:go_term_enabled = 1
    let g:go_term_height = 20
    let g:go_term_width = 20
    let g:go_fmt_command = 'goimports'
    let g:go_doc_keywordprg_enabled= 0

    au FileType go nmap <leader>r <Plug>(go-run)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <leader>c :GoCoverageBrowser<cr>
    au FileType go nmap <leader>gd <Plug>(go-doc)
    au FileType go nmap <leader>dh <Plug>(go-def-split)
    au FileType go nmap <leader>dv <Plug>(go-def-vertical)
    au FileType go nmap <leader>i  <Plug>(go-info)
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
if executable('rg')
    let g:ctrlp_user_command = 'rg --files %s'
    let g:ctrlp_use_caching = 0
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_switch_buffer = 'et'
endif
function! CtrlpStatusbar(...)
    hi CtrlpStatusDir      ctermfg=8   ctermbg=0    cterm=bold
    hi CtrlpStatusRegex    ctermfg=3   ctermbg=0    cterm=bold
    hi CtrlpStatusFilename ctermfg=5   ctermbg=0    cterm=bold
    hi CtrlpStatusPrevMode ctermfg=8   ctermbg=0    cterm=bold
    hi CtrlpStatusCurrMode ctermfg=1   ctermbg=0    cterm=bold
    hi CtrlpStatusNextMode ctermfg=8   ctermbg=0    cterm=bold
    hi CtrlPPrtBase        ctermfg=8   ctermbg=none cterm=bold
    hi CtrlPPrtText        ctermfg=7   ctermbg=none cterm=bold
    hi CtrlPPrtCursor      ctermfg=0   ctermbg=none cterm=bold
    hi CtrlPLinePre        ctermfg=8   ctermbg=none cterm=bold

    function! TranslateItem(item)
        if a:item == 'mru files' || a:item == 'mru'
            return 'MRUS'
        elseif a:item == 'files' || a:item == 'fil'
            return 'FILE'
        elseif a:item == 'tags' || a:item == 'tag'
            return 'TAGS'
        elseif a:item == 'buffers' || a:item == 'buf'
            return 'BUFS'
        endif
        return a:item
    endfunction
    let current_dir = '%#CtrlpStatusDir#' . fnamemodify(getcwd(), ':~')
    if a:3
        let regex_mode = '%#CtrlpStatusRegex#' . '  regex' . '%*'
    else
        let regex_mode = '  '
    endif
    if a:2 == 'file'
        let file_mode = '%#CtrlpStatusFilename#' . '  filename only' . '%*'
    else
        let file_mode = ''
    endif
    let previous_mode = '%#CtrlpStatusPrevMode#' . TranslateItem(a:4) . "%*"
    let current_mode = '%#CtrlpStatusCurrMode#' . TranslateItem(a:5) . "%*"
    let next_mode = '%#CtrlpStatusNextMode#' . TranslateItem(a:6) . "%*"
    return ' ' . current_dir . file_mode . regex_mode . '%=' . previous_mode . '  «  ' . current_mode . '  »  ' . next_mode . '  '
endfunction

let g:ctrlp_line_prefix = '> '
function! CtrlpProgressbar(...)
    return 'Currently scanning (' . a:1 . ')'
endfunction

let g:ctrlp_status_func = { 'main': 'CtrlpStatusbar', 'prog': 'CtrlpProgressbar'}


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

" Open/Close the Tagbar window
nnoremap <F2> :TagbarToggle <cr>

" Tabularize
nnoremap <silent> <leader><leader>t :Tabularize /
vnoremap <silent> <leader><leader>t :Tabularize /

" Ripgrep
let g:rg_command = 'rg --vimgrep -S'

" Gutentags
let g:gutentags_cache_dir = '~/.ctagscache'
let g:gutentags_enabled = 0
let g:gutentags_ctags_exclude = ['CMakeFiles', 'build', '.git', 'doc', 'ext']

" Gundo
nnoremap <F3> :GundoToggle<cr>

" AsyncRun
let g:asyncrun_open = 10
let g:asyncrun_status = "stopped"
augroup QuickfixStatus
    au!
    BufWinEnter quickfix setlocal
                \ statusline=%t\ [%{g:asyncrun_status}]\ %{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P
augroup END
nnoremap <F4> :call asyncrun#quickfix_toggle(10)<cr>
let g:asyncrun_auto = "make"

augroup focus_mode
    au!
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
    au! User GoyoEnter nested call <SID>goyo_enter()
    au! User GoyoLeave nested call <SID>goyo_leave()
    nnoremap <F8> :Goyo<cr>
    nnoremap <F9> :Limelight!!<cr>

    " Limelight
    let g:limelight_conceal_ctermfg = 240
augroup END

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
    au!
    let g:lexical#thesaurus = ['~/.config/nvim/spell/thesaurus.txt',]
    let g:lexical#spellfile = ['~/.config/nvim/spell/en.utf-8.add',]
    set thesaurus+=~/.config/nvim/spell/thesaurus.txt
    au FileType markdown,mkd call lexical#init()
augroup END

" NCM2 (Completion)
augroup ncm2
    au!
    if exists('*ncm2#enable_for_buffer')
        au BufEnter * call ncm2#enable_for_buffer()
        set completeopt=noinsert,menuone,noselect
        au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
        au User Ncm2PopupClose set completeopt=menuone
        inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
        set shortmess+=c
    endif
augroup END

" Polyglot
let g:polyglot_disabled = ['latex']

" ALE (Asynchronous Lint Engine)
augroup ale
    au!
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%][%severity%] %s'
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_insert_leave = 0
    let g:ale_lint_on_enter = 0
    let g:ale_lint_on_save = 0
    let g:ale_set_loclist = 0
    let g:ale_set_quickfix = 1
    let g:ale_open_list = 1
    let g:ale_c_parse_compile_commands = 1
    let g:ale_linters = { 'cpp': ['cppcheck'] }
    let g:ale_c_build_dir_names = ['build', 'release', 'debug']
    nnoremap <silent> <leader><leader>e :ALELint<cr>
augroup END
