" Convert ruby hash rockets (:foo => :bar) to 1.9 syntax (foo: :bar)
command! FixRockets exec "%s/:\\([a-z_]\\+\\) => /\\1: /g"

" Convenience for Tabular
command! -nargs=1 -range Align exec "<line1>,<line2>Tabularize /<args>"

" Save files that require sudo
command! W w suda://%:p

" minpac
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
