return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        options = {
            -- 在 bufferline 上显示 LSP 诊断信息
            diagnostics = "nvim_lsp",
            -- 自定义方法，用来控制在每个 buffer 标签上显示什么样的诊断信息(图标、文字等)
            diagnostics_indicator = function (_, _, diagnostics_dict, _)
                local indicator = " "
                for level, number in pairs(diagnostics_dict) do
                    local symbol
                    if level == "error" then
                        symbol = " "
                    elseif level == "warning" then
                        symbol = " "
                    else
                        symbol = " "
                    end
                    indicator = indicator .. number .. symbol
                end
                return indicator
            end
        }
    },
    keys = {
        { "<leader>bn", ":BufferLineCycleNext<CR>", silent = true, desc = "下一个缓冲区" },
        { "<leader>bo", ":BufferLineCloseOthers<CR>", silent = true, desc = "关闭其他缓冲区" },
        { "<leader>bp", ":BufferLineCyclePrev<CR>", silent = true, desc = "上一个缓冲区" },
        { "<leader>q", ":bdelete<CR>", silent = true, desc = "关闭当前缓冲区" },
        { "<leader>bh", ":BufferLinePick<CR>", silent = true, desc = "选择缓冲区" },
    },
    lazy = false
}
