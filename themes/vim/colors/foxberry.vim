" Foxberry: a light Nord colorscheme for Vim (no plugins required).
" Colors follow docs/PALETTE.md (v2.4): the role of a color decides its shade.
" Setup: see the Vim section in README.md.
" Part of Foxberry, a light Nord theme. MIT license; see LICENSE.

hi clear
if exists('syntax_on')
  syntax reset
endif
set background=light
let g:colors_name = 'foxberry'

" ---- palette (docs/PALETTE.md) -------------------------------------------
" surfaces and text
let s:bg      = '#E5E9F0'   " editor = terminal background, so no frame shows around Vim
let s:alt     = '#DFE3EA'   " one step darker: current line, folds
let s:panel   = '#D8DEE9'
let s:line    = '#C9D0DC'
let s:text    = '#3B4252'
let s:strong  = '#2E3440'
let s:dim     = '#4C566A'
let s:comment = '#6A7488'
let s:hint    = '#8E97A8'
let s:snow    = '#ECEFF4'   " text under the cursor
let s:cursor  = '#A35E75'   " foxberry

" accents, text shade
let s:n7  = '#36816F'
let s:n8  = '#287F92'
let s:n9  = '#5374B3'
let s:n10 = '#3F79A8'
let s:n11 = '#BE525A'
let s:n12 = '#B15E37'
let s:n13 = '#967044'
let s:n14 = '#4E8044'
let s:n15 = '#986393'

" accents, bright shade (undercurls)
let s:b8  = '#3B95A9'
let s:b11 = '#DA656D'
let s:b13 = '#AD8455'
let s:b14 = '#619756'

" accents, badge shade (backgrounds, dark text on top)
let s:g8   = '#ACD3DE'
let s:g12  = '#DEAB9B'
let s:g13  = '#E5C4A1'
let s:gfox = '#DEC0CC'

" diff backgrounds: badge colors blended with #ECEFF4 (not with #2E3440)
let s:diff_add    = '#C7D6C0'   " nord14 badge, 55 %
let s:diff_change = '#CCD8E5'   " nord9 badge, 45 %
let s:diff_delete = '#DFBFC4'   " nord11 badge, 55 %
let s:diff_text   = '#E6CAAD'   " nord13 badge, 85 %

" ---- helper --------------------------------------------------------------
" s:hi(group, fg, bg, gui, cterm [, sp])
"   fg, bg  hex colors ('' for none)
"   gui     attributes for GUI and termguicolors ('' for none)
"   cterm   raw cterm arguments for 16-color terminals ('' for none), with ANSI
"           indices of the Foxberry terminal palette (PALETTE.md). Badge and
"           panel backgrounds have no ANSI slot and would vanish, so they fall
"           back to reverse video, underline or ANSI colors. Ignored with
"           'termguicolors': Vim still reads cterm attributes there, so they
"           are set from gui instead (no stray reverse or underline).
function! s:hi(group, fg, bg, gui, cterm, ...) abort
  let l:attr = a:gui ==# '' ? 'NONE' : a:gui
  execute 'hi ' . a:group
        \ . ' guifg=' . (a:fg ==# '' ? 'NONE' : a:fg)
        \ . ' guibg=' . (a:bg ==# '' ? 'NONE' : a:bg)
        \ . ' gui=' . l:attr
        \ . ' ctermfg=NONE ctermbg=NONE cterm='
        \ . (&termguicolors ? l:attr : 'NONE ' . a:cterm)
        \ . (a:0 ? ' guisp=' . a:1 : '')
endfunction

" ---- UI ------------------------------------------------------------------
call s:hi('Normal',       s:text,    s:bg,      '', 'ctermfg=0')
call s:hi('Cursor',       s:snow,    s:cursor,  '', '')
call s:hi('lCursor',      s:snow,    s:cursor,  '', '')
call s:hi('CursorIM',     s:snow,    s:cursor,  '', '')
call s:hi('CursorLine',   '',        s:alt,     '', 'cterm=underline')
call s:hi('CursorColumn', '',        s:alt,     '', 'ctermbg=15')
call s:hi('ColorColumn',  '',        s:alt,     '', 'ctermbg=15')
call s:hi('LineNr',       s:hint,    '',        '', 'ctermfg=15')
call s:hi('CursorLineNr', s:text,    s:alt,     'bold', 'ctermfg=0 cterm=bold')
call s:hi('SignColumn',   s:hint,    '',        '', 'ctermfg=15')
call s:hi('FoldColumn',   s:hint,    '',        '', 'ctermfg=15')
call s:hi('Folded',       s:comment, s:alt,     '', 'ctermfg=7')
call s:hi('Visual',       '',        s:panel,   '', 'cterm=reverse')
call s:hi('VisualNOS',    '',        s:panel,   '', 'cterm=reverse')
call s:hi('Search',       s:strong,  s:g13,     '', 'ctermfg=3 cterm=reverse')
call s:hi('IncSearch',    s:strong,  s:gfox,    'bold', 'ctermfg=5 cterm=reverse,bold')
call s:hi('CurSearch',    s:strong,  s:gfox,    'bold', 'ctermfg=5 cterm=reverse,bold')
call s:hi('Substitute',   s:strong,  s:g12,     '', 'ctermfg=1 cterm=reverse')
call s:hi('MatchParen',   s:strong,  s:line,    'bold', 'ctermfg=5 cterm=bold,underline')
call s:hi('NonText',      s:line,    '',        '', 'ctermfg=15')
call s:hi('EndOfBuffer',  s:line,    '',        '', 'ctermfg=15')
call s:hi('SpecialKey',   s:line,    '',        '', 'ctermfg=15')
call s:hi('Whitespace',   s:line,    '',        '', 'ctermfg=15')
call s:hi('Conceal',      s:hint,    '',        '', 'ctermfg=15')
call s:hi('Directory',    s:n8,      '',        '', 'ctermfg=6')
call s:hi('Title',        s:strong,  '',        'bold', 'ctermfg=0 cterm=bold')
call s:hi('VertSplit',    s:line,    '',        '', 'ctermfg=15')
call s:hi('Pmenu',        s:text,    s:panel,   '', 'ctermfg=0 ctermbg=15')
call s:hi('PmenuSel',     s:strong,  s:g8,      '', 'ctermfg=6 cterm=reverse,bold')
call s:hi('PmenuSbar',    '',        s:line,    '', 'ctermbg=15')
call s:hi('PmenuThumb',   '',        s:hint,    '', 'ctermbg=8')
call s:hi('WildMenu',     s:strong,  s:g8,      '', 'ctermfg=6 cterm=reverse,bold')
" StatusLine and StatusLineNC must differ in cterm, or Vim fills the bar with ^^^
call s:hi('StatusLine',   s:text,    s:line,    'bold', 'ctermfg=0 ctermbg=15 cterm=bold')
call s:hi('StatusLineNC', s:comment, s:panel,   '', 'ctermfg=7 cterm=underline')
call s:hi('StatusLineTerm',   s:text,    s:line,  'bold', 'ctermfg=0 ctermbg=15 cterm=bold')
call s:hi('StatusLineTermNC', s:comment, s:panel, '', 'ctermfg=7 cterm=underline')
call s:hi('TabLine',      s:comment, s:panel,   '', 'ctermfg=7')
call s:hi('TabLineFill',  s:comment, s:panel,   '', 'ctermfg=7 cterm=underline')
call s:hi('TabLineSel',   s:strong,  s:g8,      'bold', 'ctermfg=6 cterm=reverse,bold')
call s:hi('ErrorMsg',     s:n11,     '',        'bold', 'ctermfg=1 cterm=bold')
call s:hi('WarningMsg',   s:n13,     '',        'bold', 'ctermfg=3 cterm=bold')
call s:hi('ModeMsg',      s:text,    '',        'bold', 'ctermfg=0 cterm=bold')
call s:hi('MoreMsg',      s:n14,     '',        '', 'ctermfg=2')
call s:hi('Question',     s:n8,      '',        '', 'ctermfg=6')

" ---- diff ----------------------------------------------------------------
call s:hi('DiffAdd',      '',        s:diff_add,    '', 'ctermfg=2')
call s:hi('DiffChange',   '',        s:diff_change, '', '')
call s:hi('DiffDelete',   s:n11,     s:diff_delete, '', 'ctermfg=1')
call s:hi('DiffText',     '',        s:diff_text,   'bold', 'ctermfg=3 cterm=reverse,bold')
call s:hi('Added',        s:n14,     '',        '', 'ctermfg=2')
call s:hi('Changed',      s:n13,     '',        '', 'ctermfg=3')
call s:hi('Removed',      s:n11,     '',        '', 'ctermfg=1')

" ---- spell ---------------------------------------------------------------
call s:hi('SpellBad',     '', '', 'undercurl', 'ctermfg=1 cterm=underline', s:b11)
call s:hi('SpellCap',     '', '', 'undercurl', 'ctermfg=3 cterm=underline', s:b13)
call s:hi('SpellRare',    '', '', 'undercurl', 'ctermfg=6 cterm=underline', s:b8)
call s:hi('SpellLocal',   '', '', 'undercurl', 'ctermfg=2 cterm=underline', s:b14)

" ---- syntax --------------------------------------------------------------
call s:hi('Comment',      s:comment, '', 'italic', 'ctermfg=7 cterm=italic')
call s:hi('Constant',     s:n15,     '', '', 'ctermfg=5')
call s:hi('String',       s:n14,     '', '', 'ctermfg=2')
call s:hi('Character',    s:n14,     '', '', 'ctermfg=2')
call s:hi('Number',       s:n15,     '', '', 'ctermfg=5')
call s:hi('Boolean',      s:n15,     '', '', 'ctermfg=5')
call s:hi('Float',        s:n15,     '', '', 'ctermfg=5')
call s:hi('Identifier',   s:text,    '', '', 'ctermfg=0')
call s:hi('Function',     s:n8,      '', '', 'ctermfg=6')
call s:hi('Statement',    s:n9,      '', '', 'ctermfg=4')
call s:hi('Conditional',  s:n9,      '', '', 'ctermfg=4')
call s:hi('Repeat',       s:n9,      '', '', 'ctermfg=4')
call s:hi('Label',        s:n9,      '', '', 'ctermfg=4')
call s:hi('Operator',     s:n9,      '', '', 'ctermfg=4')
call s:hi('Keyword',      s:n9,      '', '', 'ctermfg=4')
call s:hi('Exception',    s:n9,      '', '', 'ctermfg=4')
call s:hi('PreProc',      s:n9,      '', '', 'ctermfg=4')
call s:hi('Include',      s:n9,      '', '', 'ctermfg=4')
call s:hi('Define',       s:n9,      '', '', 'ctermfg=4')
call s:hi('Macro',        s:n9,      '', '', 'ctermfg=4')
call s:hi('PreCondit',    s:n9,      '', '', 'ctermfg=4')
call s:hi('Type',         s:n7,      '', '', 'ctermfg=14')
call s:hi('StorageClass', s:n7,      '', '', 'ctermfg=14')
call s:hi('Structure',    s:n7,      '', '', 'ctermfg=14')
call s:hi('Typedef',      s:n7,      '', '', 'ctermfg=14')
call s:hi('Special',      s:n13,     '', '', 'ctermfg=3')
call s:hi('SpecialChar',  s:n13,     '', '', 'ctermfg=3')
call s:hi('SpecialComment', s:n13,   '', '', 'ctermfg=3')
call s:hi('Tag',          s:n10,     '', '', 'ctermfg=4')
call s:hi('Delimiter',    s:dim,     '', '', 'ctermfg=8')
call s:hi('Debug',        s:n12,     '', '', 'ctermfg=3')
call s:hi('Underlined',   s:n10,     '', 'underline', 'ctermfg=4 cterm=underline')
call s:hi('Ignore',       s:hint,    '', '', 'ctermfg=15')
call s:hi('Error',        s:n11,     '', 'bold', 'ctermfg=1 cterm=bold')
call s:hi('Todo',         s:strong,  s:g13, 'bold', 'ctermfg=3 cterm=reverse,bold')

" ---- diff files, markdown, help ------------------------------------------
call s:hi('diffAdded',    s:n14, '', '', 'ctermfg=2')
call s:hi('diffRemoved',  s:n11, '', '', 'ctermfg=1')
call s:hi('diffChanged',  s:n13, '', '', 'ctermfg=3')
call s:hi('diffFile',     s:n8,  '', 'bold', 'ctermfg=6 cterm=bold')
call s:hi('diffLine',     s:n15, '', '', 'ctermfg=5')

for s:h in ['markdownH1', 'markdownH2', 'markdownH3', 'markdownH4', 'markdownH5', 'markdownH6']
  call s:hi(s:h, s:n9, '', 'bold', 'ctermfg=4 cterm=bold')
endfor
unlet s:h
call s:hi('markdownCode',     s:n14, '', '', 'ctermfg=2')
call s:hi('markdownUrl',      s:n10, '', 'underline', 'ctermfg=4 cterm=underline')
call s:hi('markdownLinkText', s:n8,  '', '', 'ctermfg=6')
call s:hi('helpHyperTextJump',  s:n10, '', 'underline', 'ctermfg=4 cterm=underline')
call s:hi('helpHyperTextEntry', s:n8,  '', '', 'ctermfg=6')

" ---- :terminal -----------------------------------------------------------
" the same 16 colors as the Foxberry Ghostty / kitty themes
let g:terminal_ansi_colors = [
  \ '#3B4252', '#BE525A', '#4E8044', '#967044',
  \ '#5374B3', '#986393', '#287F92', '#6A7488',
  \ '#4C566A', '#DA656D', '#619756', '#AD8455',
  \ '#658ACD', '#B077AB', '#489784', '#8E97A8',
  \ ]
