return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
  config = function()
    local dotnet = require("easy-dotnet")

    vim.keymap.set("n", "<leader>dn", function()
      local path = vim.fn.expand("%")
      print(path)
      dotnet.create_new_item(path)
    end)

    dotnet.setup()
  end
}
