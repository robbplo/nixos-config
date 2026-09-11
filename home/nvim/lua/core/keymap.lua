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

-- Barbar
---- Move to previous/next buffer
vim.keymap.set('', '<A-h>', cmd('BufferPrevious'), { noremap = true })
vim.keymap.set('', '<A-l>', cmd('BufferNext'), { noremap = true })
vim.keymap.set('', '<A-Left>', cmd('BufferPrevious'), { noremap = true })
vim.keymap.set('', '<A-Right>', cmd('BufferNext'), { noremap = true })
vim.keymap.set('', '[b', cmd('BufferPrevious'), { noremap = true })
vim.keymap.set('', ']b', cmd('BufferNext'), { noremap = true })
---- Goto buffer in position...
map('<A-1>', cmd('BufferGoto 1'))
map('<A-2>', cmd('BufferGoto 2'))
map('<A-3>', cmd('BufferGoto 3'))
map('<A-4>', cmd('BufferGoto 4'))
map('<A-5>', cmd('BufferGoto 5'))
map('<A-6>', cmd('BufferGoto 6'))
map('<A-7>', cmd('BufferGoto 7'))
map('<A-8>', cmd('BufferGoto 8'))
map('<A-9>', cmd('BufferGoto 9'))
map('<A-0>', cmd('BufferLast'))
---- Pin/unpin buffer
map('<A-p>', cmd('BufferPin'))
---- Close buffer
map('<A-c>', cmd('BufferClose'))
map('<A-C>', cmd('BufferCloseAllButCurrentOrPinned'))
map('<leader>bd', cmd('BufferClose'))
map('<leader>bD', cmd('BufferCloseAllButCurrentOrPinned'))

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

vim.keymap.set('n', '<leader>a', function()
  require('nvim-treesitter-textobjects.swap').swap_next('@parameter.inner')
end, { desc = 'Swap with next parameter' })
vim.keymap.set('n', '<leader>A', function()
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
nmap('<leader>gb', cmd('Gitsigns blame_line'))
nmap('<leader>gd', cmd('Gitsigns diffthis'))
nmap('<leader>gr', cmd('Gitsigns reset_hunk'))

---- Telescope mappings
nmap('<leader>gs', cmd('Telescope git_status'))
nmap('<leader>gB', cmd('Telescope git_branches'))
