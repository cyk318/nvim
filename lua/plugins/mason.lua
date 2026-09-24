return {
    "mason-org/mason.nvim",
    version = "v2.0.1",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    dependencies = {
        -- v2.4.0 支持本机 Neovim 0.11.3；升级 Neovim 后再调整版本。
        { "neovim/nvim-lspconfig", version = "v2.4.0" },
        { "mason-org/mason-lspconfig.nvim", version = "v2.0.0" },
        "saghen/blink.cmp",
    },
    config = function()
        require("mason").setup()
        vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
                    telemetry = { enable = false },
                },
            },
        })
        local servers = { "lua_ls", "pyright", "kotlin_language_server", "html", "cssls", "ts_ls", "emmet_ls" }
        require("mason-lspconfig").setup({ ensure_installed = servers, automatic_enable = servers })
        vim.diagnostic.config({
            severity_sort = true,
            virtual_text = { spacing = 2, source = "if_many" },
            update_in_insert = false,
            float = { border = "rounded", source = true },
        })
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLsp", { clear = true }),
            callback = function(event)
                local function map(lhs, rhs, desc)
                    vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
                end
                map("gd", vim.lsp.buf.definition, "跳转定义")
                map("gr", vim.lsp.buf.references, "查找引用")
                map("K", vim.lsp.buf.hover, "悬浮文档")
                map("<leader>la", vim.lsp.buf.code_action, "代码操作")
                map("<leader>lF", function()
                    vim.lsp.buf.format({ async = true })
                end, "格式化（需要服务端支持）")
            end,
        })
    end,
}
