local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    -- Enable code navigation keymaps
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", {
		desc="Go to declaration"
	})
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", {
		desc="Go to definition"
	})
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", {
		desc="go to implemenation"
	})
end

local mason_lspconfig_setup = function()
    local lspconfig = require("lspconfig")
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
    )

    return {
        ensure_installed = {
            "bashls",
            "lua_ls",
            "gopls",
            "rust_analyzer",
        },

        automatic_installation = false,

        handlers = {
            ["bashls"] = function ()
                lspconfig["bashls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim", "autocmd", },
                            }
                        }
                    },
                })
            end,
            ["rust_analyzer"] = function()
                lspconfig["rust_analyzer"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        diagnostics = {
                            enable = false,
                        },
                    },
                })
            end,
            ["gopls"] = function()
                lspconfig["gopls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        gopls = {
                            analyses = {
                                unusedparams = true,
                            },
                            staticcheck = true,
                            gofumpt = true,
                        },
                    },
                })
            end,
            ["pylsp"] = function()
                lspconfig["pylsp"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            function(server_name)
                lspconfig[server_name].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
        },
    }
end

return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "onsails/lspkind.nvim",
    },

    config = function ()
        require("mason").setup({})
        require("mason-lspconfig").setup(mason_lspconfig_setup())
        require("fidget").setup({})

        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local lspkind = require("lspkind")

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },

            sources = cmp.config.sources({
                { name = "nvim_lua" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer", keyword_length = 5, max_item_count = 20, },
            }),

            formatting = {
                format = lspkind.cmp_format({
                    with_text = true,
                    menu = {
                        buffer = "[buf]",
                        nvim_lsp = "[lsp]",
                        nvim_lua = "[api]",
                        path = "[path]",
                        luasnip = "[snip]",
                    },
                }),
            },
        })
    end,
}
