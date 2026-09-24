if not vim.g.neovide then return end

vim.o.guifont = "JetBrainsMono Nerd Font:h13"
vim.g.neovide_confirm_quit = true
vim.g.neovide_fullscreen = false
vim.g.neovide_remember_window_size = true
vim.g.neovide_opacity = 0.8
vim.g.neovide_refresh_rate = 120
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_title_text_color = "pink"
vim.g.neovide_cursor_vfx_mode = "pixiedust"

local function update_title()
    local bg = vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg
    if bg then vim.g.neovide_title_background_color = string.format("#%06x", bg) end
end
vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("UserNeovide", { clear = true }),
    callback = update_title,
})
update_title()
