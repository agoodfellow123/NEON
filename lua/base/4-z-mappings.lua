local M = {}
local utils = require "base.utils"
local ui = require "base.utils.ui"
local maps = require("base.utils").get_mappings_template()

maps.n["<leader>sa"] = { "<cmd>Lspsaga code_action<cr>", desc = "Code Action",}
maps.n["<C-Space>"] = { "<cmd>Lspsaga code_action<cr>", desc = "Code Action",}
maps.n["<leader>sd"] = { "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Doc",}
maps.n["<Tab>"] = { "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Doc",}
maps.n["<leader>sr"] = { "<cmd>Lspsaga rename<cr>", desc = "Rename",}

utils.set_mappings(maps)
return M
