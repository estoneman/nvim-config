local dashboard_logo = require("config.dashboard-logo")
local conf = {}

conf.header = dashboard_logo.header

conf.center = {
  {
    icon = "󰈞  ",
    desc = "Find  File                              ",
    action = "Leaderf file --popup",
    key = "<Leader> f f",
  },
  {
    icon = "󰈢  ",
    desc = "Recently opened files                   ",
    action = "Leaderf mru --popup",
    key = "<Leader> f r",
  },
  {
    icon = "󰈬  ",
    desc = "Project grep                            ",
    action = "Leaderf rg --popup",
    key = "<Leader> f g",
  },
  {
    icon = "  ",
    desc = "Open Nvim config                        ",
    action = "tabnew $MYVIMRC | tcd %:p:h",
    key = "<Leader> e v",
  },
  {
    icon = "  ",
    desc = "New file                                ",
    action = "enew",
    key = "e",
  },
  {
    icon = "󰗼  ",
    desc = "Quit Nvim                               ",
    action = "qa",
    key = "q",
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  group = vim.api.nvim_create_augroup("dashboard_enter", { clear = true }),
  callback = function ()
    vim.keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })
    vim.keymap.set("n", "e", ":enew<CR>", { buffer = true, silent = true })
  end
})

return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        require("dashboard").setup({
            theme = 'doom',
            config = conf,
        })
    end,
    dependencies = { {"nvim-tree/nvim-web-devicons"} }
}
