local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.g.neovide_transparency = 0.3
vim.g.neovide_window_blurred = true

vim.g.neovide_floating_blur_amount_x = 4.0
vim.g.neovide_floating_blur_amount_y = 4.0

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
    -- {
    --   "Exafunction/codeium.vim",
    --   event = "BufEnter",
    --
    --   config = function()
    --     -- Change '<C-g>' here to any keycode you like.
    --     vim.keymap.set("i", "<C-j>", function()
    --       return vim.fn["codeium#Accept"]()
    --     end, { expr = true, silent = true })
    --     vim.keymap.set("i", "<C-k>", function()
    --       return vim.fn["codeium#AcceptNextWord()"](1)
    --     end, { expr = true, silent = true })
    --     vim.keymap.set("i", "<c-,>", function()
    --       return vim.fn["codeium#CycleCompletions"](-1)
    --     end, { expr = true, silent = true })
    --     vim.keymap.set("i", "<c-x>", function()
    --       return vim.fn["codeium#Clear"]()
    --     end, { expr = true, silent = true })
    --   end,
    -- },
    {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({
          keymaps = {
            accept_suggestion = "<Tab>",
            clear_suggestion = "<C-]>",
            accept_word = "<C-j>",
          },
          ignore_filetypes = { cpp = true }, -- or { "cpp", }
          color = {
            suggestion_color = "#bd93f9",
            cterm = 244,
          },
          log_level = "info", -- set to "off" to disable logging completely
          disable_inline_completion = false, -- disables inline completion for use with cmp
          disable_keymaps = false, -- disables built in keymaps for more manual control
          condition = function()
            return false
          end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
        })
      end,
    },
    {
      {
        "stevearc/conform.nvim",
        opts = {
          formatters_by_ft = {
            javascript = { "biome" },
            typescript = { "biome" },
            javascriptreact = { "biome" },
            typescriptreact = { "biome" },
            json = { "biome" },
          },
        },
      },
    },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  -- install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
