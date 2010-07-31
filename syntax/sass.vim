" Vim syntax file
" Language:	Sass
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Filenames:	*.sass
" Last Change:	2010 Jul 28

if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim

syn case ignore

syn cluster sassCssProperties contains=cssFontProp,cssFontDescriptorProp,cssColorProp,cssTextProp,cssBoxProp,cssGeneratedContentProp,cssPagingProp,cssUIProp,cssRenderProp,cssAuralProp,cssTableProp
syn cluster sassCssAttributes contains=css.*Attr,scssComment,cssValue.*,cssColor,cssURL,sassDefault,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssRenderProp

syn region sassDefinition matchgroup=cssBraces start="{" end="}" contains=TOP

syn match sassProperty "\%([{};]\s*\|^\)\@<=\%([[:alnum:]-]\|#{[^{}]*}\)\+:" contains=css.*Prop skipwhite nextgroup=sassCssAttribute contained containedin=sassDefinition
syn match sassProperty "^\s*\zs\s\%(\%([[:alnum:]-]\|#{[^{}]*}\)\+:\|:[[:alnum:]-]\+\)"hs=s+1 contains=css.*Prop skipwhite nextgroup=sassCssAttribute
syn match sassProperty "^\s*\zs\s\%(:\=[[:alnum:]-]\+\s*=\)"hs=s+1 contains=css.*Prop skipwhite nextgroup=sassCssAttribute
syn match sassCssAttribute +\%("\%([^"]\|\\"\)*"\|'\%([^']\|\\'\)*'\|#{[^{}]*}\|[^{};]\)*+ contained contains=@sassCssAttributes,sassVariable,sassFunction,sassInterpolation
syn match sassDefault "!default\>" contained
syn match sassVariable "!\%(important\>\|default\>\)\@![[:alnum:]_-]\+"
syn match sassVariable "$[[:alnum:]_-]\+"
syn match sassVariableAssignment "\%([!$][[:alnum:]_-]\+\s*\)\@<=\%(||\)\==" nextgroup=sassCssAttribute skipwhite
syn match sassVariableAssignment "\%([!$][[:alnum:]_-]\+\s*\)\@<=:" nextgroup=sassCssAttribute skipwhite

syn match sassFunction "\<\%(rgb\|rgba\|red\|green\|blue\|mix\)\>(\@=" contained
syn match sassFunction "\<\%(hsl\|hsla\|hue\|saturation\|lightness\|adjust-hue\|lighten\|darken\|saturate\|desaturate\|grayscale\|complement\)\>(\@=" contained
syn match sassFunction "\<\%(alpha\|opacity\|rgba\|opacify\|fade-in\|transparentize\|fade-out\)\>(\@=" contained
syn match sassFunction "\<\%(unquote\|quote\)\>(\@=" contained
syn match sassFunction "\<\%(percentage\|round\|ceil\|floor\|abs\)\>(\@=" contained
syn match sassFunction "\<\%(type-of\|unit\|unitless\|comparable\)\>(\@=" contained

syn region sassInterpolation matchgroup=sassInterpolationDelimiter start="#{" end="}" contains=@sassCssAttributes,sassVariable,sassFunction containedin=cssStringQ,cssStringQQ,sassProperty

syn match sassMixinName "[[:alnum:]_-]\+" contained nextgroup=sassCssAttribute
syn match sassMixin  "^="               nextgroup=sassMixinName
syn match sassMixin  "\%([{};]\s*\|^\s*\)\@<=@mixin"   nextgroup=sassMixinName skipwhite
syn match sassMixing "^\s\+\zs+"        nextgroup=sassMixinName
syn match sassMixing "\%([{};]\s*\|^\s*\)\@<=@include" nextgroup=sassMixinName skipwhite
syn match sassExtend "\%([{};]\s*\|^\s*\)\@<=@extend"

syn match sassEscape     "^\s*\zs\\"
syn match sassIdChar     "#[[:alnum:]_-]\@=" nextgroup=sassId
syn match sassId         "[[:alnum:]_-]\+" contained
syn match sassClassChar  "\.[[:alnum:]_-]\@=" nextgroup=sassClass
syn match sassClass      "[[:alnum:]_-]\+" contained
syn match sassAmpersand  "&"

" TODO: Attribute namespaces
" TODO: Arithmetic (including strings and concatenation)

syn region sassInclude start="@import" end=";\|$" contains=scssComment,cssURL,cssUnicodeEscape,cssMediaType
syn region sassDebugLine end=";\|$" matchgroup=sassDebug start="@debug\>" contains=@sassCssAttributes,sassVariable,sassFunction
syn region sassWarnLine end=";\|$" matchgroup=sassWarn start="@warn\>" contains=@sassCssAttributes,sassVariable,sassFunction
syn region sassControlLine matchgroup=sassControl start="@\%(if\|else\%(\s\+if\)\=\|while\|for\)\>" end="[{};]\@=\|$" contains=sassFor,@sassCssAttributes,sassVariable,sassFunction
syn keyword sassFor from to through contained

syn keyword sassTodo        FIXME NOTE TODO OPTIMIZE XXX contained
syn region  sassComment     start="^\z(\s*\)//"  end="^\%(\z1 \)\@!" contains=sassTodo,@Spell
syn region  sassCssComment  start="^\z(\s*\)/\*" end="^\%(\z1 \)\@!" contains=sassTodo,@Spell

hi def link sassCssComment              sassComment
hi def link sassComment                 Comment
hi def link sassDefault                 cssImportant
hi def link sassVariable                Identifier
hi def link sassFunction                Function
hi def link sassMixing                  PreProc
hi def link sassMixin                   PreProc
hi def link sassExtend                  PreProc
hi def link sassTodo                    Todo
hi def link sassInclude                 Include
hi def link sassDebug                   sassControl
hi def link sassWarn                    sassControl
hi def link sassControl                 PreProc
hi def link sassFor                     PreProc
hi def link sassEscape                  Special
hi def link sassIdChar                  Special
hi def link sassClassChar               Special
hi def link sassInterpolationDelimiter  Delimiter
hi def link sassAmpersand               Character
hi def link sassId                      Identifier
hi def link sassClass                   Type

let b:current_syntax = "sass"

" vim:set sw=2:
