-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
-- https://www.youtube.com/watch?v=w7i4amO_zaE

-- using vim help
--  :help            to open help pages
--  :help <command>  to learn about command
--  <Ctrl>]          jump to section (under cursor)
--  <Ctrl>o          jump back

require('blazeva1')

-- " Airline style for the bottom status bar
-- Plug 'https://github.com/vim-airline/vim-airline'
-- Plug 'https://github.com/vim-airline/vim-airline-themes' " AirlineTheme peaksea
-- " Underline the word which is currently under cursor
-- Plug 'https://github.com/itchyny/vim-cursorword'

-- if has("autocmd")
    -- autocmd FileType makefile setlocal noexpandtab " makefiles need tabs to work
    -- autocmd Filetype tex,txt set spell
    -- autocmd InsertEnter * highlight CursorLine ctermbg=DarkBlue
    -- autocmd InsertLeave * highlight CursorLine ctermbg=Black
    -- autocmd BufNewFile,BufRead *.tsx set syntax=ts
-- endif
