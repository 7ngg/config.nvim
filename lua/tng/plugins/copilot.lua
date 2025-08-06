return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function ()
    require("copilot").setup({
      keymap = {
        accept = "<C-y>"
      },
      suggestion = {
        auto_trigger = false
      },
    })

    vim.keymap.set("n", "<leader>cd", function() vim.cmd("Copilot disable") end)
  end
}
