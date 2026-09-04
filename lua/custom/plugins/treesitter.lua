return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install({
      'bash', 'c', 'c_sharp', 'cpp', 'css', 'html', 'javascript', 'json',
      'lua', 'markdown', 'query', 'scss', 'tsx', 'typescript', 'vim',
      'vimdoc', 'xml', 'yaml', 'go', 'rust'
    })
  end,
}
