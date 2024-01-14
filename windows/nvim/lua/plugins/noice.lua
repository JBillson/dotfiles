-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
return {
	"folke/noice.nvim",
	dependencies = {
		"rcarriga/nvim-notify",
	},
	config = function()
    local noice, notify = require("noice"), require("notify")
		vim.notify = notify

		notify.setup({
			background_colour = "#000000",
			vim.keymap.set("n", "<leader>fn", ":Telescope notify<CR>", {}),
      render = "minimal",
		})

    noice.setup({
    })
  end,
}
