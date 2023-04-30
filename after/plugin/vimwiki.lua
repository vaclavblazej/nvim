-- vimwiki setup
vim.g.vimwiki_list = {
    {
        path = "~/Dropox/info/notes/",
        auto_tags = 1,
        auto_toc = 1,
        syntax = 'markdown',
        ext = '.md'
    }
}
-- { "path":"~/Dropbox/info/notes/zettel" }
vim.g.vimwiki_use_mouse = 1
vim.g.vimwiki_folding = 'expr'
vim.g.vimwiki_auto_chdir = 1

-- let g:vimwiki_list = [{
--             \ "path":"~/Dropbox/info/notes/",
--             \ 'auto_tags': 1,
--             \ 'auto_toc': 1,
--             \ 'syntax': 'markdown',
--             \ 'ext': '.md'
--             \ },{"path":"~/Dropbox/info/notes/zettel"}]
-- let g:vimwiki_use_mouse = 1
-- let g:vimwiki_folding = 'expr'
-- let g:vimwiki_auto_chdir = 1
