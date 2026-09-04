local opt = vim.opt

opt.encoding = "utf-8"
opt.inccommand = "split"
opt.termguicolors = true
opt.swapfile = false

opt.nu = true
opt.relativenumber = true
opt.scrolloff = 10
opt.sidescrolloff = 10

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = false
opt.incsearch = true

opt.colorcolumn = "80"
opt.signcolumn = "yes"
opt.showmode = false

opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 10

opt.updatetime = 50
opt.autoread = true

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

opt.smoothscroll = true
opt.linebreak = true
opt.laststatus = 3
