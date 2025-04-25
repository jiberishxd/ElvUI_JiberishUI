local E, L, V, P, G = unpack(ElvUI)
local JiberishUI = E:GetModule('|cff00b3ffJiberish UI|r')
local valuecolors = E:ClassColor(E.myclass, true)

function JiberishUI:General()
	if not E.db.movers then E.db.movers = {} end

	--this is so Eltruism's datatexts work fine
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
	E.db["movers"]["DTPanelEltruismDataTextMover"] = "BOTTOM,UIParent,BOTTOM,0,4"

	E.DataTexts:BuildPanelFrame('EltruismTime')
	E.global["datatexts"]["customPanels"]["EltruismTime"]["backdrop"] = false
	E.global["datatexts"]["customPanels"]["EltruismTime"]["panelTransparency"] = false
	E.global["datatexts"]["customPanels"]["EltruismTime"]["border"] = false
	E.global["datatexts"]["customPanels"]["EltruismTime"]["frameLevel"] = 2
	E.global["datatexts"]["customPanels"]["EltruismTime"]["frameStrata"] = "LOW"
	E.global["datatexts"]["customPanels"]["EltruismTime"]["fonts"]["enable"] = true
	E.global["datatexts"]["customPanels"]["EltruismTime"]["fonts"]["font"] = "Kimberley"
	E.global["datatexts"]["customPanels"]["EltruismTime"]["fonts"]["fontOutline"] = "THICKOUTLINE"
	E.global["datatexts"]["customPanels"]["EltruismTime"]["fonts"]["fontSize"] = 18
	E.global["datatexts"]["customPanels"]["EltruismTime"]["growth"] = "HORIZONTAL"
	E.global["datatexts"]["customPanels"]["EltruismTime"]["mouseover"] = false
	E.global["datatexts"]["customPanels"]["EltruismTime"]["name"] = "Eltruism"
	E.global["datatexts"]["customPanels"]["EltruismTime"]["numPoints"] = 1
	E.global["datatexts"]["customPanels"]["EltruismTime"]["textJustify"] = "CENTER"
	E.global["datatexts"]["customPanels"]["EltruismTime"]["tooltipAnchor"] = "ANCHOR_TOPLEFT"
	E.global["datatexts"]["customPanels"]["EltruismTime"]["tooltipXOffset"] = -17
	E.global["datatexts"]["customPanels"]["EltruismTime"]["tooltipYOffset"] = 4
	E.global["datatexts"]["customPanels"]["EltruismTime"]["visibility"] = "[petbattle] hide;show"
	E.global["datatexts"]["customPanels"]["EltruismTime"]["height"] = 22
	E.global["datatexts"]["customPanels"]["EltruismTime"]["width"] = 120

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
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["panelTransparency"] = true
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["backdrop"] = false
	E.db["datatexts"]["panels"]["RightChatDataPanel"]["panelTransparency"] = true
	E.db["datatexts"]["panels"]["RightChatDataPanel"]["backdrop"] = false
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

--setup eltruism nameplates/settings
function JiberishUI:EltruismNPSettings()
	if not E.private.nameplates.enable then return end
	ElvUI_EltreumUI:SetupNamePlates('ElvUI')
	E.db.ElvUI_EltreumUI.nameplates.nameplatepower.autoadjustposition = true
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.ClassColorGlow = true
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.ClassBorderNameplate = false
	if not E.db.ElvUI_EltreumUI.unitframes.gradientmode.npenable then
		E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.nameplatetexture = true
	end
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.classbarautohide = true
	E.db.ElvUI_EltreumUI.nameplates.nameplatepower.texture = "ElvUI Norm1"
	E.db.ElvUI_EltreumUI.nameplates.nameplatepower.modeleffect = true
	E.db.ElvUI_EltreumUI.nameplates.classification.enable = false
	E.db.ElvUI_EltreumUI.nameplates.nameplatepower.gradient = true

	--power bar scaling issues
	E.db.ElvUI_EltreumUI.nameplates.nameplatepower.sizex = 110.5

	--nameplate shadows (requires main shadows)
	E.db.ElvUI_EltreumUI.skins.shadow.enable = true
	E.db.ElvUI_EltreumUI.skins.shadow.nameplates = true
	E.db.ElvUI_EltreumUI.skins.shadow.nppower = true
	E.db.ElvUI_EltreumUI.skins.shadow.npcastbar = true
	E.db.ElvUI_EltreumUI.skins.shadow.npportraits = true
	E.db.ElvUI_EltreumUI.skins.shadow.npauras = true

	E.db.ElvUI_EltreumUI.skins.shadow.raid = true
	E.db.ElvUI_EltreumUI.skins.shadow.aura = true
	E.db.ElvUI_EltreumUI.skins.shadow.ufaura = true
	E.db.ElvUI_EltreumUI.skins.shadow.actionbars = true
	E.db.ElvUI_EltreumUI.skins.shadow.minimap = true
	E.db.ElvUI_EltreumUI.skins.shadow.chat = true
	E.db.ElvUI_EltreumUI.skins.shadow.unitframes = true

	E.db.ElvUI_EltreumUI.nameplates.nameplatepower.a = 1
	E.db.ElvUI_EltreumUI.nameplates.nameplatelevel = true
	E.db.ElvUI_EltreumUI.nameplates.friendlynameplatetoggle.friendlynames = false -- turns out blizzard fakes the nameplates and alphas the helthbar, causing huge performance costs
	E.db.ElvUI_EltreumUI.nameplates.friendlynameplatetoggle.hidefriendly = false -- and this one is the same but with health so make this one off as well
	E.db.ElvUI_EltreumUI.nameplates.friendlynameplatetoggle.disablefriendly = true --so hide it instead
	E.db.ElvUI_EltreumUI.nameplates.nptextureversion = "V2"
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.enableHealthHeight = true
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.useelvuinpheight = true
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.targetmodel = true
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.restedoverlap = true
	E.db.ElvUI_EltreumUI.nameplates.nameplateOptions.npglow = true
	E.db.ElvUI_EltreumUI.nameplates.auras.enable = true
	E.db.ElvUI_EltreumUI.unitframes.gradientmode.nporientation = "VERTICAL"
	E.private.ElvUI_EltreumUI.nameplatepower.enable = false
	E.db.nameplates.units.TARGET.classpower.enable = false --elvui target class bar
	E.private.ElvUI_EltreumUI.nameplatepower.adjust = true
	if E.Retail then
		E.db.ElvUI_EltreumUI.cvars.autohidenpcname = true
	end
end

--set to use VXT's gradient colors
function JiberishUI:VXTGradientColors()
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["customcolor"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["deathknightcustomcolorB1"] = 0.37647058823529
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["deathknightcustomcolorG1"] = 0.15294117647059
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["deathknightcustomcolorR1"] = 0.77647058823529
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["demonhuntercustomcolorB1"] = 0.76862745098039
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["demonhuntercustomcolorG1"] = 0.13725490196078
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["demonhuntercustomcolorG2"] = 0.25098039215686
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["demonhuntercustomcolorR1"] = 0.57254901960784
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["demonhuntercustomcolorR2"] = 0.76470588235294
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["druidcustomcolorB1"] = 0.007843137254902
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["druidcustomcolorG1"] = 0.28627450980392
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["enable"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["enablearena"] = false
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["enableplayercastbar"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["enableplayercastbarinterrupted"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["enableplayercastbarnoninterruptible"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["enablepower"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["enablepowercustom"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["enabletargetcastbar"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["enabletargetcastbarinterrupted"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["enabletargetcastbarnoninterruptible"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["energyB1"] = 0.97254901960784
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["energyB2"] = 1
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["energyG1"] = 0.40392156862745
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["energyG2"] = 0.78823529411765
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["energyR1"] = 0
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["energyR2"] = 0
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["focusB1"] = 0
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["focusB2"] = 0.25098039215686
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["focusG1"] = 0.33333333333333
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["focusG2"] = 0.50196078431373
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["focusR2"] = 1
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["furyB1"] = 0
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["furyB2"] = 0
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["furyG1"] = 0.82745098039216
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["furyG2"] = 1
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["furyR1"] = 0.42352941176471
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["furyR2"] = 0.76078431372549
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["gradientHonor"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["gradientReputation"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["gradientXP"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["huntercustomcolorB1"] = 0.31764705882353
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["huntercustomcolorB2"] = 0.098039215686275
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["huntercustomcolorG1"] = 0.76078431372549
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["huntercustomcolorG2"] = 1
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["huntercustomcolorR1"] = 0.41960784313725
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["huntercustomcolorR2"] = 0.76862745098039
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["lunarpowerB1"] = 0.90196078431373
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["lunarpowerB2"] = 0.90196078431373
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["lunarpowerG1"] = 0.36078431372549
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["lunarpowerG2"] = 0.52156862745098
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["lunarpowerR1"] = 0.12156862745098
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["lunarpowerR2"] = 0.30196078431373
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["maelstromB1"] = 0.97254901960784
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["maelstromG1"] = 0.22745098039216
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["maelstromG2"] = 0.78823529411765
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["magecustomcolorB1"] = 1
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["magecustomcolorB2"] = 0.85882352941176
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["magecustomcolorG1"] = 0.76862745098039
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["magecustomcolorG2"] = 1
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["magecustomcolorR2"] = 0
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["manaB1"] = 0.97254901960784
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["manaG1"] = 0.40392156862745
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["manaG2"] = 0.78823529411765
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["manaR1"] = 0
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["manaR2"] = 0
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["monkcustomcolorB1"] = 0.42352941176471
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["monkcustomcolorB2"] = 0.69803921568627
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["monkcustomcolorG1"] = 0.68235294117647
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["monkcustomcolorR1"] = 0
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npcfriendlyB2"] = 0.2
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npcfriendlyG1"] = 0.85098039215686
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npcfriendlyG2"] = 0.85098039215686
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npcfriendlyR1"] = 0.42745098039216
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npcfriendlyR2"] = 0.30980392156863
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npchostileB1"] = 0.15686274509804
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npchostileB2"] = 0.36078431372549
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npchostileG1"] = 0.15686274509804
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npchostileG2"] = 0.16470588235294
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npchostileR2"] = 0.80392156862745
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npcneutralB2"] = 0.28235294117647
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npcneutralG1"] = 0.68627450980392
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npcneutralG2"] = 0.90196078431373
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npcneutralR1"] = 1
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npcneutralR2"] = 0.9843137254902
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npcustomcolor"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["npenable"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["orientation"] = "VERTICAL"
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["orientationpower"] = "VERTICAL"
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["painG1"] = 0.30196078431373
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["painG2"] = 0.61176470588235
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["paladincustomcolorB2"] = 0.70588235294118
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["paladincustomcolorG2"] = 0.51764705882353
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["paladincustomcolorR2"] = 0.94901960784314
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["playercastbarB1noninterruptiblecustom"] = 0.30196079611778
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["playercastbarB2noninterruptiblecustom"] = 0
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["playercastbarG1"] = 0.60000002384186
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["playercastbarG1noninterruptiblecustom"] = 0.027450982481241
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["playercastbarG2"] = 0.94117653369904
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["playercastbarG2noninterruptiblecustom"] = 0.23529413342476
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["playercastbarR2"] = 0.67058825492859
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["playercastbarR2noninterruptiblecustom"] = 0.99215692281723
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["priestcustomcolorB1"] = 0.98431378602982
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["priestcustomcolorG1"] = 1
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["priestcustomcolorR1"] = 0.9764706492424
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["rageB1"] = 0.22745098039216
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["rageB2"] = 0.32156862745098
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["rageG1"] = 0
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["rageG2"] = 0.32156862745098
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["roguecustomcolorB2"] = 0.1843137254902
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["roguecustomcolorG1"] = 0.76078431372549
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["roguecustomcolorG2"] = 0.8156862745098
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["runicpowerG1"] = 0.57254901960784
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["runicpowerG2"] = 0.94509803921569
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["shamancustomcolorB1"] = 1
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["shamancustomcolorB2"] = 1
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["shamancustomcolorG1"] = 0.21960784313725
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["shamancustomcolorG2"] = 0.61960784313725
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["shamancustomcolorR1"] = 0.2156862745098
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["shamancustomcolorR2"] = 0.23137254901961
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["targetcastbarB1noninterruptiblecustom"] = 1
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["targetcastbarB2noninterruptiblecustom"] = 1
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["targetcastbarG1custom"] = 0.60000002384186
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["targetcastbarG1noninterruptiblecustom"] = 0.6235294342041
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["targetcastbarG2custom"] = 0.94117653369904
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["targetcastbarG2noninterruptiblecustom"] = 0.8156863451004
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["targetcastbarR1noninterruptiblecustom"] = 0.070588238537312
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["targetcastbarR2custom"] = 0.67058825492859
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["targetcastbarR2noninterruptiblecustom"] = 0
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["texture"] = "Asphyxia-Norm"
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["useUFtexture"] = true
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["warlockcustomcolorB1"] = 1
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["warlockcustomcolorB2"] = 1
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["warlockcustomcolorG1"] = 0.17254901960784
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["warlockcustomcolorG2"] = 0.50980392156863
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["warlockcustomcolorR1"] = 0.47450980392157
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["warlockcustomcolorR2"] = 0.70196078431373
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["warriorcustomcolorB1"] = 0.2
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["warriorcustomcolorB2"] = 0.37254901960784
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["warriorcustomcolorG1"] = 0.3843137254902
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["warriorcustomcolorG2"] = 0.63921568627451
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["warriorcustomcolorR1"] = 0.63921568627451
	E.db["ElvUI_EltreumUI"]["unitframes"]["gradientmode"]["warriorcustomcolorR2"] = 0.82745098039216
end
