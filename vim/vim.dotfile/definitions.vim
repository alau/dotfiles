" Strip trailing whitespace
function! StripTrailingWhitespaces()
" Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Convert ruby hash rockets (:foo => :bar) to 1.9 syntax (foo: :bar)
command! FixRockets exec "%s/:\\([a-z_]\\+\\) => /\\1: /g"