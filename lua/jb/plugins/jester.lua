return {
  "David-Kunz/jester",
  dependencies = "mfussenegger/nvim-dap",
  config = function()
    local jester = require("jester")

    -- dap configuration
    -- dap.configurations.python = {
    --   {
    --     -- The first three options are required by nvim-dap
    --     type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    --     request = "launch",
    --     name = "Launch file",
    --
    --     -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
    --
    --     program = "${file}", -- This configuration will launch the current file if used.
    --     pythonPath = function()
    --       -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
    --       -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
    --       -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
    --       local cwd = vim.fn.getcwd()
    --       if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
    --         return cwd .. "/venv/bin/python"
    --       elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
    --         return cwd .. "/.venv/bin/python"
    --       else
    --         return "/usr/bin/python"
    --       end
    --     end,
    --   },
    -- }
    -- dap.configurations.typescript = {
    --   {
    --     type = "pwa-node",
    --     request = "launch",
    --     name = "Launch file",
    --     runtimeExecutable = "deno",
    --     runtimeArgs = {
    --       "run",
    --       "--inspect-wait",
    --       "--allow-all",
    --     },
    --     program = "${file}",
    --     cwd = "${workspaceFolder}",
    --     attachSimplePort = 9229,
    --   },
    -- }

    jester.setup({
      console = "externalTerminal",
      path_to_jest_run = "yarn run test",
      dap = { -- debug adapter configuration
        type = "node",
        request = "launch",
        cwd = vim.fn.getcwd(),
        runtimeArgs = { "--inspect-brk", "$path_to_jest", "--no-coverage", "-t", "$result", "--", "$file" },
        args = { "--no-cache" },
        sourceMaps = false,
        protocol = "inspector",
        skipFiles = { "<node_internals>/**/*.js" },
        console = "integratedTerminal",
        port = 9229,
        disableOptimisticBPs = true,
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>jf", function()
      require("jester").run_file()
    end, {
      noremap = true,
      silent = true,
      desc = "Run current file using jester",
    })
    keymap.set("n", "<leader>jr", function()
      require("jester").run()
    end, {
      noremap = true,
      silent = true,
      desc = "Run nearest test(s) using jester",
    })
  end,
}
