return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")

		require("conform").setup({
			formatters_by_ft = {
				-- lua = { "stylua" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				go = { "gofmt" },
                cs = { "csharpier" },
                csproj = { "csharpier" },
			},
		})

		vim.keymap.set("n", "<leader>f", function()
			conform.format({
				lsp_format = "fallback",
			})
		end)
	end,
}
