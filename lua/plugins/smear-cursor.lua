return {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    -- Neovide 已有原生光标动画，避免叠加两套效果。
    cond = not vim.g.neovide,
    opts = {
        cursor_color = "#7aa2f7",
        smear_between_buffers = true,
        smear_between_neighbor_lines = true,
        smear_insert_mode = true,
        -- 保留明显拖尾，比最初的自定义效果略快一些。
        stiffness = 0.7,
        trailing_stiffness = 0.4,
        stiffness_insert_mode = 0.7,
        trailing_stiffness_insert_mode = 0.7,
        legacy_computing_symbols_support = false,
    },
}
