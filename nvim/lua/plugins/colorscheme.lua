return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      dark_variant = "main",
      styles = {
        bold = false,
        italic = false,
        transparency = false,
      },
    },
  },
  { "miikanissi/modus-themes.nvim", priority = 1000 },
  -- {
  --   "timofurrer/edelweiss",
  --   lazy = false, -- make sure we load this during startup, because it's the main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function(plugin)
  --     vim.opt.rtp:append(plugin.dir .. "/nvim")
  --     vim.cmd([[colorscheme edelweiss]])
  --   end,
  -- },
}
