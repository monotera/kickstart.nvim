-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Extra settings
config.window_decorations = "RESIZE"
config.audible_bell = "Disabled"
config.color_scheme = "Dracula (Official)"
config.use_fancy_tab_bar = false
config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = false })
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.foreground_text_hsb = {
	hue = 1.0,
	saturation = 1.3,
	brightness = 1.0,
}

-- keys shortcuts
config.keys = {
	{
		key = "r",
		mods = "CMD|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
	{
		key = "|",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

-- Background settings
function getRandomPhoto()
	local basePath = "/home/monotera/Downloads/bg/" -- Path to the background images folder
	local photoFiles = {} -- Table to store photo file names

	-- Execute shell command to list files in the downloads folder
	local command = "ls " .. basePath
	local fileHandle = io.popen(command)
	if fileHandle then
		for file in fileHandle:lines() do
			-- Check if the file is a JPEG photo
			if file:match("%.jpg$") then
				table.insert(photoFiles, file) -- Add the photo file name to the table
			end
		end
		fileHandle:close()
	end

	-- Check if there are any JPEG photo files in the folder
	if #photoFiles > 0 then
		-- Pick a random JPEG photo file from the table
		local randomIndex = math.random(1, #photoFiles)
		local randomPhoto = photoFiles[randomIndex]
		return basePath .. randomPhoto -- Return the path to the random photo
	else
		return nil -- Return nil if no JPEG photo files are found
	end
end

local dimmer = { brightness = 0.05, saturation = 1.5 }

local randomPhotoPath = getRandomPhoto()
if randomPhotoPath then
	config.background = {
		-- This is the deepest/back-most layer. It will be rendered first
		{
			source = {
				File = randomPhotoPath,
			},
			hsb = dimmer,
		},
	}
end

-- and finally, return the configuration to wezterm
return config
