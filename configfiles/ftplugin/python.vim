setl expandtab
setl tabstop=4
setl shiftwidth=4
setl softtabstop=0
setlocal foldmethod=indent
setlocal commentstring=#%s
autocmd BufWritePre * :%s/\s\+$//ge
setlocal textwidth=120

if version < 600
  syntax clear
elseif exists('b:current_after_syntax')
  finish
endif

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
syn match pythonDelimiter "\(,\|\.\|:\)"
syn keyword pythonSpecialWord self

hi link pythonSpecialWord    Special
hi link pythonDelimiter      Special

let b:current_after_syntax = 'python'

let &cpo = s:cpo_save
unlet s:cpo_save
