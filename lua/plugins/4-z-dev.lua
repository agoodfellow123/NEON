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

}
