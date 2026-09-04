function ColorMyPencils(color)
  color = color or "tokyonight-night"
  vim.cmd.colorscheme(color)

  local transparent_groups = {
    "Normal", "NormalFloat", "FloatBorder", "Pmenu", "SignColumn", "EndOfBuffer",
    "BlinkCmpDoc", "BlinkCmpDocBorder", "BlinkCmpDocSeparator",
  }
  for _, group in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      ColorMyPencils("tokyonight-night")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        styles = {
          italic = false,
          transparency = true,
        },
      })
    end,
  },
}
