local M = {}
local utils = require "base.utils"
local ui = require "base.utils.ui"
local maps = require("base.utils").get_mappings_template()

maps.n["<leader>la"] = { "<cmd>Lspsaga code_action<cr>", desc = "Code action",}
maps.n["<C-Space>"] = { "<cmd>Lspsaga code_action<cr>", desc = "Code action",}
maps.n["<leader>lh"] = { "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc",}
maps.n["<Tab>"] = { "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc",}
maps.n["<leader>lr"] = { "<cmd>Lspsaga rename<cr>", desc = "Rename",}

utils.set_mappings(maps)
return M
