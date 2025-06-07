local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    jsonc = { "prettier" },
    json = { "prettier" },
    go = { "gofumpt", "goimports-reviser", "golines" },
    python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
    rust = { "rustfmt" },
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
