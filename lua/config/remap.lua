-- general
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- telescope.nvim
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {
  desc = 'builtin.find_files: Lists files in your current working directory, respects .gitignore'
})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {
  desc = 'builtin.live_grep: Fuzzy search through the output of git ls-files command, respects .gitignore'
})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {
  desc = 'builtin.buffers: Searches for the string under your cursor or selection in your current working directory'
})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
  desc = 'builtin.help_tags: Search for a string in your current working directory and get results live as you type, respects .gitignore. (Requires ripgrep)'
})
