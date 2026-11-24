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

" ---- palette -------------------------------------------------------------
" surfaces and text
let s:bg      = '#ECEFF4'   " editor
let s:term_bg = '#E5E9F0'   " terminal background
let s:panel   = '#D8DEE9'
let s:line    = '#C9D0DC'
let s:text    = '#3B4252'
let s:strong  = '#2E3440'
let s:dim     = '#4C566A'
let s:comment = '#6A7488'
let s:hint    = '#8E97A8'
let s:cursor  = '#A35E75'

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
let s:fox = '#A35E75'

" accents, bright shade (markers, undercurls)
let s:b11 = '#DA656D'
let s:b13 = '#AD8455'
let s:b14 = '#619756'
let s:b8  = '#3B95A9'

" accents, badge shade (backgrounds, dark text on top)
let s:g7  = '#B6D3D2'
let s:g8  = '#ACD3DE'
let s:g9  = '#A7BDD4'
let s:g11 = '#D5989E'
let s:g12 = '#DEAB9B'
let s:g13 = '#E5C4A1'
let s:g14 = '#AAC396'
let s:g15 = '#CAB0C6'
let s:gfox = '#DEC0CC'

" blend two #rrggbb colors; t is the share of a, in percent
function! s:mix(a, b, t) abort
  let l:out = '#'
  for l:i in [1, 3, 5]
    let l:x = str2nr(a:a[l:i : l:i + 1], 16)
    let l:y = str2nr(a:b[l:i : l:i + 1], 16)
    let l:out .= printf('%02X', (l:x * a:t + l:y * (100 - a:t)) / 100)
  endfor
  return l:out
endfunction

" ---- helper --------------------------------------------------------------
" s:hi(group, fg, bg, attr [, sp])
" fg/bg: a hex color, or '' for none. Hex colors are also mapped to the ANSI
" slot of the Foxberry terminal palette (for use without termguicolors).
let s:ansi = {
  \ '#3B4252': 0, '#BE525A': 1, '#4E8044': 2, '#967044': 3,
  \ '#5374B3': 4, '#986393': 5, '#287F92': 6, '#6A7488': 7,
  \ '#4C566A': 8, '#DA656D': 9, '#619756': 10, '#AD8455': 11,
  \ '#658ACD': 12, '#B077AB': 13, '#489784': 14, '#8E97A8': 15,
  \ }

function! s:cterm(c) abort
  return has_key(s:ansi, a:c) ? s:ansi[a:c] : 'NONE'
endfunction

function! s:hi(group, fg, bg, attr, ...) abort
  let l:cmd = 'hi ' . a:group
  let l:cmd .= ' guifg=' . (a:fg ==# '' ? 'NONE' : a:fg)
  let l:cmd .= ' guibg=' . (a:bg ==# '' ? 'NONE' : a:bg)
  let l:cmd .= ' gui=' . (a:attr ==# '' ? 'NONE' : a:attr)
  let l:cmd .= ' ctermfg=' . (a:fg ==# '' ? 'NONE' : s:cterm(a:fg))
  " badge backgrounds have no ANSI slot: fall back to the terminal background
  let l:cmd .= ' ctermbg=' . (a:bg ==# '' ? 'NONE' : s:cterm(a:bg))
  let l:attr = substitute(a:attr, 'undercurl', 'underline', 'g')
  let l:cmd .= ' cterm=' . (l:attr ==# '' ? 'NONE' : l:attr)
  if a:0 && a:1 !=# ''
    let l:cmd .= ' guisp=' . a:1
  endif
  execute l:cmd
endfunction

" ---- UI ------------------------------------------------------------------
call s:hi('Normal',       s:text,   s:bg,     '')
call s:hi('NormalFloat',  s:text,   s:panel,  '')
call s:hi('FloatBorder',  s:line,   s:panel,  '')
call s:hi('Cursor',       s:bg,     s:cursor, '')
call s:hi('lCursor',      s:bg,     s:cursor, '')
call s:hi('CursorIM',     s:bg,     s:cursor, '')
call s:hi('TermCursor',   s:bg,     s:cursor, '')
call s:hi('CursorLine',   '',       s:term_bg, '')
call s:hi('CursorColumn', '',       s:term_bg, '')
call s:hi('ColorColumn',  '',       s:term_bg, '')
call s:hi('LineNr',       s:hint,   '',       '')
call s:hi('CursorLineNr', s:text,   s:term_bg, 'bold')
call s:hi('SignColumn',   s:hint,   '',       '')
call s:hi('FoldColumn',   s:hint,   '',       '')
call s:hi('Folded',       s:comment, s:term_bg, '')
call s:hi('Visual',       '',       s:panel,  '')
call s:hi('VisualNOS',    '',       s:panel,  '')
call s:hi('Search',       s:strong, s:g13,    '')
call s:hi('IncSearch',    s:strong, s:gfox,   'bold')
call s:hi('CurSearch',    s:strong, s:gfox,   'bold')
call s:hi('Substitute',   s:strong, s:g12,    '')
call s:hi('MatchParen',   s:strong, s:line,   'bold')
call s:hi('NonText',      s:line,   '',       '')
call s:hi('EndOfBuffer',  s:line,   '',       '')
call s:hi('SpecialKey',   s:line,   '',       '')
call s:hi('Whitespace',   s:line,   '',       '')
call s:hi('Conceal',      s:hint,   '',       '')
call s:hi('Directory',    s:n8,     '',       '')
call s:hi('Title',        s:strong, '',       'bold')
call s:hi('VertSplit',    s:line,   '',       '')
call s:hi('WinSeparator', s:line,   '',       '')

call s:hi('Pmenu',        s:text,   s:panel,  '')
call s:hi('PmenuSel',     s:strong, s:g8,     '')
call s:hi('PmenuSbar',    '',       s:line,   '')
call s:hi('PmenuThumb',   '',       s:hint,   '')
call s:hi('WildMenu',     s:strong, s:g8,     '')

call s:hi('StatusLine',   s:text,   s:line,   'bold')
call s:hi('StatusLineNC', s:comment, s:panel, '')
call s:hi('StatusLineTerm',   s:text,   s:line,  'bold')
call s:hi('StatusLineTermNC', s:comment, s:panel, '')
call s:hi('TabLine',      s:comment, s:panel, '')
call s:hi('TabLineFill',  s:comment, s:panel, '')
call s:hi('TabLineSel',   s:strong, s:g8,     'bold')

call s:hi('ErrorMsg',     s:n11,    '',       'bold')
call s:hi('WarningMsg',   s:n13,    '',       'bold')
call s:hi('ModeMsg',      s:text,   '',       'bold')
call s:hi('MoreMsg',      s:n14,    '',       '')
call s:hi('Question',     s:n8,     '',       '')

" ---- diff ----------------------------------------------------------------
" badge colors blended with the editor background (not with #2E3440)
call s:hi('DiffAdd',      '', s:mix(s:g14, s:bg, 55), '')
call s:hi('DiffChange',   '', s:mix(s:g9,  s:bg, 45), '')
call s:hi('DiffDelete',   s:n11, s:mix(s:g11, s:bg, 55), '')
call s:hi('DiffText',     '', s:mix(s:g13, s:bg, 85), 'bold')
call s:hi('Added',        s:n14, '', '')
call s:hi('Changed',      s:n13, '', '')
call s:hi('Removed',      s:n11, '', '')

" ---- spell ---------------------------------------------------------------
call s:hi('SpellBad',     '', '', 'undercurl', s:b11)
call s:hi('SpellCap',     '', '', 'undercurl', s:b13)
call s:hi('SpellRare',    '', '', 'undercurl', s:b8)
call s:hi('SpellLocal',   '', '', 'undercurl', s:b14)

" ---- syntax --------------------------------------------------------------
call s:hi('Comment',      s:comment, '', 'italic')
call s:hi('Constant',     s:n15,    '',       '')
call s:hi('String',       s:n14,    '',       '')
call s:hi('Character',    s:n14,    '',       '')
call s:hi('Number',       s:n15,    '',       '')
call s:hi('Boolean',      s:n15,    '',       '')
call s:hi('Float',        s:n15,    '',       '')
call s:hi('Identifier',   s:text,   '',       '')
call s:hi('Function',     s:n8,     '',       '')
call s:hi('Statement',    s:n9,     '',       '')
call s:hi('Conditional',  s:n9,     '',       '')
call s:hi('Repeat',       s:n9,     '',       '')
call s:hi('Label',        s:n9,     '',       '')
call s:hi('Operator',     s:n9,     '',       '')
call s:hi('Keyword',      s:n9,     '',       '')
call s:hi('Exception',    s:n9,     '',       '')
call s:hi('PreProc',      s:n9,     '',       '')
call s:hi('Include',      s:n9,     '',       '')
call s:hi('Define',       s:n9,     '',       '')
call s:hi('Macro',        s:n9,     '',       '')
call s:hi('PreCondit',    s:n9,     '',       '')
call s:hi('Type',         s:n7,     '',       '')
call s:hi('StorageClass', s:n7,     '',       '')
call s:hi('Structure',    s:n7,     '',       '')
call s:hi('Typedef',      s:n7,     '',       '')
call s:hi('Special',      s:n13,    '',       '')
call s:hi('SpecialChar',  s:n13,    '',       '')
call s:hi('Tag',          s:n10,    '',       '')
call s:hi('Delimiter',    s:dim,    '',       '')
call s:hi('SpecialComment', s:n13,  '',       '')
call s:hi('Debug',        s:n12,    '',       '')
call s:hi('Underlined',   s:n10,    '',       'underline')
call s:hi('Ignore',       s:hint,   '',       '')
call s:hi('Error',        s:n11,    '',       'bold')
call s:hi('Todo',         s:strong, s:g13,    'bold')

" ---- diagnostics (Vim 9 / ALE / Neovim) ----------------------------------
call s:hi('DiagnosticError', s:n11, '', '')
call s:hi('DiagnosticWarn',  s:n13, '', '')
call s:hi('DiagnosticInfo',  s:n8,  '', '')
call s:hi('DiagnosticHint',  s:n7,  '', '')
call s:hi('DiagnosticUnderlineError', '', '', 'undercurl', s:b11)
call s:hi('DiagnosticUnderlineWarn',  '', '', 'undercurl', s:b13)
call s:hi('DiagnosticUnderlineInfo',  '', '', 'undercurl', s:b8)
call s:hi('DiagnosticUnderlineHint',  '', '', 'undercurl', s:b14)
hi! link ALEError DiagnosticUnderlineError
hi! link ALEWarning DiagnosticUnderlineWarn
hi! link ALEInfo DiagnosticUnderlineInfo
hi! link ALEErrorSign DiagnosticError
hi! link ALEWarningSign DiagnosticWarn
hi! link ALEInfoSign DiagnosticInfo

" ---- git signs (bright shade) --------------------------------------------
call s:hi('GitGutterAdd',    s:b14, '', '')
call s:hi('GitGutterChange', s:b13, '', '')
call s:hi('GitGutterDelete', s:b11, '', '')
hi! link SignifySignAdd GitGutterAdd
hi! link SignifySignChange GitGutterChange
hi! link SignifySignDelete GitGutterDelete

" ---- diff files, markdown, help ------------------------------------------
call s:hi('diffAdded',    s:n14, '', '')
call s:hi('diffRemoved',  s:n11, '', '')
call s:hi('diffChanged',  s:n13, '', '')
call s:hi('diffFile',     s:n8,  '', 'bold')
call s:hi('diffLine',     s:n15, '', '')

call s:hi('markdownH1',   s:n9, '', 'bold')
call s:hi('markdownH2',   s:n9, '', 'bold')
call s:hi('markdownH3',   s:n9, '', 'bold')
call s:hi('markdownH4',   s:n9, '', 'bold')
call s:hi('markdownH5',   s:n9, '', 'bold')
call s:hi('markdownH6',   s:n9, '', 'bold')
call s:hi('markdownCode', s:n14, '', '')
call s:hi('markdownUrl',  s:n10, '', 'underline')
call s:hi('markdownLinkText', s:n8, '', '')
call s:hi('helpHyperTextJump', s:n10, '', 'underline')
call s:hi('helpHyperTextEntry', s:n8, '', '')

" ---- :terminal -----------------------------------------------------------
" the same 16 colors as the Foxberry Ghostty / kitty themes
let g:terminal_ansi_colors = [
  \ '#3B4252', '#BE525A', '#4E8044', '#967044',
  \ '#5374B3', '#986393', '#287F92', '#6A7488',
  \ '#4C566A', '#DA656D', '#619756', '#AD8455',
  \ '#658ACD', '#B077AB', '#489784', '#8E97A8',
  \ ]
if has('nvim')
  for s:i in range(16)
    let g:['terminal_color_' . s:i] = g:terminal_ansi_colors[s:i]
  endfor
  unlet s:i
endif
