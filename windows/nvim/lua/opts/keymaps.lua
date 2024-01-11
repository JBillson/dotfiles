local function setKeymap(m, l, r, o)
	vim.keymap.set(m, l, r, o)
end

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- splits
setKeymap("n", "<leader>H", ":split<CR>", opts)
setKeymap("n", "<leader>V", ":vsplit<CR>", opts)

setKeymap("n", "<C-k>", ":wincmd k<CR>", opts)
setKeymap("n", "<C-j>", ":wincmd j<CR>", opts)
setKeymap("n", "<C-h>", ":wincmd h<CR>", opts)
setKeymap("n", "<C-l>", ":wincmd l<CR>", opts)

setKeymap("n", "<C-Up>", ":resize -5<CR>", opts)
setKeymap("n", "<C-Down>", ":resize +5<CR>", opts)
setKeymap("n", "<C-Left>", ":vertical resize -5<CR>", opts)
setKeymap("n", "<C-Right>", ":vertical resize +5<CR>", opts)

setKeymap("n", "<leader>q", ":close<CR>", opts)
--

-- save
setKeymap("n", "<leader>w", ":w<CR>", opts)

-- source keymaps.lua
setKeymap(
	"n",
	"<leader>so",
	":source ~/AppData/Local/nvim/lua/opts/opts.lua<CR>:source ~/AppData/Local/nvim/lua/opts/keymaps.lua<CR>",
	opts
)

-- clear highlighting
setKeymap("n", "<C-c>", ":nohl<CR>", opts)
