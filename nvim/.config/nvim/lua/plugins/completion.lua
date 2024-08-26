--require("cmp").setup({
--sources = {
--{ name = "buffer" },
--},
--})
--return {
--"hrsh7th/cmp-buffer",
----main = "cmp",
--opts = {},
--config = function()
--require("cmp").setup({
--sources = {
--{ name = "buffer" },
--},
--})
--end,
--}

--return {
--"hrsh7th/cmp-buffer",
---- load cmp on InsertEnter
----event = "InsertEnter",
---- these dependencies will only be loaded when cmp loads
---- dependencies are always lazy-loaded unless specified otherwise
----dependencies = {
----"hrsh7th/cmp-nvim-lsp",
----"hrsh7th/cmp-buffer",
----},
--config = function()
--require("cmp_buffer").setup({
--sources = {
--{ name = "buffer" },
--},
--})
--end,
--}
return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip", -- Snippet engine
			"rafamadriz/friendly-snippets", -- Predefined snippets
			"saadparwaiz1/cmp_luasnip", -- Completion source for LuaSnip
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			-- Load all friendly snippets
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip").filetype_extend("ruby", { "rails" })
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				--sources = {
				--{ name = "buffer" },
				--{ name = "path" },
				---- You can add other sources here, like lsp, path, etc.
				--},
				sources = cmp.config.sources({
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
					-- Add other sources here if needed
				}),
				--mapping = cmp.mapping.preset.insert({
				--["<C-d>"] = cmp.mapping.scroll_docs(-4),
				--["<C-f>"] = cmp.mapping.scroll_docs(4),
				--["<C-y>"] = cmp.mapping.complete(),
				--["<C-e>"] = cmp.mapping.close(),
				--["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
				--}),
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				-- You can add more settings here
			})
			-- Setup for `/` (search) and `:` (cmdline) completion
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
}
