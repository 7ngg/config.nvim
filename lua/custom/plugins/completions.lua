vim.pack.add({
  "https://github.com/rafamadriz/friendly-snippets",
  {
    src = "https://github.com/saghen/blink.cmp",
    version = "v1.10.1"
  },
})

require("blink.cmp").setup({
  keymap = {
    preset = "none",
    ["<Tab>"] = { "accept", "fallback" },
    ["<c-n>"] = { "select_next", "fallback" },
    ["<c-p>"] = { "select_prev", "fallback" },
    ["<c-k>"] = { "snippet_forward", "fallback" },
    ["<c-j>"] = { "snippet_backward", "fallback" },
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = { documentation = { auto_show = false } },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" }
})
