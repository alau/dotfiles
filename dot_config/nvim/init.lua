require('alau.settings')
require('alau.plugins')
require('alau.definitions')
require('alau.completions')
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/alau/plugin_configs', [[v:val =~ '\.lua$']])) do
  require('alau.plugin_configs.'..file:gsub('%.lua$', ''))
end
require('alau.mappings')
