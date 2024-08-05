return {
  { "nvim-neotest/nvim-nio" },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      -- local Config = require("lazyvim.config")
      -- vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
      --
      -- for name, sign in pairs(Config.icons.dap) do
      --   sign = type(sign) == "table" and sign or { sign }
      --   vim.fn.sign_define(
      --     "Dap" .. name,
      --     { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      --   )
      -- end
      --
      -- require("dapui").setup()
      --
      -- require("dap-go").setup()
      --
      -- require('')
    end,
  },
}
