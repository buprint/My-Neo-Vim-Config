require'lspinstall'.setup()

local servers = require'lspinstall'.installed_servers()
local lspconfig = require'lspconfig'
for _, server in pairs(servers) do
    lspconfig[server].setup{}
end


lspconfig.cssmodules_ls.setup{
  cmd = { "cssmodules-language-server" },
  filetypes = {'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.jsx'}
}
