-- Get all themes
local function get_installed_themes()
  local themes = {}
  -- Get all installed colorschemes (works for both Vim and Lua themes)
  for _, name in ipairs(vim.fn.getcompletion('', 'color')) do
    -- Skip problematic themes (optional)
    local ok, _ = pcall(vim.cmd.colorscheme, name)
    if ok then
      table.insert(themes, {
        name = name:gsub('^%l', string.upper), -- Capitalize first letter
        colorscheme = name,
      })
    end
  end
  return themes
end
-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'navarasu/onedark.nvim',
  'simrat39/rust-tools.nvim',
  'mfussenegger/nvim-dap',
  -- Debugger UI
  'David-Kunz/jester',
  'pocco81/dap-buddy.nvim',
  'nvim-telescope/telescope-dap.nvim',
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  {
    'startup-nvim/startup.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim' },
    config = function()
      require('startup').setup()
    end,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
      require('themery').setup {
        themes = {
          'tokyonight',
          'tokyonight-moon',
          'tokyonight-storm',
          {
            name = 'Onedark Dark',
            colorscheme = 'onedark',
            before = [[
        require("onedark").setup({ style = "dark" })
        vim.cmd("colorscheme onedark")
      ]],
          },
          {
            name = 'Onedark Darker',
            colorscheme = 'onedark',
            before = [[
        require("onedark").setup({ style = "darker" })
        vim.cmd("colorscheme onedark")
      ]],
          },
          {
            name = 'Onedark Cool',
            colorscheme = 'onedark',
            before = [[
        require("onedark").setup({ style = "cool" })
        vim.cmd("colorscheme onedark")
      ]],
          },
          {
            name = 'Onedark Deep',
            colorscheme = 'onedark',
            before = [[
        require("onedark").setup({ style = "deep" })
        vim.cmd("colorscheme onedark")
      ]],
          },
          {
            name = 'Onedark Warm',
            colorscheme = 'onedark',
            before = [[
        require("onedark").setup({ style = "warm" })
        vim.cmd("colorscheme onedark")
      ]],
          },
          {
            name = 'Onedark Warmer',
            colorscheme = 'onedark',
            before = [[
        require("onedark").setup({ style = "warmer" })
        vim.cmd("colorscheme onedark")
      ]],
          },
        }, -- Your list of installed colorschemes.
        livePreview = true, -- Apply theme while picking. Default to true.
      }
    end,
  },
}
