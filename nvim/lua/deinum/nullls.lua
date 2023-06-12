null_ls = require("null-ls")

require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.eslint_d, -- JS linter
		require("null-ls").builtins.formatting.stylua, -- JS linter
		-- require("null-ls").builtins.formatting.yamlfmt,
		-- require("null-ls").builtins.diagnostics.yamllint,
		require("null-ls").builtins.diagnostics.luacheck, -- lua linter
		-- require("null-ls").builtins.diagnostics.proselint, -- english linter
		-- require("null-ls").builtins.diagnostics.tidy, -- HTML / XML linter
		require("null-ls").builtins.formatting.beautysh, -- Beautify shell scripts
		require("null-ls").builtins.formatting.clang_format, -- Beautify clang
    null_ls.builtins.diagnostics.credo,
    null_ls.builtins.formatting.mix,
		-- require("null-ls").builtins.formatting.black, -- Python linter
		require("null-ls").builtins.formatting.black.with({
			extra_args = { "--line-length=120" },
		}),
		-- require("null-ls").builtins.code_actions.gitsigns, -- Python linter
	},
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format {async = true}<CR>")
		end

		if client.server_capabilities.documentRangeFormattingProvider then
			vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")
		end
	end,
})
