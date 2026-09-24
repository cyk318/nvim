local group = vim.api.nvim_create_augroup("UserEditing", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    callback = function() vim.hl.on_yank({ timeout = 150 }) end,
})
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = group,
    callback = function()
        if vim.fn.getcmdwintype() == "" then vim.cmd("checktime") end
    end,
})
vim.api.nvim_create_autocmd("BufReadPost", {
    group = group,
    callback = function(event)
        local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
        if vim.bo[event.buf].buftype == "" and mark[1] > 0
            and mark[1] <= vim.api.nvim_buf_line_count(event.buf) then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
vim.api.nvim_create_autocmd("VimResized", {
    group = group,
    callback = function() vim.cmd("wincmd =") end,
})
