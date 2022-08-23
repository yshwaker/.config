return {
	server = {
		on_attach = function(client, _)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
		end,
	},
}
