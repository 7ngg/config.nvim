return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    {
      "j-hui/fidget.nvim",
      opts = {},
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "nanotee/sqls.nvim",
  },
  config = function()
    require('mason').setup({
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    })

    require("mason-lspconfig").setup()

    local servers = require("tng.servers")
    for name, config in pairs(servers) do
      vim.lsp.config(name, config)
    end

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
  end
}
