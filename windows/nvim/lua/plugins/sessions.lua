-- Neovim Session Manager
return {
	"Shatur/neovim-session-manager",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local config = require("session_manager.config")
		require("session_manager").setup({
			autoload_mode = config.AutoloadMode.Disabled,
		})
		vim.keymap.set("n", "<leader>se", ":SessionManager load_session<CR>", {})
		vim.keymap.set("n", "<leader>ss", ":SessionManager save_current_session<CR>", {})
		vim.keymap.set("n", "<leader>sd", ":SessionManager delete_session<CR>", {})
	end,
}
