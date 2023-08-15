-- local function fzf_config()
--   local actions = require("fzf-lua.actions")
--   local fzf = require("fzf-lua")
-- 
--   local map = function(lhs, rhs)
--     vim.keymap.set("n", lhs, rhs)
--   end
-- 
--   map("<Leader>ff", Telescope find_files)
--   map("<Leader>fb", fzf.buffers)
--   map("<Leader>fg", fzf.grep)
--   map("<Leader>fd", fzf.diagnostics_document)
-- end
-- 
-- return {
--   {
--     "ibhagwan/fzf-lua",
--     dependencies = {
--       -- optional for icon support
--       "kyazdani42/nvim-web-devicons",
--       --  { 'lotabout/skim', build = './install' }
--       -- 'junegunn/fzf',
--     },
--     config = fzf_config,
--     event = "VeryLazy",
--   },
-- }

local function telescope_config()
  local builtin = require('telescope.builtin')

  local map = function(lhs, rhs)
    vim.keymap.set("n", lhs, rhs, {})
  end

  map("<Leader>ff", builtin.find_files)
  map('<leader>fg', builtin.live_grep)
  map('<leader>fb', builtin.buffers)
  map('<leader>fh', builtin.help_tags)
end

return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config=telescope_config,
  event = "VeryLazy"
}
