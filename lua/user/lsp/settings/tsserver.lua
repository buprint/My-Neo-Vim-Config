require'lspinstall'.setup()

local servers = require'lspinstall'.installed_servers()
local lspconfig = require'lspconfig'
for _, server in pairs(servers) do
    lspconfig[server].setup{}
end


lspconfig.tsserver.setup{
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.jsx'}
}
