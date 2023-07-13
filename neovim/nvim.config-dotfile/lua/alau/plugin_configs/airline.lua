if vim.fn.exists('airline_symbols') ~= 0 then
  vim.g.airline_symbols = {}
end
vim.g.airline_left_sep = '⮀'
vim.g.airline_left_alt_sep = '⮁'
vim.g.airline_right_sep = '⮂'
vim.g.airline_right_alt_sep = '⮃'
vim.g.airline_symbols = {branch = '⭠', readonly = '⭤'}
vim.g['airline#extensions#branch#format'] = 2

