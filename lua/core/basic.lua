local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 0
opt.smartindent = true
opt.autoread = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.inccommand = "split"
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 400
opt.scrolloff = 6
opt.sidescrolloff = 8
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = "screen"
opt.wrap = false
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.confirm = true

-- 默认继承系统代理；需要单独配置时：NVIM_PROXY=http://127.0.0.1:7890 nvim
if vim.env.NVIM_PROXY and vim.env.NVIM_PROXY ~= "" then
    vim.env.HTTP_PROXY = vim.env.NVIM_PROXY
    vim.env.HTTPS_PROXY = vim.env.NVIM_PROXY
end
