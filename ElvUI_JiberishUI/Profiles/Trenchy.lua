local E, L, V, P, G = unpack(ElvUI)
local JiberishUI = E:GetModule('|cff00b3ffJiberish UI|r')
local D = E:GetModule('Distributor')

function JiberishUI:Trenchy()
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

function JiberishUI:TrenchyDark()
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


function JiberishUI:TrenchyStyleFilters()
	if not E.private.nameplates.enable then return end
	for _, filterName in pairs({'Nokhud Honsounder', 'Trench_CoS_Enforcer', 'TrenchyFocus', 'Trenchy_Kicks', 'Trenchy_Mobs_S1', "m-Inspiring", "m-Sanguine", "m-Spiteful-on-You", "m-Spitefull"}) do
		E.global["nameplates"]["filters"][filterName] = {}
		E.NamePlates:StyleFilterCopyDefaults(E.global["nameplates"]["filters"][filterName])
		E.db["nameplates"]["filters"][filterName] = { triggers = { enable = true } }
	end

	-- Golbal Settings
	E.global["nameplates"]["filters"]["EltreumDeadNP"]["actions"]["nameOnly"] = true
	E.global["nameplates"]["filters"]["EltreumDeadNP"]["triggers"]["isDeadOrGhost"] = true
	E.global["nameplates"]["filters"]["EltreumExecute"]["actions"]["color"]["borderColor"]["b"] = 0
	E.global["nameplates"]["filters"]["EltreumExecute"]["actions"]["color"]["borderColor"]["g"] = 0
	E.global["nameplates"]["filters"]["EltreumExecute"]["actions"]["color"]["health"] = true
	E.global["nameplates"]["filters"]["EltreumExecute"]["actions"]["color"]["healthColor"]["g"] = 0
	E.global["nameplates"]["filters"]["EltreumExecute"]["actions"]["color"]["healthColor"]["r"] = 0.65
	E.global["nameplates"]["filters"]["EltreumExecute"]["actions"]["flash"]["color"]["b"] = 0
	E.global["nameplates"]["filters"]["EltreumExecute"]["actions"]["flash"]["color"]["g"] = 0
	E.global["nameplates"]["filters"]["EltreumExecute"]["actions"]["flash"]["color"]["r"] = 0
	E.global["nameplates"]["filters"]["EltreumExecute"]["actions"]["flash"]["speed"] = 7
	E.global["nameplates"]["filters"]["EltreumExecute"]["actions"]["scale"] = 1.25
	E.global["nameplates"]["filters"]["EltreumExecute"]["actions"]["texture"]["enable"] = true
	E.global["nameplates"]["filters"]["EltreumExecute"]["actions"]["texture"]["texture"] = "Asphyxia-Norm"
	E.global["nameplates"]["filters"]["EltreumExecute"]["triggers"]["healthThreshold"] = true
	E.global["nameplates"]["filters"]["EltreumExecute"]["triggers"]["isNotTapDenied"] = true
	E.global["nameplates"]["filters"]["EltreumExecute"]["triggers"]["playerCanAttack"] = true
	E.global["nameplates"]["filters"]["EltreumExecute"]["triggers"]["underHealthThreshold"] = 0.1
	E.global["nameplates"]["filters"]["EltreumHideNP"]["actions"]["nameOnly"] = true
	E.global["nameplates"]["filters"]["EltreumHideNP"]["actions"]["tags"]["name"] = "[name:eltruism:gradient]"
	E.global["nameplates"]["filters"]["EltreumHideNP"]["actions"]["tags"]["title"] = "[eltruismnpctitle:brackets]"
	E.global["nameplates"]["filters"]["EltreumHideNP"]["triggers"]["nameplateType"]["enable"] = true
	E.global["nameplates"]["filters"]["EltreumHideNP"]["triggers"]["nameplateType"]["enemyNPC"] = true
	E.global["nameplates"]["filters"]["EltreumHideNP"]["triggers"]["playerCanNotAttack"] = true
	E.global["nameplates"]["filters"]["EltreumHideNP"]["triggers"]["priority"] = 15
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["actions"]["alpha"] = 100
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["actions"]["color"]["borderColor"]["a"] = 0.7
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["actions"]["color"]["borderColor"]["g"] = 0
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["actions"]["color"]["healthColor"]["g"] = 0
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["actions"]["flash"]["color"]["b"] = 0
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["actions"]["flash"]["color"]["g"] = 0
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["actions"]["flash"]["color"]["r"] = 0
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["actions"]["flash"]["enable"] = true
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["actions"]["flash"]["speed"] = 7
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["actions"]["scale"] = 1.2
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["actions"]["texture"]["enable"] = true
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["actions"]["texture"]["texture"] = "Eltreum-Stripes"
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["casting"]["interruptible"] = true
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["inCombat"] = true
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["instanceDifficulty"]["dungeon"]["heroic"] = true
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["instanceDifficulty"]["dungeon"]["mythic"] = true
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["instanceDifficulty"]["dungeon"]["mythic+"] = true
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["instanceDifficulty"]["dungeon"]["normal"] = true
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["instanceDifficulty"]["dungeon"]["timewalking"] = true
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["instanceType"]["arena"] = true
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["instanceType"]["none"] = true
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["instanceType"]["party"] = true
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["instanceType"]["pvp"] = true
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["instanceType"]["scenario"] = true
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["isNotTapDenied"] = true
	E.global["nameplates"]["filters"]["EltreumInterrupt"]["triggers"]["notTarget"] = true
	E.global["nameplates"]["filters"]["EltreumLevel"]["actions"]["tags"]["level"] = "[difficultycolor][smartlevel]"
	E.global["nameplates"]["filters"]["EltreumLevel"]["triggers"]["isTarget"] = true
	E.global["nameplates"]["filters"]["EltreumLevel"]["triggers"]["mylevel"] = false
	E.global["nameplates"]["filters"]["EltreumLevel"]["triggers"]["notTarget"] = true
	E.global["nameplates"]["filters"]["EltreumLevel"]["triggers"]["notTargetMe"] = false
	E.global["nameplates"]["filters"]["EltreumLevel"]["triggers"]["playerCanAttack"] = true
	E.global["nameplates"]["filters"]["EltreumRare"]["actions"]["color"]["border"] = true
	E.global["nameplates"]["filters"]["EltreumRare"]["actions"]["color"]["borderColor"]["b"] = 0.22745099663734
	E.global["nameplates"]["filters"]["EltreumRare"]["actions"]["color"]["borderColor"]["g"] = 0.11764706671238
	E.global["nameplates"]["filters"]["EltreumRare"]["actions"]["color"]["borderColor"]["r"] = 0.76862752437592
	E.global["nameplates"]["filters"]["EltreumRare"]["actions"]["color"]["health"] = true
	E.global["nameplates"]["filters"]["EltreumRare"]["actions"]["scale"] = 1.25
	E.global["nameplates"]["filters"]["EltreumRare"]["actions"]["texture"]["enable"] = true
	E.global["nameplates"]["filters"]["EltreumRare"]["actions"]["texture"]["texture"] = "Eltreum-Class-DeathKnight"
	E.global["nameplates"]["filters"]["EltreumRare"]["triggers"]["classification"]["rare"] = true
	E.global["nameplates"]["filters"]["EltreumRare"]["triggers"]["classification"]["rareelite"] = true
	E.global["nameplates"]["filters"]["EltreumRare"]["triggers"]["isNotTapDenied"] = true
	E.global["nameplates"]["filters"]["EltreumRare"]["triggers"]["priority"] = 10
	E.global["nameplates"]["filters"]["EltreumRefreshDebuff"]["actions"]["alpha"] = 100
	E.global["nameplates"]["filters"]["EltreumRefreshDebuff"]["actions"]["scale"] = 1.25
	E.global["nameplates"]["filters"]["EltreumRefreshDebuff"]["triggers"]["debuffs"]["fromMe"] = true
	E.global["nameplates"]["filters"]["EltreumRefreshDebuff"]["triggers"]["debuffs"]["maxTimeLeft"] = 5
	E.global["nameplates"]["filters"]["EltreumRefreshDebuff"]["triggers"]["enable"] = false
	E.global["nameplates"]["filters"]["EltreumRefreshDebuff"]["triggers"]["inCombat"] = true
	E.global["nameplates"]["filters"]["EltreumRefreshDebuff"]["triggers"]["notTarget"] = true
	E.global["nameplates"]["filters"]["EltreumRestedNP"]["actions"]["alpha"] = 100
	E.global["nameplates"]["filters"]["EltreumRestedNP"]["actions"]["nameOnly"] = true
	E.global["nameplates"]["filters"]["EltreumRestedNP"]["actions"]["tags"]["name"] = "[eltruismname:title][eltruismrealm:dash]"
	E.global["nameplates"]["filters"]["EltreumRestedNP"]["actions"]["tags"]["title"] = "[eltruismnpctitle:brackets][eltruismguild:brackets]"
	E.global["nameplates"]["filters"]["EltreumRestedNP"]["triggers"]["isResting"] = true
	E.global["nameplates"]["filters"]["EltreumRestedNP"]["triggers"]["outOfCombat"] = true
	E.global["nameplates"]["filters"]["EltreumRestedNP"]["triggers"]["playerCanNotAttack"] = true
	E.global["nameplates"]["filters"]["EltreumSpellsteal"]["actions"]["alpha"] = 100
	E.global["nameplates"]["filters"]["EltreumSpellsteal"]["actions"]["flash"]["enable"] = true
	E.global["nameplates"]["filters"]["EltreumSpellsteal"]["actions"]["scale"] = 1.25
	E.global["nameplates"]["filters"]["EltreumSpellsteal"]["triggers"]["buffs"]["hasStealable"] = true
	E.global["nameplates"]["filters"]["EltreumSpellsteal"]["triggers"]["class"]["MAGE"]["enabled"] = true
	E.global["nameplates"]["filters"]["EltreumSpellsteal"]["triggers"]["isTarget"] = true
	E.global["nameplates"]["filters"]["EltreumSpellsteal"]["triggers"]["notTarget"] = true
	E.global["nameplates"]["filters"]["EltreumSpellsteal"]["triggers"]["priority"] = 13
	E.global["nameplates"]["filters"]["EltreumTarget"]["actions"]["color"]["border"] = true
	E.global["nameplates"]["filters"]["EltreumTarget"]["actions"]["color"]["borderColor"]["b"] = 0.22745099663734
	E.global["nameplates"]["filters"]["EltreumTarget"]["actions"]["color"]["borderColor"]["g"] = 0.11764706671238
	E.global["nameplates"]["filters"]["EltreumTarget"]["actions"]["color"]["borderColor"]["r"] = 0.76862752437592
	E.global["nameplates"]["filters"]["EltreumTarget"]["actions"]["scale"] = 1.25
	E.global["nameplates"]["filters"]["EltreumTarget"]["triggers"]["classification"]["elite"] = true
	E.global["nameplates"]["filters"]["EltreumTarget"]["triggers"]["classification"]["minus"] = true
	E.global["nameplates"]["filters"]["EltreumTarget"]["triggers"]["classification"]["normal"] = true
	E.global["nameplates"]["filters"]["EltreumTarget"]["triggers"]["classification"]["trivial"] = true
	E.global["nameplates"]["filters"]["EltreumTarget"]["triggers"]["classification"]["worldboss"] = true
	E.global["nameplates"]["filters"]["EltreumTarget"]["triggers"]["isTarget"] = true
	E.global["nameplates"]["filters"]["EltreumTarget"]["triggers"]["priority"] = 2
	E.global["nameplates"]["filters"]["EltreumTotems"]["actions"]["scale"] = 1.25
	E.global["nameplates"]["filters"]["EltreumTotems"]["actions"]["usePortrait"] = true
	E.global["nameplates"]["filters"]["EltreumTotems"]["triggers"]["creatureType"]["Totem"] = true
	E.global["nameplates"]["filters"]["EltreumTotems"]["triggers"]["creatureType"]["enable"] = true
	E.global["nameplates"]["filters"]["EltreumTotems"]["triggers"]["isTarget"] = true
	E.global["nameplates"]["filters"]["EltreumTotems"]["triggers"]["notTarget"] = true
	E.global["nameplates"]["filters"]["EltreumTotems"]["triggers"]["playerCanAttack"] = true
	E.global["nameplates"]["filters"]["EltreumTotems"]["triggers"]["priority"] = 14
	E.global["nameplates"]["filters"]["ElvUI_NonTarget"]["actions"]["alpha"] = 70
	E.global["nameplates"]["filters"]["ElvUI_NonTarget"]["actions"]["color"]["borderColor"]["b"] = 0.22745099663734
	E.global["nameplates"]["filters"]["ElvUI_NonTarget"]["actions"]["color"]["borderColor"]["g"] = 0.11764706671238
	E.global["nameplates"]["filters"]["ElvUI_NonTarget"]["actions"]["color"]["borderColor"]["r"] = 0.76862752437592
	E.global["nameplates"]["filters"]["ElvUI_NonTarget"]["actions"]["scale"] = 0.75
	E.global["nameplates"]["filters"]["ElvUI_NonTarget"]["triggers"]["requireTarget"] = false
	E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["alpha"] = 100
	E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["b"] = 0
	E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["g"] = 0
	E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["r"] = 0
	E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["scale"] = 1.1
	E.global["nameplates"]["filters"]["ElvUI_Target"]["actions"]["texture"]["texture"] = "mMediaTag P11"
end
