return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
  config = function()
    local dotnet = require("easy-dotnet")

    vim.keymap.set("n", "<leader>dn", function()
      local path = vim.fn.expand("%")
      dotnet.create_new_item(path)
    end)

    vim.keymap.set("n", "<leader>ds", function() dotnet.secrets() end, {})

    dotnet.setup({
      picker = "telescope",
      auto_boostrap_namespace = {
        type = "file_scoped",
      },
      diagnostics = {
        default_severity = "error", -- "error" or "warning" (default: "error")
        setqflist = false,          -- Populate quickfix list automatically (default: false)
      },
    })
  end
}
