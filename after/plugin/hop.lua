local hop = require('hop')
hop.setup()
local directions = require('hop.hint').HintDirection
vim.keymap.set('', '<leader>f', hop.hint_char1, {remap=true})
