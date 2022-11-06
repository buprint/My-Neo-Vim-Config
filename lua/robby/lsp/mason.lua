local mStatus, mason = pcall(require, "mason")
if not mStatus then
  return
end

local mlspStatus, masonLSP = pcall(require, "mason-lspconfig")
if not mlspStatus then
  return
end

mason.setup()
masonLSP.setup {
  ensure_installed = {
    'tsserver',
    'sumneko_lua',
    'html',
    'cssls',
    'eslint',
    'cssmodules_ls',
  }
}


