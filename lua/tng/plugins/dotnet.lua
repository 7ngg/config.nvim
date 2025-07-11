return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  opts = {},
  config = function()
    local dotnet = require("easy-dotnet")

    dotnet.setup()

    vim.keymap.set("n", "<leader>dn", function()
      local path = vim.fn.expand("%")
      print(path)
      dotnet.createfile(path)
    end)
  end
}
