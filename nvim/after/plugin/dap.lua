local dap, dapui = require("dap"), require("dapui")

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" }
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for XDebug",
    port = 9003,
    pathMappings = {
      ["/var/app/backend"] = "${workspaceFolder}/app/backend",
      ["/var/www"] = "${workspaceFolder}/app/frontend",
    }
  }
}



-- Keybinds
-- start debugger
vim.keymap.set("n", '<leader>dc', function() require('dap').continue() end)
vim.keymap.set("n", '<leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set("n", '<leader>n', function() require('dap').step_over() end)


-- UI

local function openScopesWidget()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end

local function closeScopeWidget()
    -- Close the floating window or popup
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local config = vim.api.nvim_win_get_config(win)
        if config.relative ~= "" then
            vim.api.nvim_win_close(win, false)
            print('Closing window', win)
        end
    end
end

-- Set up key mappings only if the debugger is stopped at a breakpoint
vim.keymap.set("n", '<leader>k', openScopesWidget)
