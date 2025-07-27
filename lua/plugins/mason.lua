return {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim"
    },
    opts = {},
    config = function (_, opts)
        require("mason").setup(opts)
        local registry = require("mason-registry")
        -- 自定义 setup 方法
        local function setup(lsp_name, config)
            local success, package = pcall(registry.get_package, lsp_name)
            if success and not package:is_installed() then
                package:install()
            end
            local nvim_lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[lsp_name]
            -- 添加这行内容
            config.capabilities = require("blink.cmp").get_lsp_capabilities()
            require("lspconfig")[nvim_lsp].setup(config)
        end

        -- 先写配置项，然后通过自定义 setup 方法一起加载
        local servers = {
            ["lua-language-server"] = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            },
            pyright = {},
            ["kotlin-language-server"] = {},
            ["html-lsp"] = {},
            ["css-lsp"] = {},
            ["typescript-language-server"] = {},
            ["emmet-ls"] = {},
        }
        for server, config in pairs(servers) do
            setup(server, config)
        end

        vim.cmd("LspStart")
        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
        })
    end
}

