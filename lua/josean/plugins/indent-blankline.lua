return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function()
    local ibl = require("ibl")
    local hooks = require("ibl.hooks")

    -- 1. Tạo danh sách các nhóm màu (Highlight Groups)
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    -- 2. Đăng ký màu sắc thực tế (Hooks)
    -- Mỗi lần khởi động sẽ gán mã màu Hex cho các tên nhóm ở trên
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      
      -- Màu TRẮNG cho đường kẻ active (Scope)
      vim.api.nvim_set_hl(0, "IbScope", { fg = "#FFFFFF", bold = true })
    end)

    ibl.setup({
      -- 3. Cấu hình đường kẻ tĩnh (Rainbow)
      indent = { 
        char = "┊", -- Ký tự nét đứt như bạn yêu cầu
        highlight = highlight, -- Áp dụng mảng màu cầu vồng
      },

      -- 4. Cấu hình đường kẻ Active (Khi con trỏ đang đứng trong khối)
      scope = {
        enabled = true,
        char = "│", -- Đổi thành nét liền
        highlight = "IbScope", -- Đổi thành màu trắng (#FFFFFF)
        show_start = false, -- Tắt gạch ngang trên đầu
        show_end = false,   -- Tắt gạch ngang dưới đáy
      },

      -- 5. Loại trừ các file không cần thiết
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "nvim-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    })
  end,
}
