return {
  clangd = {},
  gopls = {},
  html = {},
  htmx = {},
  ts_ls = {},
  tailwindcss = {},
  jsonls = {},
  yamlls = {},
  cssls = {},
  sqls = {},
  lua_ls = {},
  lexical = {
    cmd = { "/home/tng/.local/share/nvim/mason/bin/lexical", "server" },
    root_dir = function(fname)
      local cwd =  require("lspconfig.util").root_pattern({ "mix.exs", ".git" })(fname) or vim.fn.getcwd()
      print(cwd)
      return cwd
    end,
    filetypes = { "elixir", "eelixir", "heex" },
    settings = {},
  },
}
