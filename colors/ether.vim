" ------------------------------------------------
" Desc:   A bold colorscheme
" Name:   ether
" Author: Alex Sanchez
" Email:  kniren@gmail.com
" ------------------------------------------------
set background=dark
hi clear
if exists("syntax on")
    syntax reset
endif

if has('gui_running')
    set antialias
    set guifont=Iosevka\ 12
    set guioptions-=M
    set guioptions-=m
    set guioptions-=r
    set guioptions-=T
    set guioptions-=L
    set guioptions-=b
    set guioptions-=i
    set guioptions-=g
    set guicursor+=a:blinkon0
endif

set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:color_name="ether"
syn match Braces display '[{}()\[\]]'

" Normal colors
hi Normal          ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi Ignore          ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi Comment         ctermfg=15    ctermbg=none  cterm=none guifg=#698193 guibg=#1a1d23
hi LineNr          ctermfg=15    ctermbg=none  cterm=none guifg=#698193 guibg=#1a1d23
hi VertSplit       ctermfg=8     ctermbg=none  cterm=none guifg=#1a1d23 guibg=#698193

hi Constant        ctermfg=7     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23
hi String          ctermfg=6     ctermbg=none  cterm=bold guifg=#26daf2 guibg=#1a1d23
hi Character       ctermfg=1     ctermbg=none  cterm=bold guifg=#f2245b guibg=#1a1d23
hi SpecialChar     ctermfg=1     ctermbg=none  cterm=bold guifg=#f2245b guibg=#1a1d23
hi Number          ctermfg=1     ctermbg=none  cterm=bold guifg=#f2245b guibg=#1a1d23
hi Boolean         ctermfg=1     ctermbg=none  cterm=bold guifg=#f2245b guibg=#1a1d23
hi Float           ctermfg=1     ctermbg=none  cterm=bold guifg=#f2245b guibg=#1a1d23
hi Include         ctermfg=15    ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23

hi Tabline         ctermfg=15    ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23
hi TablineFill     ctermfg=7     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23
hi TablineSel      ctermfg=7     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23

hi Identifier      ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi Function        ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23

hi Statement       ctermfg=7     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23
hi Conditional     ctermfg=7     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23
hi Repeat          ctermfg=7     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23
hi Label           ctermfg=7     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23
hi Operator        ctermfg=7     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23
hi Keyword         ctermfg=7     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23
hi Exception       ctermfg=7     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23

hi PreProc         ctermfg=7    ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi Define          ctermfg=7    ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi Macro           ctermfg=7    ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi PreProc         ctermfg=7    ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi PreCondit       ctermfg=7    ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi NonText         ctermfg=7    ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23

hi Directory       ctermfg=6     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23
hi SpecialKey      ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi MatchParen      ctermfg=1     ctermbg=none  cterm=bold guifg=#f2245b guibg=#1a1d23
hi Braces          ctermfg=7     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23

hi Type            ctermfg=7     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23
hi StorageClass    ctermfg=7     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23
hi Structure       ctermfg=7     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23
hi Typedef         ctermfg=7     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23

hi Underlined      ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi Title           ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23

hi Special         ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi SpecialChar     ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi Tag             ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi Delimiter       ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi SpecialComment  ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi Debug           ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23

hi MoreMsg         ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi ModeMsg         ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi Todo            ctermfg=1     ctermbg=none  cterm=bold guifg=#f2245b guibg=#1a1d23
hi Error           ctermfg=1     ctermbg=none  cterm=none guifg=#f2245b guibg=#1a1d23
hi ErrorMsg        ctermfg=1     ctermbg=none  cterm=none guifg=#f2245b guibg=#1a1d23
hi Folded          ctermfg=15    ctermbg=none  cterm=none guifg=#698193 guibg=#1a1d23
hi FoldColumn      ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi Search          ctermfg=8     ctermbg=4     cterm=bold guifg=#eqeaf0 guibg=#1a1d23
hi IncSearch       ctermfg=7     ctermbg=4     cterm=bold guifg=#eqeaf0 guibg=#1a1d23
hi WarningMsg      ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi Question        ctermfg=7     ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23

hi Pmenu           ctermfg=15    ctermbg=8     cterm=none guifg=#698193 guibg=#272c38
hi PmenuSel        ctermfg=4     ctermbg=8     cterm=bold guifg=#eqeaf0 guibg=#272c38
hi PmenuSbar       ctermfg=15    ctermbg=8     cterm=bold guifg=#698193 guibg=#272c38
hi WildMenu        ctermfg=4     ctermbg=none  cterm=bold guifg=#eqeaf0 guibg=#1a1d23

hi Visual          ctermfg=8     ctermbg=7     cterm=none guifg=#272C38 guibg=#E1EAF0
hi StatusLine      ctermfg=7     ctermbg=8     cterm=bold guifg=#272c38 guibg=#E1EAF0
hi StatusLineNC    ctermfg=15    ctermbg=8     cterm=bold guifg=#1A1D23 guibg=#698193
hi CursorLine      ctermfg=none  ctermbg=8     cterm=none guifg=#eqeaf0 guibg=#272c38
hi CursorLineNr    ctermfg=none  ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23
hi ColorColumn     ctermfg=none  ctermbg=8     cterm=none               guibg=#272C38
hi SignColumn      ctermfg=none  ctermbg=none  cterm=none guifg=#eqeaf0 guibg=#1a1d23

" Vim specific
hi helpNote          ctermfg=6    ctermbg=none  cterm=none
hi helpCommand       ctermfg=6    ctermbg=none  cterm=none
hi helpExample       ctermfg=5    ctermbg=none  cterm=none
hi helpHeader        ctermfg=7    ctermbg=none  cterm=bold
hi helpHyperTextJump ctermfg=4    ctermbg=none  cterm=none
hi vimOption         ctermfg=7    ctermbg=none  cterm=none
hi vimHiAttrib       ctermfg=1    ctermbg=none  cterm=bold
hi vimCommentTitle   ctermfg=15   ctermbg=none  cterm=bold

" Diff lines
hi DiffText        ctermfg=3     ctermbg=none
hi DiffLine        ctermfg=4     ctermbg=none
hi DiffAdd         ctermfg=2     ctermbg=none
hi DiffDelete      ctermfg=1     ctermbg=none
hi DiffChange      ctermfg=3     ctermbg=none
hi DiffRemoved     ctermfg=1     ctermbg=none
hi DiffAdded       ctermfg=2     ctermbg=none

" Spell checking
if version >= 700
  hi clear SpellBad
  hi clear SpellCap
  hi clear SpellRare
  hi clear SpellLocal
  hi SpellBad   ctermfg=3 cterm=bold
  hi SpellCap   ctermfg=3 cterm=bold
  hi SpellRare  ctermfg=3 cterm=bold
  hi SpellLocal ctermfg=3 cterm=bold
endif

" GitGutter
hi GitGutterAdd          ctermfg=15
hi GitGutterChange       ctermfg=15
hi GitGutterDelete       ctermfg=15
hi GitGutterChangeDelete ctermfg=15

" Tagbar
hi TagbarScope       ctermfg=7     ctermbg=none      cterm=bold
hi TagbarKind        ctermfg=7     ctermbg=none      cterm=bold
hi TagbarNestedKind  ctermfg=7     ctermbg=none      cterm=bold

" CPP
hi cppAccess            ctermfg=15     ctermbg=none  cterm=bold
hi cSpecialCharacter    ctermfg=1     ctermbg=none  cterm=bold
hi cSpecial             ctermfg=1     ctermbg=none  cterm=bold

" Markdown
hi markdownHeadingDelimiter  ctermfg=1     ctermbg=none  cterm=bold
hi markdownRule              ctermfg=1     ctermbg=none  cterm=bold
hi markdownH1                ctermfg=1     ctermbg=none  cterm=bold
hi markdownH2                ctermfg=1     ctermbg=none  cterm=bold
hi markdownH3                ctermfg=1     ctermbg=none  cterm=bold
hi markdownH4                ctermfg=1     ctermbg=none  cterm=bold
hi markdownH5                ctermfg=1     ctermbg=none  cterm=bold
hi markdownH6                ctermfg=1     ctermbg=none  cterm=bold
hi markdownCode              ctermfg=6     ctermbg=none  cterm=bold
hi markdownCodeDelimiter     ctermfg=6     ctermbg=none  cterm=bold
hi markdownId                ctermfg=7     ctermbg=none  cterm=bold
hi markdownIdDeclaration     ctermfg=7     ctermbg=none  cterm=bold
hi markdownUrl               ctermfg=4     ctermbg=none  cterm=bold
hi markdownLink              ctermfg=4     ctermbg=none  cterm=bold
hi markdownLinkDelimiter     ctermfg=4     ctermbg=none  cterm=bold
hi markdownLinkText          ctermfg=7     ctermbg=none  cterm=bold
hi markdownLinkTextDelimiter ctermfg=4     ctermbg=none  cterm=bold
hi markdownItalic            ctermfg=7     ctermbg=8     cterm=bold,italic
hi markdownBold              ctermfg=7     ctermbg=none  cterm=bold
hi markdownListMarker        ctermfg=4     ctermbg=none  cterm=bold

" Custom comment tags
augroup comment_tags
    autocmd!
    au Syntax * syn match CommentTagImportant
                \ /\v\_.<(IMPORTANT)(\([[:alnum:]]+\))?:/hs=s+1,he=s+10
                \ containedin=.*Comment.* contained
    au Syntax * syn match CommentTagNote
                \ /\v\_.<(NOTE)(\([[:alnum:]]+\))?:/hs=s+1,he=s+5
                \ containedin=.*Comment.* contained
    au Syntax * syn match CommentTagDebug
                \ /\v\_.<(DEBUG)(\([[:alnum:]]+\))?:/hs=s+1,he=s+6
                \ containedin=.*Comment.* contained
    au Syntax * syn match CommentTagFixme
                \ /\v\_.<(FIXME)(\([[:alnum:]]+\))?:/hs=s+1,he=s+6
                \ containedin=.*Comment.* contained
    au Syntax * syn match CommentTagTodo
                \ /\v\_.<(TODO)(\([[:alnum:]]+\))?:/hs=s+1,he=s+5
                \ containedin=.*Comment.* contained
    au Syntax * syn match CommentTagAuthor
                \ /\v(\([[:alnum:]]+\))/
                \ containedin=CommentTag.* contained
augroup END
hi CommentTagImportant ctermfg=3 ctermbg=none cterm=bold
hi CommentTagNote      ctermfg=6 ctermbg=none cterm=bold
hi CommentTagDebug     ctermfg=2 ctermbg=none cterm=bold
hi CommentTagFixme     ctermfg=8 ctermbg=1    cterm=bold
hi CommentTagTodo      ctermfg=1 ctermbg=none cterm=bold
hi CommentTagAuthor    ctermfg=15 ctermbg=none cterm=bold

" GitGutter
hi GitGutterAdd          ctermfg=2 ctermbg=none
hi GitGutterChange       ctermfg=3 ctermbg=none
hi GitGutterChangeDelete ctermfg=3 ctermbg=none
hi GitGutterDelete       ctermfg=1 ctermbg=none
hi gitCommitOverflow     ctermfg=1 ctermbg=none cterm=bold
