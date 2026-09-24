return {
    "lewis6991/gitsigns.nvim",
    version = "v1.0.2",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        on_attach = function(buf)
            local gs = require("gitsigns")
            local function map(lhs, rhs, desc)
                vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
            end
            map("]h", function() gs.nav_hunk("next") end, "下一个 Git 修改")
            map("[h", function() gs.nav_hunk("prev") end, "上一个 Git 修改")
            map("<leader>gp", gs.preview_hunk, "预览 Git 修改")
            map("<leader>gb", gs.blame_line, "当前行 Git 来源")
            map("<leader>gd", gs.diffthis, "对比 Git 修改")
        end,
    },
}
