local config = {
	defaults = {
		variant = "veil", -- nyxvamp variant: "radiance" (light), "veil" (dark), "obsidian" (very dark)
		transparent = false,
		italics = {
			comments = true,
			keywords = true,
			functions = true,
			strings = true,
			variables = true,
			bufferline = false,
		},
		overrides = {},
	},
}

setmetatable(config, { __index = config.defaults })

return config
