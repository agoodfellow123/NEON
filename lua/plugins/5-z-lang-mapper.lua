local function escape(str)
  -- You need to escape these characters to work correctly
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

-- Recommended to use lua template string
local en = [[`qwertyuiop[]asdfghjkl;'\zxcvbnm,./]]
local tr = [["qwertyuıopğüasdfghjklşi,zxcvbnmöç.]] -- vi layout
-- local tr = [["qwertyuıopğüasdfgjklşi,hzxcvbnmöç.]]

local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"|ZXCVBNM<>?]]
local tr_shift = [[éQWERTYUIOPĞÜASDFGHJKLŞİ;ZXCVBNMÖÇ:]] -- vi layout
-- local tr_shift = [[éQWERTYUIOPĞÜASDFGJKLŞİ;HZXCVBNMÖÇ:]]

vim.opt.langmap = vim.fn.join({
    -- | `to` should be first     | `from` should be second
    escape(tr_shift) .. ';' .. escape(en_shift),
    escape(tr) .. ';' .. escape(en),
}, ',')

local default_config = {
  ---@type boolean Add mapping for every CTRL+ binding or not.
  map_all_ctrl = true,
  ---@type string[] Modes to `map_all_ctrl`
  ---Here and below each mode must be specified, even if some of them extend others.
  ---E.g., 'v' includes 'x' and 's', but must be listed separate.
  ctrl_map_modes = { 'n', 'o', 'i', 'c', 't', 'v' },
  ---@type boolean Wrap all keymap's functions (nvim_set_keymap etc)
  hack_keymap = true,
  ---@type string[] Usually you don't want insert mode commands to be translated when hacking.
  ---This does not affect normal wrapper functions, such as `langmapper.map`
  disable_hack_modes = { 'i' },
  ---@type table Modes whose mappings will be checked during automapping.
  automapping_modes = { 'n', 'v', 'x', 's' },
  ---@type string Standart English layout (on Mac, It may be different in your case.)
  default_layout = [[~QWERTYUIOP{}ASDFGHJKL:"|ZXCVBNM<>?`qwertyuiop[]asdfghjkl;'\zxcvbnm,./]],
  ---@type string[] Names of layouts. If empty, will handle all configured layouts.
  use_layouts = {"tr"},
  ---@type table Fallback layouts
  layouts = {
    ---@type table Fallback layout item. Name of key is a name of language
    tr = {
      ---@type string Name of your second keyboard layout in system.
      ---It should be the same as result string of `get_current_layout_id()`
      id = 'tr',
      ---@type string Fallback layout to translate. Should be same length as default layout
      layout = [[éQWERTYUIOPĞÜASDFGHJKLŞİ;ZXCVBNMÖÇ:"qwertyuıopğüasdfghjklşi,zxcvbnmöç.]],  -- vi layout

--       layout = [[éQWERTYUIOPĞÜASDFGJKLŞİ;HZXCVBNMÖÇ:"qwertyuıopğüasdfgjklşi,hzxcvbnmöç.]],
      ---@type string if you need to specify default layout for this fallback layout
    },
  },
}
return {
  'Wansmer/langmapper.nvim',
  lazy = false,
  priority = 1, -- High priority is needed if you will use `autoremap()`
  config = function()
    require('langmapper').setup(default_config)
  end,
}
