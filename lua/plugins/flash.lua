return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
		},
		config = function(_, opts)
			require("flash").setup(opts)

			-- LazyVim's own flash spec registers the treesitter keys, and lazy.nvim
			-- merges `keys` lists instead of replacing them, so the only way to
			-- drop them is to delete the mappings after the plugin has loaded.
			-- Only delete flash's mappings: vim-surround owns `S` in visual mode.
			local drop = {
				{ "S", { "n", "o", "x" }, "Flash Treesitter" },
				{ "R", { "o", "x" }, "Treesitter Search" },
				{ "r", { "o" }, "Remote Flash" },
				{ "<C-Space>", { "n", "o", "x" }, "Treesitter Incremental Selection" },
			}
			for _, item in ipairs(drop) do
				for _, mode in ipairs(item[2]) do
					local m = vim.fn.maparg(item[1], mode, false, true)
					if m and m.desc == item[3] then
						pcall(vim.keymap.del, mode, item[1])
					end
				end
			end

			-- Loading flash also re-registers its `S` key in visual mode, which
			-- overwrites vim-surround's `S`. Put vim-surround's mapping back.
			if vim.fn.maparg("<Plug>VSurround", "x") ~= "" then
				vim.keymap.set("x", "S", "<Plug>VSurround", { remap = true, silent = true })
			end
		end,
	},
}
