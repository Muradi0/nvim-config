-- return {
-- 	{
-- 		"catppuccin/nvim",
-- 		lazy = false,
-- 		name = "catppuccin",
-- 		priority = 1000,
-- 		config = function()
-- 			require("catppuccin").setup({
-- 				color_overrides = {
-- 					frappe = {},
-- 					macchiato = {},
-- 					mocha = {
-- 						base = "#000000",
-- 						mantle = "#000000",
-- 						crust = "#000000",
-- 					},
-- 				},
-- 			})
-- 			vim.cmd.colorscheme("catppuccin-mocha")
-- 		end,
-- 	},
-- }

return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                term_colors = true,
                transparent_background = false,
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                },
                color_overrides = {
                    mocha = {
                        -- The Base: Deep, high-contrast dark purple
                        base = "#0d0a12",   -- Very dark purple-black
                        mantle = "#09070c", -- Even darker for UI elements
                        crust = "#050406",  -- Darkest "border" color
                        -- The Accents: High contrast reds and purples
                        red = "#ff4d6d",    -- Vibrant dark red/pink for errors/tags
                        maroon = "#e01e37", -- Deep blood red
                        mauve = "#c77dff",  -- Bright purple for keywords
                        pink = "#f15bb5",   -- Neon pink-purple for constants
                        -- UI Elements
                        surface0 = "#2d2a3d", -- Selection/Line highlights
                        text = "#e0def4",     -- High contrast off-white text
                    },
                },
                integrations = {
                    telescope = { enabled = true },
                    treesitter = true,
                    notify = true,
                    mini = true,
                },
            })
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },
}

