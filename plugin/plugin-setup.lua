-- *** nvim-tree setup ***
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
-- (done in init.vim)
-- vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort = {
    sorter = "name",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- *** tokyonight ***
require('tokyonight').setup()
vim.cmd[[colorscheme tokyonight-night]]

-- LSP
local lspconfig = require('lspconfig')
require('lspconfig').pylsp.setup{
    settings = {
        pylsp = {
            plugins = {
                ruff = {
                  enabled = true,  -- Enable the plugin
                  formatEnabled = true,  -- Enable formatting using ruffs formatter
                  executable = "~/mambaforge/bin/ruff",  -- Custom path to ruff
                  -- config = "<path_to_custom_ruff_toml>",  -- Custom config for ruff to use
                  extendSelect = { "I" },  -- Rules that are additionally used by ruff
                  extendIgnore = { "C90" },  -- Rules that are additionally ignored by ruff
                  format = { "I" },  -- Rules that are marked as fixable by ruff that should be fixed when running textDocument/formatting
                  severities = { ["D212"] = "I" },  -- Optional table of rules where a custom severity is desired
                  unsafeFixes = false,  -- Whether or not to offer unsafe fixes as code actions. Ignored with the "Fix All" action

                  -- Rules that are ignored when a pyproject.toml or ruff.toml is present:
                  lineLength = 88,  -- Line length to pass to ruff checking and formatting
                  exclude = { "__about__.py" },  -- Files to be excluded by ruff checking
                  select = { "F" },  -- Rules to be enabled by ruff
                  ignore = { "D210" },  -- Rules to be ignored by ruff
                  perFileIgnores = { ["__init__.py"] = "CPY001" },  -- Rules that should be ignored for specific files
                  preview = false,  -- Whether to enable the preview style linting and formatting.
                  targetVersion = "py310",  -- The minimum python version to target (applies for both linting and formatting).
                },
            }
        }
    }
}

-- *** telescope ***
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- *** other plugins ***
require('cokeline').setup()
require('dashboard').setup()
require('lspsaga').setup()
