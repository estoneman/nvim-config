local keymap = vim.keymap
local ls = require("luasnip")
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

-- general
keymap.set("n", "<leader>pv", vim.cmd.Ex, {
    desc = "Return to netrw"
})

keymap.set("n", "<leader>ch", vim.cmd.checkhealth, {
    desc = "Run checkhealth"
})

-- telescope.nvim
local builtin = require("telescope.builtin")

keymap.set("n", "<leader>ff", builtin.find_files, {
    desc = "builtin.find_files: Lists files in your current working directory, respects .gitignore"
})

keymap.set("n", "<leader>fg", builtin.live_grep, {
    desc = "builtin.live_grep: Fuzzy search through the output of git ls-files command, respects .gitignore"
})

keymap.set("n", "<leader>fb", builtin.buffers, {
    desc = "builtin.buffers: Searches for the string under your cursor or selection in your current working directory"
})

keymap.set("n", "<leader>fh", builtin.help_tags, {
    desc = "builtin.help_tags: Search for a string in your current working directory and get results live as you type, respects .gitignore. (Requires ripgrep)"
})

keymap.set("n", "<leader>fr", ":Telescope frecency<cr>", {
    desc = "Telescope frecency: list frequently and recently visited files"
})

-- lazy
keymap.set("n", "<leader>lz", Lazy.home, {
    desc = ":Lazy home: go to Lazy vim's home menu"
})

keymap.set("n", "<leader>lu", Lazy.update, {
    desc = ":Lazy update: update installed plugins in Lazy"
})

keymap.set("n", "<leader>lc", Lazy.check, {
    desc = ":Lazy check: check for updates of installed plugins in Lazy"
})

keymap.set("n", "<leader>lr", Lazy.reaload, {
    desc = ":Lazy reload: reload Lazy configuration (e.g., pick up new plugins in real-time)",
})

-- lspconfig
keymap.set("n", "<leader>ll", vim.cmd.LspLog, {
    desc = ":LspLog: show logs of lsp clients"
})

keymap.set("n", "<leader>li", vim.cmd.LspInfo, {
    desc = ":LspInfo: show active lsp clients"
})

-- mason
keymap.set("n", "<leader>ma", vim.cmd.Mason, {
    desc = ":Mason: go to Mason home menu"
})

keymap.set("n", "<leader>ml", vim.cmd.MasonLog, {
    desc = ":MasonLog: view logs for Mason",
})

keymap.set("n", "<leader>mr", vim.cmd.MasonUpdate, {
    desc = ":MasonLog: update Mason registries",
})

-- wit
keymap.set("n", "<leader>ws", ":WitSearch ", {
    desc = ":WitSearch: open cmdline for adding search terms"
})

-- dashboard
keymap.set("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", {
    silent = true,
    desc = "open init.lua",
})

keymap.set("n", "<leader>gl", ":-tabm<cr>", {
    desc = "Move one tab left",
})

keymap.set("n", "<leader>gr", ":+tabm<cr>", {
    desc = "Move one tab right",
})

-- luasnip
keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

keymap.set({"i", "s"}, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, {silent = true})

-- harpoon
keymap.set("n", "<leader>ha", harpoon_mark.add_file, {
    desc = "harpoon.mark.add_file: you mark files you want to revisit later on",
})

keymap.set("n", "<leader>ht", harpoon_ui.toggle_quick_menu, {
    desc = "harpoon.ui.toggle_quick_menu: view all project marks",
})
