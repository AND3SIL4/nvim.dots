-- This file contains the configuration for the oil.nvim plugin in Neovim.

return {
  {
    -- Plugin: oil.nvim
    -- URL: https://github.com/stevearc/oil.nvim
    -- Description: A Neovim plugin for managing and navigating directories.
    "stevearc/oil.nvim",
    dependencies = {
      -- Plugin: nvim-web-devicons
      -- URL: https://github.com/nvim-tree/nvim-web-devicons
      -- Description: A Lua fork of vim-web-devicons for Neovim.
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("oil").setup({
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<M-h>"] = "actions.select_split",
        },
        view_options = {
          show_hidden = true,
        },
      })
      -- Open parent directory in current window
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

      -- Open parent directory in floating window
      vim.keymap.set("n", "<leader>2", require("oil").toggle_float, { desc = "Open toggle directory" })
    end,
  },
}