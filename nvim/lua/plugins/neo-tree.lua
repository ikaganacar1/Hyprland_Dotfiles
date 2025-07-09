return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          dir = vim.loop.cwd(), -- Force current working directory as root
        })
      end,
      desc = "Toggle Neotree (CWD)",
    },
    { "<leader>E", false }, -- Disable default LazyVim leader+E
  },
  opts = function(_, opts)
    return vim.tbl_deep_extend("force", opts, {
      window = {
        position = "right",
        width = 20, -- Number type (not string "20")
      },
      filesystem = {
        follow_current_file = {
          enabled = true, -- Always track active file's directory
        },
        hijack_netrw_behavior = "open_current", -- Open current file's dir
        bind_to_cwd = true, -- Lock Neotree to the current working directory
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    })
  end,
}
