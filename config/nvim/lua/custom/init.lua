local hooks = require "core.hooks"

hooks.add("setup_mappings", function(map)
   map("n", "<leader>cc", ":Telescope <CR>", opt)
   map("n", "<leader>q", ":q <CR>", opt)
end)

hooks.add("install_plugins", function(use)
  use "rinx/nvim-minimap"

  use {
      "karb94/neoscroll.nvim",
       opt = true,
       config = function()
          require("neoscroll").setup()
       end,

       -- lazy loading
       setup = function()
         require("core.utils").packer_lazy_load "neoscroll.nvim"
       end,
  }

  use {
   "Pocco81/AutoSave.nvim",
   config = function()
      local autosave = require "autosave"

      autosave.setup {
         enabled = true,
         execution_message = "autosaved at : " .. vim.fn.strftime "%H:%M:%S",
         events = { "InsertLeave", "TextChanged" },
         conditions = {
            exists = true,
            filetype_is_not = {},
            modifiable = true,
         },
         clean_command_line_interval = 2500,
         on_off_commands = true,
         write_all_buffers = false,
      }
   end,
  }

  use {
      "Pocco81/TrueZen.nvim",
      cmd = {
         "TZAtaraxis",
         "TZMinimalist",
         "TZFocus",
      },
      config = function()
          -- check https://github.com/Pocco81/TrueZen.nvim#setup-configuration (init.lua version)
      end
   }

  use "nathom/filetype.nvim"

  use {
      "luukvbaal/stabilize.nvim",
      config = function() require("stabilize").setup() end
  }

  use "nvim-lua/popup.nvim"

  use "Shatur/neovim-session-manager"

  use "chrisbra/Colorizer"

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use "elkowar/yuck.vim"

  use "wakatime/vim-wakatime"

  use "rcarriga/nvim-notify"

  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use 'andweeb/presence.nvim'

  use 'sheerun/vim-polyglot'

  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })
end)

