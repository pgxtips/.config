
-- Trouble
local trouble = require("trouble")

trouble.setup({
    icons = false,
    fold_open = "v", -- icon used for open folds
    fold_closed = ">", -- icon used for closed folds
    indent_lines = false, -- add an indent guide below the fold icons
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    group = false, -- group results by file
    signs = {
        -- icons / text used for a diagnostic
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
    },
    use_diagnostic_signs = true
})

vim.keymap.set("n", "<leader>q", function() trouble.toggle() end)
-- vim.keymap.set("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() trouble.toggle("document_diagnostics") end)
-- vim.keymap.set("n", "<leader>xq", function() trouble.toggle("quickfix") end)
-- vim.keymap.set("n", "<leader>xl", function() trouble.toggle("loclist") end)
-- vim.keymap.set("n", "gR", function() trouble.toggle("lsp_references") end)
