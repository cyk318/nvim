return {
    "nvimdev/lspsaga.nvim",
    -- 设置懒加载机制为，使用此命令时加载
    cmd = "Lspsaga",
    opts = {
        finder = {
            -- 显示变量引用，进行跳转时，会弹出一个菜单，但是默认跳转按键为 o 键，这里修改为 回车
            keys = {
                toggle_or_open = "<CR>"
            }
        }
    },
    -- 快捷键绑定
    keys = {
        -- 重命名
        { "<leader>lr", "<Cmd>Lspsaga rename<CR>" },
        -- 寻找变量引用
        { "<leader>lf", "<Cmd>Lspsaga finder<CR>" },
        -- 跳转变量、函数定义
        { "<leader>ld", "<Cmd>Lspsaga goto_definition<CR>" },
        -- 显示帮助文档
        { "<leader>lh", "<Cmd>Lspsaga hover_doc<CR>" },
        -- 针对错误，警告代码提供快速修改
        { "<leader>lc", "<Cmd>Lspsaga code_action<CR>" },
        -- 跳转到下一个警告
        { "<leader>ln", "<Cmd>Lspsaga diagnostic_jump_next<CR>" },
        -- 跳转到上一个警告
        { "<leader>lp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>" },
    }
}

