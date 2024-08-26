return {
	"rose-pine/neovim",
  lazy = false,
  priority = 1000,
	init = function()
		vim.cmd("colorscheme rose-pine")
	end,
	name = "rose-pine",
	opts = {
		styles = {
			italic = false,
		},
	},
}
