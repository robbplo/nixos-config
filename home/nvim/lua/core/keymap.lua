-- Functional wrapper for mapping custom keybindings
local function mapfun(mode)
  return function(lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
      options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end

local nmap = mapfun('n')
local map = mapfun('')

local function cmd(command)
  return '<cmd>' .. command .. '<cr>'
end

-- Space as leader
vim.g.mapleader = " "

-- General
nmap('<leader>P', cmd('PackerSync'))
---- Copy to clipboard
map('<leader>y', '"+y')
---- Paste from clipboard
map('<leader>p', '"+P')
---- Copy current filename to clipboard
nmap('<leader>cf', cmd('let @+=@%'))

-- Panes
---- Resize
nmap('<S-Left>', cmd('vertical resize -1'))
nmap('<S-Right>', cmd('vertical resize +1'))
nmap('<S-Up>', cmd('resize -1'))
nmap('<S-Down>', cmd('resize +1'))

-- Trouble
nmap('<leader>xx', cmd('Trouble diagnostics toggle'))
nmap('<leader>xd', cmd('Trouble diagnostics filter.buf=0 toggle'))
nmap('<leader>xq', cmd('Trouble quickfix toggle'))
nmap('<leader>xl', cmd('Trouble loclist toggle'))
nmap('<leader>xn', cmd('lua require("trouble").next({skip_groups = true, jump = true})'))
nmap('<leader>xp', cmd('lua require("trouble").previous({skip_groups = true, jump = true})'))

-- Treesitter textobjects
for lhs, capture in pairs({
  aa = '@parameter.outer',
  ia = '@parameter.inner',
  af = '@function.outer',
  ['if'] = '@function.inner',
  ac = '@class.outer',
  ic = '@class.inner',
}) do
  vim.keymap.set({ 'x', 'o' }, lhs, function()
    require('nvim-treesitter-textobjects.select').select_textobject(capture, 'textobjects')
  end, { desc = 'Select ' .. capture })
end

for method, mappings in pairs({
  goto_next_start = { [']f'] = '@function.outer', [']]'] = '@class.outer' },
  goto_next_end = { [']F'] = '@function.outer', [']['] = '@class.outer' },
  goto_previous_start = { ['[f'] = '@function.outer', ['[['] = '@class.outer' },
  goto_previous_end = { ['[F'] = '@function.outer', ['[]'] = '@class.outer' },
}) do
  for lhs, capture in pairs(mappings) do
    vim.keymap.set({ 'n', 'x', 'o' }, lhs, function()
      require('nvim-treesitter-textobjects.move')[method](capture, 'textobjects')
    end, { desc = method:gsub('_', ' ') .. ' ' .. capture })
  end
end

vim.keymap.set('n', '<leader>w', function()
  require('nvim-treesitter-textobjects.swap').swap_next('@parameter.inner')
end, { desc = 'Swap with next parameter' })
vim.keymap.set('n', '<leader>W', function()
  require('nvim-treesitter-textobjects.swap').swap_previous('@parameter.inner')
end, { desc = 'Swap with previous parameter' })

-- File explorer
nmap('<leader>e', cmd('Oil'))
nmap('<leader>E', cmd('Oil .'))

-- Telescope
nmap('<leader>T', cmd('Telescope'))
nmap('<leader>tt', cmd('Telescope resume'))
nmap('<leader>tp', cmd('Telescope find_files'))
nmap('<leader>tP', cmd('lua require("telescope.builtin").find_files({ hidden = true, no_ignore = true})'))
nmap('<leader>tf', cmd('Telescope live_grep'))
nmap('<leader>tF', cmd('lua require("telescope.builtin").live_grep({ no_ignore = true})'))

-- Git
nmap('<leader>gp', cmd('Gitsigns prev_hunk'))
nmap('<leader>gn', cmd('Gitsigns next_hunk'))
nmap('[g', cmd('Gitsigns prev_hunk'))
nmap(']g', cmd('Gitsigns next_hunk'))
nmap('<leader>ga', cmd('Gitsigns stage_hunk'))
nmap('<leader>gb', cmd('Gitsigns blame_line'))
nmap('<leader>gd', cmd('Gitsigns diffthis'))
nmap('<leader>gr', cmd('Gitsigns reset_hunk'))

---- Telescope mappings
nmap('<leader>gs', cmd('Telescope git_status'))
nmap('<leader>gB', cmd('Telescope git_branches'))
