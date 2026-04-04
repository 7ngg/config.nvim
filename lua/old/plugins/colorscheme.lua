function ColorMyPencils(color)
  color = color or "vscode"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    config = function()
      require("vscode").setup({
        transparent = true
      })
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        styles = {
          italic = false,
          transparency = true
        }
      })

      ColorMyPencils("rose-pine")
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup({
        transparent = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          floats = "transparent"
        }
      })
      -- ColorMyPencils("tokyonight-moon")
    end
  },
}
