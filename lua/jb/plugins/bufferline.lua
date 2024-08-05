return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left" } },
      max_name_length = 40,
      tab_size = 40,
      max_prefix_length = 35,
      name_formatter = function(buf)
        local path = vim.fn.fnamemodify(buf.path, ":~:.")
        local parts = vim.split(path, "/")
        for i, part in ipairs(parts) do
          if i < #parts then
            parts[i] = part:sub(1, 2)
          end
        end
        return table.concat(parts, "/")
      end,
    },
  },
}
