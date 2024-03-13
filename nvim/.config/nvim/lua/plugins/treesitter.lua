return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			sync_install = false,
			auto_install = true,
			ensure_installed = { "lua" },
			ignore_install = { "javascript" },
			highlight = {
				enable = true,
			},
			indent = { enable = true },
		})
	end,
}
