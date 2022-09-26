local o = vim.o
local vim = vim

-- Make sure its installed properly
local status_ok, lspconfig
status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  print("couldn't find lspconfig!")
  return
end

-- LSP config settings
lspconfig.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }
end


local bufopts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }

-- c/cpp
lspconfig["clangd"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- typescript
lspconfig["tsserver"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- rust
lspconfig["rust_analyzer"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {},
  },
})

lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require 'lspconfig'.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { 'W391' },
          maxLineLength = 100
        }
      }
    }
  }
}


require 'lspconfig'.elixirls.setup {
  cmd = { "elixir-ls" }
}

require 'lspconfig'.html.setup {
  capabilities = capabilities,
}

require 'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

require 'lspconfig'.csharp_ls.setup {}

require 'lspconfig'.texlab.setup {}

require 'lspconfig'.prosemd_lsp.setup {}

-- require("lspconfig").typescript_language_server.setup{}

-- require "lspconfig".angular_language_server.setup{}

-- require "lspconfig".cssmodules_language_server.setup{}

vim.diagnostic.config({
  virtual_text = false,
})
