-- telescope.nvim is a highly extendable fuzzy finder over lists.
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")

      -- telescope
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    end,
  },
  {
    "smartpde/telescope-recent-files",
    config = function()
      require("telescope").load_extension("recent_files")
      vim.keymap.set("n", "<leader>fr", require("telescope").extensions.recent_files.pick, {})
    end,
  },
  {
    "tom-anders/telescope-vim-bookmarks.nvim",
    config = function()
      require("telescope").load_extension("vim_bookmarks")

      vim.keymap.set("n", "<leader>fm", ":Telescope vim_bookmarks current_file<CR>", {})
      vim.keymap.set("n", "<leader>fM", ":Telescope vim_bookmarks all<CR>", {})
    end,
  },
}
