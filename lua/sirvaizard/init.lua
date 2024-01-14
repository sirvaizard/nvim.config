require("sirvaizard.remap")
require("sirvaizard.set")
require("sirvaizard.lazy")

local augroup = vim.api.nvim_create_augroup
local SirVaizardGroup = augroup('SirVaizard', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    group = SirVaizardGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

vim.g.newtrw_browse_split = 0
vim.g.newtr_banner = 0
vim.g.newtr_winsize = 25
