local map = vim.keymap.set
local function simap(mode, lhs, rhs, opts)
  if opts == nil then
    opts = {}
  end
  opts.silent = true
  vim.keymap.set(mode, lhs, rhs, opts)
end

--  Map jk kj to esc
map('i', 'jk', [[<C-\><C-n>]])
map('i', 'kj', [[<C-\><C-n>]])
map('v', 'jk', [[<C-\><C-n>]])
map('v', 'kj', [[<C-\><C-n>]])
