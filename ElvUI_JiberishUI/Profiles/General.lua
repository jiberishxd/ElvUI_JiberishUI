local E, L, V, P, G = unpack(ElvUI)
local JiberishUI = E:GetModule('|cff00b3ffJiberish UI|r')
local valuecolors = E:ClassColor(E.myclass, true)

function JiberishUI:General()
	if not E.db.movers then E.db.movers = {} end

	E.global["general"]["UIScale"] = 0.59 --replace with the scale you use
	if (not IsAddOnLoaded("ElvUI_SLE")) then
		SetCVar('uiScale', 0.59)
	end

	--private profile
	E.private.ElvUI_EltreumUI.install_version = GetAddOnMetadata("ElvUI_EltreumUI", "Version") -- this is so eltruism doesn't popup after
	--E.db.mui.core.installed = true -- this is so merathilis doesn't popup after
	--E.private.mui.general.install_complete = GetAddOnMetadata("ElvUI_MerathilisUI", "Version") -- this is so merathilis doesn't popup after
	--E.private["bags"]["enable"] = false

	E.private["ElvUI_EltreumUI"]["isInstalled"]["projectazilroka"] = true
	E.private["ElvUI_EltreumUI"]["isInstalled"]["sle"] = true
	E.private["ElvUI_EltreumUI"]["isInstalled"]["windtools"] = true
	E.private["ElvUI_EltreumUI"]["nameplatepower"]["adjust"] = true
	E.private["actionbar"]["hideCooldownBling"] = true
	E.private["general"]["chatBubbleFont"] = "KMT-GothamXN_Ultra"
	E.private["general"]["chatBubbleFontOutline"] = "OUTLINE"
	E.private["general"]["chatBubbleFontSize"] = 10
	E.private["general"]["chatBubbleName"] = true
	E.private["general"]["chatBubbles"] = "nobackdrop"
	E.private["general"]["dmgfont"] = "KMT-GothamXN_Ultra"
	E.private["general"]["glossTex"] = "Asphyxia-Norm"
	E.private["general"]["minimap"]["hideTracking"] = true
	E.private["general"]["namefont"] = "KMT-GothamXN_Ultra"
	E.private["general"]["nameplateFont"] = "KMT-GothamXN_Ultra"
	E.private["general"]["nameplateFontSize"] = 10
	E.private["general"]["nameplateLargeFont"] = "KMT-GothamXN_Ultra"
	E.private["general"]["nameplateLargeFontSize"] = 10
	E.private["general"]["normTex"] = "Asphyxia-Norm"
	E.private["general"]["raidUtility"] = false
	E.private["general"]["replaceCombatText"] = true
	E.private["general"]["totemTracker"] = false
	E.private["skins"]["parchmentRemoverEnable"] = true
	E.private["theme"] = "class"

	--global
	E.global["datatexts"]["settings"]["Combat"]["TimeFull"] = false
	E.global["datatexts"]["settings"]["Durability"]["percThreshold"] = 40
	E.global["datatexts"]["settings"]["Experience"]["textFormat"] = "PERCENT"
	E.global["datatexts"]["settings"]["Friends"]["hideAFK"] = true
	E.global["datatexts"]["settings"]["Friends"]["hideApp"] = true
	E.global["datatexts"]["settings"]["Friends"]["hideBSAp"] = true
	E.global["datatexts"]["settings"]["Gold"]["goldCoins"] = false
	E.global["general"]["WorldMapCoordinates"]["position"] = "TOPLEFT"
	E.global["general"]["fadeMapDuration"] = 0.1
	E.global["general"]["mapAlphaWhenMoving"] = 0.35
	E.global["general"]["smallerWorldMap"] = false
	E.global["general"]["smallerWorldMapScale"] = 1
	E.global["unitframe"]["AuraBarColors"][2825]["color"]["b"] = 0.33333334326744
	E.global["unitframe"]["AuraBarColors"][2825]["color"]["g"] = 0.37647062540054
	E.global["unitframe"]["AuraBarColors"][2825]["color"]["r"] = 0.98039221763611
	E.global["unitframe"]["AuraBarColors"][80353]["color"]["b"] = 0.91372555494308
	E.global["unitframe"]["AuraBarColors"][80353]["color"]["g"] = 0.98039221763611
	E.global["unitframe"]["AuraBarColors"][80353]["color"]["r"] = 0.38431376218796

	--nameplate filters (even though its disabled it needs to appear to prevent errors)


	--E.db["nameplates"] = E.db["nameplates"] or {}
	--E.db["nameplates"]["filters"] = E.db["nameplates"]["filters"] or {}
	E.private["nameplates"]["enable"] = true --keep this in mind, you'll need to comment out the nameplate sections of the profiles
	E.db["nameplates"]["filters"] = E.db["nameplates"]["filters"] or {}
	for _, filterName in pairs({'EltreumTarget', 'EltreumInterrupt', 'EltreumRare', 'Neutral', 'm-2nd-Priority', 'm-High-HP','m-Priority-Target','m-Priority-Target-oof','m-Special', 'Explosives', 'm-3nd-Priority'}) do
		E.global["nameplates"]["filters"][filterName] = {}
		E.NamePlates:StyleFilterCopyDefaults(E.global["nameplates"]["filters"][filterName])
		--E.global["nameplates"]["filters"][filterName]["triggers"] = E.global["nameplates"]["filters"][filterName]["triggers"] or {}
		--E.global["nameplates"]["filters"][filterName]["triggers"]["enable"] = E.global["nameplates"]["filters"][filterName]["triggers"]["enable"] or false
		E.db["nameplates"]["filters"][filterName] = E.global["nameplates"]["filters"][filterName]
	end

	E.db["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["enable"] = true

	E.private["nameplates"]["enable"] = false --keep this in mind, you'll need to comment out the nameplate sections of the profiles

	--start the datatexts
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["enable"] = false
	E.db["datatexts"]["panels"]["RightChatDataPanel"]["enable"] = false

	E.DataTexts:BuildPanelFrame('EltruismDataText')
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["backdrop"] = false
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["panelTransparency"] = false
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["border"] = false
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["frameLevel"] = 1
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["frameStrata"] = "LOW"
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["growth"] = "HORIZONTAL"
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["mouseover"] = false
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["name"] = "Eltruism"
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["numPoints"] = 9
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["textJustify"] = "CENTER"
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["tooltipAnchor"] = "ANCHOR_TOPLEFT"
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["tooltipXOffset"] = -17
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["tooltipYOffset"] = 4
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["visibility"] = "[petbattle] hide;show"
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["height"] = 23

	local buttonwidth = _G.RightChatToggleButton:GetWidth()
	local width = ceil(E.screenWidth)
	E.global["datatexts"]["customPanels"]["EltruismDataText"]["width"] = 2 + math.ceil(width - (buttonwidth * 2))
	E.db["datatexts"]["panels"]["EltruismDataText"][1] = "mGameMenu"
	E.db["datatexts"]["panels"]["EltruismDataText"][2] = "Currencies"
	E.db["datatexts"]["panels"]["EltruismDataText"][3] = "Eltruism Stats 1"
	E.db["datatexts"]["panels"]["EltruismDataText"][4] = "Eltruism Stats 2"
	E.db["datatexts"]["panels"]["EltruismDataText"][5] = "Time"
	E.db["datatexts"]["panels"]["EltruismDataText"][6] = "Durability"
	E.db["datatexts"]["panels"]["EltruismDataText"][7] = "Item Level"
	E.db["datatexts"]["panels"]["EltruismDataText"][8] = "System"
	E.db["datatexts"]["panels"]["EltruismDataText"][9] = "Combat"
	E.db["datatexts"]["panels"]["EltruismDataText"]["battleground"] = false
	E.db["datatexts"]["panels"]["EltruismDataText"]["enable"] = true
	E.db["movers"]["DTPanelEltruismDataTextMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,0"

	--start the custom texts

	--party
	E.db["unitframe"]["units"]["party"]["customTexts"] = E.db["unitframe"]["units"]["party"]["customTexts"] or {}
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:gradient]"] = {}
	E.db["unitframe"]["units"]["party"]["customTexts"]["[eltruism:IconOutline:player]"] = {}
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:abbreviate]"] = {}
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:current:shortvalue]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:current:shortvalue]"]["enable"] = true
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:current:shortvalue]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:current:shortvalue]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:current:shortvalue]"]["justifyH"] = "LEFT"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:current:shortvalue]"]["size"] = 10
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:current:shortvalue]"]["text_format"] = "[health:current:shortvalue]"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:current:shortvalue]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:current:shortvalue]"]["yOffset"] = 0
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:percent]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:percent]"]["enable"] = true
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:percent]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:percent]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:percent]"]["justifyH"] = "RIGHT"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:percent]"]["size"] = 10
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:percent]"]["text_format"] = "[health:percent]"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:percent]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["party"]["customTexts"]["[health:percent]"]["yOffset"] = 0
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:gradient]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:gradient]"]["enable"] = false
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:gradient]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:gradient]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:gradient]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:gradient]"]["size"] = 15
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:gradient]"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:gradient]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:gradient]"]["yOffset"] = 0
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:abbreviate]"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:abbreviate]"]["enable"] = false
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:abbreviate]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:abbreviate]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:abbreviate]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:abbreviate]"]["size"] = 14
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:abbreviate]"]["text_format"] = "[name:eltruism:abbreviate]"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:abbreviate]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["party"]["customTexts"]["[name:eltruism:abbreviate]"]["yOffset"] = 0
	E.db["unitframe"]["units"]["party"]["customTexts"]["[eltruism:IconOutline:player]"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[eltruism:IconOutline:player]"]["enable"] = false
	E.db["unitframe"]["units"]["party"]["customTexts"]["[eltruism:IconOutline:player]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[eltruism:IconOutline:player]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[eltruism:IconOutline:player]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[eltruism:IconOutline:player]"]["size"] = 35
	E.db["unitframe"]["units"]["party"]["customTexts"]["[eltruism:IconOutline:player]"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["party"]["customTexts"]["[eltruism:IconOutline:player]"]["xOffset"] = -74
	E.db["unitframe"]["units"]["party"]["customTexts"]["[eltruism:IconOutline:player]"]["yOffset"] = 29

	--player
	E.db["unitframe"]["units"]["player"]["customTexts"] = E.db["unitframe"]["units"]["player"]["customTexts"] or {}
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:gradient]"] = {}
	E.db["unitframe"]["units"]["player"]["customTexts"]["[eltruism:IconOutline:player]"] = {}
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current-percent-nostatus:shortvalue]"] = {}
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:abbreviate]"] = {}
	E.db["unitframe"]["units"]["player"]["customTexts"]["[eltruism:IconOutline:player]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[eltruism:IconOutline:player]"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["customTexts"]["[eltruism:IconOutline:player]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[eltruism:IconOutline:player]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[eltruism:IconOutline:player]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[eltruism:IconOutline:player]"]["size"] = 21
	E.db["unitframe"]["units"]["player"]["customTexts"]["[eltruism:IconOutline:player]"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[eltruism:IconOutline:player]"]["xOffset"] = -64
	E.db["unitframe"]["units"]["player"]["customTexts"]["[eltruism:IconOutline:player]"]["yOffset"] = 0
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current-percent-nostatus:shortvalue]"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current-percent-nostatus:shortvalue]"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current-percent-nostatus:shortvalue]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current-percent-nostatus:shortvalue]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current-percent-nostatus:shortvalue]"]["justifyH"] = "RIGHT"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current-percent-nostatus:shortvalue]"]["size"] = 14
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current-percent-nostatus:shortvalue]"]["text_format"] = "[health:current-percent-nostatus:shortvalue]"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current-percent-nostatus:shortvalue]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current-percent-nostatus:shortvalue]"]["yOffset"] = 19
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current:shortvalue]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current:shortvalue]"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current:shortvalue]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current:shortvalue]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current:shortvalue]"]["justifyH"] = "LEFT"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current:shortvalue]"]["size"] = 10
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current:shortvalue]"]["text_format"] = "[health:current:shortvalue]"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current:shortvalue]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:current:shortvalue]"]["yOffset"] = 0
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:percent]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:percent]"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:percent]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:percent]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:percent]"]["justifyH"] = "RIGHT"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:percent]"]["size"] = 10
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:percent]"]["text_format"] = "[health:percent]"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:percent]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["player"]["customTexts"]["[health:percent]"]["yOffset"] = 0
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:abbreviate]"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:abbreviate]"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:abbreviate]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:abbreviate]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:abbreviate]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:abbreviate]"]["size"] = 15
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:abbreviate]"]["text_format"] = "[name:eltruism:abbreviate]"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:abbreviate]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:abbreviate]"]["yOffset"] = 4
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:gradient]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:gradient]"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:gradient]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:gradient]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:gradient]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:gradient]"]["size"] = 15
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:gradient]"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:gradient]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["player"]["customTexts"]["[name:eltruism:gradient]"]["yOffset"] = -1

	--raid1
	E.db["unitframe"]["units"]["raid1"]["customTexts"] = E.db["unitframe"]["units"]["raid1"]["customTexts"] or {}
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[perhp<%]"] = {}
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[name:eltruism:gradient]"] = {}
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[health:current:shortvalue]"] = {}
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[eltruism:IconOutline:player]"] = {}
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[name:eltruism:abbreviate]"] = {}
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[eltruism:IconOutline:player]"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[eltruism:IconOutline:player]"]["enable"] = false
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[eltruism:IconOutline:player]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[eltruism:IconOutline:player]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[eltruism:IconOutline:player]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[eltruism:IconOutline:player]"]["size"] = 18
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[eltruism:IconOutline:player]"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[eltruism:IconOutline:player]"]["xOffset"] = -50
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[eltruism:IconOutline:player]"]["yOffset"] = -1
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[health:current:shortvalue]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[health:current:shortvalue]"]["enable"] = false
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[health:current:shortvalue]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[health:current:shortvalue]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[health:current:shortvalue]"]["justifyH"] = "RIGHT"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[health:current:shortvalue]"]["size"] = 8
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[health:current:shortvalue]"]["text_format"] = "[health:current:shortvalue]"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[health:current:shortvalue]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[health:current:shortvalue]"]["yOffset"] = 0
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[name:eltruism:gradient]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[name:eltruism:gradient]"]["enable"] = false
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[name:eltruism:gradient]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[name:eltruism:gradient]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[name:eltruism:gradient]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[name:eltruism:gradient]"]["size"] = 9
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[name:eltruism:gradient]"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[name:eltruism:gradient]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[name:eltruism:gradient]"]["yOffset"] = -1
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[perhp<%]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[perhp<%]"]["enable"] = false
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[perhp<%]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[perhp<%]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[perhp<%]"]["justifyH"] = "LEFT"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[perhp<%]"]["size"] = 8
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[perhp<%]"]["text_format"] = "[perhp<%]"
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[perhp<%]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid1"]["customTexts"]["[perhp<%]"]["yOffset"] = 0

	--raid2
	E.db["unitframe"]["units"]["raid2"]["customTexts"] = E.db["unitframe"]["units"]["raid2"]["customTexts"] or {}
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[perhp<%]"] = {}
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[name:eltruism:gradient]"] = {}
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[health:current:shortvalue]"] = {}
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[eltruism:IconOutline:player]"] = {}
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[name:eltruism:abbreviate]"] = {}
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[eltruism:IconOutline:player]"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[eltruism:IconOutline:player]"]["enable"] = false
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[eltruism:IconOutline:player]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[eltruism:IconOutline:player]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[eltruism:IconOutline:player]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[eltruism:IconOutline:player]"]["size"] = 18
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[eltruism:IconOutline:player]"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[eltruism:IconOutline:player]"]["xOffset"] = -50
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[eltruism:IconOutline:player]"]["yOffset"] = -1
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[health:current:shortvalue]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[health:current:shortvalue]"]["enable"] = false
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[health:current:shortvalue]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[health:current:shortvalue]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[health:current:shortvalue]"]["justifyH"] = "RIGHT"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[health:current:shortvalue]"]["size"] = 8
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[health:current:shortvalue]"]["text_format"] = "[health:current:shortvalue]"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[health:current:shortvalue]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[health:current:shortvalue]"]["yOffset"] = 0
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[name:eltruism:gradient]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[name:eltruism:gradient]"]["enable"] = false
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[name:eltruism:gradient]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[name:eltruism:gradient]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[name:eltruism:gradient]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[name:eltruism:gradient]"]["size"] = 8
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[name:eltruism:gradient]"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[name:eltruism:gradient]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[name:eltruism:gradient]"]["yOffset"] = 0
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[perhp<%]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[perhp<%]"]["enable"] = false
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[perhp<%]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[perhp<%]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[perhp<%]"]["justifyH"] = "LEFT"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[perhp<%]"]["size"] = 8
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[perhp<%]"]["text_format"] = "[perhp<%]"
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[perhp<%]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid2"]["customTexts"]["[perhp<%]"]["yOffset"] = 0

	--raid3
	E.db["unitframe"]["units"]["raid3"]["customTexts"] = E.db["unitframe"]["units"]["raid3"]["customTexts"] or {}
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[perhp<%]"] = {}
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[name:eltruism:gradient]"] = {}
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[health:current:shortvalue]"] = {}
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[eltruism:IconOutline:player]"] = {}
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[name:eltruism:abbreviate]"] = {}
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[eltruism:IconOutline:player]"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[eltruism:IconOutline:player]"]["enable"] = false
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[eltruism:IconOutline:player]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[eltruism:IconOutline:player]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[eltruism:IconOutline:player]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[eltruism:IconOutline:player]"]["size"] = 18
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[eltruism:IconOutline:player]"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[eltruism:IconOutline:player]"]["xOffset"] = -50
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[eltruism:IconOutline:player]"]["yOffset"] = -1
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[health:current:shortvalue]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[health:current:shortvalue]"]["enable"] = false
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[health:current:shortvalue]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[health:current:shortvalue]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[health:current:shortvalue]"]["justifyH"] = "RIGHT"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[health:current:shortvalue]"]["size"] = 8
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[health:current:shortvalue]"]["text_format"] = "[health:current:shortvalue]"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[health:current:shortvalue]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[health:current:shortvalue]"]["yOffset"] = 0
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[name:eltruism:gradient]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[name:eltruism:gradient]"]["enable"] = false
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[name:eltruism:gradient]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[name:eltruism:gradient]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[name:eltruism:gradient]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[name:eltruism:gradient]"]["size"] = 8
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[name:eltruism:gradient]"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[name:eltruism:gradient]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[name:eltruism:gradient]"]["yOffset"] = 0
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[perhp<%]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[perhp<%]"]["enable"] = false
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[perhp<%]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[perhp<%]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[perhp<%]"]["justifyH"] = "LEFT"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[perhp<%]"]["size"] = 8
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[perhp<%]"]["text_format"] = "[perhp<%]"
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[perhp<%]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid3"]["customTexts"]["[perhp<%]"]["yOffset"] = 0

	--target
	E.db["unitframe"]["units"]["target"]["customTexts"] = E.db["unitframe"]["units"]["target"]["customTexts"] or {}
	E.db["unitframe"]["units"]["target"]["customTexts"]["[name:eltruism:gradient]"] = {}
	E.db["unitframe"]["units"]["target"]["customTexts"]["[eltruism:IconOutline:player]"] = {}
	E.db["unitframe"]["units"]["target"]["customTexts"]["[health:current-percent-nostatus:shortvalue]"] = {}
	E.db["unitframe"]["units"]["target"]["customTexts"]["[name:eltruism:abbreviate]"] = {}
	E.db["unitframe"]["units"]["target"]["customTexts"]["[eltruism:IconOutline:player]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["target"]["customTexts"]["[eltruism:IconOutline:player]"]["enable"] = false
	E.db["unitframe"]["units"]["target"]["customTexts"]["[eltruism:IconOutline:player]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["target"]["customTexts"]["[eltruism:IconOutline:player]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["target"]["customTexts"]["[eltruism:IconOutline:player]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["target"]["customTexts"]["[eltruism:IconOutline:player]"]["size"] = 21
	E.db["unitframe"]["units"]["target"]["customTexts"]["[eltruism:IconOutline:player]"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["target"]["customTexts"]["[eltruism:IconOutline:player]"]["xOffset"] = -64
	E.db["unitframe"]["units"]["target"]["customTexts"]["[eltruism:IconOutline:player]"]["yOffset"] = 0
	E.db["unitframe"]["units"]["target"]["customTexts"]["[name:eltruism:gradient]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["target"]["customTexts"]["[name:eltruism:gradient]"]["enable"] = false
	E.db["unitframe"]["units"]["target"]["customTexts"]["[name:eltruism:gradient]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["target"]["customTexts"]["[name:eltruism:gradient]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["target"]["customTexts"]["[name:eltruism:gradient]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["target"]["customTexts"]["[name:eltruism:gradient]"]["size"] = 15
	E.db["unitframe"]["units"]["target"]["customTexts"]["[name:eltruism:gradient]"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["target"]["customTexts"]["[name:eltruism:gradient]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["target"]["customTexts"]["[name:eltruism:gradient]"]["yOffset"] = -1

	--target of target
	E.db["unitframe"]["units"]["targettarget"]["customTexts"] = E.db["unitframe"]["units"]["targettarget"]["customTexts"] or {}
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:gradient]"] = {}
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[eltruism:IconOutline:player]"] = {}
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:abbreviate]"] = {}
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[eltruism:IconOutline:player]"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[eltruism:IconOutline:player]"]["enable"] = false
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[eltruism:IconOutline:player]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[eltruism:IconOutline:player]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[eltruism:IconOutline:player]"]["justifyH"] = "LEFT"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[eltruism:IconOutline:player]"]["size"] = 40
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[eltruism:IconOutline:player]"]["text_format"] = "[eltruism:IconOutline:player]"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[eltruism:IconOutline:player]"]["xOffset"] = -1
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[eltruism:IconOutline:player]"]["yOffset"] = -1
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:gradient]"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:gradient]"]["enable"] = false
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:gradient]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:gradient]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:gradient]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:gradient]"]["size"] = 10
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:gradient]"]["text_format"] = "[name:eltruism:gradient]"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:gradient]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:gradient]"]["yOffset"] = -1
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:abbreviate]"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:abbreviate]"]["enable"] = false
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:abbreviate]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:abbreviate]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:abbreviate]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:abbreviate]"]["size"] = 11
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:abbreviate]"]["text_format"] = "[name:eltruism:abbreviate]"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:abbreviate]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["[name:eltruism:abbreviate]"]["yOffset"] = 3

	--focus
	E.db["unitframe"]["units"]["focus"]["customTexts"] = E.db["unitframe"]["units"]["focus"]["customTexts"] or {}
	E.db["unitframe"]["units"]["focus"]["customTexts"]["[name:eltruism:abbreviate]"] = {}
	E.db["unitframe"]["units"]["focus"]["customTexts"]["[name:eltruism:abbreviate]"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["[name:eltruism:abbreviate]"]["enable"] = false
	E.db["unitframe"]["units"]["focus"]["customTexts"]["[name:eltruism:abbreviate]"]["font"] = "KMT-GothamXN_Ultra"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["[name:eltruism:abbreviate]"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["[name:eltruism:abbreviate]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["[name:eltruism:abbreviate]"]["size"] = 15
	E.db["unitframe"]["units"]["focus"]["customTexts"]["[name:eltruism:abbreviate]"]["text_format"] = "[name:eltruism:abbreviate]"
	E.db["unitframe"]["units"]["focus"]["customTexts"]["[name:eltruism:abbreviate]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["focus"]["customTexts"]["[name:eltruism:abbreviate]"]["yOffset"] = 4

end

--fix colors afterwards so jiberish doesn't need to manually fix each new profile
function JiberishUI:FixClassColors()
	E.db["chat"]["tabSelectorColor"]["r"] = valuecolors.r
	E.db["chat"]["tabSelectorColor"]["g"] = valuecolors.g
	E.db["chat"]["tabSelectorColor"]["b"] = valuecolors.b
	E.db["general"]["customGlow"]["color"]["r"] = valuecolors.r
	E.db["general"]["customGlow"]["color"]["g"] = valuecolors.g
	E.db["general"]["customGlow"]["color"]["b"] = valuecolors.b
	E.db["chat"]["tabSelectedTextColor"]["r"] = valuecolors.r
	E.db["chat"]["tabSelectedTextColor"]["g"] = valuecolors.g
	E.db["chat"]["tabSelectedTextColor"]["b"] = valuecolors.b
	E.db["general"]["valuecolor"]["r"] = valuecolors.r
	E.db["general"]["valuecolor"]["g"] = valuecolors.g
	E.db["general"]["valuecolor"]["b"] = valuecolors.b
end
