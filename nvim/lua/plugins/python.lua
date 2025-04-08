return {
  -- Add Python LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Configure pyright server
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                diagnosticMode = "workspace",
                inlayHints = {
                  variableTypes = true,
                  functionReturnTypes = true,
                },
              },
            },
          },
        },
      },
    },
  },

  -- Add Python support to null-ls for formatting
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.black)
    end,
  },

  -- Ensure Python-related tools are installed
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "pyright") -- LSP
      table.insert(opts.ensure_installed, "black") -- Formatter
      table.insert(opts.ensure_installed, "ruff") -- Linter
    end,
  },
}
