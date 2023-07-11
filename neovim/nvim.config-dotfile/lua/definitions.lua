-- Convert ruby hash rockets (:foo => :bar) to 1.9 syntax (foo: :bar)
vim.cmd([[command! FixRockets exec "%s/:\\([a-z_]\\+\\) => /\\1: /g"]])

-- Convenience for Tabular
vim.cmd([[command! -nargs=1 -range Align exec "<line1>,<line2>Tabularize /<args>"]])

-- Save files that require sudo
vim.cmd([[command! W w suda://%:p]])

-- minpac
vim.cmd([[command! PackUpdate call minpac#update()]])
vim.cmd([[command! PackClean call minpac#clean()]])
