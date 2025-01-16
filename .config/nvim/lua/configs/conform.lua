local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    go = { "gofumpt", "goimports-reviser", "golines" },
    python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
    zig = { "zigfmt" },
    odin = { "odinfmt" },
    nix = { "nixfmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
