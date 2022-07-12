local status_ok, ts_utils = pcall(require, "nvim-lsp-ts-utils")
if not status_ok then
	return
end

return {
	on_attach = function(client)
		ts_utils.setup {}
		ts_utils.setup_client(client)
	end,
}
