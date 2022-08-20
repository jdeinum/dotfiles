------------------------GLOBALS + LEADERS--------------------------------------
local vim = vim
local g = vim.g
local fn = vim.fn
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local status_ok

g.mapleader = " "
g.maplocalleader = " "

require("deinum.packer")
require("deinum.options")
require("deinum.keybind")
require("deinum.cmp")
require("deinum.telescope")
require("deinum.lsp")
require("deinum.mason")
-- require "deinum.neotest"
require("deinum.saga")
require("deinum.auto-tag")
require("deinum.options")
require("deinum.autopairs")
require("deinum.nullls")
require("deinum.comment")
require("deinum.treesitter")
-- require "deinum.dap"
require("deinum.pretier")
require("deinum.lualine")
require("deinum.keybind")
require("deinum.gitsigns")
require("deinum.packer")
require("deinum.colorizer")
