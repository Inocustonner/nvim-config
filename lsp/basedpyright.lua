return {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git" },
  handlers = {
    -- only show Warning/Error messages (LSP MessageType: 1=Error, 2=Warning, 3=Info, 4=Log)
    ["window/showMessage"] = function(err, result, ctx)
      if result and result.type <= vim.lsp.protocol.MessageType.Warning then
        vim.lsp.handlers["window/showMessage"](err, result, ctx)
      end
    end,
    -- drop "Analyzing/Diagnosing..." progress popups
    ["$/progress"] = function() end,
  },
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
}
