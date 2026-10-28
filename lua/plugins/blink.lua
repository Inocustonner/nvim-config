return {
	{
		"saghen/blink.cmp",
		optional = true, -- no-op unless the coding.blink extra is enabled
		opts = {
			keymap = { preset = "default" },
			-- cmdline = { enabled = false }, -- keep the `:` command line vanilla (no popup above it)
			appearance = { nerd_font_variant = "mono" },
			completion = { documentation = { auto_show = true, auto_show_delay_ms = 300 } },
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			fuzzy = { implementation = "lua" },
		},
	},
}
