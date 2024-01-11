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
      vim.keymap.set("n", "<leader>fh", require("telescope").extensions.recent_files.pick, {})
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")

      vim.keymap.set("n", "<leader>fr", ":Telescope frecency<CR>", {})
    end,
  },
  {
    "tom-anders/telescope-vim-bookmarks.nvim",
    config = function()
      require("telescope").load_extension("vim_bookmarks")

      vim.keymap.set("n", "<leader>fm", ":Telescope vim_bookmarks all<CR>", {})
      vim.keymap.set("n", "<leader>fM", ":Telescope vim_bookmarks current_file<CR>", {})
    end,
  },
}
