" Convert ruby hash rockets (:foo => :bar) to 1.9 syntax (foo: :bar)
command! FixRockets exec "%s/:\\([a-z_]\\+\\) => /\\1: /g"
