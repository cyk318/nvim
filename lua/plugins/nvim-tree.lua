return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>t", ":NvimTreeToggle<CR>", desc = "切换文件树" },
        { "<leader>e", ":NvimTreeFindFile<CR>", desc = "在文件树定位" }
    },
    opts = {
        sync_root_with_cwd = true,
        update_focused_file = { enable = true },
        view = { width = 32 },
        renderer = { group_empty = true },
    },
    lazy = false,
}
