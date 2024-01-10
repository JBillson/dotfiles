-- Neo-tree is a Neovim plugin to browse the file system and other tree like structures in whatever 
-- style suits you, including sidebars, floating windows, netrw split style, or all of them at once!
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<C-f>', ':Neotree toggle<CR>', {})
  end
}
