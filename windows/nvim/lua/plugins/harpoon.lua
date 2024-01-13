-- ThePrimeagen's file navigation tool
return {
  {
    'ThePrimeagen/harpoon',
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      local opts = {}
      vim.keymap.set('n', '<leader>ha', mark.add_file, opts)
      vim.keymap.set('n', '<leader>he', ui.toggle_quick_menu, opts)
      vim.keymap.set('n', '<C-n>', ui.nav_next, opts)
      vim.keymap.set('n', '<C-p>', ui.nav_prev, opts)
    end
  }
}

