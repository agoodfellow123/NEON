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

        vim.api.nvim_set_keymap("n", "<Leader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })

        }

      },
    },
  },
  config = true
}

}
