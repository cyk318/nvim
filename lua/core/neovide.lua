-- 字体
vim.o.guifont = "JetBrainsMono Nerd Font:h13"
-- 没有空闲
vim.g.neovide_no_idle = true
-- 退出需要确认
vim.g.neovide_confirm_quit = true
-- 是否全屏
vim.g.neovide_fullscreen = false
-- 记住以前的窗口大小
vim.g.neovide_remember_window_size = true

-- 屏幕半透明效果
vim.g.neovide_opacity = 0.8

-- fps 
vim.g.neovide_refresh_rate = 120
vim.g.neovide_refresh_rate_idle = 5

-- 标题栏颜色
vim.g.neovide_title_background_color = string.format(
    "%x",
    vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg
)
vim.g.neovide_title_text_color = "pink"

-- 滑动效果
vim.g.neovide_cursor_vfx_mode = "pixiedust"

