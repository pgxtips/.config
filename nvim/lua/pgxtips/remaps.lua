--set leader to space
vim.g.mapleader = " "

-- To exit insert mode my pressing kj
vim.keymap.set("i", "kj", "<Esc>")

--vim.keymap.set("i", "<C-c>", "<Esc>")
--open netrw using tab
vim.keymap.set("n", "<leader><Tab>", vim.cmd.Explore);

--centers cursor on screen when page up (c-u) or down (c-d) is pressed 
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

--use gp to select pasted text
vim.keymap.set("n", "gp", "`[v`]")

--greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

--open tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.config/scripts/tmux-sessionizer.sh<CR>")



-------------------
--- Quickfix list
-------------------

-- Function to set up concealment for the quickfix list
local function setup_quickfix_concealment()
    vim.cmd[[
        syntax match ConcealedDetails /\v^[^|]*\|[^|]*\| / conceal
        setlocal conceallevel=2
        setlocal concealcursor=nvic
    ]]
end

local function open_qf_list()
    vim.diagnostic.setqflist()
    setup_quickfix_concealment()
end

-- open quickfix list
vim.keymap.set("n", "<leader>q", open_qf_list)

-- Map j and k to navigate through the quickfix list only when it's open
vim.cmd[[
    augroup QuickFix                                
        au FileType qf nnoremap <buffer> j j<cr><c-w>p 
        au FileType qf noremap <buffer> k k<cr><c-w>p  
        au FileType qf nnoremap <buffer> <CR> <CR><c-w>p:cclose<CR>
    augroup END                                     
]]

