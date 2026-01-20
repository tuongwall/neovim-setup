return {
  "aurum77/live-server.nvim",
  cmd = {
    "LiveServerStart",
    "LiveServerStop",
    "LiveServerToggle",
  },
  keys = {
    { "<leader>ls", "<cmd>LiveServerStart<cr>", desc = "Live Server Start" },
    { "<leader>lt", "<cmd>LiveServerStop<cr>", desc = "Live Server Stop" },
    { "<leader>ll", "<cmd>LiveServerToggle<cr>", desc = "Live Server Toggle" },
  },
  config = function()
    require("live_server").setup({
      args = {
        "--port=5500",
        "--quiet",
        "--no-css-inject",
        "--watch=.",
      },
    })
  end,
}
