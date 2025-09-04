--Don't worry about this
local addon, ns = ...
local Version = _G.C_AddOns.GetAddOnMetadata(addon, "Version")

--Cache Lua / WoW API
local format = string.format
local GetCVarBool = GetCVarBool
local ReloadUI = ReloadUI
local StopMusic = StopMusic
local tconcat = _G.table.concat

-- These are things we do not cache
-- GLOBALS: PluginInstallStepComplete, PluginInstallFrame

--Change this line and use a unique name for your plugin.
local MyPluginName = "|cff00b3ffJiberish UI|r"
--"|cff0DB1D0J|cff15A6D1i|cff1D9CD3b|cff2691D5e|cff2E87D6r|cff367DD8i|cff3F72DAs|cff4768DCh |cff5853DFU|cff6049E1I|r"
--"|cFF4668dcJ|cFF5268d7i|cFF5d68d3b|cFF6969cee|cFF7569car|cFF8069c5i|cFF8c69c1s|cFF986abch |cFFa36ab8U|cFFaf6ab3I|r"
--Create references to ElvUI internals
local E, L, V, P, G = unpack(ElvUI)

--Create reference to LibElvUIPlugin
local EP = LibStub("LibElvUIPlugin-1.0")

--Create a new ElvUI module so ElvUI can handle initialization when ready
local JiberishUI = E:NewModule(MyPluginName, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0");

-- example of credits if you want to add some
local CREDITS = {
    "|cff0DB1D0J|r|cff18A2D2i|r|cff2494D4b|r|cff2F86D7e|r|cff3B78D9r|r|cff4669DBi|r|cff525BDEs|r|cff5D4DE0h|r - Author",
    '|cff82B4ffEltreum|r - Programming, Inspiration, LEGEND!',
    '|cffec1000Trenchy|r, |cff00baffBlinkii|r, |cffec1000Repooc|r, Pastafarian, Thurin, Claq, Stoned, Vxt, Fab, Dlarge, Pasch, Rebelmania, Nerdzilla, Merathilis, Benik, Tukui.org, and the amazing ElvUI Discord community! Every Fabled Myth, Legend, Immortal, and Eternal... THANK YOU!',

  }
local CREDITS_STRING = tconcat(CREDITS, '|n')

--This function will hold your layout settings
local function SetupLayout(layout)

	--import eltruism nameplates
	if E.private.nameplates.enable then
		JiberishUI:EltruismNPSettings()
	end

	--import gradient mode
	ElvUI_EltreumUI:GradientMode()

	--set Eltruism defaults (some of which will be disabled on profiles)
	--ElvUI_EltreumUI:UpdateEltruismSettings()

	--setup general settings/datapanel creation
	JiberishUI:General()

	--import details profile
	JiberishUI:Details(layout)

	--profile specific settings (layouts)
	if layout == "JiberishAllusive" then
		JiberishUI:JiberishAllusive()
	elseif layout == "JiberishAndromeda" then
		JiberishUI:JiberishAndromeda()
	elseif layout == "JiberishCaith" then
		JiberishUI:JiberishCaith()
	elseif layout == "JiberishImmersed" then
		JiberishUI:JiberishImmersed()
	elseif layout == "JiberishImpulse" then
		JiberishUI:JiberishImpulse()
	elseif layout == "JiberishMidnight" then
		JiberishUI:JiberishMidnight()
	elseif layout == "JiberishVerticality" then
		JiberishUI:JiberishVerticality()
	elseif layout == "JiberishVXT" then
		JiberishUI:JiberishVXT()
	elseif layout == "JiberishWoven" then
		JiberishUI:JiberishWoven()
	end

	-- this is so eltruism doesn't popup after
	if not E.private.ElvUI_EltreumUI.install_version then
		local privateKey = _G.ElvPrivateDB.profileKeys and _G.ElvPrivateDB.profileKeys[E.mynameRealm]
		if privateKey then
			_G.ElvPrivateDB.profiles[privateKey]["ElvUI_EltreumUI"]["install_version"] = ElvUI_EltreumUI.Version
		end
	else
		E.private.ElvUI_EltreumUI.install_version = ElvUI_EltreumUI.Version
	end

	--fix the colors after the profile
	JiberishUI:FixClassColors()

	--disable here since profiles might have nameplate settings
	--E.private["nameplates"]["enable"] = false --keep this in mind, you'll need to comment out the nameplate sections of the profiles

	--Update ElvUI
	E:StaggeredUpdateAll()

	--Show message about layout being set
	_G.PluginInstallStepComplete.message = "|cFF4668dcJ|cFF5268d7i|cFF5d68d3b|cFF6969cee|cFF7569car|cFF8069c5i|cFF8c69c1s|cFF986abch |cFFa36ab8U|cFFaf6ab3I|r".." Layout Set"
	_G.PluginInstallStepComplete:Show()
end

--This function is executed when you press "Skip Process" or "Finished" in the installer.
local function InstallComplete()
	if GetCVarBool("Sound_EnableMusic") then
		StopMusic()
	end

	--Set a variable tracking the version of the addon when layout was installed
	E.db[MyPluginName].install_version = Version
	E.private.install_complete = E.version

	ReloadUI()
end

--This is the data we pass on to the ElvUI Plugin Installer.
--The Plugin Installer is reponsible for displaying the install guide for this layout.
local InstallerData = {
	Title = "|cFF4668dcJ|cFF5268d7i|cFF5d68d3b|cFF6969cee|cFF7569car|cFF8069c5i|cFF8c69c1s|cFF986abch |cFFa36ab8U|cFFaf6ab3I|r",
	Name = "|cFF4668dcJ|cFF5268d7i|cFF5d68d3b|cFF6969cee|cFF7569car|cFF8069c5i|cFF8c69c1s|cFF986abch |cFFa36ab8U|cFFaf6ab3I|r",
	tutorialImage = "Interface\\AddOns\\ElvUI_JiberishUI\\logo.tga", --If you have a logo you want to use, otherwise it uses the one from ElvUI
	Pages = {
		[1] = function()
			ElvUI_EltreumUI:ResizeInstall()
			ElvUI_EltreumUI:ImproveInstall()

			_G.PluginInstallFrame.SubTitle:SetText("Welcome to the installation for |cFF4668dcJ|cFF5268d7i|cFF5d68d3b|cFF6969cee|cFF7569car|cFF8069c5i|cFF8c69c1s|cFF986abch |cFFa36ab8U|cFFaf6ab3I|r")
			_G.PluginInstallFrame.Desc1:SetText("This installation process will guide you through a few steps and create a new ElvUI profile.")
			_G.PluginInstallFrame.Desc2:SetText("Please press the continue button if you wish to go through the installation process, otherwise click the 'Skip Process' button.")
			_G.PluginInstallFrame.Option1:Show()
			_G.PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			_G.PluginInstallFrame.Option1:SetText("Skip Process")

			_G.PluginInstallFrame.Option2:Hide()
			_G.PluginInstallFrame.Option3:Hide()
			_G.PluginInstallFrame.Option4:Hide()

			_G.PluginInstallFrame.Option1:SetScript('OnEnter', nil)
			_G.PluginInstallFrame.Option1:SetScript('OnLeave', nil)
			_G.PluginInstallFrame.Option2:SetScript('OnEnter', nil)
			_G.PluginInstallFrame.Option2:SetScript('OnLeave', nil)
			_G.PluginInstallFrame.Option3:SetScript('OnEnter', nil)
			_G.PluginInstallFrame.Option3:SetScript('OnLeave', nil)
			_G.PluginInstallFrame.Option4:SetScript('OnEnter', nil)
			_G.PluginInstallFrame.Option4:SetScript('OnLeave', nil)

		end,
		[2] = function()
			ElvUI_EltreumUI:ResizeInstall()

			_G.PluginInstallFrame.SubTitle:SetText("Layouts 1")
			_G.PluginInstallFrame.Desc1:SetText("These are the layouts that are available. Please click a button below to apply the layout of your choosing.")
			_G.PluginInstallFrame.Desc2:SetText("Importance: |cff07D400High|r")

			_G.PluginInstallFrame.Option1:Show()
			_G.PluginInstallFrame.Option1:SetScript("OnClick", function()
				SetupLayout("JiberishAllusive")
			end)
			_G.PluginInstallFrame.Option1:SetText("Allusive")
			_G.PluginInstallFrame.Option1:SetScript('OnEnter', function() ElvUI_EltreumUI:ImproveInstall(nil,"ENTERING",nil,true,"Interface\\Addons\\ElvUI_JiberishUI\\Media\\Installer\\Allusive.jpg") end)
			_G.PluginInstallFrame.Option1:SetScript('OnLeave', function() ElvUI_EltreumUI:ImproveInstall(nil,"LEAVING")end)

			_G.PluginInstallFrame.Option2:Show()
			_G.PluginInstallFrame.Option2:SetScript("OnClick", function()
				SetupLayout("JiberishAndromeda") --this will apply the profile to the current profile
			end)
			_G.PluginInstallFrame.Option2:SetText("Andromeda")
			_G.PluginInstallFrame.Option2:SetScript('OnEnter', function() ElvUI_EltreumUI:ImproveInstall(nil,"ENTERING",nil,true,"Interface\\Addons\\ElvUI_JiberishUI\\Media\\Installer\\Andromeda.jpg") end)
			_G.PluginInstallFrame.Option2:SetScript('OnLeave', function() ElvUI_EltreumUI:ImproveInstall(nil,"LEAVING")end)

			_G.PluginInstallFrame.Option3:Show()
			_G.PluginInstallFrame.Option3:SetScript("OnClick", function()
				SetupLayout("JiberishCaith") --this will apply the profile to the current profile
			end)
			_G.PluginInstallFrame.Option3:SetText("Caith")
			_G.PluginInstallFrame.Option3:SetScript('OnEnter', function() ElvUI_EltreumUI:ImproveInstall(nil,"ENTERING",nil,true,"Interface\\Addons\\ElvUI_JiberishUI\\Media\\Installer\\Caith.jpg") end)
			_G.PluginInstallFrame.Option3:SetScript('OnLeave', function() ElvUI_EltreumUI:ImproveInstall(nil,"LEAVING")end)

			_G.PluginInstallFrame.Option4:Hide()
		end,
		[3] = function()
			ElvUI_EltreumUI:ResizeInstall()
			_G.PluginInstallFrame.SubTitle:SetText("Layouts 2")
			_G.PluginInstallFrame.Desc1:SetText("These are the layouts that are available. Please click a button below to apply the layout of your choosing.")
			_G.PluginInstallFrame.Desc2:SetText("Importance: |cff07D400High|r")

			_G.PluginInstallFrame.Option1:Show()
			_G.PluginInstallFrame.Option1:SetScript("OnClick", function()
				SetupLayout("JiberishImmersed") --this will apply the profile to the current profile
			end)
			_G.PluginInstallFrame.Option1:SetText("Immersed")
			_G.PluginInstallFrame.Option1:SetScript('OnEnter', function() ElvUI_EltreumUI:ImproveInstall(nil,"ENTERING",nil,true,"Interface\\Addons\\ElvUI_JiberishUI\\Media\\Installer\\Immersed.jpg") end)
			_G.PluginInstallFrame.Option1:SetScript('OnLeave', function() ElvUI_EltreumUI:ImproveInstall(nil,"LEAVING")end)

			_G.PluginInstallFrame.Option2:Show()
			_G.PluginInstallFrame.Option2:SetScript("OnClick", function()
				SetupLayout("JiberishImpulse")
			end)
			_G.PluginInstallFrame.Option2:SetText("Impulse")
			_G.PluginInstallFrame.Option2:SetScript('OnEnter', function() ElvUI_EltreumUI:ImproveInstall(nil,"ENTERING",nil,true,"Interface\\Addons\\ElvUI_JiberishUI\\Media\\Installer\\Impulse.jpg") end)
			_G.PluginInstallFrame.Option2:SetScript('OnLeave', function() ElvUI_EltreumUI:ImproveInstall(nil,"LEAVING")end)

			_G.PluginInstallFrame.Option3:Show()
			_G.PluginInstallFrame.Option3:SetScript("OnClick", function()
				SetupLayout("JiberishMidnight") --this will apply the profile to the current profile
			end)
			_G.PluginInstallFrame.Option3:SetText("Midnight")
			_G.PluginInstallFrame.Option3:SetScript('OnEnter', function() ElvUI_EltreumUI:ImproveInstall(nil,"ENTERING",nil,true,"Interface\\Addons\\ElvUI_JiberishUI\\Media\\Installer\\Midnight.jpg") end)
			_G.PluginInstallFrame.Option3:SetScript('OnLeave', function() ElvUI_EltreumUI:ImproveInstall(nil,"LEAVING")end)

			_G.PluginInstallFrame.Option4:Hide()
		end,
		[4] = function()
			ElvUI_EltreumUI:ResizeInstall()
			_G.PluginInstallFrame.SubTitle:SetText("Layouts 3")
			_G.PluginInstallFrame.Desc1:SetText("These are the layouts that are available. Please click a button below to apply the layout of your choosing.")
			_G.PluginInstallFrame.Desc2:SetText("Importance: |cff07D400High|r")

			_G.PluginInstallFrame.Option1:Show()
			_G.PluginInstallFrame.Option1:SetScript("OnClick", function()
				SetupLayout("JiberishVerticality") --this will apply the profile to the current profile
			end)
			_G.PluginInstallFrame.Option1:SetText("Verticality")
			_G.PluginInstallFrame.Option1:SetScript('OnEnter', function() ElvUI_EltreumUI:ImproveInstall(nil,"ENTERING",nil,true,"Interface\\Addons\\ElvUI_JiberishUI\\Media\\Installer\\Verticality.jpg") end)
			_G.PluginInstallFrame.Option1:SetScript('OnLeave', function() ElvUI_EltreumUI:ImproveInstall(nil,"LEAVING")end)

			_G.PluginInstallFrame.Option2:Show()
			_G.PluginInstallFrame.Option2:SetScript("OnClick", function()
				SetupLayout("JiberishVXT") --this will apply the profile to the current profile
			end)
			_G.PluginInstallFrame.Option2:SetText("VXT")
			_G.PluginInstallFrame.Option2:SetScript('OnEnter', function() ElvUI_EltreumUI:ImproveInstall(nil,"ENTERING",nil,true,"Interface\\Addons\\ElvUI_JiberishUI\\Media\\Installer\\VXT.jpg") end)
			_G.PluginInstallFrame.Option2:SetScript('OnLeave', function() ElvUI_EltreumUI:ImproveInstall(nil,"LEAVING")end)

			_G.PluginInstallFrame.Option3:Show()
			_G.PluginInstallFrame.Option3:SetScript("OnClick", function()
				SetupLayout("JiberishWoven") --this will apply the profile to the current profile
			end)
			_G.PluginInstallFrame.Option3:SetText("Woven")
			_G.PluginInstallFrame.Option3:SetScript('OnEnter', function() ElvUI_EltreumUI:ImproveInstall(nil,"ENTERING",nil,true,"Interface\\Addons\\ElvUI_JiberishUI\\Media\\Installer\\Woven.jpg") end)
			_G.PluginInstallFrame.Option3:SetScript('OnLeave', function() ElvUI_EltreumUI:ImproveInstall(nil,"LEAVING")end)

			_G.PluginInstallFrame.Option4:Hide()
		end,
		[5] = function()
			ElvUI_EltreumUI:ResizeInstall()
			_G.PluginInstallFrame.SubTitle:SetFormattedText('Discord')
			_G.PluginInstallFrame.Desc1:SetText(L["Join the Discord if you have any questions or issues"])
			_G.PluginInstallFrame.Option1:Enable()
			_G.PluginInstallFrame.Option1:Show()
			_G.PluginInstallFrame.Option1:SetScript('OnClick', function() E:StaticPopup_Show('ELVUI_EDITBOX', nil, nil, 'https://discord.gg/jr5w8ArzAx')  end)
			_G.PluginInstallFrame.Option1:SetText('Discord')

			_G.PluginInstallFrame.Option1:SetScript('OnEnter', nil)
			_G.PluginInstallFrame.Option1:SetScript('OnLeave', nil)
			_G.PluginInstallFrame.Option2:SetScript('OnEnter', nil)
			_G.PluginInstallFrame.Option2:SetScript('OnLeave', nil)
			_G.PluginInstallFrame.Option3:SetScript('OnEnter', nil)
			_G.PluginInstallFrame.Option3:SetScript('OnLeave', nil)
			_G.PluginInstallFrame.Option4:SetScript('OnEnter', nil)
			_G.PluginInstallFrame.Option4:SetScript('OnLeave', nil)

			_G.PluginInstallFrame.Option2:Hide()
			_G.PluginInstallFrame.Option3:Hide()
			_G.PluginInstallFrame.Option4:Hide()
		end,
		[6] = function()
			ElvUI_EltreumUI:ResizeInstall()
			_G.PluginInstallFrame.SubTitle:SetText("Installation Complete")
			_G.PluginInstallFrame.Desc1:SetText("You have completed the installation process.")
			_G.PluginInstallFrame.Desc2:SetText("Please click the button below in order to finalize the process and automatically reload your UI.")
			_G.PluginInstallFrame.Option1:Show()
			_G.PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			_G.PluginInstallFrame.Option1:SetText("Finished")

			_G.PluginInstallFrame.Option2:Hide()
			_G.PluginInstallFrame.Option3:Hide()
			_G.PluginInstallFrame.Option4:Hide()

			_G.PluginInstallFrame.Option1:SetScript('OnEnter', nil)
			_G.PluginInstallFrame.Option1:SetScript('OnLeave', nil)

			_G.PluginInstallFrame.Option2:SetScript('OnEnter', nil)
			_G.PluginInstallFrame.Option2:SetScript('OnLeave', nil)

			_G.PluginInstallFrame.Option3:SetScript('OnEnter', nil)
			_G.PluginInstallFrame.Option3:SetScript('OnLeave', nil)

			_G.PluginInstallFrame.Option4:SetScript('OnEnter', nil)
			_G.PluginInstallFrame.Option4:SetScript('OnLeave', nil)

		end,
	},
	StepTitles = {
		[1] = "Welcome",
		[2] = "Layouts 1",
		[3] = "Layouts 2",
		[4] = "Layouts 3",
		[5] = "Discord",
		[6] = "Installation Complete",
	},
	StepTitlesColor = {1, 1, 1},
	StepTitlesColorSelected = {0.41, 0.25, 0.89},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = "RIGHT",
}

--This function holds the options table which will be inserted into the ElvUI config
local function InsertOptions()
	E.Options.args.MyPluginName = {
		order = 100,
		type = "group",
		name = "|cFF4668dcJ|cFF5268d7i|cFF5d68d3b|cFF6969cee|cFF7569car|cFF8069c5i|cFF8c69c1s|cFF986abch |cFFa36ab8U|cFFaf6ab3I|r",
		args = {
			header1 = {
				order = 1,
				type = "header",
				name = "|cFF4668dcJ|cFF5268d7i|cFF5d68d3b|cFF6969cee|cFF7569car|cFF8069c5i|cFF8c69c1s|cFF986abch |cFFa36ab8U|cFFaf6ab3I|r",
			},
			description1 = {
				order = 2,
				type = "description",
				name = format("%s is a layout for ElvUI.", "|cFF4668dcJ|cFF5268d7i|cFF5d68d3b|cFF6969cee|cFF7569car|cFF8069c5i|cFF8c69c1s|cFF986abch |cFFa36ab8U|cFFaf6ab3I|r"),
			},
			thankyou = {
				order = 3,
				type = 'group',
				inline = true,
				name = L["Credits"],
				args = {
					desc = {
						order = 1,
						type = 'description',
						fontSize = 'medium',
						name = CREDITS_STRING,
					},
				},
			},
			spacer1 = {
				order = 13,
				type = "description",
				name = "\n\n\n",
			},
			header2 = {
				order = 14,
				type = "header",
				name = "Installation",
			},
			description2 = {
				order = 15,
				type = "description",
				name = "The installation guide should pop up automatically after you have completed the ElvUI installation. If you wish to re-run the installation process for this layout then please click the button below.",
			},
			spacer2 = {
				order = 16,
				type = "description",
				name = "",
			},
			install = {
				order = 17,
				type = "execute",
				name = "Install",
				desc = "Run the installation process.",
				func = function() E:GetModule("PluginInstaller"):Queue(InstallerData); E:ToggleOptions(); end,
			},
			spacer3 = {
				order = 18,
				type = "description",
				name = "\n\n\n",
			},
			header3 = {
				order = 19,
				type = "header",
				name = "Gradient Colors",
			},
			description3 = {
				order = 20,
				type = "description",
				name = "Change the Custom Colors in Eltruism.",
			},
			spacer4 = {
				order = 21,
				type = "description",
				name = "",
			},
			vxtcolors = {
				order = 22,
				type = "execute",
				name = "VXT Colors",
				desc = "Set Eltruism Gradient Custom Colors to use VXT's Colors.",
				func = function() JiberishUI:VXTGradientColors() E:StaticPopup_Show('CONFIG_RL') end,
			},
		},
	}
end

--Create a unique table for our plugin
P[MyPluginName] = {}

--This function will handle initialization of the addon
function JiberishUI:Initialize()

	--hide Eltruism install since you are going to apply settings anyway
	if _G["PluginInstallFrame"] and _G["PluginInstallFrame"].Title and E.db[MyPluginName].install_version == nil then
		if _G["PluginInstallFrame"].Title:GetText() ~= nil and _G["PluginInstallFrame"].Title:GetText() == ElvUI_EltreumUI.Name then
			local PI = E:GetModule('PluginInstaller')
			PI.CloseInstall()
		end
	end

	--Initiate installation process if ElvUI install is complete and our plugin install has not yet been run
	if E.private.install_complete and E.db[MyPluginName].install_version == nil then
		E:GetModule("PluginInstaller"):Queue(InstallerData)
	end

	--Insert our options table when ElvUI config is loaded
	EP:RegisterPlugin(addon, InsertOptions)
end

-- Eltreum UI print
function JiberishUI:Print(msg)
	print(MyPluginName..': '..msg)
end


--Register module with callback so it gets initialized when ready
E:RegisterModule(JiberishUI:GetName())
