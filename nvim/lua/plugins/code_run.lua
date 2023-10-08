return {
	--Code-runner
	{
		"CRAG666/code_runner.nvim",
		opts = {
			filetype = {
				java = "cd $dir && javac -d . $fileName && java $fileNameWithoutExt && rm $fileNameWithoutExt.class",
				python = "python3 -u",
				typescript = "deno run",
				rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
				javascript = "cd $dir && node $fileName",
			},
			-- project
			project = {
				["~/codes/java/projects/chat-app/"] = {
					name = "chat-app",
					description = "test",
					file_name = "src/main/java/code/server.java",
					command = "mvn clean package && java -cp target/chat-app-0.1.jar: code.App",
				},
			},
			startinsert = true,
		},
		keys = {
			{ "<leader>rc", "<cmd>RunCode<CR>", desc = "RunCode" },
			{ "<leader>rf", "<cmd>RunFile<CR>", desc = "RunFile" },
			{ "<leader>rp", "<cmd>RunProject<CR>", desc = "RunProject" },
		},
	},

	--overseer
	{
		"stevearc/overseer.nvim",
		cmd = {
			"OverseerRun",
			"OverseerToggle",
			"OverseerBuild",
			"OverseerOpen",
		},
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1,
				bindings = {
					["q"] = function()
						vim.cmd("OverseerClose")
					end,
				},
			},
		},
	},
}
