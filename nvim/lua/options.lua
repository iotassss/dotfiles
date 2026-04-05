local opt = vim.opt

opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.guicursor = "n-v-c:block-blinkon0,i-ci-ve:ver25-blinkon0,r-cr:hor20-blinkon0"
-- スペース・インデントを明示
opt.list = true
opt.listchars = {
  tab = ">-",
  trail = "·",
  space = "·",
  nbsp = "␣",
}
-- 行数表示
vim.opt.number = true
vim.opt.relativenumber = true

