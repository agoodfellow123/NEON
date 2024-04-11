local M = {}
local utils = require "base.utils"
local ui = require "base.utils.ui"
local maps = require("base.utils").get_mappings_template()


org_key = {
">",
"{",
"\"",
"<",
":",
"}",
"±",
"@",
"#",
"$",
"^",
"&",
"*",
"(",
")",
"_",
"+",
"~",
"|",
"?",
".",
"[",
"\'",
",",
";",
"]",
"i",
"§",
"-",
"=",
"\\",
"/",
"`",
"™",
"£",
"¢",
"∞",
"¶",
"•",
"ª",
"º",
"–",
"≠",
"œ",
"´",
"†",
"¥",
"‘",
"…",
"«",
}

tur_key = {
"Ç",
"Ğ",
"İ",
"Ö",
"Ş",
"Ü",
"é",
"'",
"^",
"+",
"&",
"/",
"(",
")",
"=",
"?",
"_",
">",
";",
":",
"ç",
"ğ",
"i",
"ö",
"ş",
"ü",
"ı",
"\"",
"*",
"-",
",",
".",
"<",
"£",
"#",
"$",
"½",
"{",
"[",
"]",
"}",
"\\",
"|",
"@",
"€",
"₺",
"¥",
"~",
"´",
"`",
}

for i in ipairs(tur_key) do
    maps.n[tur_key[i]] = {org_key[i]}
    maps.v[tur_key[i]] = {org_key[i]}
    maps.o[tur_key[i]] = {org_key[i]}
end



maps.n["<leader>la"] = { "<cmd>Lspsaga code_action<cr>", desc = "Code action",}
maps.n["<C-Space>"] = { "<cmd>Lspsaga code_action<cr>", desc = "Code action",}
maps.n["<leader>lh"] = { "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc",}
maps.n["<Tab>"] = { "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc",}
maps.n["<leader>lr"] = { "<cmd>Lspsaga rename<cr>", desc = "Rename",}

maps.n["<Down>"] = {"gj"}
maps.n["<Up>"] = {"gk"}

maps.v["<Down>"] = {"gj"}
maps.v["<Up>"] = {"gk"}

maps.n["0"] = {"g0"}
maps.n["-"] = {"g$"}
maps.v["0"] = {"g0"}
maps.v["-"] = {"g$"}

maps.n["Q"] = {"gq"}

vim.opt.whichwrap = vim.opt.whichwrap + "h"
vim.opt.whichwrap = vim.opt.whichwrap + "l"

-- maps.n["j"] = {"h"}
-- maps.n["k"] = {"gj"}
-- maps.n["l"] = {"gk"}
-- maps.n[";"] = {"l"}
-- maps.n["'"] = {";"}
-- maps.n["\\"] = {"'"}
-- maps.n["h"] = {"\\"}
--
-- maps.n["J"] = {"H"}
-- maps.n["K"] = {"J"}
-- maps.n["L"] = {"K"}
-- maps.n[":"] = {"L"}
-- maps.n["\""] = {":"}
-- maps.n["|"] = {"\""}
-- maps.n["H"] = {"|"}

maps.n["j"] = {"h"}
maps.n["k"] = {"gj"}
maps.n["l"] = {"gk"}
maps.n["ş"] = {"l"}
maps.n["i"] = {";"}
maps.n[","] = {"'"}
maps.n["h"] = {"\\"}

maps.n["J"] = {"H"}
maps.n["K"] = {"J"}
maps.n["L"] = {"K"}
maps.n["Ş"] = {"L"}
maps.n["İ"] = {":"}
maps.n[";"] = {"\""}
maps.n["H"] = {"|"}

-- maps.v["j"] = {"h"}
-- maps.v["k"] = {"gj"}
-- maps.v["l"] = {"gk"}
-- maps.v[";"] = {"l"}
-- maps.v["'"] = {";"}
-- maps.v["\\"] = {"'"}
-- maps.v["h"] = {"\\"}
--
-- maps.v["J"] = {"H"}
-- maps.v["K"] = {"J"}
-- maps.v["L"] = {"K"}
-- maps.v[":"] = {"L"}
-- maps.v["\""] = {":"}
-- maps.v["|"] = {"\""}
-- maps.v["H"] = {"|"}

maps.v["j"] = {"h"}
maps.v["k"] = {"gj"}
maps.v["l"] = {"gk"}
maps.v["ş"] = {"l"}
maps.v["i"] = {";"}
maps.v[","] = {"'"}
maps.v["h"] = {"\\"}

maps.v["J"] = {"H"}
maps.v["K"] = {"J"}
maps.v["L"] = {"K"}
maps.v["Ş"] = {"L"}
maps.v["İ"] = {":"}
maps.v[";"] = {"\""}
maps.v["H"] = {"|"}

-- maps.o["j"] = {"h"}
-- maps.o["k"] = {"gj"}
-- maps.o["l"] = {"gk"}
-- maps.o[";"] = {"l"}
-- maps.o["'"] = {";"}
-- maps.o["\\"] = {"'"}
-- maps.o["h"] = {"\\"}
--
-- maps.o["J"] = {"H"}
-- maps.o["K"] = {"J"}
-- maps.o["L"] = {"K"}
-- maps.o[":"] = {"L"}
-- maps.o["\""] = {":"}
-- maps.o["|"] = {"\""}
-- maps.o["H"] = {"|"}

maps.o["j"] = {"h"}
maps.o["k"] = {"gj"}
maps.o["l"] = {"gk"}
maps.o["ş"] = {"l"}
maps.o["i"] = {";"}
maps.o[","] = {"'"}
maps.o["h"] = {"\\"}

maps.o["J"] = {"H"}
maps.o["K"] = {"J"}
maps.o["L"] = {"K"}
maps.o["Ş"] = {"L"}
maps.o["İ"] = {":"}
maps.o[";"] = {"\""}
maps.o["H"] = {"|"}

maps.n["H"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" }
maps.n["h"] = { "<cmd>split<cr>", desc = "Horizontal Split" }

-- maps.n["\\"] = { "<cmd>lua require(\"which-key\").show(\"'\", {mode = \"n\", auto = true})<cr>" }
-- maps.n["|"] = { "<cmd>lua require(\"which-key\").show(\"\\\"\", {mode = \"n\", auto = true})<cr>" }
-- maps.n["|"] = { "<cmd>lua require(\"which-key\").show(\"\\\"\", {mode = \"v\", auto = true})<cr>" }

maps.n[","] = { "<cmd>lua require(\"which-key\").show(\"'\", {mode = \"n\", auto = true})<cr>" }
maps.n[";"] = { "<cmd>lua require(\"which-key\").show(\"\\\"\", {mode = \"n\", auto = true})<cr>" }
maps.n[";"] = { "<cmd>lua require(\"which-key\").show(\"\\\"\", {mode = \"v\", auto = true})<cr>" }

-- if vim.g.neovide then
--     function toggle_nvde_transparancy()
--         if vim.g.neovide_transparency == 1.0 then
--             vim.g.neovide_transparency = 0.8
--         else
--             vim.g.neovide_transparency = 1.0
--         end
--     end
-- end
--
-- maps.n["<leader>x"] = {toggle_nvde_transparancy(), desc = "Neovide transparency toggle" }

if vim.g.neovide then
--     maps.n["<leader>xi"] = {"<cmd>lua vim.g.neovide_transparency = vim.g.neovide_transparency - 0.2<cr>", desc = "Increase Neovide transparency" }
--     maps.n["<leader>xd"] = {"<cmd>lua vim.g.neovide_transparency = vim.g.neovide_transparency + 0.2<cr>", desc = "Decrease Neovide transparency" }
    maps.n["<C-Up>"] = {"<cmd>lua vim.g.neovide_transparency = vim.g.neovide_transparency - 0.1<cr>", desc = "Increase Neovide transparency" }
    maps.n["<C-Down>"] = {"<cmd>lua vim.g.neovide_transparency = vim.g.neovide_transparency + 0.1<cr>", desc = "Decrease Neovide transparency" }
end

maps.n["<leader>Dn"] = {"<cmd>GlobalNote<cr>"}


utils.set_mappings(maps)
return M
