return {
  {
    -- Local plugin: Copy file content to the clipboard
    -- Description: This plugin copies the current file's content to the clipboard.

    dir = vim.fn.stdpath("config") .. "/lua/plugins", -- Path to the plugin directory
    name = "clipboard", -- Plugin name
    config = function()
      -- Function to check if xclip is installed
      local function is_xclip_installed()
        local handle = io.popen("which xclip")
        local result = handle:read("*a")
        handle:close()
        return result ~= "" -- Returns true if xclip is installed
      end

      -- Function to install xclip if it's not installed
      local function install_xclip()
        -- Check if the system uses apt (for Ubuntu/Debian)
        local is_ubuntu = vim.fn.system("which apt") ~= "" -- Check if apt is present
        if is_ubuntu then
          vim.notify("xclip is not installed. Attempting to install it...", vim.log.levels.WARN)
          -- Run the xclip installation command
          vim.fn.system("sudo apt-get install xclip -y")
          vim.notify("xclip has been installed.", vim.log.levels.INFO)
        else
          vim.notify(
            "xclip is not installed, and it cannot be installed automatically on this system.",
            vim.log.levels.ERROR
          )
        end
      end

      -- Function to copy file content to the clipboard
      local function clipboard()
        -- Check if xclip is installed
        if not is_xclip_installed() then
          vim.notify("xclip is not installed.", vim.log.levels.WARN)
          -- If not installed, attempt to install it
          install_xclip()
          return
        end

        -- Get the current file's path
        local file_path = vim.fn.expand("%:p")

        -- Check if the file is readable
        if vim.fn.filereadable(file_path) == 0 then
          vim.notify("An error occurred during copying file content", vim.log.levels.WARN)
          return
        end

        -- Copy the file content to the clipboard using xclip
        local command = string.format('cat "%s" | xclip -selection clipboard', file_path)
        vim.fn.system(command)
        vim.notify("File content has been copied successfully", vim.log.levels.INFO)
      end

      -- Map the function to a keyboard shortcut
      vim.keymap.set(
        "n",
        "<leader>cp",
        clipboard,
        { desc = "Expose the content of the file", noremap = true, silent = true }
      )
    end,
  },
}
