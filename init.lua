require("tng.remap")
require("tng.set")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.cmd.filetype("on")

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = true,
  float = {
    style = 'minimal',
    border = "rounded",
    source = true,
    header = '',
    prefix = '',
  },
})

vim.treesitter.install = {
  auto_install = true,
  prefer_git = true,  -- скачивать парсеры из GitHub проекта Neovim
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
    vim.keymap.set("n", "gr", builtin.lsp_references, opts)

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ buffer = args.buf, border = "rounded" }) end, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  end
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local bufnr = args.buf
    local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
    if not ok or not parser then
      return
    end
    pcall(vim.treesitter.start)
  end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

require("lazy").setup("tng.plugins")
