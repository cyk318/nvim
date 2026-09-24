return {
    "folke/which-key.nvim",
    version = "^3",
    event = "VeryLazy",
    opts = {
        delay = 300,
        spec = {
            { "<leader>b", group = "缓冲区" },
            { "<leader>l", group = "代码 / LSP" },
            { "<leader>s", group = "搜索 / 分屏" },
            { "<leader>g", group = "Git" },
        },
    },
    keys = {
        { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "快捷键提示" },
    },
}
