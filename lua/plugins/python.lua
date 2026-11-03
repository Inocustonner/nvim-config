return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              -- ruff handles import sorting
              disableOrganizeImports = true,
              analysis = {
                typeCheckingMode = "standard", -- "basic" | "standard" | "strict" | "recommended"
                autoImportCompletions = true,
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },
      },
    },
  },
}
