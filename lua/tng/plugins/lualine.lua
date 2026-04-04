return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local job_indicator = { require("easy-dotnet.ui-modules.jobs").lualine }
    require('lualine').setup({
      sections = {
        lualine_a = { "mode" },
      },
      options = {
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
      },
    })
  end
}
