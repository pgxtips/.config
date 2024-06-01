local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

function qm()
  harpoon.ui:toggle_quick_menu(harpoon:list())
  vim.cmd.norm("$ze")
end

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", qm, { noremap = true, silent = true })

vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end)
