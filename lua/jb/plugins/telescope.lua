return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "sharkdp/fd",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "absolute" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-x>"] = require("trouble.sources.telescope").open,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd, respects .gitignore" })
    keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd, respects .gitignore" })
    keymap.set(
      "n",
      "<leader>fc",
      builtin.grep_string,
      { desc = "Find string under cursor in cwd, doesn't respect .gitignore" }
    )
    keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    keymap.set(
      "n",
      "<leader>fg",
      builtin.git_files,
      { desc = "Fuzzy search through output of `git ls-files`, respects .gitignore" }
    )
    keymap.set("n", "<leader>fo", builtin.jumplist, { desc = "jump list" })
    keymap.set("n", "<leader>ft", builtin.tagstack, { desc = "tag stack" })
    keymap.set("n", "<leader>fq", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
