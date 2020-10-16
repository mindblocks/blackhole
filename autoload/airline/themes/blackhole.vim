
" ... blackhole.vim

" blackhole for airline

let g:airline#themes#blackhole#palette = {}

" Colors
let s:guiTS = 'NONE'
let s:ctermTS = 'NONE'

let s:gui00 = '#000000'
let s:cterm00 = 0

let s:gui01 = '#3c3836'
let s:cterm01 = 235

let s:gui02 = '#504945'
let s:cterm02 = 236

let s:gui03 = '#665c54'
let s:cterm03 = 240

let s:gui04 = '#bdae93'
let s:cterm04 = 143

let s:gui05 = '#d5c4a1'
let s:cterm05 = 187

let s:gui06 = '#ebdbb2'
let s:cterm06 = 223

let s:gui07 = '#fbf1c7'
let s:cterm07 = 230

let s:gui08 = '#dc143c'
let s:cterm08 = 161

let s:gui09 = '#fb4934'
let s:cterm09 = 203

let s:gui0A = '#ff5f00'
let s:cterm0A = 202

let s:gui0B = '#fe8019'
let s:cterm0B = 208

let s:gui0C = '#ffc300'
let s:cterm0C = 220

let s:gui0D = '#709206'
let s:cterm0D = 64

let s:gui0E = '#5fff00'
let s:cterm0E = 82

let s:gui0F = '#00dfff'
let s:cterm0F = 45

" Normal mode
let s:N1   = [ s:gui0F, s:guiTS, s:cterm0F, s:ctermTS ]
let s:N2   = [ s:gui0A, s:guiTS, s:cterm0A, s:ctermTS ]
let s:N3   = [ s:gui0D, s:guiTS, s:cterm0D, s:ctermTS ]
let g:airline#themes#blackhole#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

" Insert mode
let s:I1   = [ s:gui08, s:guiTS, s:cterm0E, s:ctermTS ]
let s:I2   = [ s:gui0A, s:guiTS, s:cterm0A, s:ctermTS ]
let s:I3   = [ s:gui0D, s:guiTS, s:cterm0D, s:ctermTS ]
let g:airline#themes#blackhole#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

" Replace mode
let s:R1   = [ s:gui04, s:guiTS, s:cterm04, s:ctermTS ]
let s:R2   = [ s:gui0A, s:guiTS, s:cterm0A, s:ctermTS ]
let s:R3   = [ s:gui0D, s:guiTS, s:cterm0D, s:ctermTS ]
let g:airline#themes#blackhole#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

" Visual mode
let s:V1   = [ s:gui0C, s:guiTS, s:cterm0C, s:ctermTS ]
let s:V2   = [ s:gui0A, s:guiTS, s:cterm0A, s:ctermTS ]
let s:V3   = [ s:gui0D, s:guiTS, s:cterm0D, s:ctermTS ]
let g:airline#themes#blackhole#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

" Inactive mode
let s:IA1   = [ s:gui04, s:guiTS, s:cterm04, s:ctermTS ]
let s:IA2   = [ s:gui04, s:guiTS, s:cterm04, s:ctermTS ]
let s:IA3   = [ s:gui04, s:guiTS, s:cterm04, s:ctermTS ]
let g:airline#themes#blackhole#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

let g:airline#themes#blackhole#palette.terminal = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#blackhole#palette.normal.airline_term = s:N3
let g:airline#themes#blackhole#palette.terminal.airline_term = s:N3
let g:airline#themes#blackhole#palette.visual.airline_term = s:N3

" CtrlP
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif

let s:CP1 = [ s:gui0F, s:guiTS, s:cterm0F, s:ctermTS ]
let s:CP2 = [ s:gui0A, s:guiTS, s:cterm0A, s:ctermTS ]
let s:CP3 = [ s:gui0D, s:guiTS, s:cterm0D, s:ctermTS ]

let g:airline#themes#blackhole#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(s:CP1, s:CP2, s:CP3)

