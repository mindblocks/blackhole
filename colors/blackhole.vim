"
" -----------------------------------------------------------------------------
" Name: blackhole
" File: blackhole.vim
" Description: blackhole color scheme for vim, neovim
" Author: Sajjad alDalwachee
" License: MIT
" Version: 1.0.0
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='blackhole'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:blackhole_bold')
  let g:blackhole_bold=1
endif
if !exists('g:blackhole_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:blackhole_italic=1
  else
    let g:blackhole_italic=0
  endif
endif
if !exists('g:blackhole_undercurl')
  let g:blackhole_undercurl=1
endif
if !exists('g:blackhole_underline')
  let g:blackhole_underline=1
endif
if !exists('g:blackhole_inverse')
  let g:blackhole_inverse=1
endif

if !exists('g:blackhole_guisp_fallback') || index(['fg', 'bg'], g:blackhole_guisp_fallback) == -1
  let g:blackhole_guisp_fallback='NONE'
endif

if !exists('g:blackhole_improved_strings')
  let g:blackhole_improved_strings=0
endif

if !exists('g:blackhole_improved_warnings')
  let g:blackhole_improved_warnings=0
endif

if !exists('g:blackhole_termcolors')
  let g:blackhole_termcolors=256
endif

if !exists('g:blackhole_invert_indent_guides')
  let g:blackhole_invert_indent_guides=0
endif

if exists('g:blackhole_contrast')
  echo 'g:blackhole_contrast is deprecated; use g:blackhole_contrast_light and g:blackhole_contrast_dark instead'
endif

if !exists('g:blackhole_contrast_dark')
  let g:blackhole_contrast_dark='medium'
endif

if !exists('g:blackhole_contrast_light')
  let g:blackhole_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:color = {}

" fill it with absolute colors
let s:color.black       = ['#000000', 234]     " 29-32-33
let s:color.white       = ['#F3F3F3', 234]     " 29-32-33

let s:color.dark0_hard  = ['#000000', 234]     " 29-32-33
let s:color.dark0       = ['#101010', 235]     " 40-40-40
let s:color.dark0_soft  = ['#202020', 236]     " 50-48-47
let s:color.dark1       = ['#303030', 237]     " 60-56-54
let s:color.dark2       = ['#404040', 239]     " 80-73-69
let s:color.dark3       = ['#505050', 241]     " 102-92-84
let s:color.dark4       = ['#606060', 243]     " 124-111-100
let s:color.dark4_256   = ['#707070', 243]     " 124-111-100

let s:color.gray_245    = ['#928374', 245]     " 146-131-116
let s:color.gray_244    = ['#928374', 244]     " 146-131-116

let s:color.light0_hard = ['#f9f5d7', 230]     " 249-245-215
let s:color.light0      = ['#fbf1c7', 229]     " 253-244-193
let s:color.light0_soft = ['#f2e5bc', 228]     " 242-229-188
let s:color.light1      = ['#ebdbb2', 223]     " 235-219-178
let s:color.light2      = ['#d5c4a1', 250]     " 213-196-161
let s:color.light3      = ['#bdae93', 248]     " 189-174-147
let s:color.light4      = ['#a89984', 246]     " 168-153-132
let s:color.light4_256  = ['#a89984', 246]     " 168-153-132

let s:color.bright_red     = ['#e8364b', 167]     " 251-73-52
let s:color.bright_green   = ['#12a600', 142]     " 184-187-38
let s:color.bright_yellow  = ['#f6dd36', 214]     " 250-189-47
let s:color.bright_blue    = ['#4ab3e5', 109]     " 131-165-152
let s:color.bright_purple  = ['#b886dd', 175]     " 211-134-155
let s:color.bright_aqua    = ['#00dfff', 108]     " 142-192-124
let s:color.bright_orange  = ['#fe8019', 208]     " 254-128-25

let s:color.neutral_red    = ['#cc241d', 124]     " 204-36-29
let s:color.neutral_green  = ['#98971a', 106]     " 152-151-26
let s:color.neutral_yellow = ['#d79921', 172]     " 215-153-33
let s:color.neutral_blue   = ['#458588', 66]      " 69-133-136
let s:color.neutral_purple = ['#b16286', 132]     " 177-98-134
let s:color.neutral_aqua   = ['#689d6a', 72]      " 104-157-106
let s:color.neutral_orange = ['#d65d0e', 166]     " 214-93-14

let s:color.faded_red      = ['#9d0006', 88]      " 157-0-6
let s:color.faded_green    = ['#79740e', 100]     " 121-116-14
let s:color.faded_yellow   = ['#b57614', 136]     " 181-118-20
let s:color.faded_blue     = ['#076678', 24]      " 7-102-120
let s:color.faded_purple   = ['#8f3f71', 96]      " 143-63-113
let s:color.faded_aqua     = ['#427b58', 66]      " 66-123-88
let s:color.faded_orange   = ['#af3a03', 130]     " 175-58-3

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:blackhole_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:blackhole_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:blackhole_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:blackhole_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:blackhole_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:color.dark0_hard
  if g:blackhole_contrast_dark == 'soft'
    let s:bg0  = s:color.dark0_soft
  elseif g:blackhole_contrast_dark == 'hard'
    let s:bg0  = s:color.dark0_hard
  endif

  let s:bg1  = s:color.dark0
  let s:bg2  = s:color.dark2
  let s:bg3  = s:color.dark3
  let s:bg4  = s:color.dark4

  let s:gray = s:color.gray_245

  let s:fg0 = s:color.light0
  let s:fg1 = s:color.light1
  let s:fg2 = s:color.light2
  let s:fg3 = s:color.light3
  let s:fg4 = s:color.light4

  let s:fg4_256 = s:color.light4_256

  let s:black  = s:color.black
  let s:white  = s:color.white
  let s:red    = s:color.bright_red
  let s:green  = s:color.bright_green
  let s:yellow = s:color.bright_yellow
  let s:blue   = s:color.bright_blue
  let s:purple = s:color.bright_purple
  let s:aqua   = s:color.bright_aqua
  let s:orange = s:color.bright_orange
else
  let s:bg0  = s:color.light0
  if g:blackhole_contrast_light == 'soft'
    let s:bg0  = s:color.light0_soft
  elseif g:blackhole_contrast_light == 'hard'
    let s:bg0  = s:color.light0_hard
  endif

  let s:bg1  = s:color.light1
  let s:bg2  = s:color.light2
  let s:bg3  = s:color.light3
  let s:bg4  = s:color.light4

  let s:gray = s:color.gray_244

  let s:fg0 = s:color.dark0
  let s:fg1 = s:color.dark1
  let s:fg2 = s:color.dark2
  let s:fg3 = s:color.dark3
  let s:fg4 = s:color.dark4

  let s:fg4_256 = s:color.dark4_256

  let s:black  = s:color.black
  let s:white  = s:color.white
  let s:red    = s:color.faded_red
  let s:green  = s:color.faded_green
  let s:yellow = s:color.faded_yellow
  let s:blue   = s:color.faded_blue
  let s:purple = s:color.faded_purple
  let s:aqua   = s:color.faded_aqua
  let s:orange = s:color.faded_orange
endif

" reset to 16 colors fallback
if g:blackhole_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:color.bg0 = s:bg0
let s:color.bg1 = s:bg1
let s:color.bg2 = s:bg2
let s:color.bg3 = s:bg3
let s:color.bg4 = s:bg4

let s:color.gray = s:gray

let s:color.fg0 = s:fg0
let s:color.fg1 = s:fg1
let s:color.fg2 = s:fg2
let s:color.fg3 = s:fg3
let s:color.fg4 = s:fg4

let s:color.fg4_256 = s:fg4_256

let s:color.black  = s:black
let s:color.white  = s:white
let s:color.red    = s:red
let s:color.green  = s:green
let s:color.yellow = s:yellow
let s:color.blue   = s:blue
let s:color.purple = s:purple
let s:color.aqua   = s:aqua
let s:color.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:color.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:color.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:color.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:color.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:color.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:color.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:blackhole_hls_cursor')
  let s:hls_cursor = get(s:color, g:blackhole_hls_cursor)
endif

let s:number_column = s:none
if exists('g:blackhole_number_column')
  let s:number_column = get(s:color, g:blackhole_number_column)
endif

let s:sign_column = s:bg0

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:blackhole_sign_column')
    let s:sign_column = get(s:color, g:blackhole_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:blackhole_color_column')
  let s:color_column = get(s:color, g:blackhole_color_column)
endif

let s:vert_split = s:bg0
if exists('g:blackhole_vert_split')
  let s:vert_split = get(s:color, g:blackhole_vert_split)
endif

let s:invert_signs = ''
if exists('g:blackhole_invert_signs')
  if g:blackhole_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:blackhole_invert_selection')
  if g:blackhole_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:blackhole_invert_tabline')
  if g:blackhole_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:blackhole_italicize_comments')
  if g:blackhole_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:blackhole_italicize_strings')
  if g:blackhole_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HighLight(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:blackhole_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:blackhole_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" Blackhole Hi Groups: {{{

" memoize common hi groups
call s:HighLight('BlackholeFg0', s:fg0)
call s:HighLight('BlackholeFg1', s:fg1)
call s:HighLight('BlackholeFg2', s:fg2)
call s:HighLight('BlackholeFg3', s:fg3)
call s:HighLight('BlackholeFg4', s:fg4)
call s:HighLight('BlackholeBg0', s:bg0)
call s:HighLight('BlackholeBg1', s:bg1)
call s:HighLight('BlackholeBg2', s:bg2)
call s:HighLight('BlackholeBg3', s:bg3)
call s:HighLight('BlackholeBg4', s:bg4)

call s:HighLight('BlackholeBlack', s:black)
call s:HighLight('BlackholeBlackBold', s:black, s:none, s:bold)
call s:HighLight('BlackholeGray', s:gray)
call s:HighLight('BlackholeGrayBold', s:gray, s:none, s:bold)
call s:HighLight('BlackholeWhite', s:white)
call s:HighLight('BlackholeWhiteBold', s:white, s:none, s:bold)
call s:HighLight('BlackholeRed', s:red)
call s:HighLight('BlackholeRedBold', s:red, s:none, s:bold)
call s:HighLight('BlackholeGreen', s:green)
call s:HighLight('BlackholeGreenBold', s:green, s:none, s:bold)
call s:HighLight('BlackholeYellow', s:yellow)
call s:HighLight('BlackholeYellowBold', s:yellow, s:none, s:bold)
call s:HighLight('BlackholeBlue', s:blue)
call s:HighLight('BlackholeBlueBold', s:blue, s:none, s:bold)
call s:HighLight('BlackholePurple', s:purple)
call s:HighLight('BlackholePurpleBold', s:purple, s:none, s:bold)
call s:HighLight('BlackholeAqua', s:aqua)
call s:HighLight('BlackholeAquaBold', s:aqua, s:none, s:bold)
call s:HighLight('BlackholeOrange', s:orange)
call s:HighLight('BlackholeOrangeBold', s:orange, s:none, s:bold)

call s:HighLight('BlackholeRedSign', s:red, s:sign_column, s:invert_signs)
call s:HighLight('BlackholeGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HighLight('BlackholeYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HighLight('BlackholeBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HighLight('BlackholePurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HighLight('BlackholeAquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HighLight('BlackholeOrangeSign', s:orange, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HighLight('Normal', s:fg1, s:black)

if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HighLight('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HighLight('TabLineFill', s:gray, s:none, s:invert_tabline)
  " Active tab page label
  call s:HighLight('TabLineSel', s:blue, s:none, s:bold)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HighLight('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HighLight('ColorColumn',  s:none, s:none)

  " Concealed element: \lambda → λ
  call s:HighLight('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HighLight('CursorLineNr', s:red, s:bg1, s:bold)
endif

hi! link NonText BlackholeBg2
hi! link SpecialKey BlackholeBg2

call s:HighLight('Visual',    s:none,  s:bg2, s:bold)
hi! link VisualNOS Visual

call s:HighLight('Search',    s:yellow, s:bg0, s:inverse)
call s:HighLight('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HighLight('Underlined', s:blue, s:none, s:underline)

call s:HighLight('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HighLight('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HighLight('VertSplit', s:bg1, s:vert_split)

" Current match in wildmenu completion
call s:HighLight('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory BlackholeGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title BlackholeGreenBold

" Error messages on the command line
call s:HighLight('ErrorMsg',   s:red, s:none, s:undercurl)
" More prompt: -- More --
hi! link MoreMsg BlackholeRedBold
" Current mode message: -- INSERT --
hi! link ModeMsg BlackholeWhiteBold
" 'Press enter' prompt and yes/no questions
hi! link Question BlackholeOrange
" Warning messages
hi! link WarningMsg BlackholeYellow

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HighLight('LineNr', s:gray, s:none)

" Column where signs are displayed
call s:HighLight('SignColumn', s:none, s:none)

" Line used for closed folds
call s:HighLight('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HighLight('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HighLight('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:blackhole_improved_strings == 0
  hi! link Special BlackholeOrange
else
  call s:HighLight('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HighLight('Comment', s:gray, s:none, s:italicize_comments)
call s:HighLight('Todo', s:gray, s:none, s:bold . s:italic)
call s:HighLight('Error', s:red, s:none, s:bold . s:inverse)

" Generic statement
hi! link Statement BlackholeRedBold
" if, then, else, endif, swicth, etc.
hi! link Conditional BlackholeRedBold
" for, do, while, etc.
hi! link Repeat BlackholeRedBold
" case, default, etc.
hi! link Label BlackholeRedBold
" try, catch, throw
hi! link Exception BlackholeRedBold
" sizeof, "+", "*", etc.
hi! link Operator BlackholeOrange
" Any other keyword
hi! link Keyword BlackholeRed

" Variable name
hi! link Identifier BlackholeBlue
" Function name
hi! link Function BlackholeWhiteBold

" Generic preprocessor
hi! link PreProc BlackholeBlue
" Preprocessor #include
hi! link Include BlackholePurple
" Preprocessor #define
hi! link Define BlackholeAqua
" Same as Define
hi! link Macro BlackholeAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit BlackholeAqua

" Generic constant
hi! link Constant BlackholePurple
" Character constant: 'c', '/n'
hi! link Character BlackholePurpleBold
" String constant: "this is a string"
if g:blackhole_improved_strings == 0
  call s:HighLight('String',  s:green, s:none, s:italicize_strings)
else
  call s:HighLight('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean BlackholePurple
" Number constant: 234, 0xff
hi! link Number BlackholePurple
" Floating point constant: 2.3e10
hi! link Float BlackholePurple

" Generic type
hi! link Type BlackholeWhiteBold
" static, register, volatile, etc
hi! link StorageClass BlackholeOrange
" struct, union, enum, etc.
hi! link Structure BlackholeAqua
" typedef
hi! link Typedef BlackholeYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HighLight('Pmenu', s:fg0, s:bg1)
  " Popup menu: selected item
  call s:HighLight('PmenuSel', s:black, s:aqua, s:bold)
  " Popup menu: scrollbar
  call s:HighLight('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HighLight('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HighLight('DiffDelete', s:red, s:bg0, s:inverse)
call s:HighLight('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HighLight('DiffChange', s:bg0, s:blue)
"call s:HighLight('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HighLight('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HighLight('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:blackhole_improved_warnings == 0
    call s:HighLight('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HighLight('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HighLight('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HighLight('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HighLight('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:blackhole_invert_indent_guides == 0
    call s:HighLight('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HighLight('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HighLight('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HighLight('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd BlackholeGreenSign
hi! link GitGutterChange BlackholeAquaSign
hi! link GitGutterDelete BlackholeRedSign
hi! link GitGutterChangeDelete BlackholeAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitBlank BlackholeRedBold
hi! link gitcommitBranch BlackholeAquaBold
hi! link gitcommitDiscardedFile BlackholeRed
hi! link gitcommitDiscardedType BlackholeRedBold
hi! link gitcommitHeader BlackholeFg0
hi! link gitcommitSelectedFile BlackholeGreen
hi! link gitcommitSelectedType BlackholeGreenBold
hi! link gitcommitSummary BlackholeAqua

" }}}
" Signify: {{{

hi! link SignifySignAdd BlackholeGreenSign
hi! link SignifySignChange BlackholeAquaSign
hi! link SignifySignDelete BlackholeRedSign

" }}}
" Syntastic: {{{

call s:HighLight('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HighLight('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign BlackholeRedSign
hi! link SyntasticWarningSign BlackholeYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   BlackholeBlueSign
hi! link SignatureMarkerText BlackholePurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHighLightl BlackholeBlueSign
hi! link ShowMarksHighLightu BlackholeBlueSign
hi! link ShowMarksHighLighto BlackholeBlueSign
hi! link ShowMarksHighLightm BlackholeBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch BlackholeYellow
hi! link CtrlPNoEntries BlackholeRed
hi! link CtrlPPrtBase BlackholeBg2
hi! link CtrlPPrtCursor BlackholeBlue
hi! link CtrlPLinePre BlackholeBg2

call s:HighLight('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HighLight('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HighLight('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket BlackholeFg3
hi! link StartifyFile BlackholeFg1
hi! link StartifyNumber BlackholeBlue
hi! link StartifyPath BlackholeGray
hi! link StartifySlash BlackholeGray
hi! link StartifySection BlackholeYellow
hi! link StartifySpecial BlackholeBg2
hi! link StartifyHeader BlackholeOrange
hi! link StartifyFooter BlackholeBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HighLight('BufTabLineCurrent', s:bg0, s:fg4)
call s:HighLight('BufTabLineActive', s:fg4, s:bg2)
call s:HighLight('BufTabLineHidden', s:bg4, s:bg1)
call s:HighLight('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HighLight('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HighLight('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HighLight('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign BlackholeRedSign
hi! link ALEWarningSign BlackholeYellowSign
hi! link ALEInfoSign BlackholeBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail BlackholeAqua
hi! link DirvishArg BlackholeYellow

" }}}
" Netrw: {{{

hi! link netrwDir BlackholeAqua
hi! link netrwClassify BlackholeAqua
hi! link netrwLink BlackholeGray
hi! link netrwSymLink BlackholeFg1
hi! link netrwExe BlackholeYellow
hi! link netrwComment BlackholeGray
hi! link netrwList BlackholeBlue
hi! link netrwHelpCmd BlackholeAqua
hi! link netrwCmdSep BlackholeFg3
hi! link netrwVersion BlackholeGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir BlackholeGrayBold
hi! link NERDTreeDirSlash BlackholeWhite
hi! link NERDTreeFlags BlackholeGray

hi! link NERDTreeOpenable BlackholeFg3
hi! link NERDTreeClosable BlackholeOrange

hi! link NERDTreeFile BlackholeFg1
hi! link NERDTreeExecFile BlackholeGreen

hi! link NERDTreeUp BlackholeGray
hi! link NERDTreeCWD BlackholeGreen
hi! link NERDTreeHelp BlackholeFg1

hi! link NERDTreeToggleOn BlackholeGreen
hi! link NERDTreeToggleOff BlackholeRed

" }}}
" Vim Multiple Cursors: {{{

call s:HighLight('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HighLight('multiple_cursors_visual', s:none, s:bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign BlackholeRedSign
hi! link CocWarningSign BlackholeOrangeSign
hi! link CocInfoSign BlackholeYellowSign
hi! link CocHintSign BlackholeBlueSign
hi! link CocErrorFloat BlackholeRed
hi! link CocWarningFloat BlackholeOrange
hi! link CocInfoFloat BlackholeYellow
hi! link CocHintFloat BlackholeBlue
hi! link CocDiagnosticsError BlackholeRed
hi! link CocDiagnosticsWarning BlackholeOrange
hi! link CocDiagnosticsInfo BlackholeYellow
hi! link CocDiagnosticsHint BlackholeBlue

hi! link CocSelectedText BlackholeRed
hi! link CocCodeLens BlackholeGray

call s:HighLight('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HighLight('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HighLight('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HighLight('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded BlackholeGreen
hi! link diffRemoved BlackholeRed
hi! link diffChanged BlackholeAqua

hi! link diffFile BlackholeOrange
hi! link diffNewFile BlackholeYellow

hi! link diffLine BlackholeBlue

" }}}
" Html: {{{

hi! link htmlTag BlackholeBlue
hi! link htmlEndTag BlackholeBlue

hi! link htmlTagName BlackholeAquaBold
hi! link htmlArg BlackholeAqua

hi! link htmlScriptTag BlackholePurple
hi! link htmlTagN BlackholeFg1
hi! link htmlSpecialTagName BlackholeAquaBold

call s:HighLight('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar BlackholeOrange

call s:HighLight('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HighLight('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HighLight('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HighLight('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HighLight('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HighLight('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HighLight('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag BlackholeBlue
hi! link xmlEndTag BlackholeBlue
hi! link xmlTagName BlackholeBlue
hi! link xmlEqual BlackholeBlue
hi! link docbkKeyword BlackholeAquaBold

hi! link xmlDocTypeDecl BlackholeGray
hi! link xmlDocTypeKeyword BlackholePurple
hi! link xmlCdataStart BlackholeGray
hi! link xmlCdataCdata BlackholePurple
hi! link dtdFunction BlackholeGray
hi! link dtdTagName BlackholePurple

hi! link xmlAttrib BlackholeAqua
hi! link xmlProcessingDelim BlackholeGray
hi! link dtdParamEntityPunct BlackholeGray
hi! link dtdParamEntityDPunct BlackholeGray
hi! link xmlAttribPunct BlackholeGray

hi! link xmlEntity BlackholeOrange
hi! link xmlEntityPunct BlackholeOrange
" }}}
" Vim: {{{

call s:HighLight('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation BlackholeOrange
hi! link vimBracket BlackholeOrange
hi! link vimMapModKey BlackholeOrange
hi! link vimFuncSID BlackholeFg3
hi! link vimSetSep BlackholeFg3
hi! link vimSep BlackholeFg3
hi! link vimContinue BlackholeFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword BlackholeBlue
hi! link clojureCond BlackholeOrange
hi! link clojureSpecial BlackholeOrange
hi! link clojureDefine BlackholeOrange

hi! link clojureFunc BlackholeYellow
hi! link clojureRepeat BlackholeYellow
hi! link clojureCharacter BlackholeAqua
hi! link clojureStringEscape BlackholeAqua
hi! link clojureException BlackholeRed

hi! link clojureRegexp BlackholeAqua
hi! link clojureRegexpEscape BlackholeAqua
call s:HighLight('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen BlackholeFg3
hi! link clojureAnonArg BlackholeYellow
hi! link clojureVariable BlackholeBlue
hi! link clojureMacro BlackholeOrange

hi! link clojureMeta BlackholeYellow
hi! link clojureDeref BlackholeYellow
hi! link clojureQuote BlackholeYellow
hi! link clojureUnquote BlackholeYellow

" }}}
" C: {{{

hi! link cOperator BlackholePurple
hi! link cStructure BlackholeOrange

" }}}
" Python: {{{

hi! link pythonBuiltin BlackholeOrangeBold
hi! link pythonBuiltinObj BlackholeOrange
hi! link pythonBuiltinFunc BlackholeOrange
hi! link pythonFunction BlackholeWhiteBold
hi! link pythonStatement BlackholeAquaBold
hi! link pythonDecorator BlackholeRedBold
hi! link pythonInclude BlackholeBlue
hi! link pythonImport BlackholeBlue
hi! link pythonRun BlackholeBlue
hi! link pythonCoding BlackholeBlue
hi! link pythonOperator BlackholeRedBold
hi! link pythonException BlackholeRed
hi! link pythonExceptions BlackholePurple
hi! link pythonBoolean BlackholePurple
hi! link pythonDot BlackholeOrange
hi! link pythonConditional BlackholeRedBold
hi! link pythonRepeat BlackholeRedBold
hi! link pythonDottedName BlackholeGreenBold

" }}}
" CSS: {{{

hi! link cssBraces BlackholeBlue
hi! link cssFunctionName BlackholeYellow
hi! link cssIdentifier BlackholeOrange
hi! link cssClassName BlackholeGreen
hi! link cssColor BlackholeBlue
hi! link cssSelectorOp BlackholeBlue
hi! link cssSelectorOp2 BlackholeBlue
hi! link cssImportant BlackholeGreen
hi! link cssVendor BlackholeFg1

hi! link cssTextProp BlackholeAqua
hi! link cssAnimationProp BlackholeAqua
hi! link cssUIProp BlackholeYellow
hi! link cssTransformProp BlackholeAqua
hi! link cssTransitionProp BlackholeAqua
hi! link cssPrintProp BlackholeAqua
hi! link cssPositioningProp BlackholeYellow
hi! link cssBoxProp BlackholeAqua
hi! link cssFontDescriptorProp BlackholeAqua
hi! link cssFlexibleBoxProp BlackholeAqua
hi! link cssBorderOutlineProp BlackholeAqua
hi! link cssBackgroundProp BlackholeAqua
hi! link cssMarginProp BlackholeAqua
hi! link cssListProp BlackholeAqua
hi! link cssTableProp BlackholeAqua
hi! link cssFontProp BlackholeAqua
hi! link cssPaddingProp BlackholeAqua
hi! link cssDimensionProp BlackholeAqua
hi! link cssRenderProp BlackholeAqua
hi! link cssColorProp BlackholeAqua
hi! link cssGeneratedContentProp BlackholeAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces BlackholeFg1
hi! link javaScriptFunction BlackholeAqua
hi! link javaScriptIdentifier BlackholeRed
hi! link javaScriptMember BlackholeBlue
hi! link javaScriptNumber BlackholePurple
hi! link javaScriptNull BlackholePurple
hi! link javaScriptParens BlackholeFg3

" }}}
" YAJS: {{{

hi! link javascriptImport BlackholeAqua
hi! link javascriptExport BlackholeAqua
hi! link javascriptClassKeyword BlackholeAqua
hi! link javascriptClassExtends BlackholeAqua
hi! link javascriptDefault BlackholeAqua

hi! link javascriptClassName BlackholeYellow
hi! link javascriptClassSuperName BlackholeYellow
hi! link javascriptGlobal BlackholeYellow

hi! link javascriptEndColons BlackholeFg1
hi! link javascriptFuncArg BlackholeFg1
hi! link javascriptGlobalMethod BlackholeFg1
hi! link javascriptNodeGlobal BlackholeFg1
hi! link javascriptBOMWindowProp BlackholeFg1
hi! link javascriptArrayMethod BlackholeFg1
hi! link javascriptArrayStaticMethod BlackholeFg1
hi! link javascriptCacheMethod BlackholeFg1
hi! link javascriptDateMethod BlackholeFg1
hi! link javascriptMathStaticMethod BlackholeFg1

" hi! link javascriptProp BlackholeFg1
hi! link javascriptURLUtilsProp BlackholeFg1
hi! link javascriptBOMNavigatorProp BlackholeFg1
hi! link javascriptDOMDocMethod BlackholeFg1
hi! link javascriptDOMDocProp BlackholeFg1
hi! link javascriptBOMLocationMethod BlackholeFg1
hi! link javascriptBOMWindowMethod BlackholeFg1
hi! link javascriptStringMethod BlackholeFg1

hi! link javascriptVariable BlackholeOrange
" hi! link javascriptVariable BlackholeRed
" hi! link javascriptIdentifier BlackholeOrange
" hi! link javascriptClassSuper BlackholeOrange
hi! link javascriptIdentifier BlackholeOrange
hi! link javascriptClassSuper BlackholeOrange

" hi! link javascriptFuncKeyword BlackholeOrange
" hi! link javascriptAsyncFunc BlackholeOrange
hi! link javascriptFuncKeyword BlackholeAqua
hi! link javascriptAsyncFunc BlackholeAqua
hi! link javascriptClassStatic BlackholeOrange

hi! link javascriptOperator BlackholeRed
hi! link javascriptForOperator BlackholeRed
hi! link javascriptYield BlackholeRed
hi! link javascriptExceptions BlackholeRed
hi! link javascriptMessage BlackholeRed

hi! link javascriptTemplateSB BlackholeAqua
hi! link javascriptTemplateSubstitution BlackholeFg1

" hi! link javascriptLabel BlackholeBlue
" hi! link javascriptObjectLabel BlackholeBlue
" hi! link javascriptPropertyName BlackholeBlue
hi! link javascriptLabel BlackholeFg1
hi! link javascriptObjectLabel BlackholeFg1
hi! link javascriptPropertyName BlackholeFg1

hi! link javascriptLogicSymbols BlackholeFg1
hi! link javascriptArrowFunc BlackholeYellow

hi! link javascriptDocParamName BlackholeFg4
hi! link javascriptDocTags BlackholeFg4
hi! link javascriptDocNotation BlackholeFg4
hi! link javascriptDocParamType BlackholeFg4
hi! link javascriptDocNamedParamType BlackholeFg4

hi! link javascriptBrackets BlackholeFg1
hi! link javascriptDOMElemAttrs BlackholeFg1
hi! link javascriptDOMEventMethod BlackholeFg1
hi! link javascriptDOMNodeMethod BlackholeFg1
hi! link javascriptDOMStorageMethod BlackholeFg1
hi! link javascriptHeadersMethod BlackholeFg1

hi! link javascriptAsyncFuncKeyword BlackholeRed
hi! link javascriptAwaitFuncKeyword BlackholeRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword BlackholeAqua
hi! link jsExtendsKeyword BlackholeAqua
hi! link jsExportDefault BlackholeAqua
hi! link jsTemplateBraces BlackholeAqua
hi! link jsGlobalNodeObjects BlackholeFg1
hi! link jsGlobalObjects BlackholeFg1
hi! link jsFunction BlackholeAqua
hi! link jsFuncParens BlackholeFg3
hi! link jsParens BlackholeFg3
hi! link jsNull BlackholePurple
hi! link jsUndefined BlackholePurple
hi! link jsClassDefinition BlackholeYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved BlackholeAqua
hi! link typeScriptLabel BlackholeAqua
hi! link typeScriptFuncKeyword BlackholeAqua
hi! link typeScriptIdentifier BlackholeOrange
hi! link typeScriptBraces BlackholeFg1
hi! link typeScriptEndColons BlackholeFg1
hi! link typeScriptDOMObjects BlackholeFg1
hi! link typeScriptAjaxMethods BlackholeFg1
hi! link typeScriptLogicSymbols BlackholeFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects BlackholeFg1
hi! link typeScriptParens BlackholeFg3
hi! link typeScriptOpSymbols BlackholeFg3
hi! link typeScriptHtmlElemProperties BlackholeFg1
hi! link typeScriptNull BlackholePurple
hi! link typeScriptInterpolationDelimiter BlackholeAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword BlackholeAqua
hi! link purescriptModuleName BlackholeFg1
hi! link purescriptWhere BlackholeAqua
hi! link purescriptDelimiter BlackholeFg4
hi! link purescriptType BlackholeFg1
hi! link purescriptImportKeyword BlackholeAqua
hi! link purescriptHidingKeyword BlackholeAqua
hi! link purescriptAsKeyword BlackholeAqua
hi! link purescriptStructure BlackholeAqua
hi! link purescriptOperator BlackholeBlue

hi! link purescriptTypeVar BlackholeFg1
hi! link purescriptConstructor BlackholeFg1
hi! link purescriptFunction BlackholeFg1
hi! link purescriptConditional BlackholeOrange
hi! link purescriptBacktick BlackholeOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp BlackholeFg3
hi! link coffeeSpecialOp BlackholeFg3
hi! link coffeeCurly BlackholeOrange
hi! link coffeeParen BlackholeFg3
hi! link coffeeBracket BlackholeOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter BlackholeGreen
hi! link rubyInterpolationDelimiter BlackholeAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier BlackholeRed
hi! link objcDirective BlackholeBlue

" }}}
" Go: {{{

hi! link goDirective BlackholeAqua
hi! link goConstants BlackholePurple
hi! link goDeclaration BlackholeRed
hi! link goDeclType BlackholeBlue
hi! link goBuiltins BlackholeOrange

" }}}
" Lua: {{{

hi! link luaIn BlackholeRed
hi! link luaFunction BlackholeAqua
hi! link luaTable BlackholeOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp BlackholeFg3
hi! link moonExtendedOp BlackholeFg3
hi! link moonFunction BlackholeFg3
hi! link moonObject BlackholeYellow

" }}}
" Java: {{{

hi! link javaAnnotation BlackholeBlue
hi! link javaDocTags BlackholeAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen BlackholeFg3
hi! link javaParen1 BlackholeFg3
hi! link javaParen2 BlackholeFg3
hi! link javaParen3 BlackholeFg3
hi! link javaParen4 BlackholeFg3
hi! link javaParen5 BlackholeFg3
hi! link javaOperator BlackholeOrange

hi! link javaVarArg BlackholeGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter BlackholeGreen
hi! link elixirInterpolationDelimiter BlackholeAqua

hi! link elixirModuleDeclaration BlackholeYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition BlackholeFg1
hi! link scalaCaseFollowing BlackholeFg1
hi! link scalaCapitalWord BlackholeFg1
hi! link scalaTypeExtension BlackholeFg1

hi! link scalaKeyword BlackholeRed
hi! link scalaKeywordModifier BlackholeRed

hi! link scalaSpecial BlackholeAqua
hi! link scalaOperator BlackholeFg1

hi! link scalaTypeDeclaration BlackholeYellow
hi! link scalaTypeTypePostDeclaration BlackholeYellow

hi! link scalaInstanceDeclaration BlackholeFg1
hi! link scalaInterpolation BlackholeAqua

" }}}
" Markdown: {{{

call s:HighLight('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 BlackholeGreenBold
hi! link markdownH2 BlackholeGreenBold
hi! link markdownH3 BlackholeYellowBold
hi! link markdownH4 BlackholeYellowBold
hi! link markdownH5 BlackholeYellow
hi! link markdownH6 BlackholeYellow

hi! link markdownCode BlackholeAqua
hi! link markdownCodeBlock BlackholeAqua
hi! link markdownCodeDelimiter BlackholeAqua

hi! link markdownBlockquote BlackholeGray
hi! link markdownListMarker BlackholeGray
hi! link markdownOrderedListMarker BlackholeGray
hi! link markdownRule BlackholeGray
hi! link markdownHeadingRule BlackholeGray

hi! link markdownUrlDelimiter BlackholeFg3
hi! link markdownLinkDelimiter BlackholeFg3
hi! link markdownLinkTextDelimiter BlackholeFg3

hi! link markdownHeadingDelimiter BlackholeOrange
hi! link markdownUrl BlackholePurple
hi! link markdownUrlTitleDelimiter BlackholeGreen

call s:HighLight('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType BlackholeYellow
" hi! link haskellOperators BlackholeOrange
" hi! link haskellConditional BlackholeAqua
" hi! link haskellLet BlackholeOrange
"
hi! link haskellType BlackholeFg1
hi! link haskellIdentifier BlackholeFg1
hi! link haskellSeparator BlackholeFg1
hi! link haskellDelimiter BlackholeFg4
hi! link haskellOperators BlackholeBlue
"
hi! link haskellBacktick BlackholeOrange
hi! link haskellStatement BlackholeOrange
hi! link haskellConditional BlackholeOrange

hi! link haskellLet BlackholeAqua
hi! link haskellDefault BlackholeAqua
hi! link haskellWhere BlackholeAqua
hi! link haskellBottom BlackholeAqua
hi! link haskellBlockKeywords BlackholeAqua
hi! link haskellImportKeywords BlackholeAqua
hi! link haskellDeclKeyword BlackholeAqua
hi! link haskellDeriving BlackholeAqua
hi! link haskellAssocType BlackholeAqua

hi! link haskellNumber BlackholePurple
hi! link haskellPragma BlackholePurple

hi! link haskellString BlackholeGreen
hi! link haskellChar BlackholeGreen

" }}}
" Json: {{{

hi! link jsonKeyword BlackholeGreen
hi! link jsonQuote BlackholeGreen
hi! link jsonBraces BlackholeFg1
hi! link jsonString BlackholeFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! BlackholeHlsShowCursor()
  call s:HighLight('Cursor', s:bg0, s:hls_cursor)
endfunction

function! BlackholeHlsHideCursor()
  call s:HighLight('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:

