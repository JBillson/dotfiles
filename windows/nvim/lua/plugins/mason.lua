return {
  "williamboman/mason.nvim",
  name = "mason",
  config = function()
    local settings = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
    require("mason").setup(settings)
  end
}
