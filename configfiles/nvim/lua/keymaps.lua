vim.g.mapleader = " "

local map = vim.keymap.set

-- Display line movement
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "<Down>", "gj")
map("n", "<Up>", "gk")
