require("core.remap")
require("core.set")

require("custom.plugins.colors")
require("custom.plugins.telescope")
require("custom.plugins.lsp")
require("custom.plugins.completions")

vim.pack.add({
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/j-hui/fidget.nvim"
})

vim.o.winborder = "rounded"
vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = true,
  float = {
    border = "rounded"
  }
})

-- FUGITIVE
vim.keymap.set("n", "<leader>g", vim.cmd.Git)

-- FIDGET
require("fidget").setup({})

-- GENERAL
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end
})
