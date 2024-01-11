local options = {
  backup = false,
	clipboard = "unnamedplus",
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	scrolloff = 8,
	sidescrolloff = 8,
	undofile = true,
	swapfile = false,
	wrap = false,
  number = true,
	relativenumber = true,
  autoindent = true,
  expandtab = true,
  incsearch = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
