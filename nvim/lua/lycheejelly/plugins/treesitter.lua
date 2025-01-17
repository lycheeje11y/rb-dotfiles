return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter =require("nvim-treesitter.configs")
		
		treesitter.setup({
			highlight = {
				enable = true,
			},
			indent = {enable = true},
			ensure_installed = {
				"json",
				"javascript",
				"arduino",
				"bash",
				"c",
				"c_sharp",
				"cpp",
				"css",
				"csv",
				"dart",
				"dockerfile",
				"fish",
				"lua",
				"markdown",
				"markdown_inline",
				"rust",
				"scss",
				"sql",
				"typescript",
				"vim",
				"zig"
			},
			incremental_selection = {
				enable = true,
				keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>"
			}
		},
	})
	end
}
