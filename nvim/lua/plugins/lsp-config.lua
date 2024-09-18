return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    border = "single",
                    width = 0.7,
                    height = 0.7,
                    icons = {
                        package_installed = "V",
                        package_pending = ">",
                        package_uninstalled = "X"
                    },
                },
            })
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "rust_analyzer" },
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                settings = {
                    ["rust_analyzer"] = {
                        inlayHints = {
                            enable = true,
                            showParameterNames = true,
                            -- parameterHintsPrefix = "<- ",
                            -- otherHintsPrefix = "=> ",
                        },
                    },
                },
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        hint = { enable = true },
                    },
                },
            })

            -- Only map these keys after the LS attaches to a buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf })
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf })
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = args.buf })
                    vim.keymap.set("n", "K", vim.lsp.buf.hover,{ buffer = args.buf })
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = args.buf })
                    vim.keymap.set("n", "<leader>i", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { buffer = args.buf })
                end,
            })

            vim.diagnostic.config({
                virtual_text = {
                    spacing = 8,
                    sources = "if_many",
                    prefix = "*",
                },
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "single",
                },
            })
        end,
    },
}
