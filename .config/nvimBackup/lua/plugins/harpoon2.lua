return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local harpoon = require("harpoon")
    local list = harpoon:list()

    local keys = {
      {
        "<leader>H",
        function()
          list:add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>h",
        function()
          harpoon.ui:toggle_quick_menu(list)
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        "<leader>n",
        function()
          list:next()
        end,
        desc = "Harpoon Next File",
      },
      {
        "<leader>p",
        function()
          list:prev()
        end,
        desc = "Harpoon Previous File",
      },
      {
        "<leader>d",
        function()
          list:remove()
        end,
        desc = "Harpoon Remove Current File",
      },
    }

    for i = 1, 5 do
      table.insert(keys, {
        "<leader>" .. i,
        function()
          list:select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end
    return keys
  end,
}
