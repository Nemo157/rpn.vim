" Vim syntax file
" Language   : RPN
" Maintainers: Wim Looman
" Last Change: 2012-09-20

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match
syn sync minlines=50

" Identifiers
syn match rpnIdentifier "\<[^\s\[\]{}]\+\>"

" Variables
syn match rpnVariable "\<[A-Z][^\s\[\]{}]\*\>"

" Arguments
syn match rpnArgument "\<[A-Z][^\s\[\]{}]\*\>" contained

" blocks
" syn region rpnBlock start="{" end="}"
syn region rpnArgumentDefs start="\[" end="\]" contains=rpnArgument

" function definitions
syn match rpnFunctionName "\<[^\s\[\]{}]\+\>" contained
syn keyword rpnFunctionKeyword def contained
syn match rpnFunctionDefinition "\<[^\s\[\]{}]\+\>\s*def" contains=rpnFunctionName,rpnFunctionKeyword

" namespace definitions
syn match rpnNamespaceName "\<[a-z][a-zA-Z?!&|_]*\>" contained
syn keyword rpnNamespaceKeyword namespace contained
syn match rpnNamespaceDefinition "\<[a-z][a-zA-Z?!&|_]*\>\s*namespace" contains=rpnNamespaceName,rpnNamespaceKeyword

" namespace usage
syn match rpnFunctionCall "[a-z][a-zA-Z?!&|_]*" contained
syn region rpnNamespace start="[a-z][a-zA-Z?!&|_]*" matchGroup=rpnNamespaceSep end="::" contained nextgroup=rpnFunctionCall
syn match rpnNamespacedFunctionCall "\<[a-z][a-zA-Z?!&|_]*\(::[a-z][a-zA-Z?!&|_]*\)\+\>" contains=rpnNamespace,rpnFunctionCall

" keywords
syn keyword rpnKeyword if else value vvalue call nil dup
syn keyword rpnError error
syn keyword rpnBoolean true false

" comments
syn match rpnLineComment "#.*" contains=@Spell

" symbol and character literals
syn match rpnCharacter "'[^'\\]'\|'\\.'\|'\\u[0-9a-fA-F]\{4}'"

" number literals
syn match rpnNumber "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match rpnNumber "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match rpnNumber "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match rpnNumber "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

syn sync fromstart

" map RPN groups to standard groups
hi link rpnFunctionKeyword rpnKeyword
hi link rpnNamespaceKeyword rpnKeyword
hi link rpnIdentifier Normal
hi link rpnKeyword Keyword
hi link rpnError Exception
hi link rpnBoolean Boolean
hi link rpnNumber Number
hi link rpnCharacter Character
hi link rpnLineComment Comment
hi link rpnArgument Identifier
hi link rpnVariable Normal
hi link rpnFunctionName Function
hi link rpnFunctionCall Function
hi link rpnNamespace Structure
hi link rpnNamespaceName Structure
hi link rpnSymbol Constant

let b:current_syntax = "rpn"

