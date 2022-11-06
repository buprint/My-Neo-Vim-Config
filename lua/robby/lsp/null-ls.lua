local setup, null_lsp = pcall(require, "null-lsp")
if not setup then
  return
end

null_lsp.setup {
  source = {
    null_lsp.builtins.formatting.stylua,
    null_lsp.builtins.diagnostics.eslint,
    null_lsp.builtins.completion.spell,
  }
}
