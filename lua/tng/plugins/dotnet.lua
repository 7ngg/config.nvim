return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
  config = function()
    local dotnet = require("easy-dotnet")

    vim.keymap.set("n", "<leader>dn", function()
      local path = vim.fn.expand("%")
      dotnet.create_new_item(path)
    end)

    dotnet.setup({
      auto_boostrap_namespace = {
        type = "file_scoped",
      }
    })
  end
}
