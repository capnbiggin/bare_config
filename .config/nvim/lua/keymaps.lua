vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", "<cmd>:Ex<cr>", { desc = "File Tree, :Ex" })
vim.keymap.set("n", "<leader>re", "<cmd>:restart<cr>", { desc = "Restart nvim Config. :restart" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
