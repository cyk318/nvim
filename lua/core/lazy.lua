
-- 构造 lazy.nvim 的安装路径
-- vim.fn.stdpath("data") 表示返回 neovim 的数据目录，例如 win 是 ~/AppData/Local/nvim-data；linux/mac 是 ~/.local/share/nvim
-- .. 是 lua 用来拼接字符串的，
-- win 最后拼接成 ~/AppData/Local/nvim-data/lazy/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- 如果 lazypath 不存在（lazy.nvim 未安装），就执行内部逻辑
if not vim.uv.fs_stat(lazypath) then
    -- 把 lazy.nvim 下载到 lazypath 目录
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end
-- 把 lazy.nvim 加入到 neovim 的运行时路径(runtimepath)的最前面
-- 这样才能使用 require("lazy") 正确加载插件管理器
vim.opt.rtp:prepend(lazypath)

-- 加载 lazy.nvim 插件管理器，并调用 setup 函数
-- 传入 {} 空表，表示还没有配置任何插件，后续可以加
require("lazy").setup({
    spec = {
        { import = "plugins" }
    }
})



