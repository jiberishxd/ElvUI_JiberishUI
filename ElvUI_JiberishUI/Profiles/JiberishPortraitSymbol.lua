local E, L, V, P, G = unpack(ElvUI)
local JiberishUI = E:GetModule('|cff00b3ffJiberish UI|r')
local D = E:GetModule('Distributor')

function JiberishUI:JiberishPortraitSymbol()
	if not E.private.nameplates.enable then return end

	-- only replace these
	local profile = ""
	local private = ""
	local global = ""
	local nameplatestylefilters = ""

	--do not change anything below

	--profile
	D:ImportProfile(private)
	D:ImportProfile(nameplatestylefilters)
	D:ImportProfile(profile)
	D:ImportProfile(global)

	-- update this as needed
	E.global["general"]["UIScale"] = 0.59
end
