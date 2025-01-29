require("config.lazy")

vim.opt.shiftwidth = 4

-- yank and delete to the clipboard
vim.opt.clipboard = "unnamedplus"


-- example how to change highlight
-- vim.cmd [[hi @function.builtin.lua guifg=yellow]]
-- modified all function builint hightlights
--vim.cmd [[hi @function.builtin.lua guifg=yellow]]
-- tab, ctrl+n for iterating through
-- help
-- lua 

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "highlight when yanking text",
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true}),
  callback = function()
    vim.highlight.on_yank()
  end,
})


