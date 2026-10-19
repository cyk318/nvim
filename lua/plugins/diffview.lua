return {
    "sindrets/diffview.nvim",
    cmd = {
        "DiffviewOpen",
        "DiffviewClose",
        "DiffviewFileHistory",
        "DiffviewToggleFiles",
        "DiffviewFocusFiles",
        "DiffviewRefresh",
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>gD", "<Cmd>DiffviewOpen<CR>", desc = "查看项目 Git 差异" },
        { "<leader>gs", "<Cmd>DiffviewOpen --cached<CR>", desc = "查看已暂存 Git 差异" },
        { "<leader>gh", "<Cmd>DiffviewFileHistory %<CR>", desc = "查看当前文件 Git 历史" },
        { "<leader>gH", "<Cmd>DiffviewFileHistory<CR>", desc = "查看项目 Git 历史" },
        { "<leader>gq", "<Cmd>DiffviewClose<CR>", desc = "关闭 Git 差异视图" },
    },
    opts = {},
}
