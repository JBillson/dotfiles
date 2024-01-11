-- adds language based highlighting by using language parsers
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			ensure_installed = { "lua", "go", "vim", "json" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
