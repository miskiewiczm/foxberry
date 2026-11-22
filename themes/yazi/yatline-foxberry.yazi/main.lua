-- Foxberry theme for yatline.yazi.
-- Part of Foxberry, a light Nord theme. MIT license; see LICENSE and THIRD_PARTY_NOTICES.md.

-- Accents darkened to >= 4.5:1 on the light background (Foxberry palette).
-- Blues are lighter than the other accents: section A uses the same tints
-- as the Starship segments; the path and file count use nord10.
local c = {
	mode = { normal = "#A7BDD4", select = "#ACD3DE", un_set = "#DEAB9B" },
	style_b = { bg = "#C9D0DC", fg = "#3B4252" }, -- like section B of the bottom bar
	-- section C has no background of its own: Ghostty applies background-opacity only to
	-- the default background, so an explicit #E5E9F0 came out opaque and "white".
	-- Needs show_background = true in init.lua, otherwise the rounded ends of section C
	-- are drawn in the text color instead of disappearing.
	style_c = { bg = "reset", fg = "#5E81AC" },
	green = "#4E8044",
	yellow = "#967044",
	red = "#BE525A",
	cyan = "#287F92",
	blue = "#5E81AC",
	purple = "#986393",
	perm_sep = "#8E97A8",
	-- bottom bar like lualine in nvim: full background, sections one step darker than
	-- the terminal background #E5E9F0 (B #C9D0DC, C #D8DEE9). The top bar has no background.
	-- Swapped in only while the status bar is drawn (init.lua).
	status_b = { bg = "#C9D0DC", fg = "#3B4252" },
	status_c = { bg = "#D8DEE9", fg = "#3F79A8" },
	-- tab in the top bar: teal (nord7 pastel); select/unset modes unchanged
	header_tab = "#B6D3D2",
}

return {
	setup = function()
		return {
			section_separator = { open = "", close = "" },
			part_separator = { open = "", close = "" },
			inverse_separator = { open = "", close = "" },

			-- section A: dark text on a pastel
			style_a = {
				fg = "black",
				bg_mode = c.mode,
			},
			style_b = c.style_b,
			style_c = c.style_c,

			permissions_t_fg = c.green,
			permissions_r_fg = c.yellow,
			permissions_w_fg = c.red,
			permissions_x_fg = c.cyan,
			permissions_s_fg = c.perm_sep,

			selected = { icon = "󰻭", fg = c.yellow },
			copied = { icon = "", fg = c.green },
			cut = { icon = "", fg = c.red },

			files = { icon = "", fg = c.blue },
			filtereds = { icon = "", fg = c.purple },

			total = { icon = "󰮍", fg = c.yellow },
			success = { icon = "", fg = c.green },
			failed = { icon = "", fg = c.red },
		}
	end,

	-- Section B and C styles for the bottom bar
	status_styles = function()
		return c.status_b, c.status_c
	end,

	-- Tab background in the top bar in normal mode
	header_tab = function()
		return c.header_tab
	end,
}
