vim.g.mapleader = ";"
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
vim.keymap.set("n", "<leader>gc", vim.lsp.buf.code_action, {buffer=0})
vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, {buffer=0})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {buffer=0})
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {buffer=0})
require('lspconfig')['gopls'].setup {
    on_attach = function()
    	vim.keymap.set("n", "ga", "<cmd>GoAlternate<cr>", {buffer=0})
        vim.keymap.set("n", "dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
        vim.keymap.set("n", "go", "<cmd>GoDoc<cr>", {buffer=0})
        vim.keymap.set("n", "ge", "<cmd>GoIfErr<cr>", {buffer=0})
        vim.keymap.set("n", "ds", "<cmd>GoDebugStart<cr>", {buffer=0})
        vim.keymap.set("n", "dt", "<cmd>GoDebugStop<cr>", {buffer=0})
        vim.keymap.set("n", "db", "<cmd>GoDebugBreakpoint<cr>", {buffer=0})
        vim.keymap.set("n", "dc", "<cmd>GoDebugContinue<cr>", {buffer=0})
    end,
    capabilities = capabilities
}

