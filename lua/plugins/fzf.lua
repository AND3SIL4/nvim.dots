return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end,
    keys = {
      { "<Leader>r", "<cmd>FzfLua files<CR>", desc = "Fzf Files" },
      { "<Leader>rg", "<cmd>FzfLua live_grep<CR>", desc = "Fzf Live Grep" },
    },
  },
  { "junegunn/fzf", build = "./install --bin" },
}
