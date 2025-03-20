" These are copied from the default syntax/json.vim file.
" See https://github.com/vim/vim/blob/master/runtime/syntax/json.vim
" These make vim highlight syntax errors in red - very convenient.
" However, it can be super obnoxious while editing. So we have an autocmd here
" that temporarily turns these off when entering insert mode and turns it back
" on again when leaving.
"
" Technically, we did not have to copy these definitions here. But I'm worried about
" names and whatnot changing when vim updates. So I've disabled the definitions
" in the default plugin with g:vim_json_warnings = 0 in my vimrc and defined my
" own copy here. 
syn match jsonNoQuotesError "\<[[:alpha:]][[:alnum:]]*\>"
syn match jsonTripleQuotesError /"""/
syn match jsonNumError "-\=\<0\d\.\d*\>"
syn match jsonNumError "\:\@<=[[:blank:]\r\n]*\zs\.\d\+"
syn match jsonCommentError "//.*"
syn match jsonCommentError "\(/\*\)\|\(\*/\)"
syn match jsonSemicolonError ";"
syn match jsonTrailingCommaError ",\_s*[}\]]"
syn match jsonMissingCommaError /\("\|\]\|\d\)\zs\_s\+\ze"/
syn match jsonMissingCommaError /\(\]\|\}\)\_s\+\ze"/ 
syn match jsonMissingCommaError /}\_s\+\ze{/ 
syn match jsonMissingCommaError /\(true\|false\)\_s\+\ze"/ 

function DisableJSONWarnings() abort
    hi! def link jsonNumError None
    hi! def link jsonCommentError None
    hi! def link jsonSemicolonError None
    hi! def link jsonTrailingCommaError None
    hi! def link jsonMissingCommaError None
    hi! def link jsonStringSQError None
    hi! def link jsonNoQuotesError None
    hi! def link jsonTripleQuotesError None
endfunction

function EnableJSONWarnings() abort
    hi! def link jsonNumError Error
    hi! def link jsonCommentError Error
    hi! def link jsonSemicolonError Error
    hi! def link jsonTrailingCommaError Error
    hi! def link jsonMissingCommaError Error
    hi! def link jsonStringSQError Error
    hi! def link jsonNoQuotesError Error
    hi! def link jsonTripleQuotesError Error
endfunction

" Overrides jsonNoQuotesError. Also copied from default plugin.
" Avoids error highlighting for these special literals.
syn keyword jsonBoolean true
syn keyword jsonBoolean false
syn keyword jsonNull null

augroup json_autocmds
    autocmd!
    autocmd InsertEnter *.json call DisableJSONWarnings()
    autocmd InsertLeave *.json call EnableJSONWarnings()
augroup END

call EnableJSONWarnings()
