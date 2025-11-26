return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},

	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	lazy = false,
	-- 	config = function()
	-- 		local lspconfig = require("lspconfig")
	-- 		local capabilities = require("cmp_nvim_lsp").default_capabilities()
	--
	-- 		vim.lsp.config("lua_ls", {
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		vim.lsp.config("basedpyright", {
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		vim.lsp.config("gopls", {
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		vim.lsp.config("jdtls", {
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		vim.lsp.config("tailwindcss", {
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		vim.lsp.config("jsonls", {
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		vim.lsp.config("eslint", {
	-- 			capabilities = capabilities,
	-- 		})
	--
	-- 		-- vim.lsp.config("tsserver", {
	-- 		-- 	capabilities = capabilities,
	-- 		-- })
	-- 		--
	-- 		-- lspconfig.tsserver.setup({
	-- 		-- 	capabilities = capabilities,
	-- 		-- })
	--
	-- 		local mason_registry = require("mason-registry")
	-- 		local vue_language_server = mason_registry.get_package("vue-language-server"):get_install_path()
	-- 			.. "/node_modules/@vue/language-server"
	--
	-- 		lspconfig.ts_ls.setup({
	-- 			capabilities = capabilities,
	-- 			init_options = {
	-- 				plugins = {
	-- 					{
	-- 						name = "@vue/typescript-plugin",
	-- 						location = vue_language_server,
	-- 						languages = { "vue" },
	-- 					},
	-- 				},
	-- 			},
	-- 			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	-- 		})
	--
	-- 		vim.lsp.enable("lua_ls")
	-- 		vim.lsp.enable("basedpyright")
	-- 		vim.lsp.enable("gopls")
	-- 		vim.lsp.enable("jdtls")
	-- 		vim.lsp.enable("tsserver")
	-- 		vim.lsp.enable("tailwindcss")
	-- 		vim.lsp.enable("jsonls")
	-- 		vim.lsp.enable("eslint")
	--
	-- 		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	-- 		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
	-- 		vim.keymap.set("n", "<leader>grr", vim.lsp.buf.references, {})
	-- 		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	-- 		vim.keymap.set("n", "<leader>grn", vim.lsp.buf.rename, {})
	-- 	end,
	-- },

	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- 1. Setup Capabilities
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- 2. Setup Simple Servers (Loop to keep config clean)
			local servers = {
				"lua_ls",
				"basedpyright",
				"gopls",
				"jdtls",
				"tailwindcss",
				"jsonls",
				"eslint",
			}

			for _, server in ipairs(servers) do
				vim.lsp.config(server, {
					capabilities = capabilities,
				})
			end

			local vue_language_server_path = vim.fn.expand("$MASON/packages")
				.. "/vue-language-server"
				.. "/node_modules/@vue/language-server"

			local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }

			local vue_plugin = {
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue" },
				configNamespace = "typescript",
			}
			local vtsls_config = {
				settings = {
					vtsls = {
						tsserver = {
							globalPlugins = {
								vue_plugin,
							},
						},
					},
				},
				filetypes = tsserver_filetypes,
			}

			local ts_ls_config = {
				init_options = {
					plugins = {
						vue_plugin,
					},
				},
				filetypes = tsserver_filetypes,
			}

			-- If you are on most recent `nvim-lspconfig`
			local vue_ls_config = {}

			vim.lsp.config("vtsls", vtsls_config)
			vim.lsp.config("vue_ls", vue_ls_config)
			vim.lsp.config("ts_ls", ts_ls_config)
			vim.lsp.enable({ "vtsls", "vue_ls" })

			-- 4. Keymaps (Global LSP mappings)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>grr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>grn", vim.lsp.buf.rename, {})
		end,
	},
}
