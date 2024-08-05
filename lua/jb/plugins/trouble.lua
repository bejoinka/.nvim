return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  cmd = "Trouble",
  config = function()
    local trouble = require("trouble")
    trouble.setup({
      width = 60,
    })

    local keymap = vim.keymap
    keymap.set(
      "n",
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      { noremap = true, silent = true, desc = "Open/close trouble list" }
    )
    keymap.set(
      "n",
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      { desc = "Open buffer diagnostics", noremap = true, silent = true }
    )
    keymap.set(
      "n",
      "<leader>xq",
      "<cmd>Trouble qflist toggle<cr>",
      { desc = "Open trouble quickfix list", noremap = true, silent = true }
    )
    keymap.set(
      "n",
      "<leader>xl",
      "<cmd>Trouble loclist toggle<cr>",
      { desc = "Open trouble location list", noremap = true, silent = true }
    )
    keymap.set(
      "n",
      "<leader>xt",
      "<cmd>TodoTrouble<cr>",
      { desc = "Open todos in trouble", noremap = true, silent = true }
    )
    keymap.set(
      "n",
      "<leader>xw",
      "<cmd>Trouble lsp_workspace_diagnostics<cr>",
      { desc = "Open workspace diagnostics", noremap = true, silent = true }
    )
    keymap.set(
      "n",
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      { desc = "Open trouble document diagnostics", noremap = true, silent = true }
    )
  end,
}
