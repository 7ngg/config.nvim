return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets"
  },

  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
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

    completion = {
      documentation = {
        auto_show = true,
        window = {
          scrollbar = false,
        },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
    sources = {
      default = { 'easy-dotnet', 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        ["easy-dotnet"] = {
          name = "easy-dotnet",
          enabled = true,
          module = "easy-dotnet.completion.blink",
          score_offset = 10000,
          async = true,
        },
      },
    },
  },
}
