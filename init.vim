" ------------------------------------------------------------------
"
"     .vimrc
"     Author: Alex Sánchez <kniren@gmail.com>
"
" ------------------------------------------------------------------

" ------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------
"
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/vim-plug'                     " Plugin manager
Plug 'ctrlpvim/ctrlp.vim'                    " Fuzzy-finder file navigator
Plug 'cohama/lexima.vim'                     " Autoclose parentheses and brackets
Plug 'godlygeek/tabular'                     " OCD helper
Plug 'vim-scripts/scratch.vim'               " Open a scratch buffer with :Scratch or :Sscratch
Plug 'tpope/vim-surround'                    " Handy surround plugin
Plug 'tpope/vim-commentary'                  " Toggle comments
Plug 'tpope/vim-fugitive'                    " Git integration in vim
Plug 'tpope/vim-unimpaired'                  " Useful pair mappings
Plug 'airblade/vim-gitgutter'                " Git symbols on your gutter
Plug 'skywind3000/asyncrun.vim'              " Run commands asynchronously
Plug 'christoomey/vim-tmux-navigator'        " Seamless navigation between vim and tmux
Plug 'SirVer/ultisnips'                      " Snippets support
Plug 'kniren/vim-snippets'                   " My personal snippets
Plug 'reedes/vim-lexical'                    " Better spell checker facilities
Plug 'reedes/vim-wordy'                      " Lightweight check for common words missuse
"Plug 'vim-pandoc/vim-pandoc' | Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'lervag/vimtex'                         " LaTeX tooling for vim
Plug 'Chiel92/vim-autoformat'                " Autoformatting for clang-format compatible languages
call plug#end()

" ------------------------------------------------------------------
" Basic Options
" ------------------------------------------------------------------

" Basics
set nocompatible
set nomodeline
set modelines=0
set encoding=utf-8
set hidden
set history=1000
set undolevels=1000
set title
set backspace=indent,eol,start
set ruler
set number
set signcolumn=yes
set scrolloff=4
set lazyredraw
set noshowmode
set showcmd
set nocursorline
set mouse=a
syntax on
syntax sync minlines=256 " start highlighting from 256 lines backwards
set synmaxcol=300

" Keep buffers in sync
set autoread
augroup sync_buffers
    au!
    au CursorHold,CursorHoldI * checktime
    au FocusGained,BufEnter * :checktime
augroup END

" Fuzzy-like search
set path+=**

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
set textwidth=80
set formatoptions=qrn1
set colorcolumn=81
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
set gdefault
set showmatch

" Wildmenu Completion Options
set wildmode=longest,list,full
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class

" Backup, Swap and Undofile
set nobackup
set noswapfile
set undofile
if exists('+undofile')
    if isdirectory($HOME . '/.vimtmp') == 0
        :silent !mkdir -p ~/.vimtmp > /dev/null 2>&1
    endif
    set undodir=~/.vimtmp//
    set undofile
endif

" Built-in tree navigation
let g:netrw_banner=0
let g:netrw_liststyle=3
augroup netrw_mapping
    autocmd!
    autocmd filetype netrw nnoremap <buffer> <C-h> <C-w>h
    autocmd filetype netrw nnoremap <buffer> <C-j> <C-w>j
    autocmd filetype netrw nnoremap <buffer> <C-k> <C-w>k
    autocmd filetype netrw nnoremap <buffer> <C-l> <C-w>l
augroup END

" ------------------------------------------------------------------
" Custom Statusline
" ------------------------------------------------------------------
function! StatuslineMode()
    let l:currentMode = mode()
    if  l:currentMode == 'n'
        hi vimStatuslineMode ctermbg=8 ctermfg=15 cterm=bold
        return '  ' . 'N' . ' '
    elseif  l:currentMode == 'r'
        hi vimStatuslineMode ctermbg=8 ctermfg=1 cterm=bold
        return '  ' . 'R' . ' '
    elseif l:currentMode == 'i'
        hi vimStatuslineMode ctermbg=8 ctermfg=4 cterm=bold
        return '  ' . 'I' . ' '
    elseif l:currentMode == 'v'
        hi vimStatuslineMode ctermbg=8 ctermfg=2 cterm=bold
        return '  ' . 'V' . ' '
    endif
    hi vimStatuslineMode ctermbg=8 ctermfg=15 cterm=bold
    return '  ' . ':' . ' '
endfunction

function! Status(winnum)
    hi vimStatuslineFilename          ctermbg=8  ctermfg=7  cterm=bold
    hi vimStatuslineCurrentLine       ctermbg=8  ctermfg=7  cterm=bold
    hi vimStatuslineSeparator         ctermbg=8  ctermfg=15 cterm=bold
    hi vimStatuslineTotalLines        ctermbg=8  ctermfg=7  cterm=bold
    hi vimStatuslineScrollPercentage  ctermbg=8  ctermfg=7  cterm=bold
    hi vimStatuslineFileType          ctermbg=8  ctermfg=7  cterm=bold
    hi vimStatuslineAsyncRunning      ctermbg=8  ctermfg=1  cterm=bold

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

    " Asyncrun indicator
    if exists('g:asyncrun_status')
        if g:asyncrun_status == 'running'
            if active
                let stat .= '%#vimStatuslineAsyncRunning#'
            endif
            let stat .= ' R' . '%*'
        endif
    endif

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

    return stat . ' '
endfunction

function! s:RefreshStatus()
    for nr in range(1, winnr('$'))
        call setwinvar(nr, '&statusline', '%!Status(' . nr . ')')
    endfor
endfunction

augroup status
    au!
    au VimEnter,WinEnter,BufWinEnter * call <SID>RefreshStatus()
augroup END

" ------------------------------------------------------------------
" Key mappings
" ------------------------------------------------------------------

" Remap leader key to ',' instead of '\'
let mapleader=","
let maplocalleader="\\"

" Source vim config
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader><leader>ev :so $MYVIMRC<CR>

" In insert mode substitute ctrl-c with esc
inoremap <C-c> <Esc>

" Open and move through splits
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <silent> <leader>h :split<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
nnoremap J 5j
nnoremap K 5k

" Folding
set foldlevelstart=99
nnoremap <Space> za

" Focus on current fold
nnoremap <leader>z zMzvzz

" Common typos
nnoremap ; :
nnoremap ñ :
nnoremap Ñ :
nnoremap :Q :q
nnoremap :W :w
nnoremap :Wq :wq
nnoremap :WQ :wq

" Show Hidden Chars (Eol, Tab)
nnoremap <silent> <leader>l :set list!<cr>

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

" Fix movement when wrapping is set
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Clean trailing whitespace
nnoremap <silent> <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z
            \ :echo 'Trailing whitespace removed'<cr>

" Clean windows carriage return
nnoremap <silent> <leader><leader>w :%s/\r\(\n\)/\1/g<cr>
            \ :echoj'Windows carriage return removed'<cr>

" Copy and paste from the system clipboard
vnoremap <C-c> "+y
inoremap <C-v> <Esc>"+pi

" Force file update if it has changed
nnoremap <silent> <leader>u :checktime<cr>:GitGutter<cr>:echo 'File updated'<cr>

" Autoformat file
nnoremap <silent> <leader>f ix<ESC>x:undojoin \| Autoformat<cr>
            \ :echo 'File formatted'<cr>

" Emacs-like navigation on insert mode
inoremap <M-b> <C-o>b
inoremap <M-f> <C-o>w
inoremap <M-d> <C-o>dw
inoremap <M-w> <C-o>db

" Mergetool shortcuts
map <leader>1 :diffget LOCAL<CR>
map <leader>2 :diffget BASE<CR>
map <leader>3 :diffget REMOTE<CR>

" Replacing multiple cursors with vim native objects.
nnoremap <C-f> *``cgn
vnoremap <C-f> :<C-u>call <SID>VSetSearch()<cr>//<cr><c-o>cgn

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
nmap <leader><leader>h :call <SID>SynStack()<cr>
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
nnoremap <silent> <leader>jf :AsyncRun! -raw python -m json.tool %<cr>:copen<cr>
vnoremap <silent> <leader>jf :AsyncRun! -raw python -m json.tool<cr>:copen<cr>
"   Run on current buffer
nnoremap <silent> <leader><leader>jf :%!python -m json.tool<cr>
vnoremap <silent> <leader><leader>jf :!python -m json.tool<cr>

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
    au BufRead,BufNewFile *.h,*.c set filetype=c
    au FileType c setlocal makeprg=make
    au FileType c,make nnoremap <buffer> <leader>r :AsyncRun
                \ -cwd=<root> make CFLAGS=-DDEBUG<cr>:copen<cr>
augroup END

" C/CPP
augroup ft_cpp
    au!
    let g:clang_format#code_style = 'google'
    let g:clang_format#detect_style_file = 1
    let g:ncm2_pyclang#database_path = [
                \ 'compile_commands.json',
                \ 'build/compile_commands.json'
                \ ]

    if has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
            let g:ncm2_pyclang#library_path =
                        \ '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
        else
            let g:ncm2_pyclang#library_path = '/usr/lib/libclang.so'
        endif
    endif

    " C/CPP mappings
    au FileType cpp setlocal makeprg=ninja\ -C\ build
    au FileType cpp nnoremap <silent> <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>
    au FileType cpp nnoremap <silent> <buffer> <leader>f :ClangFormat<cr>:echo 'File formatted'<cr>
    au FileType cpp nnoremap <buffer> <F5> :AsyncRun
                \ -cwd=<root> mkdir -p build && cd build && cmake ..
                \ -G Ninja -DCMAKE_BUILD_TYPE=Release
                \ -DCMAKE_EXPORT_COMPILE_COMMANDS=1 && cd .. && ninja -C build<cr>:copen<cr>
    au FileType cpp nnoremap <buffer> <F6> :AsyncRun
                \ -cwd=<root> mkdir -p build && cd build && cmake ..
                \ -G Ninja -DCMAKE_BUILD_TYPE=Debug
                \ -DCMAKE_EXPORT_COMPILE_COMMANDS=1 && cd .. && ninja -C build<cr>:copen<cr>
    au FileType cpp nnoremap <buffer> <F7> :AsyncRun
                \ -cwd=<root> -raw cd build && ninja && CTEST_OUTPUT_ON_FAILURE=TRUE
                \ ninja test<cr>:copen<cr>
augroup END

" Python
augroup ft_python
    au!
    au FileType python setlocal foldmethod=indent
augroup END

" Git
augroup ft_gitcommit
    au!
    au Filetype gitcommit setlocal spell textwidth=72
    au Filetype gitcommit setlocal colorcolumn=73
augroup END

" Tex
" TODO: Revisit this when I get to writing latex again.
au BufNewFile,BufRead *.tex setlocal filetype=tex
augroup ft_tex
    au!

    " Vimtex
    let g:vimtex_compiler_latexmk = {
                \ 'backend' : 'nvim',
                \ 'background' : 1,
                \ 'build_dir' : 'build',
                \ 'callback' : 1,
                \ 'continuous' : 1,
                \ 'executable' : 'latexmk',
                \ 'hooks' : [],
                \ 'options' : [
                \   '-verbose',
                \   '-file-line-error',
                \   '-synctex=1',
                \   '-interaction=nonstopmode',
                \ ],
                \}
    au User Ncm2Plugin call ncm2#register_source({
                \ 'name' : 'vimtex',
                \ 'priority': 9,
                \ 'subscope_enable': 1,
                \ 'complete_length': 1,
                \ 'scope': ['tex'],
                \ 'mark': 'tex',
                \ 'word_pattern': '\w+',
                \ 'complete_pattern': g:vimtex#re#ncm,
                \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
                \ })
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_view_forward_search_on_start = 0

    au Filetype tex setlocal spell
    au Filetype tex nnoremap <silent> <buffer> <F2>  :VimtexTocToggle<cr>
    au Filetype tex nnoremap <silent> <buffer> <F5>  :VimtexCompile<cr>
    au Filetype tex nnoremap <silent> <buffer> <F6>  :VimtexStop<cr>
    au Filetype tex nnoremap <silent> <buffer> <F7>  :VimtexView<cr>
    au Filetype tex nnoremap <silent> <buffer> <F8>  :VimtexCompileSS<cr>
    au Filetype tex nnoremap <silent> <buffer> <F9>  :VimtexClean<cr>
    au Filetype tex nnoremap <silent> <buffer> <F10> :VimtexClean!<cr>
    au Filetype tex nnoremap <silent> <buffer> <F11> :VimtexView<cr>
    au Filetype tex nnoremap <silent> <buffer> <F12> :VimtexCountWords<cr>
augroup END

" Mail
" TODO: Revisit this for Neomutt usage.
au BufNewFile,BufRead *.eml setlocal filetype=mail
augroup ft_mail
    au!
    au Filetype mail setlocal wrap
    au Filetype mail setlocal linebreak
    au Filetype mail setlocal textwidth=72
    au Filetype mail setlocal formatoptions+=w
augroup END

" ------------------------------------------------------------------
" Plugins specific options
" ------------------------------------------------------------------

" NERDTree
let NERDTreeShowHidden=1
nnoremap <silent> <F1> :NERDTreeToggle<cr>

" CtrlP
let g:ctrlp_extensions = ['tag']
nnoremap <silent> <leader>mr :CtrlPMRU<cr>
if executable('rg')
    let g:ctrlp_user_command = 'rg --files %s'
    let g:ctrlp_use_caching = 0
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_switch_buffer = 'et'
endif
function! CtrlpStatusbar(...)
    hi CtrlpStatusDir      ctermbg=8    ctermfg=15   cterm=bold
    hi CtrlpStatusRegex    ctermbg=8    ctermfg=15   cterm=bold
    hi CtrlpStatusFilename ctermbg=8    ctermfg=15   cterm=bold
    hi CtrlpStatusPrevMode ctermbg=8    ctermfg=15   cterm=bold
    hi CtrlpStatusCurrMode ctermbg=8    ctermfg=1    cterm=bold
    hi CtrlpStatusNextMode ctermbg=8    ctermfg=15   cterm=bold
    hi CtrlPPrtBase        ctermbg=none ctermfg=15   cterm=bold
    hi CtrlPPrtText        ctermbg=none ctermfg=none cterm=bold
    hi CtrlPPrtCursor      ctermbg=none ctermfg=none cterm=bold
    hi CtrlPLinePre        ctermbg=none ctermfg=none cterm=bold

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
    return ' ' . current_dir . file_mode . regex_mode . '%=' .
                \ previous_mode . '  «  ' . current_mode . '  »  ' . next_mode . '  '
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

" Open/Close the Tagbar window
nnoremap <silent> <F2> :TagbarToggle <cr>

" Tabularize
nnoremap <silent> <C-a> :Tabularize /
vnoremap <silent> <C-a> :Tabularize /

" Tag generation.
set tags+=.git/tags
nnoremap <leader>t :AsyncRun -cwd=<root> ctags -Rf .git/tags
            \ --tag-relative --exclude=.git,pkg,build,doc,ext,tests<CR>:cw<CR>

" AsyncRun
let g:asyncrun_open = 0
let g:asyncrun_status = "stopped"
let g:asyncrun_auto = "make"
command! -nargs=+ Make execute ':AsyncRun -cwd=<root> make <args>' | copen 10
nnoremap <leader><leader>r :Make

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
    let g:lexical_parameters = {
                \ 'spell': 1,
                \ 'spelllang':  ['en', 'scientific', 'chemistry', 'medical'],
                \ 'dictionary': [
                \                '/usr/share/dict/words',
                \                '~/.config/nvim/spell/scientific_us.dic',
                \                '~/.config/nvim/spell/chemistry.dic',
                \                '~/.config/nvim/spell/medical.dic',
                \               ],
                \ 'thesaurus':  ['~/.config/nvim/spell/thesaurus.txt'],
                \ 'spellfile':  ['~/.config/nvim/spell/en.utf-8.add'],
                \ }

    " Avoid spellcheck errors on URL and acronyms.
    au Syntax tex,md syn match URL 'https\?:\/\/[^[:space:]]\+'
                \ contains=@NoSpell containedin=ALL contained transparent
    au Syntax tex,md syn match Acronym '\<\u\{3,}s\?\>'
                \ contains=@NoSpell containedin=ALL contained transparent

    au FileType tex call lexical#init(g:lexical_parameters)
    au FileType tex call lexical#init(g:lexical_parameters)
augroup END

" NCM2 (Completion)
augroup ncm2
    au!
    if &rtp =~ 'ncm2'
        au BufEnter * call ncm2#enable_for_buffer()
        set completeopt=noinsert,menuone,noselect
        au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
        au User Ncm2PopupClose set completeopt=menuone
        inoremap <silent> <expr> <cr> ncm2_ultisnips#expand_or("\<cr>", 'n')
        set shortmess+=c
    endif
augroup END

" GitGutter
set updatetime=100
let g:gitgutter_sign_added = '• '
let g:gitgutter_sign_modified = '• '
let g:gitgutter_sign_removed = '• '
let g:gitgutter_sign_removed_first_line = '• '
let g:gitgutter_sign_modified_removed = '• '
let g:gitgutter_sign_removed_above_and_below = '• '

" Autocomplete parenthesis/brackets.
" I don't want quote completion in Scheme.
call lexima#add_rule({'char': "'", 'input_after': '', 'filetype': 'scheme'})

" Vim-commentary
" Toggle comments in visual mode is all I need.
vmap <Space> gc
augroup commentary
    au!
    au FileType c,cpp,cs,java setlocal commentstring=//\ %s
augroup END

augroup whitespace
    au!
    highlight ExtraWhitespace ctermbg=1 guibg=red
    au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    au InsertLeave * match ExtraWhitespace /\s\+$/
    au BufWinLeave * call clearmatches()
    au FileType fugitive call clearmatches()
augroup END

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<cr>

" Replace Rg plugin
command! -nargs=+ Vimgrep execute 'silent vimgrep! <args> **' | cw 10
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading\ -S
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    command! -nargs=+ Grep execute 'silent grep! <args>' | cw 10
endif
packadd cfilter

" Set notes directory.
command! -nargs=+ Notes execute 'silent grep! <args> ~/Dropbox/Notes/**' | cw 10
" Set tasks directory.
" TODO: With a bit more work this might work very well for my use case of Org
" mode!
command! -nargs=+ Tasks execute 'silent grep! <args> ~/Dropbox/Org/**' | cw 10
