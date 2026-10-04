return {
	--Apps
	browser = "zen-browser",
	fileExplorer = "dolphin",
	editor = "nvim",

	-- Modifier only, the actual binds will be mod + 0-9. These should be strings and not arrays.
	kbMoveWinToWs = "SUPER + SHIFT",

	--Workspaces
	kbPrevWs = { "SUPER + mouse_up", "SUPER + U", "SUPER + Page_Up" },
	kbNextWs = { "SUPER + mouse_down", " SUPER + I", "SUPER + Page_Down" },

	--Misc
	kbLock = "SUPER + CTRL + L",
	kbEditor = "",
}
