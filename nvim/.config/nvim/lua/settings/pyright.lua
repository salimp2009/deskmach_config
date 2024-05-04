return {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				-- reportOptionalMemberAccess = false,
				-- diagnosticMode = "workspace",
				inlayHints = {
					variableTypes = true,
					functionReturnTypes = true,
				},
			},
		},
	},
}
