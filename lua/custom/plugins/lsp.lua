vim.pack.add({
  "https://github.com/folke/lazydev.nvim",
  "https://github.com/neovim/nvim-lspconfig",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  once = true,
  callback = function()
    require("lazydev").setup({
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    local telescope_builtin = require("telescope.builtin")

    vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, opts)
    vim.keymap.set("n", "gr", telescope_builtin.lsp_references, opts)

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ buffer = args.buf, border = "rounded" }) end, opts)
    vim.keymap.set("i", "<c-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  end
})
