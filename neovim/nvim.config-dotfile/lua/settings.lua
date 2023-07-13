 -- Don't create backup/swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Indentation
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Line numbers
vim.opt.number = true

-- Allow modelines
vim.opt.modeline = true

-- Ignore case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Avoid redraw-flashing while doing stuff
vim.opt.lazyredraw = true

-- Use , as <Leader> and <LocalLeader>
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Colorscheme
vim.cmd [[colorscheme vividchalk]]
vim.cmd [[highlight Comment ctermfg=blue]]

-- Remove trailing whitespaces upon write
vim.cmd [[autocmd BufWritePre * EraseBadWhitespace]]

-- Use system clipboard by default
vim.opt.clipboard = {'unnamedplus','unnamed'}

-- ctrlp
vim.opt.wildignore = {'.git','vendor','node_modules'}
vim.g.ctrlp_user_command = {'.git', 'cd %s && git ls-files'}
vim.g.ctrlp_match_window = 'top,order:btt,results:10'
vim.cmd [[highlight CtrlPBufferNr guibg=Black guifg=White]]
vim.cmd [[highlight CtrlPBufferInd guibg=Black guifg=White]]
vim.cmd [[highlight CtrlPBufferPath guibg=Black guifg=White]]
vim.cmd [[highlight CtrlPBufferVis guibg=Black guifg=White]]
vim.cmd [[highlight CtrlPBufferHid guibg=Black guifg=White]]
vim.cmd [[highlight CtrlPBufferCur guibg=Black guifg=White]]

-- Change the position of NERDTree
vim.g.NERDTreeWinPos = 'right'

-- Ack
vim.g.ackprg = "ack -H -i --nocolor --nogroup --column --noxml --nocss"

-- delimitMate
vim.g.delimitMate_expand_space = 1
vim.g.delimitMate_expand_cr = 1
vim.g.delimitMate_excluded_ft = "txt"

-- endwise
vim.g.endwise_no_mappings = 0

-- airline
if vim.fn.exists('airline_symbols') ~= 0 then
  vim.g.airline_symbols = {}
end
vim.g.airline_left_sep = '⮀'
vim.g.airline_left_alt_sep = '⮁'
vim.g.airline_right_sep = '⮂'
vim.g.airline_right_alt_sep = '⮃'
vim.g.airline_symbols = {branch = '⭠', readonly = '⭤'}
vim.g['airline#extensions#branch#format'] = 2

-- easymotion
vim.g.EasyMotion_leader_key = '<Leader>'
vim.g.EasyMotion_mapping_t = '<Leader><Leader>t'
vim.g.EasyMotion_mapping_f = 'f'
vim.g.EasyMotion_mapping_F = 'F'
vim.g.EasyMotion_keys = 'hutenosadimkwjvqzbxgpcrlf'

-- gitv
vim.g.Gitv_DoNotMapCtrlKey = 1
vim.g.Gitv_WipeAllOnClose = 1

-- vim-multiple-cursors
vim.g.multi_cursor_exit_from_visual_mode = 0
vim.g.multi_cursor_exit_from_insert_mode = 0
vim.cmd [[highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse]]
vim.cmd [[highlight link multiple_cursors_visual Visual]]

-- UltiSnips
vim.g.UltiSnipsExpandTrigger = '<F9>'
vim.g.UltiSnipsJumpForwardTrigger = '<F9>'
vim.g.UltiSnipsEditSplit = 'horizontal'
vim.g.UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

-- gitgutter
vim.cmd [[highlight SignColumn guibg=Black]]
vim.cmd [[highlight link GitGutterAdd DiffAdded]]
vim.cmd [[highlight link GitGutterDelete DiffRemoved]]
vim.cmd [[highlight link GitGutterChange DiffChanged]]

-- vim-mustache-handlebars
vim.g.mustache_abbreviations = 1
vim.g.mustache_operators = 0

-- tmux-navigator
vim.g.tmux_navigator_no_mappings = 1

-- yankstack
vim.g.yankstack_map_keys = 0

-- fixmyjs
vim.g.fixmyjs_engine = 'eslint'
vim.g.fixmyjs_use_local = 1

-- folding
vim.opt.foldmethod = 'syntax'
vim.g.javaScript_fold = 1
vim.opt.foldlevelstart = 99

-- symbols-outline
require("symbols-outline").setup()

-- terminal
vim.cmd [[autocmd TermOpen * startinsert]]
vim.cmd [[autocmd TermOpen * setlocal nonumber]]
vim.cmd [[autocmd TermOpen * :HideBadWhitespace]]
vim.cmd [[autocmd TermEnter * setlocal signcolumn=no]]
