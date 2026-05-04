function ColorMyPencils(color)
  color = color or "rose-pine-moon"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "none" })
  vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "none" })
  vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { bg = "none" })
end

return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      styles = {
        italic = false,
        transparency = true
      }
    })

    vim.cmd.colorscheme("rose-pine-moon")
  end
}
