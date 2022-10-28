require'lspinstall'.setup()

local servers = require'lspinstall'.installed_servers()
local lspconfig = require'lspconfig'
for _, server in pairs(servers) do
    lspconfig[server].setup{}
end


lspconfig.emmet_ls.setup{
  cmd = { "emmet-ls", "--stdio" },
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
}
