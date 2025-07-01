-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
--
--
-- Remap delete commands to use the black hole register
-- vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "dd", '"_dd', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true, silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<D-d>", "<C-d>zz")

vim.keymap.set("n", "<D-u>", "<C-u>zz")

vim.keymap.set("i", "<D-[>", "<C-[>")

vim.keymap.set("n", "<D>", "<esc>")

vim.keymap.set("n", "<D-s>", "<C-s>")

vim.keymap.set("n", "<leader>o", "ko<Esc>j")
