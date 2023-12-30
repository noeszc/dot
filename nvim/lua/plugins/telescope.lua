return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Find current Word" },
      { "<leader>k", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    },
  },
}
