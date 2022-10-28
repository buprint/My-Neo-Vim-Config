require'lspinstall'.setup()

local servers = require'lspinstall'.installed_servers()
local lspconfig = require'lspconfig'
for _, server in pairs(servers) do
    lspconfig[server].setup{}
end


lspconfig.tsserver.setup{
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" } 
}
