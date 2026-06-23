vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })

local function escape(str)
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

-- local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
-- local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]
-- local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
-- local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
-- vim.opt.langmap = vim.fn.join({
--   escape(ru_shift) .. ';' .. escape(en_shift),
--  escape(ru) .. ';' .. escape(en),
--}, ',')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "\\" 

-- English layout
vim.keymap.set('n', '<Leader>w', ':write<CR>', {desc = "Save file"})
vim.keymap.set('n', '<Leader>q', ':q<CR>', {desc = "Quit"})
vim.keymap.set('n', '<Leader>e', ':Ex<CR>', {desc = "Explorer"})
vim.keymap.set('n', '<Leader>v', ':vsplit<CR>', {desc = "Vertical split"})
vim.keymap.set('n', '<Leader>s', ':split<CR>', {desc = "Horizontal split"})

-- Russian layout
vim.keymap.set('n', '<Leader>ц', ':write<CR>', {desc = "Save file"})
vim.keymap.set('n', '<Leader>й', ':q<CR>', {desc = "Quit "})
vim.keymap.set('n', '<Leader>у', ':Ex<CR>', {desc = "Explorer "})
vim.keymap.set('n', '<Leader>м', ':vsplit<CR>', {desc = "Vertical split "})
vim.keymap.set('n', '<Leader>ы', ':split<CR>', {desc = "Horizontal split "})

require("lazy").setup("plugins")
