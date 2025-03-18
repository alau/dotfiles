-- Convenience for Tabular
vim.cmd([[command! -nargs=1 -range Align exec "<line1>,<line2>Tabularize /<args>"]])

-- Save files that require sudo
vim.cmd([[command! W w suda://%:p]])
