local mason_status, mason = pcall(require, "mason")
if not mason_status then return end

local lsp_status, lsp = pcall(require, "mason-lspconfig")
if not lsp_status then return end

local null_ls_status, null_ls = pcall(require, "mason-null-ls")
if not null_ls_status then return end

mason.setup()

lsp.setup ({
  ensure_installed = {
    "cssls",
    "tsserver",
    "sumneko_lua",
		"emmet_ls",
    "html",
    "pyright",
    "tailwindcss",
    "jsonls"
  },
  automatic_installation = true,
})

null_ls.setup ({
  ensure_installed = {
    "black",
    "clang-format",
    "eslint_d",
    "prettier",
    "stylua",
  },
  automatic_installation = true,
})
