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
	vim.lsp.buf.format({ async = true })
	vim.keymap.set(
		"n",
		"<leader>f",
		"<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
		{ noremap = true, silent = true }
	)
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
	"docker_compose_language_service",
	"dockerls",
	"tsserver",
  "sqlls"
}

-- setup each server
for _, value in pairs(servers) do
	lspconfig[value].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

require("lspconfig").elixirls.setup({
	cmd = { "/usr/bin/elixir-ls" },
})

vim.diagnostic.config({
	virtual_text = false,
})
