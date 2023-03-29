local o = vim.o
local vim = vim


-- Make sure its installed properly
local status_ok, lspconfig
status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	print("couldn't find lspconfig!")
	return
end

-- Saga handles everything but formatting
local on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

-- LSP capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.offsetEncoding = { "utf-16" }

-- server list
local servers = {
	"clangd",
	"rust_analyzer",
	"lua_ls",
	"html",
	"cssls",
	"texlab",
	"prosemd_lsp",
	"dartls",
	"pyright",
  "bashls",
  "awk_ls",
  "yamlls",
  "gopls",
  "jsonls",

}

-- setup each server
for _, value in pairs(servers) do
	lspconfig[value].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

vim.diagnostic.config({
	virtual_text = false,
})
