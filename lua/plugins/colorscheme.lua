return {
  {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      opts = {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true, -- disables setting the background color.
        term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      },
    },
    {
      "folke/tokyonight.nvim",
      lazy = false, -- Cargar inmediatamente
      priority = 1000, -- Alta prioridad para asegurar que se aplique primero
      opts = {
        style = "moon", -- Opciones: storm, night, moon, day
        transparent = true, -- Fondo transparente
        terminal_colors = true, -- Colores para la terminal
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "transparent", -- Transparencia en barras laterales
          floats = "transparent", -- Transparencia en ventanas flotantes
        },
      },
    },
    {
      "Alan-TheGentleman/oldworld.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    },
    {
      -- LazyVim configuration
      "LazyVim/LazyVim",
      opts = {
        -- Set the default color scheme
        colorscheme = "catppuccin",
      },
    },
  },
}
