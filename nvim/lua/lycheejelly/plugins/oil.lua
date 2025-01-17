return {
	"stevearc/oil.nvim",
	--@module 'oil'
	--@type oil.SetupOpts
	opts = {},
	dependencies = {
		{
			"DaikyXendo/nvim-material-icon",
			config = function()
				require("nvim-web-devicons").setup({
					color_icons = true,
					default = true,
				})
			end,
		},
	},
	config = function()
		require("oil").setup()
		vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
	end,
}
