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
Plug 'scrooloose/nerdtree'                                    " Project tree navigator. Use with <F2>
Plug 'tpope/vim-surround'                                     " Handy surround plugin
Plug 'scrooloose/syntastic'                                   " Syntax checker
Plug 'airblade/vim-gitgutter'                                 " Git symbols on your gutter
Plug 'terryma/vim-multiple-cursors'                           " Multi-cursors. Use with <C-n> in normal.
Plug 'jiangmiao/auto-pairs'                                   " Autoclose parentheses and brackets
Plug 'majutsushi/tagbar'                                      " Tag searcher
Plug 'tpope/vim-fugitive'                                     " Git integration in vim
Plug 'godlygeek/tabular'                                      " OCD helper. Use with <leader>t in visual.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Completion engine
Plug 'SirVer/ultisnips'                                       " Snippets support
Plug 'honza/vim-snippets'                                     " A collection of snippets for ultisnips
Plug 'jreybert/vimagit'                                       " Magit for vim
Plug 'jremmen/vim-ripgrep'                                    " A better code finder (Grep, Ack)
Plug 'Chiel92/vim-autoformat'                                 " Autoformatting for clang-format compatible languages
Plug 'ervandew/supertab'                                      " Better TAB usage for completion
Plug 'tikhomirov/vim-glsl'                                    " Syntax data for OpenGL shading language
Plug 'christoomey/vim-tmux-navigator'                         " Seamless navigation between vim and tmux
Plug 'zchee/deoplete-clang'                                   " Code completion for C family languages
Plug 'jsfaint/gen_tags.vim'                                   " Ctags/Gtags generation
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
set nonumber
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
nnoremap <leader><leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z :echo 'Trailing whitespace removed'<cr>

" Clean windows carriage return
nnoremap <leader><leader>r :%s/\r\(\n\)/\1/g<cr> :echo 'Windows carriage return removed'<cr>

" Copy and paste from the system clipboard
vnoremap <C-c> "+y
inoremap <C-v> <Esc>"+pi

" Yank and past from buffer [1-5]
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

" Force file update if it has changed
nnoremap <leader>u :checktime<cr>:echo 'File updated'<cr>

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
    let g:clang_format#code_style = 'llvm'
    noremap <leader>f ix<ESC>x:undojoin \| Autoformat<CR>
    " Deoplete-clang
    if has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
            let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
			let g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'
        else
            " Linux path goes here
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
    au BufNewFile,BufRead *.m*down setlocal filetype=markdown foldlevel=1
    au FileType markdown setlocal nonumber nocursorline
    au FileType markdown setlocal textwidth=82
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
nnoremap <F2> :NERDTreeToggle<cr>

" Ctrl-P
let g:ctrlp_extensions = ['tag']
nnoremap <silent> <leader>lj :CtrlPBuffer<cr>
nnoremap <silent> <leader>mr :CtrlPMRU<cr>
nnoremap <silent> <leader>MR :CtrlPMRU<cr>
nnoremap <silent> <leader>p :CtrlPTag<cr>

" UltiSnips
let g:UltiSnipsExpandTrigger='<c-y>'
let g:UltiSnipsJumpForwardTrigger='<c-u>'
let g:UltiSnipsJumpBackwardTrigger='<c-b>'

" Syntastic
let g:syntastic_html_checkers=['']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_quiet_messages = { 'regex': 'file not found' }
nnoremap <leader>e :Errors<cr>
nnoremap <leader>es :SyntasticCheck<cr>

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
au FileType go nmap <leader>t  <Plug>(go-test)
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
nnoremap <F5> :TagbarToggle <cr>

" Tabularize
nnoremap <silent> <leader><leader>t :Tabularize /
vnoremap <silent> <leader><leader>t :Tabularize /

" CtrlP
if executable('rg')
    let g:ctrlp_user_command = 'rg --files %s'
    let g:ctrlp_use_caching = 0
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_switch_buffer = 'et'
endif

" Ripgrep
let g:rg_command = 'rg --vimgrep -S'

" Deoplete
call deoplete#enable()
set completeopt=menu
set completeopt-=preview

" Supertab
let g:SuperTabDefaultCompletionType = '<c-n>'

" Gen Ctags
let g:loaded_gentags#gtags = 1
let g:gen_tags#ctags_auto_gen = 1
let g:gen_tags#blacklist = ['$HOME']
