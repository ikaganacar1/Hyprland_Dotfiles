-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local function set_transparency()
  vim.cmd([[
hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi StatusLine guibg=NONE ctermbg=NONE
hi StatusLineNC guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE
hi TabLine guibg=NONE ctermbg=NONE
hi TabLineFill guibg=NONE ctermbg=NONE
hi TabLineSel guibg=NONE ctermbg=NONE
hi NeoTreeNormal guibg=NONE ctermbg=NONE
hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
hi NeoTreeWinSeparator guibg=NONE ctermbg=NONE
hi NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

hi Pmenu guibg=#0a0a0a ctermbg=235
hi PmenuSel guibg=#1a1a1a ctermbg=236
hi FloatBorder guibg=#0a0a0a ctermbg=235
hi NormalFloat guibg=#0a0a0a ctermbg=235
]])
end

-- Apply transparency settings initially
set_transparency()

-- Reapply transparency on buffer enter
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = set_transparency,
})
vim.keymap.set("n", "<leader>e", function()
  require("neo-tree.command").execute({
    toggle = true,
    dir = vim.fn.getcwd(), -- Force use of current working directory
  })
end, { desc = "Toggle Neotree in CWD" })
