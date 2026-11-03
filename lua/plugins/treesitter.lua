return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		opts = function(_, opts)
			-- LazyVim maps ]f/[f/]c/[c/]a/[a (and the uppercase variants) to
			-- treesitter textobjects. Turn the whole move feature off; add your
			-- own keys here later if you want some of them back.
			opts.move = opts.move or {}
			opts.move.enable = false
			return opts
		end,
	},
	{
		"nvim-mini/mini.ai",
		opts = function(_, opts)
			-- Drop the treesitter-backed text objects: af/if, ac/ic, ao/io.
			-- Arguments (aa/ia), brackets, quotes, etc. are unaffected.
			opts.custom_textobjects = opts.custom_textobjects or {}
			opts.custom_textobjects.f = false
			opts.custom_textobjects.c = false
			opts.custom_textobjects.o = false

			-- LazyVim's which-key helper advertises every object regardless of
			-- this config, so hide the entries for the objects we just removed.
			local orig = LazyVim.mini.ai_whichkey
			LazyVim.mini.ai_whichkey = function(o)
				orig(o)
				local hide = {}
				for _, prefix in ipairs({ "a", "i", "an", "in", "al", "il" }) do
					for _, object in ipairs({ "f", "c", "o" }) do
						hide[#hide + 1] = { prefix .. object, hidden = true }
					end
				end
				require("which-key").add(hide, { notify = false })
			end
			return opts
		end,
	},
}
