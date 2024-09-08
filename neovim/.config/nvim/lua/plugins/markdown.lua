return {
	{
		'iamcco/markdown-preview.nvim',
		ft = {'markdown'},
		build = function()
			vim.cmd [[Lazy load markdown-preview.nvim]]
			vim.fn["mkdp#util#install"]()
		end,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	},
}
