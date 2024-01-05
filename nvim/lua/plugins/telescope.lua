local _, builtin = pcall(require, "telescope.builtin")
return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader><space>", false },
      { "<leader>fF", false },
      {
        "<leader>ff",
        function(opts)
          opts = opts or {}
          local ok = pcall(builtin.git_files, opts)
          if not ok then
            builtin.find_files(opts)
          end
        end,
        desc = "Find Files",
      },
      { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Find current Word" },
      { "<leader>k", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    },
  },
}
