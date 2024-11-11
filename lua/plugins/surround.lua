-- This file contains the confuguration for the nvim-surround plugin in Neovim

return {
  -- Plugin: nvim-surround
  -- URL: https://github.com/kylechui/nvim-surround
  -- Description: A Neovim plugin for wrapp or un wrapp ano pice of code easly
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}
