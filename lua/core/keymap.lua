vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("i", "jk", "<esc>", { silent = true })

vim.keymap.set("n", "L", "$", {silent = true})
vim.keymap.set("v", "L", "$", {silent = true})

vim.keymap.set("n", "H", "^", {silent = true})
vim.keymap.set("v", "H", "^", {silent = true})

