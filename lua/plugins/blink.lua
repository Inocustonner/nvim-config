return {
	{
		"saghen/blink.cmp",
		optional = true, -- no-op unless the coding.blink extra is enabled
		opts = {
			keymap = { preset = "default" },
			cmdline = { enabled = false }, -- keep the `:` command line vanilla (no popup above it)
			appearance = { nerd_font_variant = "mono" },
			-- No automatic docs popup: every auto-show makes blink request docs from
			-- idris2_lsp (which typechecks to produce them) on each menu selection.
			-- `<C-space>` still shows docs on demand.
			completion = { documentation = { auto_show = false } },
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			fuzzy = { implementation = "lua" },
		},
	},
}
