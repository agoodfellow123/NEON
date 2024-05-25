return
{

  {
  "olimorris/codecompanion.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- Optional
    "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI

      opts = {
        keys = {
--             `vim.api.nvim_set_keymap("n", "<Leader>a", "<cmd>lua if (io.popen(\"if pgrep -x \"ollama\" > /dev/null then echo \"okllama\"\"):close() == (\"okllama\")) then vim.cmd(\"CodeCompanionToggle\") else io.popen(\"ollama serve\"), vim.cmd(\"CodeCompanionToggle\") end<cr>", { noremap = true, silent = true })`


          vim.api.nvim_set_keymap("n", "<Leader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
        },

      },

  },
  config = true
},

--     {
--       "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
--       config = function()
--         require("lsp_lines").setup()
--       end,
--       lazy = false,
--     },


{
    'dgagn/diagflow.nvim',
    -- event = 'LspAttach', This is what I use personnally and it works great
    opts = {}
},

{
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
},

{
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
    opts = {
        load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
          config = {
            icon_preset = "varied",
            icons = {
              delimiter = {
                horizontal_line = {
                  highlight = "@neorg.delimiters.horizontal_line",
                },
              },
              code_block = {
                -- If true will only dim the content of the code block (without the
                -- `@code` and `@end` lines), not the entirety of the code block itself.
                content_only = true,

                -- The width to use for code block backgrounds.
                --
                -- When set to `fullwidth` (the default), will create a background
                -- that spans the width of the buffer.
                --
                -- When set to `content`, will only span as far as the longest line
                -- within the code block.
                width = "content",

                -- Additional padding to apply to either the left or the right. Making
                -- these values negative is considered undefined behaviour (it is
                -- likely to work, but it's not officially supported).
                padding = {
                  -- left = 20,
                  -- right = 20,
                },

                -- If `true` will conceal (hide) the `@code` and `@end` portion of the code
                -- block.
                conceal = true,

                nodes = { "ranged_verbatim_tag" },
                highlight = "CursorLine",
                -- render = module.public.icon_renderers.render_code_block,
                insert_enabled = true,
              },
            },
          },
        },
      },
    },
  },

{
  'linux-cultist/venv-selector.nvim',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
  opts = {
    -- Your options go here
    -- name = "venv",
    -- auto_refresh = false
  },
  event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
--   keys = {
--     -- Keymap to open VenvSelector to pick a venv.
--     { '<leader>vs', '<cmd>VenvSelect<cr>' },
--     -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
--     { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
--   },
}


}
