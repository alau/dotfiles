vim.opt.wildignore = {'.git','vendor','node_modules'}
vim.g.ctrlp_user_command = {'.git', 'cd %s && git ls-files'}
vim.g.ctrlp_match_window = 'top,order:btt,results:10'
vim.cmd [[highlight CtrlPBufferNr guibg=Black guifg=White]]
vim.cmd [[highlight CtrlPBufferInd guibg=Black guifg=White]]
vim.cmd [[highlight CtrlPBufferPath guibg=Black guifg=White]]
vim.cmd [[highlight CtrlPBufferVis guibg=Black guifg=White]]
vim.cmd [[highlight CtrlPBufferHid guibg=Black guifg=White]]
vim.cmd [[highlight CtrlPBufferCur guibg=Black guifg=White]]

