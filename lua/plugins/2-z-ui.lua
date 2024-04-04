 return
 {

   --  cyberdream [theme]
	{
	    "scottmckendry/cyberdream.nvim",
           event = "User LoadColorSchemes",
	        opts = {
	         theme = {
              highlights = {

               StatusLine = { fg = "#ffffff", bg = "NONE" },
               TabLine = { fg = "#7b8496", bg = "NONE" },
               TabLineFill = { fg = "#7b8496", bg = "NONE" },
               FoldColumn = { fg = "#7b8496", bg = "NONE" },


                DiagnosiicVirtualTextError = { bg = "#340500" },
                DiagnosticVirtualTextWarn = { bg = "#2f3400" },
                DiagnosticVirtualTextInfo = { bg = "#001534" },
                DiagnosticVirtualTextHint = { bg = "#002f34" },

               },
              },
	            transparent = true,
	            italic_comments = true,
	            hide_fillchars = true,
	            borderless_telescope = false,
	            terminal_colors = true,

	            require("notify").setup({
	              background_colour = "black",
	            })
	        },
	},

	  --  alpha-nvim [greeter]
  --  https://github.com/goolord/alpha-nvim
  {
    "goolord/alpha-nvim",
    cmd = "Alpha",
    -- setup header and buttonts
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

    vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#ff0086" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#ff009c" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#ff00b2" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#ff009c" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#ff0086" })


dashboard.section.header.type = "group"
        dashboard.section.header.val = {
    { type = "text", val = [[  Y88b Y88  888'Y88   e88 88e   Y88b Y88  ]], opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" } },
    { type = "text", val = [[   Y88b Y8  888 ,'Y  d888 888b   Y88b Y8  ]], opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
    { type = "text", val = [[  b Y88b Y  888C8   C8888 8888D b Y88b Y  ]], opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" } },
    { type = "text", val = [[  8b Y88b   888 ",d  Y888 888P  8b Y88b   ]], opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" } },
    { type = "text", val = [[  88b Y88b  888,d88   "88 88"   88b Y88b  ]], opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" } },
    -- [[-------------  *  --------------]],
    -- [[ Y8b Y88888P  888      e   e     ]],
    -- [[  Y8b Y888P   888     d8b d8b    ]],
    -- [[   Y8b Y8P    888    e Y8b Y8b   ]],
    -- [[    Y8b Y     888   d8b Y8b Y8b  ]],
    -- [[     Y8P      888  d888b Y8b Y8b ]],
        }

--       dashboard.section.header.opts.hl = "DashboardHeader"
--       vim.cmd "highlight DashboardHeader guifg=#ff00cd"
--       vim.cmd "highlight DashboardHeader guifg=#F7778F"

      -- If on windows, don't show the 'ranger' button
      local ranger_button = dashboard.button("r", "🐍 Ranger  ", "<cmd>RnvimrToggle<CR>")
      if is_windows then ranger_button = nil end

      -- Buttons
      dashboard.section.buttons.val = {
        dashboard.button("n", "  New File", "<cmd>ene<CR>"),
        dashboard.button("f", "🗁  Find File", "<cmd>Telescope find_files<CR>"),
        dashboard.button("e", "  Recent Files", "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("t", "  Find Text", "<cmd> Telescope live_grep<cr>"),
        -- ranger_button,
        dashboard.button(
          "s",
          "  Sessions",
          "<cmd>SessionManager! load_session<CR>"
        ),
        dashboard.button("p", "🮁  Projects", "<cmd>Telescope projects<CR>"),
        dashboard.button("", ""),
        dashboard.button("q", "  Quit", "<cmd>exit<CR>"),
        --  --button("LDR f '", "  Bookmarks  "),
      }

      ---- Vertical margins
      dashboard.config.layout[1].val =
          vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.10) } -- Above header
      dashboard.config.layout[3].val =
          vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.10) } -- Above buttons

      -- Disable autocmd and return
      dashboard.config.opts.noautocmd = true
      return dashboard
    end,
    config = function(_, opts)
      -- Footer
      require("alpha").setup(opts.config)
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        desc = "Add Alpha dashboard footer",
        once = true,
        callback = function()
          local stats = require("lazy").stats()
          stats.real_cputime = not is_windows
          local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
          opts.section.footer.val = {
            " ",
            " ",
            " ",
            "Loaded " .. stats.loaded .. " plugins  in " .. ms .. "ms",
            ".............................",
          }
          opts.section.footer.opts.hl = "DashboardFooter"
          vim.cmd "highlight DashboardFooter guifg=#D29B68"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },

    {
    "zeioth/heirline-components.nvim",
    opts = {}
  },

    --  heirline [ui components]
  --  https://github.com/rebelot/heirline.nvim
  --  Use it to customize the components of your user interface,
  --  Including tabline, winbar, statuscolumn, statusline.
  --  Be aware some components are positional. Read heirline documentation.
  {
    "rebelot/heirline.nvim",
    dependencies = { "zeioth/heirline-components.nvim" },
    event = "User BaseDefered",
    opts = function()
      local lib = require "heirline-components.all"
      return {
        opts = {

        colors = colors,

          disable_winbar_cb = function(args) -- We do this to avoid showing it on the greeter.
            local is_disabled = not require("heirline-components.buffer").is_valid(args.buf) or
                lib.condition.buffer_matches({
                  buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
                  filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
                }, args.buf)
            return is_disabled
          end,
        },
        tabline = { -- UI upper bar
          lib.component.tabline_conditional_padding(),
          lib.component.tabline_buffers(),
          lib.component.fill { hl = { bg = "tabline_bg" } },
          lib.component.tabline_tabpages()
        },
        statuscolumn = { -- UI left column
          init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
          lib.component.foldcolumn(),
          lib.component.numbercolumn(),
          lib.component.signcolumn(),
        } or nil,
        statusline = { -- UI statusbar
          hl = { fg = "fg", bg = "bg" },
--           lib.component.mode({
--           mode_text =  { pad_text = "left" },
--           surround = {
--             color = mode_colors, },
--           update = {  "ModeChanged", pattern = "*:*" },
--           mode = vim.fn.mode(1):sub(1, 1),
--           mode_names = { -- change the strings if you like it vvvvverbose!
--             n = "N",
--             no = "N?",
--             nov = "N?",
--             noV = "N?",
--             ["no\22"] = "N?",
--             niI = "Ni",
--             niR = "Nr",
--             niV = "Nv",
--             nt = "Nt",
--             v = "V",
--             vs = "Vs",
--             V = "V_",
--             Vs = "Vs",
--             ["\22"] = "^V",
--             ["\22s"] = "^V",
--             s = "S",
--             S = "S_",
--             ["\19"] = "^S",
--             i = "I",
--             ic = "Ic",
--             ix = "Ix",
--             R = "R",
--             Rc = "Rc",
--             Rx = "Rx",
--             Rv = "Rv",
--             Rvc = "Rv",
--             Rvx = "Rv",
--             c = "C",
--             cv = "Ex",
--             r = "...",
--             rm = "M",
--             ["r?"] = "?",
--             ["!"] = "!",
--             t = "T",
--             },
--
--           mode_colors = {
--             n = "red" ,
--             i = "green",
--             v = "cyan",
--             V =  "cyan",
--             ["\22"] =  "cyan",
--             c =  "orange",
--             s =  "purple",
--             S =  "purple",
--             ["\19"] =  "purple",
--             R =  "orange",
--             r =  "orange",
--             ["!"] =  "red",
--             t =  "red",
--             },
--           }),
          lib.component.file_info(),
          lib.component.diagnostics({
          lib.component.git_branch(),
          lib.component.git_diff(),
            on_click = {
              name = "heirline_diagnostic",
              callback = function()
                -- replace this line by the command to open trouble.
                require("trouble").toggle()
              end,
            }
          }),
          lib.component.fill(),
          lib.component.cmd_info(),
          lib.component.fill(),
          lib.component.lsp(),
          lib.component.virtual_env(),
          lib.component.compiler_state(),
          lib.component.nav({

            ruler = false,
            scrollbar = { padding = { left = 1 }, hl = { fg = "#ffffff" } }, -- if set, displays a interactive square that fills depending the point of the document you are.

          }),
--           lib.component.mode { surround = { separator = "right" } },
        },
      }
    end,
    config = function(_, opts)
      local heirline = require("heirline")
      local heirline_components = require "heirline-components.all"

      -- Setup
      heirline_components.init.subscribe_to_events()
      heirline.load_colors(heirline_components.hl.get_colors())
      heirline.setup(opts)
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    keys = {
      {
        "<F8>",
        "<cmd>TroubleToggle<cr>",
        desc = "Diagnostics",
      },
      {
        "<leader>lx",
        "<cmd>TroubleToggle<cr>",
        desc = "Diagnostics",
      },
      {
        "<leader>lw",
        "<cmd>Trouble workspace_diagnostics<cr>",
        desc = "Workspace diagnostics",
      },
      {
        "<leader>ld",
        "<cmd>Trouble document_diagnostics<cr>",
        desc = "Document diagnostics",
      },
      {
        "<leader>lq",
        "<cmd>Trouble quickfix<cr>",
        desc = "Quickfix",
      },
      {
        "<leader>ll",
        "<cmd>Trouble loclist<cr>",
        desc = "Location list",
      },
      {
        "<leader>le",
        "<cmd>Trouble lsp_references<cr>",
        desc = "Lsp references",
      },
    },

    opts = {},
  },

    {
    "soulis-1256/eagle.nvim",
    },

    {
    'backdround/global-note.nvim',
    },

    {
    'iamcco/markdown-preview.nvim',
    },

    {
    'nvimdev/lspsaga.nvim',
    lazy = false,
    config = function()
        require('lspsaga').setup({

            symbol_in_winbar = {
              enable = false,
            },

              code_action_keys = {
                quit = "q", "<ESC>",
              },

              hover_doc_keys = {
                quit = "q", "<ESC>",
              },

              ui = {
                code_action = ''
              }

--               hover_doc = {
--                 keys = {
--                   quit = '<ESC>', 'q',
--               },
--             },
--               code_action = {
--                 keys = {
--                   quit = '<ESC>', 'q',
--               },
--             },
--               finder = {
--                 keys = {
--                   toggle_or_open = '<Tab>',
--               },
--             },
--               light_bulb = {
--                 enable = false,
--             },
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
        }
    },

}
