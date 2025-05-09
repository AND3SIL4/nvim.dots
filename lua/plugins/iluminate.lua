return {
  "RRethy/vim-illuminate",
  event = "BufReadPost", -- Carga al abrir un buffer
  config = function()
    require("illuminate").configure({
      providers = { "lsp", "treesitter" }, -- Usa LSP y Treesitter para Python
      delay = 100, -- Retraso para evitar parpadeos
      filetypes_denylist = { "lazy", "snacks" }, -- Evita en dashboards
    })
  end,
  keys = {
    { "<leader>ti", "<cmd>IlluminateToggle<CR>", desc = "Toggle Illuminate" },
  },
}
