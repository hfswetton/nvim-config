local lsp = require('lspconfig')
local coq = require('coq')

local custom_attach = function()
    coq.on_attach()
    -- Python specifically isn't setting omnifunc correctly, ftplugin conflict
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

lsp.pylsp.setup{on_attach=custom_attach}
