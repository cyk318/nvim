
-- 显示行号
vim.opt.number = true
-- 相对行号
vim.opt.relativenumber = true

-- 高亮当前光标所在行
vim.opt.cursorline = true

-- 将 tab 水平制表符转化成空格
vim.opt.expandtab = true
-- tab 长度设置成4个空格
vim.opt.tabstop = 4
-- shiftwidth 设置成0，可以避免换行后回车带来的 tab 长度不一致问题
vim.opt.shiftwidth = 0

-- 当 neovim 中打开的文件被其他程序修改了(例如idea)，neovim 会自动加载
vim.opt.autoread = true

-- 查找时忽略大小写，除非针对查找大写字母
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 查找之后，不再继续高亮匹配结果
vim.opt.hlsearch = false

-- 隐藏模式显示
vim.opt.showmode = false

-- 共享粘贴板
vim.o.clipboard = "unnamedplus"

vim.env.HTTP_PROXY = "http://127.0.0.1:7897"
vim.env.HTTPS_PROXY = "http://127.0.0.1:7897"

