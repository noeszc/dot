local _, builtin = pcall(require, "telescope.builtin")
local function find_project_files(opts)
  opts = opts or {}
  local ok = pcall(builtin.git_files, opts)

  if not ok then
    builtin.find_files(opts)
  end
end

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      theme = "dropdown",
      pickers = {
        git_files = {
          hidden = true,
          show_untracked = true,
        },
      },
    },
    keys = {
      { "<leader><space>", false },
      { "<leader>fF", false },
      {
        "<leader>ff",
        function()
          find_project_files({ previewer = false })
        end,
        desc = "Find Files",
      },
      { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Find current Word" },
      { "<leader>k", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    },
  },
}
