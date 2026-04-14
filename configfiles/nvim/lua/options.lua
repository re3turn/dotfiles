local opt = vim.opt

-- Encoding
opt.fileencoding = "utf-8"
opt.fileencodings = { "ucs-bom", "utf-8", "euc-jp", "cp932" }
opt.fileformats = { "unix", "dos", "mac" }
opt.ambiwidth = "double"

-- Tab and indent
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 2

-- Cursor
opt.whichwrap = "b,s,h,l,<,>,[,],~"
opt.number = true
opt.cursorline = true
opt.backspace = { "indent", "eol", "start" }
opt.guicursor = "a:ver75-Cursor,a:blinkon0"

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("CursorHighlight", { clear = true }),
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Cursor", { bg = "#dc322f", fg = "#fdf6e3" })
    vim.api.nvim_set_hl(0, "lCursor", { bg = "#dc322f", fg = "#fdf6e3" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#eee8d5" })
  end,
})

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Command mode
opt.wildmenu = true
opt.history = 5000

-- Mouse
opt.mouse = "a"

-- Clipboard
opt.clipboard = "unnamed,unnamedplus"

-- WSL clipboard support
if vim.fn.system("uname -r"):find("WSL") then
  vim.api.nvim_create_augroup("Yank", { clear = true })
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = "Yank",
    callback = function()
      vim.fn.system("win32yank -i", vim.fn.getreg('"'))
    end,
  })
  vim.keymap.set("n", "p", function()
    vim.fn.setreg('"', vim.fn.system("win32yank -o"))
    return '""p'
  end, { silent = true, expr = true })
end

-- Appearance
opt.termguicolors = true
opt.showmatch = true

-- Paste mode auto-off
vim.api.nvim_create_augroup("vimrc", { clear = true })
vim.api.nvim_create_autocmd("InsertLeave", {
  group = "vimrc",
  pattern = "*",
  command = "set nopaste",
})

-- Shell
if vim.o.shell:find("fish$") then
  opt.shell = "sh"
end
