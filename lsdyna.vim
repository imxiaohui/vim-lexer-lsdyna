" Vim syntax file
" Language:	LSDYNA finite element input file (lstc.com)
" Maintainer:	Tim Hartman <tbhartman@gmail.com>
" Contributer:  Jorgen Bergstom <jorgen@PolymerFEM.com>
"               Carl Osterwisch <osterwischc@asme.org>
" Comment:      This file originated from Jorgen Bergstom and may be found at:
"                   http://polymerfem.com/polymer_files/vim.zip
"               Modified from ABAQUS by Carl Osterwisch.

" Copyright 2011 Tim Hartman <tbhartman@gmail.com>
" 
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
" 
"     http://www.apache.org/licenses/LICENSE-2.0
" 
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" LSDYNA comment lines
syn match lsdynaComment	"^\$.*$"

" LSDYNA keyword lines
syn match lsdynaKeywordLine "^\*\h.*" contains=lsdynaKeyword,lsdynaParameter,lsdynaValue display
syn match lsdynaKeyword "^\*\h[^,]*" contained display
syn match lsdynaParameter ",[^,=]\+"lc=1 contained display
syn match lsdynaValue	"=\s*[^,]*"lc=1 contained display

" Illegal syntax
syn match lsdynaBadLine	"^\s\+\*.*" display

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_lsdyna_syn_inits")
	if version < 508
		let did_lsdyna_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	" The default methods for highlighting.  Can be overridden later
	HiLink lsdynaComment	Comment
	HiLink lsdynaKeyword	Statement
	HiLink lsdynaParameter	Identifier
	HiLink lsdynaValue	Constant
	HiLink lsdynaBadLine    Error

	delcommand HiLink
endif

let b:current_syntax = "lsdyna"
