local mason_lspconfig_setup = {
  ensure_installed = {
    "bashls",
    "lua_ls",
    "gopls",
    "rust_analyzer",
  },

  automatic_installation = false,

  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,
  },
}

return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    require("mason").setup({})
    require("mason-lspconfig").setup(mason_lspconfig_setup)
  end,
}
