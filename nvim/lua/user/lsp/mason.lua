local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok2 then
	return
end

local servers = {
	"tsserver",
	"jsonls",
	"sumneko_lua",
}

mason.setup()
mason_lspconfig.setup {
	ensure_installed = servers,
	automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server == "jsonls" then
		local jsonls_opts = require "user.lsp.settings.jsonls"
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server == "sumneko_lua" then
		local sumneko_opts = require "user.lsp.settings.sumneko_lua"
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server == "tsserver" then
		local tsserver_opts = require "user.lsp.settings.tsserver"
		local typescipt_status_ok, typescript = pcall(require, "typescript")
		if not typescipt_status_ok then
			return
		end

		typescript.setup(tsserver_opts)
		goto continue
	end

	lspconfig[server].setup(opts)
	::continue::
end
