return {
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        cmdline = {
          view = "cmdline", -- Use the cmdline view for the command-line
        },
        presets = {
          bottom_search = true, -- Enable bottom search view
          command_palette = true, -- Enable command palette view
          lsp_doc_border = true, -- Enable LSP documentation border
        },
        -- Uncomment the following lines to customize the cmdline popup view
        -- views = {
        --   cmdline_popup = {
        --     filter_options = {},
        --     win_options = {
        --       winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        --     },
        --   },
        -- },
      })
    end,
  },
  -- Plugin: incline.nvim
  -- URL: https://github.com/b0o/incline.nvim
  -- Description: A Neovim plugin for showing the current filename in a floating window.
  {
    "b0o/incline.nvim",
    event = "BufReadPre", -- Load this plugin before reading a buffer
    priority = 1200, -- Set the priority for loading this plugin
    config = function()
      require("incline").setup({
        window = { margin = { vertical = 0, horizontal = 1 } }, -- Set the window margin
        hide = {
          cursorline = true, -- Hide the incline window when the cursorline is active
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t") -- Get the filename
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename -- Indicate if the file is modified
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename) -- Get the icon and color for the file
          return { { icon, guifg = color }, { " " }, { filename } } -- Return the rendered content
        end,
      })
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
██████╗ ██╗██████╗ ███████╗     ██████╗ ██╗    ██╗██╗     
██╔══██╗██║██╔══██╗██╔════╝    ██╔═══██╗██║    ██║██║     
██████╔╝██║██████╔╝█████╗      ██║   ██║██║ █╗ ██║██║     
██╔═══╝ ██║██╔═══╝ ██╔══╝      ██║   ██║██║███╗██║██║     
██║     ██║██║     ███████╗    ╚██████╔╝╚███╔███╔╝███████╗
╚═╝     ╚═╝╚═╝     ╚══════╝     ╚═════╝  ╚══╝╚══╝ ╚══════╝
]]
      logo = string.rep("\n", 3) .. logo .. "\n" -- Add a padding to the logo
      opts.config.header = vim.split(logo, "\n") -- Set the header for the dashboard
    end,
  },
}