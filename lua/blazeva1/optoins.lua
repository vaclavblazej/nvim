vim.g.mapleader = ' '      -- set the <leader> key
vim.g.maplocalleader = ' ' -- set the <localleader> key

-- read about these by typing :options

vim.opt.number = true            -- line numbering
vim.opt.relativenumber = true    --   with relative numbering from the current line

vim.opt.expandtab = true         -- use spaces instead of tabs
vim.opt.tabstop = 4              --   each tab counts for 4 spaces
vim.opt.shiftwidth = 4           --   indentation width is 4 spaces

vim.opt.wrap = true              -- softwraps
vim.opt.linebreak = true         --   prevent linebreaking in the middle of words
vim.opt.breakindent = true       --   the wrapped line indents the wraps as well
vim.opt.smartindent = true

vim.opt.swapfile = false         -- rather than using swapfile, use undotree '<leader>u'
vim.opt.backup = false
vim.opt.undofile = true          -- enable saving of the file history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.wildmenu = true          -- display all options when tab-completing
vim.opt.background = 'dark'      -- prevent possible glithes before theme loads

vim.opt.hlsearch = true          -- highlight matches when searching
vim.opt.incsearch = true         --   incremental highlight of search
vim.opt.ignorecase = true        --   ignore case by default
vim.opt.smartcase = true         --     but turn on cases when big letter is typed

vim.opt.termguicolors = true

vim.opt.mouse = 'a'              -- allow mouse usage

vim.opt.timeoutlen = 400         -- shorter timeout for <leader> wait
vim.opt.updatetime = 200         -- time in msec after which the swap file will be updated
vim.opt.scrolloff = 8            -- don't let the carret go to the top/bottom edge
vim.opt.foldenable = false       -- no autofolding
vim.opt.autoread = true          -- load file changes automatically when no local changes were made
vim.opt.colorcolumn = "80"       -- colored column to show common limit on linewidth

vim.opt.list = true              -- display some whitespace characters
-- vim.highlight['SpecialKey'] ctermfg=darkgrey guifg=grey70
vim.opt.listchars = {            --   set how those characters should look like
    tab='▸-',
    trail='.',
    nbsp='+',
}

-- set vim clipboard to be the same as system clipboard
-- requires 'sudo apt install xclip'
vim.opt.clipboard = "unnamedplus"

-- vim.opt.cursorline = true
--print(vim.highlight['CursorLine']) -- .cterm = nil
--for k,v in pairs(vim.highlight.priorities) do print(k,v) end
-- clear CursorLine
-- highlight CursorLine cterm=None ctermbg=Black ctermfg=None
