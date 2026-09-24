vim.g.mapleader = " "
vim.g.maplocalleader = ","
local map = vim.keymap.set
map("i", "jk", "<Esc>", { desc = "退出插入模式" })
map({ "n", "x" }, "L", "$", { desc = "行尾" })
map({ "n", "x" }, "H", "^", { desc = "行首" })
map("n", "<leader>w", "<Cmd>write<CR>", { desc = "保存文件" })
map("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "清除搜索高亮" })
for key, direction in pairs({ h = "h", j = "j", k = "k", l = "l" }) do
    map("n", "<C-" .. key .. ">", "<C-w>" .. direction, { desc = "切换窗口 " .. direction })
end
map("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "左右分屏" })
map("n", "<leader>sh", "<Cmd>split<CR>", { desc = "上下分屏" })
map("x", "<", "<gv", { desc = "减少缩进" })
map("x", ">", ">gv", { desc = "增加缩进" })
map("n", "<leader>le", vim.diagnostic.open_float, { desc = "显示当前诊断" })
map("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "诊断列表" })
