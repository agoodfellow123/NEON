local M = {}
local utils = require "base.utils"
local ui = require "base.utils.ui"
local maps = require("base.utils").get_mappings_template()

maps.n["<leader>la"] = { "<cmd>Lspsaga code_action<cr>", desc = "Code action",}
maps.n["<C-Space>"] = { "<cmd>Lspsaga code_action<cr>", desc = "Code action",}
maps.n["<leader>lh"] = { "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc",}
maps.n["<Tab>"] = { "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc",}
maps.n["<leader>lr"] = { "<cmd>Lspsaga rename<cr>", desc = "Rename",}

-- maps.n["j"] = {"gj"}
-- maps.n["k"] = {"gk"}
-- maps.n["<Down>"] = {"gj"}
-- maps.n["<Up>"] = {"gk"}
--
-- maps.v["j"] = {"gj"}
-- maps.v["k"] = {"gk"}
-- maps.v["<Down>"] = {"gj"}
-- maps.v["<Up>"] = {"gk"}
--
-- maps.n["0"] = {"g0"}
-- maps.n["-"] = {"g$"}
-- maps.v["0"] = {"g0"}
-- maps.v["-"] = {"g$"}
--
-- maps.n["Q"] = {"gq"}

-- vim.opt.whichwrap = vim.opt.whichwrap + "h"
-- vim.opt.whichwrap = vim.opt.whichwrap + "l"

-- maps.n["ı"] = {"i"}
maps.n["j"] = {"h"}
maps.n["k"] = {"j"}
maps.n["l"] = {"k"}
maps.n[";"] = {"l"}
maps.n["'"] = {";"}
maps.n["\\"] = {"'"}
maps.n["h"] = {"\\"}

maps.n["J"] = {"H"}
maps.n["K"] = {"J"}
maps.n["L"] = {"K"}
maps.n[":"] = {"L"}
maps.n["\""] = {":"}
maps.n["|"] = {"\""}
maps.n["H"] = {"|"}
-- [[~QWERTYUIOP{}ASDFGHJKL:"|ZXCVBNM<>?`qwertyuiop[]asdfghjkl;'\zxcvbnm,./]]
-- [[éQWERTYUIOPĞÜASDFGHJKLŞİ;ZXCVBNMÖÇ:"qwertyuıopğüasdfghjklşi,zxcvbnmöç.]]
utils.set_mappings(maps)
return M
