return
{

  {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- Optional
    {
      "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
      opts = {
        keys = {

        vim.api.nvim_set_keymap("n", "<Leader>a", "<cmd>Code companion toggle<cr>", { noremap = true, silent = true })

        }

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

}
