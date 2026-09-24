return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function() return vim.fn.executable("make") == 1 end,
        },
    },
    keys = {
        { "<leader>f", "<Cmd>Telescope live_grep<CR>", desc = "全文搜索" },
        { "<leader><space>", "<Cmd>Telescope find_files<CR>", desc = "查找文件" },
        { "<leader>sb", "<Cmd>Telescope buffers<CR>", desc = "查找缓冲区" },
        { "<leader>sr", "<Cmd>Telescope oldfiles<CR>", desc = "最近文件" },
        { "<leader>sw", "<Cmd>Telescope grep_string<CR>", desc = "搜索当前单词" },
        { "<leader>sd", "<Cmd>Telescope diagnostics<CR>", desc = "搜索诊断" },
        { "<leader>sk", "<Cmd>Telescope keymaps<CR>", desc = "搜索快捷键" },
        { "<leader>ss", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "搜索当前文件" },
    },
    opts = {
        defaults = { sorting_strategy = "ascending", layout_config = { prompt_position = "top" } },
        pickers = { find_files = { hidden = true, find_command = { "rg", "--files", "--hidden", "-g", "!.git" } } },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        pcall(telescope.load_extension, "fzf")
    end,
}
