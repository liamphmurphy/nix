set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set title
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber          " add relative line numbers on all but the current line
set wildmode=longest,list   " get bash-like tab completions
" set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

" plugins

let mapleader = ";"

filetype plugin on


" Go Lua and fancy things
autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)
" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Telescope remappings
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').git_commits()<cr>

set completeopt=menu,menuone,noselect

" NERDTree remappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" Floatererm remappings
nnoremap <silent> <Leader>t   :FloatermToggle cd %:p:h<CR>
tnoremap <silent> <Leader>t   <C-\><C-n>:FloatermToggle<CR>

lua << EOF
require('telescope').load_extension('fzf')
EOF

lua << EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
EOF


lua <<EOF
  require("nvim-tree").setup() 
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

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
EOF

