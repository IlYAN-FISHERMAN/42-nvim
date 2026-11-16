-- Sur NixOS, le clangd de Mason cherche les en-têtes standard dans /usr/include, absent ici.
-- On prend alors celui de Nix (home/dev.nix dans nixos-config), qui sait où ils sont.
local clangd = "/etc/profiles/per-user/" .. (vim.env.USER or "") .. "/bin/clangd"
if vim.fn.executable(clangd) == 0 then
	clangd = "clangd"
end

return {
	clangd = {
		-- filetypes = {
		-- 	'c', 'h', 'm',
		-- 	'mm', 'cc',
		-- 	'cpp', 'cxx', 'c++', 'hpp', 'hxx', 'h++', 'tpp', 'ipp'
		-- },
		filetypes = {
			"c",
			"hpp",
			"cpp",
			"hpp",
			"hh",
			"objc",
			"objcpp",
			"cuda",
		},
		cmd = {
			clangd,
			'--header-insertion=never',
			'-j=4',
			'--background-index',
			'--background-index-priority=low',
			"--compile-commands-dir=" .. vim.env.HOME .. "/travail/repo/libftpp",
			"--compile-commands-dir=" .. vim.env.HOME .. "/travail/repo/libftpp/build",
			"--compile-commands-dir=build",
		}
	},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},

	cmake = { filetypes = { 'cmake', 'CMakeLists.txt' } },
	html = { filetypes = { 'html', 'twig', 'hbs' } },
	ts_ls = {},
}
