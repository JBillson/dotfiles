-- Use Neovim as a language server to inject LSP
-- diagnostics, code actions, and more via Lua.
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.goimports,
      },
    })

    local opts = {}
    vim.keymap.set("n", "<leader>rf", vim.lsp.buf.format, opts)
  end,
}
