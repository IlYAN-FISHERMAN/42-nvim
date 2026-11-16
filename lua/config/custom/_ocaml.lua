vim.lsp.config("ocamllsp", {
	cmd = { "opam", "exec", "--switch=ocaml-clean", "--", "ocamllsp" },

	filetypes = {
		"ocaml",
		"ocamlinterface",
		"ocamllex",
		"menhir",
		"reason",
		"dune",
	},

	root_markers = {
		{ "dune-project", "dune-workspace" },
		{ "*.opam",       "opam",          "esy.json", "package.json" },
		".git",
	},
})

vim.lsp.enable("ocamllsp")
