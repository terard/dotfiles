return {
	"yetone/avante.nvim",
	enabled = false,
	event = "VeryLazy",
	lazy = false,
	version = false, -- set this if you want to always pull the latest change
	build = "make BUILD_FROM_SOURCE=true",
	--build = "make",
	opts = {
		provider = "ollama",
		vendors = {
			---@type AvanteProvider
			ollama = {
				["local"] = true,
				endpoint = "127.0.0.1:11434/v1",
				--model = "codegemma",
				--model = "llama3.1:405b",
				--model = "llama3.1",
				model = "gemma2",
				parse_curl_args = function(opts, code_opts)
					return {
						url = opts.endpoint .. "/chat/completions",
						headers = {
							["Accept"] = "application/json",
							["Content-Type"] = "application/json",
						},
						body = {
							model = opts.model,
							messages = require("avante.providers").copilot.parse_message(code_opts), -- you can make your own message, but this is very advanced
							max_tokens = 2048,
							stream = true,
						},
					}
				end,
				parse_response_data = function(data_stream, event_state, opts)
					require("avante.providers").openai.parse_response(data_stream, event_state, opts)
				end,
			},
		},
	},
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
