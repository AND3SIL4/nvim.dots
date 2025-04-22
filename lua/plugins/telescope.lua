return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VimEnter",
  opts = {
    defaults = {
      mappings = {
        i = { ["<C-j>"] = "move_selection_next", ["<C-k>"] = "move_selection_previous" },
      },
    },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
  },
}
