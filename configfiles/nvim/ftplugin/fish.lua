vim.bo.textwidth = 79
vim.wo.foldmethod = "expr"

vim.api.nvim_create_autocmd("BufReadPost", {
  buffer = 0,
  once = true,
  callback = function()
    pcall(vim.cmd, "compiler fish")
  end,
})
