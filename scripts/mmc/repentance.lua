if MMC then return end

local MusicModCallback = RegisterMod("Music Mod Callback", 1)

local json = require("json")
local modSaveData = {}

MMC = {}
MMC.Mod = MusicModCallback

MMC.Version = "2.0"

Isaac.ConsoleOutput("Loaded Music Mod Callback "..MMC.Version.."\n")

local newmusicenum = {
	MUSIC_NULL = 0,
	MUSIC_BASEMENT = Isaac.GetMusicIdByName("Basement"),
	MUSIC_CAVES = Isaac.GetMusicIdByName("Caves"),
	MUSIC_DEPTHS = Isaac.GetMusicIdByName("Depths"),
	MUSIC_CELLAR = Isaac.GetMusicIdByName("Cellar"),
	MUSIC_CATACOMBS = Isaac.GetMusicIdByName("Catacombs"),
	MUSIC_NECROPOLIS = Isaac.GetMusicIdByName("Necropolis"),
	MUSIC_WOMB_UTERO = Isaac.GetMusicIdByName("Womb"),
	MUSIC_GAME_OVER = Isaac.GetMusicIdByName("Game Over"),
	MUSIC_BOSS = Isaac.GetMusicIdByName("Boss"),
	MUSIC_CATHEDRAL = Isaac.GetMusicIdByName("Cathedral"),
	MUSIC_SHEOL = Isaac.GetMusicIdByName("Sheol"),
	MUSIC_DARK_ROOM = Isaac.GetMusicIdByName("Dark Room"),
	MUSIC_CHEST = Isaac.GetMusicIdByName("Chest"),
	MUSIC_BURNING_BASEMENT = Isaac.GetMusicIdByName("Burning Basement"),
	MUSIC_FLOODED_CAVES = Isaac.GetMusicIdByName("Flooded Caves"),
	MUSIC_DANK_DEPTHS = Isaac.GetMusicIdByName("Dank Depths"),
	MUSIC_SCARRED_WOMB = Isaac.GetMusicIdByName("Scarred Womb"),
	MUSIC_BLUE_WOMB = Isaac.GetMusicIdByName("Blue Womb"),
	MUSIC_MOM_BOSS = Isaac.GetMusicIdByName("Boss (Depths - Mom)"),
	MUSIC_MOMS_HEART_BOSS = Isaac.GetMusicIdByName("Boss (Womb - Mom's Heart)"),
	MUSIC_ISAAC_BOSS = Isaac.GetMusicIdByName("Boss (Cathedral - Isaac)"),
	MUSIC_SATAN_BOSS = Isaac.GetMusicIdByName("Boss (Sheol - Satan)"),
	MUSIC_DARKROOM_BOSS = Isaac.GetMusicIdByName("Boss (Dark Room)"),
	MUSIC_BLUEBABY_BOSS = Isaac.GetMusicIdByName("Boss (Chest - ???)"),
	MUSIC_BOSS2 = Isaac.GetMusicIdByName("Boss (alternate)"),
	MUSIC_HUSH_BOSS = Isaac.GetMusicIdByName("Boss (Blue Womb - Hush)"),
	MUSIC_ULTRAGREED_BOSS = Isaac.GetMusicIdByName("Boss (Ultra Greed)"),
	MUSIC_LIBRARY_ROOM = Isaac.GetMusicIdByName("Library Room"),
	MUSIC_SECRET_ROOM = Isaac.GetMusicIdByName("Secret Room"),
	MUSIC_DEVIL_ROOM = Isaac.GetMusicIdByName("Devil Room"),
	MUSIC_ANGEL_ROOM = Isaac.GetMusicIdByName("Angel Room"),
	MUSIC_SHOP_ROOM = Isaac.GetMusicIdByName("Shop Room"),
	MUSIC_ARCADE_ROOM = Isaac.GetMusicIdByName("Arcade Room"),
	MUSIC_BOSS_OVER = Isaac.GetMusicIdByName("Boss Room (empty)"),
	MUSIC_CHALLENGE_FIGHT = Isaac.GetMusicIdByName("Challenge Room (fight)"),
	MUSIC_CREDITS = Isaac.GetMusicIdByName("Credits"),
	MUSIC_TITLE = Isaac.GetMusicIdByName("Title Screen"),
	MUSIC_TITLE_AFTERBIRTH = Isaac.GetMusicIdByName("Title Screen (Afterbirth)"),
	MUSIC_JINGLE_BOSS = Isaac.GetMusicIdByName("Boss (jingle)"),
	MUSIC_JINGLE_BOSS_OVER = Isaac.GetMusicIdByName("Boss Death (jingle)"),
	MUSIC_JINGLE_HOLYROOM_FIND = Isaac.GetMusicIdByName("Holy Room Find (jingle)"),
	MUSIC_JINGLE_SECRETROOM_FIND = Isaac.GetMusicIdByName("Secret Room Find (jingle)"),
	MUSIC_JINGLE_TREASUREROOM_ENTRY_0 = Isaac.GetMusicIdByName("Treasure Room Entry (jingle) 1"),
	MUSIC_JINGLE_TREASUREROOM_ENTRY_1 = Isaac.GetMusicIdByName("Treasure Room Entry (jingle) 2"),
	MUSIC_JINGLE_TREASUREROOM_ENTRY_2 = Isaac.GetMusicIdByName("Treasure Room Entry (jingle) 3"),
	MUSIC_JINGLE_TREASUREROOM_ENTRY_3 = Isaac.GetMusicIdByName("Treasure Room Entry (jingle) 4"),
	MUSIC_JINGLE_CHALLENGE_ENTRY = Isaac.GetMusicIdByName("Challenge Room Entry (jingle)"),
	MUSIC_JINGLE_CHALLENGE_OUTRO = Isaac.GetMusicIdByName("Challenge Room Outro (jingle)"),
	MUSIC_JINGLE_GAME_OVER = Isaac.GetMusicIdByName("Game Over (jingle)"),
	MUSIC_JINGLE_DEVILROOM_FIND = Isaac.GetMusicIdByName("Devil Room appear (jingle)"),
	MUSIC_JINGLE_GAME_START = Isaac.GetMusicIdByName("Game start (jingle)"),
	MUSIC_JINGLE_NIGHTMARE = Isaac.GetMusicIdByName("Nightmare"),
	MUSIC_JINGLE_BOSS_OVER2 = Isaac.GetMusicIdByName("Boss Death Alternate (jingle)"),
	MUSIC_JINGLE_HUSH_OVER = Isaac.GetMusicIdByName("Boss Hush Death (jingle)"),
	MUSIC_INTRO_VOICEOVER = Isaac.GetMusicIdByName("Intro Voiceover"),
	MUSIC_EPILOGUE_VOICEOVER = Isaac.GetMusicIdByName("Epilogue Voiceover"),
	MUSIC_VOID = Isaac.GetMusicIdByName("Void"),
	MUSIC_VOID_BOSS = Isaac.GetMusicIdByName("Boss (Void)"),
	
	MUSIC_UTERO = Isaac.GetMusicIdByName("Utero"),
	MUSIC_SECRET_ROOM2 = Isaac.GetMusicIdByName("Secret Room Alt"),
	MUSIC_BOSS_RUSH = Isaac.GetMusicIdByName("Boss Rush"),
	MUSIC_JINGLE_BOSS_RUSH_OUTRO = Isaac.GetMusicIdByName("Boss Rush (jingle)"),
	MUSIC_BOSS3 = Isaac.GetMusicIdByName("Boss (alternate alternate)"),
	MUSIC_JINGLE_BOSS_OVER3 = Isaac.GetMusicIdByName("Boss Death Alternate Alternate (jingle)"),
	MUSIC_MOTHER_BOSS = Isaac.GetMusicIdByName("Boss (Mother)"),
	MUSIC_DOGMA_BOSS = Isaac.GetMusicIdByName("Boss (Dogma)"),
	MUSIC_BEAST_BOSS = Isaac.GetMusicIdByName("Boss (Beast)"),
	MUSIC_JINGLE_MOTHER_OVER = Isaac.GetMusicIdByName("Boss Mother Death (jingle)"),
	MUSIC_JINGLE_DOGMA_OVER = Isaac.GetMusicIdByName("Boss Dogma Death (jingle)"),
	MUSIC_JINGLE_BEAST_OVER = Isaac.GetMusicIdByName("Boss Beast Death (jingle)"),
	MUSIC_PLANETARIUM = Isaac.GetMusicIdByName("Planetarium"),
	MUSIC_SECRET_ROOM_ALT_ALT = Isaac.GetMusicIdByName("Secret Room Alt Alt"),
	MUSIC_BOSS_OVER_TWISTED = Isaac.GetMusicIdByName("Boss Room (empty, twisted)"),
	MUSIC_TITLE_REPENTANCE = Isaac.GetMusicIdByName("Title Screen (Repentance)"),
	MUSIC_JINGLE_GAME_START_ALT = Isaac.GetMusicIdByName("Game start (jingle, twisted)"),
	MUSIC_JINGLE_NIGHTMARE_ALT = Isaac.GetMusicIdByName("Nightmare (alt)"),
	MUSIC_MOTHERS_SHADOW_INTRO = Isaac.GetMusicIdByName("Mom's Shadow Intro"),
	MUSIC_DOGMA_INTRO = Isaac.GetMusicIdByName("Dogma Intro"),
	MUSIC_STRANGE_DOOR_JINGLE = Isaac.GetMusicIdByName("Strange Door (jingle)"),
	MUSIC_DARK_CLOSET = Isaac.GetMusicIdByName("Echoes Reverse"),
	MUSIC_CREDITS_ALT = Isaac.GetMusicIdByName("Credits Alt"),
	MUSIC_CREDITS_ALT_FINAL = Isaac.GetMusicIdByName("Credits Alt Final"),
	MUSIC_DOWNPOUR = Isaac.GetMusicIdByName("Downpour"),
	MUSIC_MINES = Isaac.GetMusicIdByName("Mines"),
	MUSIC_MAUSOLEUM = Isaac.GetMusicIdByName("Mausoleum"),
	MUSIC_CORPSE = Isaac.GetMusicIdByName("Corpse"),
	MUSIC_DROSS = Isaac.GetMusicIdByName("Dross"),
	MUSIC_ASHPIT = Isaac.GetMusicIdByName("Ashpit"),
	MUSIC_GEHENNA = Isaac.GetMusicIdByName("Gehenna"),
	MUSIC_MORTIS = (function() -- what the fuck
		local Mortis = Isaac.GetMusicIdByName("Mortis")
		return Mortis >= 0 and Mortis or Isaac.GetMusicIdByName("not done")
	end)(),
	MUSIC_ISAACS_HOUSE = Isaac.GetMusicIdByName("Home"),
	MUSIC_FINAL_VOICEOVER = Isaac.GetMusicIdByName("Final Voiceover"),
	MUSIC_DOWNPOUR_REVERSE = Isaac.GetMusicIdByName("Downpour (reversed)"),
	MUSIC_DROSS_REVERSE = Isaac.GetMusicIdByName("Dross (reversed)"),
	MUSIC_MINESHAFT_AMBIENT = Isaac.GetMusicIdByName("Abandoned Mineshaft"),
	MUSIC_MINESHAFT_ESCAPE = Isaac.GetMusicIdByName("Mineshaft Escape"),
	MUSIC_REVERSE_GENESIS = Isaac.GetMusicIdByName("Genesis (reversed)"),
}

for _,n in pairs(newmusicenum) do
	if not newmusicenum.NUM_MUSIC or n > newmusicenum.NUM_MUSIC then
		newmusicenum.NUM_MUSIC = n
	end
end
newmusicenum.NUM_MUSIC = newmusicenum.NUM_MUSIC + 1

local musicmgr = MusicManager()

MusicPreMMC = MusicPreMMC or Music

local redirectmusicenum = {}
for i,v in pairs(MusicPreMMC) do
	if v < MusicPreMMC.NUM_MUSIC and redirectmusicenum[v] ~= newmusicenum[i] then
		redirectmusicenum[v] = newmusicenum[i]
	end
end

Music = newmusicenum

local chapter_music = {}
MMC.ChapterMusic = chapter_music
local chapter_music_greed = {}
MMC.ChapterMusicGreed = chapter_music_greed

chapter_music[LevelStage.STAGE1_1] = {
	[StageType.STAGETYPE_ORIGINAL] = Music.MUSIC_BASEMENT,
	[StageType.STAGETYPE_WOTL] = Music.MUSIC_CELLAR,
	[StageType.STAGETYPE_AFTERBIRTH] = Music.MUSIC_BURNING_BASEMENT,
	[StageType.STAGETYPE_REPENTANCE] = Music.MUSIC_DOWNPOUR,
	[StageType.STAGETYPE_REPENTANCE_B] = Music.MUSIC_DROSS,
}

local chapter_music_default = chapter_music[LevelStage.STAGE1_1]

chapter_music[LevelStage.STAGE1_2] = chapter_music[LevelStage.STAGE1_1]

chapter_music[LevelStage.STAGE2_1] = {
	[StageType.STAGETYPE_ORIGINAL] = Music.MUSIC_CAVES,
	[StageType.STAGETYPE_WOTL] = Music.MUSIC_CATACOMBS,
	[StageType.STAGETYPE_AFTERBIRTH] = Music.MUSIC_FLOODED_CAVES,
	[StageType.STAGETYPE_REPENTANCE] = Music.MUSIC_MINES,
	[StageType.STAGETYPE_REPENTANCE_B] = Music.MUSIC_ASHPIT,
}

chapter_music[LevelStage.STAGE2_2] = chapter_music[LevelStage.STAGE2_1]

chapter_music[LevelStage.STAGE3_1] = {
	[StageType.STAGETYPE_ORIGINAL] = Music.MUSIC_DEPTHS,
	[StageType.STAGETYPE_WOTL] = Music.MUSIC_NECROPOLIS,
	[StageType.STAGETYPE_AFTERBIRTH] = Music.MUSIC_DANK_DEPTHS,
	[StageType.STAGETYPE_REPENTANCE] = Music.MUSIC_MAUSOLEUM,
	[StageType.STAGETYPE_REPENTANCE_B] = Music.MUSIC_GEHENNA,
}	

chapter_music[LevelStage.STAGE3_2] = chapter_music[LevelStage.STAGE3_1]

chapter_music[LevelStage.STAGE4_1] = {
	[StageType.STAGETYPE_ORIGINAL] = Music.MUSIC_WOMB_UTERO,
	[StageType.STAGETYPE_WOTL] = Music.MUSIC_UTERO,
	[StageType.STAGETYPE_AFTERBIRTH] = Music.MUSIC_SCARRED_WOMB,
	[StageType.STAGETYPE_REPENTANCE] = Music.MUSIC_CORPSE,
	[StageType.STAGETYPE_REPENTANCE_B] = Music.MUSIC_MORTIS,
}

chapter_music[LevelStage.STAGE4_2] = chapter_music[LevelStage.STAGE4_1]

chapter_music[LevelStage.STAGE4_3] = {
	[StageType.STAGETYPE_ORIGINAL] = Music.MUSIC_BLUE_WOMB,
}

chapter_music[LevelStage.STAGE5] = {
	[StageType.STAGETYPE_ORIGINAL] = Music.MUSIC_SHEOL,
	[StageType.STAGETYPE_WOTL] = Music.MUSIC_CATHEDRAL,
	[StageType.STAGETYPE_AFTERBIRTH] = Music.MUSIC_DARK_ROOM,
}

chapter_music[LevelStage.STAGE6] = {
	[StageType.STAGETYPE_ORIGINAL] = Music.MUSIC_DARK_ROOM,
	[StageType.STAGETYPE_WOTL] = Music.MUSIC_CHEST,
}

chapter_music[LevelStage.STAGE7] = {
	[StageType.STAGETYPE_ORIGINAL] = Music.MUSIC_VOID,
}

chapter_music[LevelStage.STAGE8] = {
	[StageType.STAGETYPE_ORIGINAL] = Music.MUSIC_ISAACS_HOUSE,
	[StageType.STAGETYPE_WOTL] = Music.MUSIC_ISAACS_HOUSE,
}

chapter_music_greed[LevelStage.STAGE1_GREED] = chapter_music[LevelStage.STAGE1_1]
chapter_music_greed[LevelStage.STAGE2_GREED] = chapter_music[LevelStage.STAGE2_1]
chapter_music_greed[LevelStage.STAGE3_GREED] = chapter_music[LevelStage.STAGE3_1]
chapter_music_greed[LevelStage.STAGE4_GREED] = chapter_music[LevelStage.STAGE4_1]
chapter_music_greed[LevelStage.STAGE5_GREED] = chapter_music[LevelStage.STAGE5]

chapter_music_greed[LevelStage.STAGE6_GREED] = {
	[StageType.STAGETYPE_ORIGINAL] = Music.MUSIC_SHOP_ROOM,
}

chapter_music_greed[LevelStage.STAGE7_GREED] = chapter_music_greed[LevelStage.STAGE6_GREED]

local random_music = { --this is for the "DELETE THIS" challenge
	[0] = Music.MUSIC_BASEMENT,
	[1] = Music.MUSIC_CELLAR,
	[2] = Music.MUSIC_BURNING_BASEMENT,
	[3] = Music.MUSIC_DOWNPOUR,
	[4] = Music.MUSIC_DROSS,
	[5] = Music.MUSIC_CAVES,
	[6] = Music.MUSIC_CATACOMBS,
	[7] = Music.MUSIC_FLOODED_CAVES,
	[8] = Music.MUSIC_MINES,
	[9] = Music.MUSIC_ASHPIT,
	[10] = Music.MUSIC_DEPTHS,
	[11] = Music.MUSIC_NECROPOLIS,
	[12] = Music.MUSIC_DANK_DEPTHS,
	[13] = Music.MUSIC_MAUSOLEUM,
	[14] = Music.MUSIC_GEHENNA,
	[15] = Music.MUSIC_WOMB_UTERO,
	[16] = Music.MUSIC_UTERO,
	[17] = Music.MUSIC_SCARRED_WOMB,
	[18] = Music.MUSIC_CORPSE,
	[19] = Music.MUSIC_BLUE_WOMB,
	[20] = Music.MUSIC_SHEOL,
	[21] = Music.MUSIC_CATHEDRAL,
	[22] = Music.MUSIC_DARK_ROOM,
	[23] = Music.MUSIC_CHEST,
	[24] = Music.MUSIC_VOID,
	--Music.MUSIC_MORTIS
}
local random_music_size = 25

local function correctedTrackNum(n)
	if redirectmusicenum[n] then
		return redirectmusicenum[n]
	end
	return n
end

local addMusicCallback
local removeMusicCallback
local musicQueue
local musicCrossfade
local musicPlay

local Callbacks = {}
local usernolayers = false
local roomclearbefore = false
local challengedonebefore = false
local challengeactivebefore = false
local previousgreedwave = 0
local previousbosscount = 0
local waitingforgamestjingle = true
local satanfightstage = 0
local ultragreedfightstage = 0
local doorprevvariants = {}
local inbadstage = false
local strangedoorstatebefore = DoorState.STATE_INIT
local foundknifepiecebefore = false
local devildoorspawnedbefore = false
local angeldoorspawnedbefore = false
local dogmadeathjingledelay = 0

--this table is only for the start jingles, and for unlooped tracks that, under specific circumstances, need to continue playing upon entering a new room and retain the queued track
local musicJingles = {}

--Cyber: "The length numbers used are subject to adjustment, but they matched vanilla fairly closely on my computer; I REALLY hope they're not machine dependent"
musicJingles[Music.MUSIC_JINGLE_GAME_START] = {
	["length"] = 220,
	["timeleft"] = 0,
	["gamestart"] = true,
}
musicJingles[Music.MUSIC_JINGLE_GAME_START_ALT] = {
	["length"] = 220,
	["timeleft"] = 0,
	["gamestart"] = true,
}
musicJingles[Music.MUSIC_JINGLE_BOSS_OVER] = {
	["length"] = 370, --these numbers will be in roughly 1/48 of a second, i.e. # of MC_POST_RENDER calls
	["timeleft"] = 0, --i.e. how many more MC_POST_RENDER calls until the jingle ends
	["nexttrack"] = Music.MUSIC_BOSS_OVER,
}
musicJingles[Music.MUSIC_JINGLE_BOSS_OVER2] = {
	["length"] = 242,
	["timeleft"] = 0,
	["nexttrack"] = Music.MUSIC_BOSS_OVER,
}
musicJingles[Music.MUSIC_JINGLE_BOSS_OVER3] = {
	["length"] = 434,
	["timeleft"] = 0,
	["nexttrack"] = Music.MUSIC_BOSS_OVER,
}
musicJingles[Music.MUSIC_MOTHERS_SHADOW_INTRO] = {
	["length"] = 425,
	["timeleft"] = 0,
	["nexttrack"] = Music.MUSIC_MINESHAFT_ESCAPE,
}

local soundJingleTimer --renamed treasure_jingle_timer
local soundJingleVolume = false --renamed treasure_volume
local soundJingles = {}

soundJingles[Music.MUSIC_JINGLE_TREASUREROOM_ENTRY_0] = {
	["id"] = Isaac.GetSoundIdByName("Treasure Jingle 1"),
}
soundJingles[Music.MUSIC_JINGLE_TREASUREROOM_ENTRY_1] = {
	["id"] = Isaac.GetSoundIdByName("Treasure Jingle 2"),
}
soundJingles[Music.MUSIC_JINGLE_TREASUREROOM_ENTRY_2] = {
	["id"] = Isaac.GetSoundIdByName("Treasure Jingle 3"),
}
soundJingles[Music.MUSIC_JINGLE_TREASUREROOM_ENTRY_3] = {
	["id"] = Isaac.GetSoundIdByName("Treasure Jingle 4"),
}
soundJingles[Music.MUSIC_JINGLE_SECRETROOM_FIND] = {
	["id"] = Isaac.GetSoundIdByName("Secret Room Jingle"),
}
soundJingles[Music.MUSIC_STRANGE_DOOR_JINGLE] = {
	["id"] = Isaac.GetSoundIdByName("Strange Door Jingle"),
}
soundJingles[Music.MUSIC_JINGLE_DEVILROOM_FIND] = {
	["id"] = SoundEffect.SOUND_SATAN_ROOM_APPEAR,
	["noVolumeChange"] = true,
}
soundJingles[Music.MUSIC_JINGLE_HOLYROOM_FIND] = {
	["id"] = SoundEffect.SOUND_CHOIR_UNLOCK,
	["noVolumeChange"] = true,
}

local stageapiexists = false

local overridemusicmgrfuncs = {
	Play = function(badself, track, vol) return musicPlay(track, nil, true) end,
	Fadein = function(badself, track, vol) return musicCrossfade(track, nil, true) end,
	Crossfade = function(badself, track) return musicCrossfade(track, nil) end,
	Queue = function(badself, track) return musicQueue(track, true) end,
	Fadeout = function(badself, ...) return musicmgr:Fadeout(...) end,
	Pause = function(badself, ...) return musicmgr:Pause(...) end,
	Resume = function(badself, ...) return musicmgr:Resume(...) end,
	EnableLayer = function(badself, ...) return musicmgr:EnableLayer(...) end,
	DisableLayer = function(badself, ...) return musicmgr:DisableLayer(...) end,
	IsLayerEnabled = function(badself, ...) return musicmgr:IsLayerEnabled(...) end,
	Enable = function(badself, ...) return musicmgr:Enable(...) end,
	Disable = function(badself, ...) return musicmgr:Disable(...) end,
	IsEnabled = function(badself, ...) return musicmgr:IsEnabled(...) end,
	PitchSlide = function(badself, ...) return musicmgr:PitchSlide(...) end,
	ResetPitch = function(badself, ...) return musicmgr:ResetPitch(...) end,
	VolumeSlide = function(badself, ...) return musicmgr:VolumeSlide(...) end,
	UpdateVolume = function(badself, ...) return musicmgr:UpdateVolume(...) end,
	GetCurrentMusicID = function(badself, ...) return musicmgr:GetCurrentMusicID(...) end,
	GetQueuedMusicID = function(badself, ...) return musicmgr:GetQueuedMusicID(...) end,
}

overridemusicmgrfuncs.__index = overridemusicmgrfuncs
local overridemusicmgr = {}
setmetatable(overridemusicmgr, overridemusicmgrfuncs)

local weakfunc = function() return end
local weakmusicmgrfuncs = {
	Play = weakfunc,
	Fadein = weakfunc,
	Crossfade = weakfunc,
	Queue = weakfunc
}

weakmusicmgrfuncs.__index = weakmusicmgrfuncs
local weakmusicmgr = {}
setmetatable(weakmusicmgr, weakmusicmgrfuncs)
setmetatable(weakmusicmgrfuncs, overridemusicmgrfuncs)

function MMC.ResetSave()
	modSaveData["railcomplete"] = false
	modSaveData["deathcertificateroom"] = false
	modSaveData["darkhome"] = 0
	
	modSaveData["secretjingles"] = {}
	modSaveData["railbuttons"] = {}
end

function MMC.LoadSave()
	local success = pcall(function()
		if Isaac.HasModData(MusicModCallback) then
			local dat = Isaac.LoadModData(MusicModCallback)
			modSaveData = json.decode(dat)
			usernolayers = modSaveData["usernolayers"]
		else
			modSaveData["usernolayers"] = false
		end
		
		--make sure we have values for non-boolean data
		if modSaveData["darkhome"] == nil then modSaveData["darkhome"] = 0 end
		if modSaveData["secretjingles"] == nil then modSaveData["secretjingles"] = {} end
		if modSaveData["railbuttons"] == nil then modSaveData["railbuttons"] = {} end
	end)
	if not success then
		MMC.ResetSave()
	end
end

local function getChapterMusic(floor_type, floor_variant, greed)
	local music_table = greed and chapter_music_greed or chapter_music
	local chapter = music_table[floor_type] or chapter_music_default
	return chapter[floor_variant] or chapter[StageType.STAGETYPE_ORIGINAL] or Music.MUSIC_TITLE_REPENTANCE
end

local function getRandomStageMusic(seed)
	return random_music[(seed % random_music_size)]
end

local musicByBackdrop = {
	[BackdropType.BASEMENT] = Music.MUSIC_BASEMENT,
	[BackdropType.CELLAR] = Music.MUSIC_CELLAR,
	[BackdropType.BURNT_BASEMENT] = Music.MUSIC_BURNING_BASEMENT,
	[BackdropType.DOWNPOUR] = Music.MUSIC_DOWNPOUR,
	[BackdropType.DROSS] = Music.MUSIC_DROSS,
	[BackdropType.CAVES] = Music.MUSIC_CAVES,
	[BackdropType.CATACOMBS] = Music.MUSIC_CATACOMBS,
	[BackdropType.FLOODED_CAVES] = Music.MUSIC_FLOODED_CAVES,
	[BackdropType.MINES] = Music.MUSIC_MINES,
	[BackdropType.ASHPIT] = Music.MUSIC_ASHPIT,
	[BackdropType.DEPTHS] = Music.MUSIC_DEPTHS,
	[BackdropType.NECROPOLIS] = Music.MUSIC_NECROPOLIS,
	[BackdropType.DANK_DEPTHS] = Music.MUSIC_DANK_DEPTHS,
	[BackdropType.MAUSOLEUM] = Music.MUSIC_MAUSOLEUM,
	[BackdropType.MAUSOLEUM2] = Music.MUSIC_MAUSOLEUM,
	[BackdropType.MAUSOLEUM3] = Music.MUSIC_MAUSOLEUM,
	[BackdropType.MAUSOLEUM4] = Music.MUSIC_MAUSOLEUM,
	[BackdropType.GEHENNA] = Music.MUSIC_GEHENNA,
	[BackdropType.WOMB] = Music.MUSIC_WOMB_UTERO,
	[BackdropType.UTERO] = Music.MUSIC_UTERO,
	[BackdropType.SCARRED_WOMB] = Music.MUSIC_SCARRED_WOMB,
	[BackdropType.CORPSE] = Music.MUSIC_CORPSE,
	[BackdropType.CORPSE2] = Music.MUSIC_CORPSE,
	[BackdropType.CORPSE3] = Music.MUSIC_CORPSE,
}

--check for death certificate
MusicModCallback:AddCallback(ModCallbacks.MC_USE_ITEM, function()
	modSaveData["deathcertificateroom"] = true
end, CollectibleType.COLLECTIBLE_DEATH_CERTIFICATE)

local function getStageMusic()
	local game = Game()
	local level = game:GetLevel()
	local stage = level:GetStage()
	local stage_type = level:GetStageType()
	local backdrop = Game():GetRoom():GetBackdropType()
	
	--play random music for "DELETE THIS" challenge
	if Isaac.GetChallenge() == Challenge.CHALLENGE_DELETE_THIS then
		local seeds = game:GetSeeds()
		local stageseed = seeds:GetStageSeed(stage)
		return getRandomStageMusic(stageseed)
	end
	
	--change music when the room backdrop changes in "Red Redemption" challenge
	if Isaac.GetChallenge() == Challenge.CHALLENGE_RED_REDEMPTION and musicByBackdrop[backdrop] then
		--NOTE: this is incomplete
		--TODO: specifically, we need a way to tell which music is supposed to play in special rooms that play the main stage music
		--such as RoomType.ROOM_CURSE, RoomType.ROOM_DICE, etc.
		return musicByBackdrop[backdrop]
	end
	
	--death certificate check
	if modSaveData["deathcertificateroom"] then
		if backdrop == BackdropType.DARK_CLOSET then
			return Music.MUSIC_DARK_CLOSET
		else
			modSaveData["deathcertificateroom"] = false
		end
	end
	return getChapterMusic(stage, stage_type, game:IsGreedMode())
end

local function getGenericBossMusic()
	local game = Game()
	local level = game:GetLevel()
	local stage_type = level:GetStageType()
	if stage_type == StageType.STAGETYPE_REPENTANCE or stage_type == StageType.STAGETYPE_REPENTANCE_B then
		return Music.MUSIC_BOSS3
	else
		local roomdesc = level:GetCurrentRoomDesc()
		local roomdescflags = roomdesc.Flags
		if (roomdescflags & RoomDescriptor.FLAG_ALT_BOSS_MUSIC) == 0 then
			return Music.MUSIC_BOSS
		else
			return Music.MUSIC_BOSS2
		end
	end
end

local function getGenericBossDeathJingle()
	local game = Game()
	local level = game:GetLevel()
	local stage_type = level:GetStageType()
	if stage_type == StageType.STAGETYPE_REPENTANCE or stage_type == StageType.STAGETYPE_REPENTANCE_B then
		return Music.MUSIC_JINGLE_BOSS_OVER3
	else
		local roomdesc = level:GetCurrentRoomDesc()
		local roomdescflags = roomdesc.Flags
		if (roomdescflags & RoomDescriptor.FLAG_ALT_BOSS_MUSIC) == 0 then
			return Music.MUSIC_JINGLE_BOSS_OVER
		else
			return Music.MUSIC_JINGLE_BOSS_OVER2
		end
	end
end

local function getBossMusic()
	local room = Game():GetRoom()
	local boss_id = room:GetBossID()
	
	if boss_id == 6 then
		return Music.MUSIC_MOM_BOSS
	elseif boss_id == 8 then
		return Music.MUSIC_MOMS_HEART_BOSS
	elseif boss_id == 25 then
		return Music.MUSIC_MOMS_HEART_BOSS
	elseif boss_id == 24 then
		return Music.MUSIC_DEVIL_ROOM
	elseif boss_id == 39 then
		return Music.MUSIC_ISAAC_BOSS
	elseif boss_id == 40 then
		return Music.MUSIC_BLUEBABY_BOSS
	elseif boss_id == 54 then
		return Music.MUSIC_DARKROOM_BOSS
	elseif boss_id == 55 then
		return Music.MUSIC_DEVIL_ROOM
	elseif boss_id == 62 then
		return Music.MUSIC_ULTRAGREED_BOSS
	elseif boss_id == 63 then
		return Music.MUSIC_BLUEBABY_BOSS
	elseif boss_id == 70 then
		return Music.MUSIC_VOID_BOSS
	elseif boss_id == 88 then
		return Music.MUSIC_MOTHER_BOSS
	end
	
	return getGenericBossMusic()
end

local function getMusicTrack()
	if waitingforgamestjingle then
		return musicmgr:GetCurrentMusicID()
	end
	
	local game = Game()
	local room = game:GetRoom()
	local roomtype = room:GetType()
	local level = game:GetLevel()
	local roomdesc = level:GetCurrentRoomDesc()
	local stage = level:GetStage()
	local stagetype = level:GetStageType()
	local roomidx = level:GetCurrentRoomIndex()
	local ascent = level:IsAscent()
	local inrepstage = stagetype == StageType.STAGETYPE_REPENTANCE or stagetype == StageType.STAGETYPE_REPENTANCE_B
	local curseoflabyrinth = (level:GetCurses() & LevelCurse.CURSE_OF_LABYRINTH) == LevelCurse.CURSE_OF_LABYRINTH
	
	if room:IsMirrorWorld() and (stage == LevelStage.STAGE1_2 or (stage == LevelStage.STAGE1_1 and curseoflabyrinth)) and inrepstage then
		if roomtype ~= RoomType.ROOM_BOSS then
			local stage_type = level:GetStageType()
			if stage_type == StageType.STAGETYPE_REPENTANCE then
				return Music.MUSIC_DOWNPOUR_REVERSE --in vanilla, the reversed track for Downpour is slowly faded in on top of the normal track
			elseif stage_type == StageType.STAGETYPE_REPENTANCE_B then
				return Music.MUSIC_DROSS_REVERSE --but strangely, reversed Dross plays immediately
			end
		end
	elseif room:HasCurseMist() and (stage == LevelStage.STAGE2_2 or (stage == LevelStage.STAGE2_1 and curseoflabyrinth)) and inrepstage then
		if level:GetStateFlag(LevelStateFlag.STATE_MINESHAFT_ESCAPE) then --this flag doesn't seem to be set until leaving the room after Mom's Shadow spawns
			return Music.MUSIC_MINESHAFT_ESCAPE
		else
			return Music.MUSIC_MINESHAFT_AMBIENT
		end
	elseif modSaveData["darkhome"] == 4 and stage == LevelStage.STAGE8 and room:GetRoomShape() == RoomShape.ROOMSHAPE_1x2 then-- Dogma fighting and in Dogma room
		return Music.MUSIC_DOGMA_BOSS
	end
	
	--TODO: play Boss Over Twisted instead of Mom Fight music when fighting Mausoleum Mom when STATE_MAUSOLEUM_HEART_KILLED is true
	--TODO: compare vanilla to MMC: check what happens if you rerun or use Forget Me Not and replay the Mineshaft Escape
	--TODO: need to play Mineshaft Escape music in Crawlspace! Also, compare vanilla to MMC of Mineshaft Escape in Black Market
	
	if ascent then
		return Music.MUSIC_REVERSE_GENESIS
	elseif game:GetStateFlag(GameStateFlag.STATE_MAUSOLEUM_HEART_KILLED) and (stage == LevelStage.STAGE3_2 or (stage == LevelStage.STAGE3_1 and curseoflabyrinth)) and inrepstage and not (roomtype == RoomType.ROOM_BOSS and room:GetBossID() == 8) then
		return Music.MUSIC_BOSS_OVER_TWISTED
	elseif roomtype == RoomType.ROOM_MINIBOSS or roomdesc.SurpriseMiniboss then
		if room:IsClear() then
			return Music.MUSIC_BOSS_OVER
		else
			return Music.MUSIC_CHALLENGE_FIGHT --Minibosses play Challenge music in Repentance
		end
	elseif roomtype == RoomType.ROOM_DEFAULT then
		return getStageMusic()
	elseif roomtype == RoomType.ROOM_SHOP then
		if (game:IsGreedMode() or level:GetStage() ~= LevelStage.STAGE4_3) then
			return Music.MUSIC_SHOP_ROOM
		else
			return getStageMusic()
		end
	elseif roomtype == RoomType.ROOM_TREASURE then
		return getStageMusic()
	elseif roomtype == RoomType.ROOM_BOSS then
		if room:IsClear() then
			if inrepstage and (stage == LevelStage.STAGE3_2 or (stage == LevelStage.STAGE3_1 and curseoflabyrinth)) then
				if game:GetStateFlag(GameStateFlag.STATE_MAUSOLEUM_HEART_KILLED) then
					if room:GetBossID() == 8 then
						return Music.MUSIC_NULL --No music plays here
					else
						return Music.MUSIC_BOSS_OVER_TWISTED
					end
				end
			end
			return Music.MUSIC_BOSS_OVER
		else
			if room:GetBossID() == 0 then
				return getGenericBossMusic()
			else
				return Music.MUSIC_JINGLE_BOSS
			end
		end
	elseif roomtype == RoomType.ROOM_SECRET then
		return Music.MUSIC_SECRET_ROOM
	elseif roomtype == RoomType.ROOM_SUPERSECRET then
		return Music.MUSIC_SECRET_ROOM2
	elseif roomtype == RoomType.ROOM_ARCADE then
		return Music.MUSIC_ARCADE_ROOM
	elseif roomtype == RoomType.ROOM_DEVIL then
		return Music.MUSIC_DEVIL_ROOM
	elseif roomtype == RoomType.ROOM_ANGEL then
		return Music.MUSIC_ANGEL_ROOM
	elseif roomtype == RoomType.ROOM_LIBRARY then
		return Music.MUSIC_LIBRARY_ROOM
	elseif roomtype == RoomType.ROOM_CHALLENGE then
		if room:IsAmbushDone() then	
			return Music.MUSIC_BOSS_OVER
		elseif room:IsAmbushActive() then
			return Music.MUSIC_CHALLENGE_FIGHT
		else
			return getStageMusic()
		end
	elseif roomtype == RoomType.ROOM_BOSSRUSH then
		if room:IsAmbushDone() then	
			return Music.MUSIC_BOSS_OVER
		elseif room:IsAmbushActive() then
			return Music.MUSIC_BOSS_RUSH
		else
			return getStageMusic()
		end
	elseif roomtype == RoomType.ROOM_PLANETARIUM then
		return Music.MUSIC_PLANETARIUM
	elseif roomtype == RoomType.ROOM_ULTRASECRET then
		return Music.MUSIC_SECRET_ROOM_ALT_ALT
	elseif roomtype == RoomType.ROOM_SECRET_EXIT then
		return Music.MUSIC_BOSS_OVER --the rooms with the exits to the Repentance alt floors
	elseif roomtype == RoomType.ROOM_DUNGEON and stage == LevelStage.STAGE8 and roomidx == GridRooms.ROOM_SECRET_EXIT_IDX then
		return Music.MUSIC_BEAST_BOSS
	elseif roomidx == GridRooms.ROOM_ROTGUT_DUNGEON1_IDX then
		return getGenericBossMusic()
	elseif roomidx == GridRooms.ROOM_ROTGUT_DUNGEON2_IDX then
		return getGenericBossMusic()
	else
		return getStageMusic()
	end	
end

local function mirrorSoundIsPlaying()
	return (SFXManager():IsPlaying(SoundEffect.SOUND_MIRROR_ENTER) or SFXManager():IsPlaying(SoundEffect.SOUND_MIRROR_EXIT))
end

function addMusicCallback(ref, func, ...)
	assert(type(ref) == "table" and ref.Name, "Expected registered mod table for 1st argument, got "..type(ref))
	assert(type(func) == "function", "Expected function for 2nd argument, got "..type(func))
	local tracks = {...}
	for i=1,#tracks do
		local v = tracks[i]
		tracks[i] = tonumber(v)
	end
	if #tracks == 0 then tracks = nil end
	Callbacks[#Callbacks + 1] = {ref = ref.Name, func = func, tracks = tracks}
end

function removeMusicCallback(ref)
	assert(type(ref) == "table" and ref.Name, "Expected registered mod table for 1st argument, got "..type(ref))
	for i=1,#Callbacks do
		local v = Callbacks[i]
		if v.ref == ref.Name then
			table.remove(Callbacks, i)
			i = i - 1
		end
	end
end

local function iterateThroughCallbacks(track, isQueued) -- returns correct track
	for i=1,#Callbacks do
		local v = Callbacks[i]
		
		local trackincallback = false
		if v.tracks then
			for j,k in ipairs(v.tracks) do
				if k == track then
					trackincallback = true
					break
				end
			end
		else
			trackincallback = true
		end
		
		if trackincallback then
			local s, res, res2, len = pcall(v.func, v.ref, track, isQueued) --len is jingle length or jingle sound id
			if s then
				res = tonumber(res)
				if res then
					return res, tonumber(res2), tonumber(len)
				end
			else
				Isaac.ConsoleOutput("Error in music mod callback: "..res.."\n")
			end
		end
	end
	return track
end

function musicCrossfade(track, track2) --TODO: make use of faderate argument?
	local replacedtrack2 = false
	local id, id2, jinglelength = iterateThroughCallbacks(track, false)
	if id2 then replacedtrack2 = true end
	id2 = id2 or track2
	local faderate = 0.08 --0.08 is default in MusicManager.Crossfade
	if mirrorSoundIsPlaying() and Game():GetLevel():GetStageType() == StageType.STAGETYPE_REPENTANCE then faderate = 0.01 end
	if not id then
		return
	elseif id > 0 then
		--NOTE: which tracks are considered jingles is based on the track BEFORE replacement
		--for example, anything that replaces a boss over jingle is considered a jingle
		--but if a boss over jingle replaces a stage track, it is not considered a jingle
		--IMPORTANT: replaced jingles can have different length, so if the callback function does not return a length, do not run special jingle code
		--NOTE: the intention is that if a function does not return jinglelength, then the code runs like normal with no issues
		if not Game():IsGreedMode() and musicJingles[track] and (jinglelength or track == id) then --if we replaced this jingle and didn't provide length, don't run jingle-specific code
			--Isaac.DebugString("running music jingle code for track "..tostring(track))
			--Isaac.DebugString("jinglelength found to be "..tostring(jinglelength))
			if jinglelength then
				musicJingles[track]["timeleft"] = jinglelength
			else
				musicJingles[track]["timeleft"] = musicJingles[track]["length"]
			end
			musicJingles[track]["nexttrack"] = track2
			id2 = 0 --don't queue because we are going to play in the MC_POST_RENDER function
		end
		if musicmgr:GetCurrentMusicID() ~= id then
			musicmgr:Crossfade(correctedTrackNum(id), faderate)
		end
		if id2 and id2 > 0 then
			if replacedtrack2 then
				musicmgr:Queue(correctedTrackNum(id2))
			else
				musicQueue(id2)
			end
		end
	elseif id < 0 then
		if id2 then
			if id2 == 0 then
				return
			elseif id2 < 0 then
				musicmgr:Fadeout()
				return
			end
			if replacedtrack2 then
				musicmgr:Crossfade(correctedTrackNum(id2), faderate)
			else
				musicCrossfade(id2, false)
			end
		else
			musicmgr:Fadeout()
		end
	end
end

function musicPlay(track, track2)
	local replacedtrack2 = false
	local id, id2, jingleinfo = iterateThroughCallbacks(track or false, false)
	
	--NOTE: which tracks are considered jingles is based on the track BEFORE replacement
	--for example, anything that replaces a treasure room jingle is considered a jingle
	--but if a treasure room jingle replaces a stage track, it is not considered a jingle
	--IMPORTANT: replaced jingles probably have a different sound ID, so if the callback function does not return a sound id, do not run special jingle code
	--NOTE: the intention is that if a function does not return jingleinfo, then the code runs like normal with no issues
	if soundJingles[track] and (jingleinfo or track == id) then --if we replaced this jingle and didn't provide jingleinfo, don't run jingle-specific code
		--Isaac.DebugString("running sound jingle code for track "..tostring(track))
		--Isaac.DebugString("jingleinfo found to be "..tostring(jingleinfo))
		local sfxid
		if jingleinfo then
			sfxid = jingleinfo
		else
			sfxid = soundJingles[track]["id"]
		end
		--Isaac.DebugString("sfxid found to be "..tostring(sfxid))
		if sfxid and sfxid > 0 then
			SFXManager():Play(sfxid,1,0,false,1)
			if not soundJingles[track]["noVolumeChange"] then
				soundJingleTimer = 145 --roughly 3 seconds
				soundJingleVolume = false
			end
		end
		id = -1 --musicmgr skips track 1, plays track 2
	end
	
	if id2 then replacedtrack2 = true end
	id2 = id2 or track2
	if id and id > 0 then
		--NOTE: which tracks are considered jingles is based on the track BEFORE replacement
		--for example, anything that replaces a boss over jingle is considered a jingle
		--but if a boss over jingle replaces a stage track, it is not considered a jingle
		--IMPORTANT: replaced jingles can have different length, so if the callback function does not return a length, do not run special jingle code
		--NOTE: the intention is that if a function does not return jingleinfo, then the code runs like normal with no issues
		if not Game():IsGreedMode() and musicJingles[track] and (jingleinfo or track == id) then --if we replaced this jingle and didn't provide length, don't run jingle-specific code
			--Isaac.DebugString("running music jingle code for track "..tostring(track))
			--Isaac.DebugString("jingleinfo found to be "..tostring(jingleinfo))
			if jingleinfo then
				musicJingles[track]["timeleft"] = jingleinfo
			else
				musicJingles[track]["timeleft"] = musicJingles[track]["length"]
			end
			musicJingles[track]["nexttrack"] = track2
			id2 = 0 --don't queue because we are going to play in the MC_POST_RENDER function
		end
		
		if musicmgr:GetCurrentMusicID() ~= id then
			musicmgr:Play(correctedTrackNum(id),1)
			if not soundJingleVolume then
				musicmgr:UpdateVolume()
			end
		end
	elseif id == 0 then
		return
	elseif id < 0 then
		if id2 then
			if id2 == 0 then
				return
			elseif id2 < 0 then
				musicmgr:Fadeout()
				return
			end
			if replacedtrack2 then
				musicmgr:Play(correctedTrackNum(id2),1)
				if not soundJingleVolume then
					musicmgr:UpdateVolume()
				end
			else
				musicPlay(id2)
			end
		else
			musicmgr:Fadeout()
		end
		return
	end
	if id2 and id2 > 0 then
		if replacedtrack2 then
			musicmgr:Queue(correctedTrackNum(id2))
		else
			musicQueue(id2)
		end
	end
end

function musicQueue(track)
	local id = iterateThroughCallbacks(track or false, true)
	if id and id > 0 then
		musicmgr:Queue(correctedTrackNum(id))
	end
end

function MusicModCallback:StageAPIcheck()
	if StageAPI and StageAPI.Loaded then
		stageapiexists = true
	else
		stageapiexists = false
	end
	
	if stageapiexists then
		if StageAPI.InNewStage() then
			inbadstage = true
			-- musicmgr:Play(getStageMusic(),1) -- StageAPI waits for other music to play.
			-- StageAPI.Music = overridemusicmgr
			StageAPI.Music = overridemusicmgr
		else
			inbadstage = false
			StageAPI.Music = weakmusicmgr
		end
	else
		inbadstage = false
	end
end

function MusicModCallback:LoadSaveData(isContinued)
	--run this when we start a game so we get the correct data for this save file
	if isContinued then
		MMC.LoadSave()
	else
		MMC.ResetSave()
	end
end

function MusicModCallback:UpdateSaveValuesForNewFloor()
	MMC.ResetSave()
end

function MusicModCallback:InitializeMusicJingles(isContinued) --this function kicks off the Game Start Jingle countdown
	local currentMusicId = musicmgr:GetCurrentMusicID()
	if currentMusicId == Music.MUSIC_JINGLE_GAME_START or currentMusicId == Music.MUSIC_JINGLE_GAME_START_ALT then
		musicJingles[currentMusicId]["timeleft"] = musicJingles[currentMusicId]["length"]
		
		local room = Game():GetRoom()
		if Isaac.GetChallenge() == Challenge.CHALLENGE_DELETE_THIS and not isContinued then
			musicJingles[currentMusicId]["nexttrack"] = -1 --fadeout
		elseif room:GetType() == RoomType.ROOM_BOSS and not room:IsClear() then
			musicJingles[currentMusicId]["nexttrack"] = nil
		else
			waitingforgamestjingle = false --trick getMusicTrack into giving us the track early
			musicJingles[currentMusicId]["nexttrack"] = getMusicTrack()
			waitingforgamestjingle = true --Cyber: "This may not be good code, but I don't want to interfere with the check that Nato added to the beginning of getMusicTrack because I figure it is important for the Soundtrack Menu."
		end
	end
end

MusicModCallback:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, MusicModCallback.StageAPIcheck)
MusicModCallback:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, MusicModCallback.UpdateSaveValuesForNewFloor)

--ensure correct "darkhome" value at start of Home, even if jumping to Home using debug console
MusicModCallback:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, function()
	local level = Game():GetLevel()
	if level:GetStage() == LevelStage.STAGE8 then
		if level:GetStageType() == StageType.STAGETYPE_WOTL then
			modSaveData["darkhome"] = 2
		else
			modSaveData["darkhome"] = 0
		end
	end
end)

MusicModCallback:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, MusicModCallback.StageAPIcheck)
MusicModCallback:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, MusicModCallback.LoadSaveData)
MusicModCallback:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, MusicModCallback.InitializeMusicJingles)

function MusicModCallback:PlayGameOverMusic(isGameOver)
	for i,v in pairs(musicJingles) do
		v["timeleft"] = 0
	end
	if isGameOver then
		musicCrossfade(Music.MUSIC_JINGLE_GAME_OVER, Music.MUSIC_GAME_OVER)
	end
end
MusicModCallback:AddCallback(ModCallbacks.MC_POST_GAME_END, MusicModCallback.PlayGameOverMusic)

MusicModCallback:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function()
	if not inbadstage then
		local room = Game():GetRoom()
		local roomtype = room:GetType()
		local level = Game():GetLevel()
		local ascent = level:IsAscent()
		local curseoflabyrinth = (level:GetCurses() & LevelCurse.CURSE_OF_LABYRINTH) == LevelCurse.CURSE_OF_LABYRINTH
		
		previousgreedwave = 0
		previousbosscount = 0
		satanfightstage = 0
		ultragreedfightstage = 0
		
		challengeactivebefore = room:IsAmbushActive()
		challengedonebefore = room:IsAmbushDone()
		roomclearbefore = room:IsClear()
		devildoorspawnedbefore = false
		angeldoorspawnedbefore = false
		
		for i=0,7 do
			local door = room:GetDoor(i)
			if door then
				doorprevvariants[i] = door:GetVariant()
				
				if door.TargetRoomType == RoomType.ROOM_DEVIL then
					devildoorspawnedbefore = true
				end
				if door.TargetRoomType == RoomType.ROOM_ANGEL then
					angeldoorspawnedbefore = true
				end
			end
		end
		
		--initialize MINES/ASHPIT II RAIL BUTTONS upon discovery
		if not modSaveData["railcomplete"] and (level:GetStage() == LevelStage.STAGE2_2 or (level:GetStage() == LevelStage.STAGE2_1 and curseoflabyrinth)) and level:GetStageType() >= StageType.STAGETYPE_REPENTANCE then
			local roomdesc = level:GetCurrentRoomDesc()
			local roomdescflags = roomdesc.Flags
			if (roomdescflags & RoomDescriptor.FLAG_RED_ROOM) == 0 then
				for i = 1, room:GetGridSize() do
					local gridentity = room:GetGridEntity(i)
					if gridentity and gridentity:GetType() == GridEntityType.GRID_PRESSURE_PLATE and gridentity:GetVariant() == 3 then
						--found a rail button
						local roomidx = roomdesc.SafeGridIndex
						if modSaveData["railbuttons"][tostring(roomidx)] == nil then
							modSaveData["railbuttons"][tostring(roomidx)] = false
						end
						break
					end
				end
			end
		end
		
		if not waitingforgamestjingle then
			--if we need to, we can stop music from playing in a new room
			local skipCrossfade = false
			
			if room:HasCurseMist() and musicJingles[Music.MUSIC_MOTHERS_SHADOW_INTRO]["timeleft"] > 0 then
				skipCrossfade = true
			else
				musicJingles[Music.MUSIC_MOTHERS_SHADOW_INTRO]["timeleft"] = 0
			end
			
			local prevRoomType = RoomType.ROOM_NULL
			if level.EnterDoor >= 0 then
				local prevRoomDoor = room:GetDoor(level.EnterDoor)
				if prevRoomDoor then
					prevRoomType = prevRoomDoor.TargetRoomType
				end
			end
			
			--NOTE: the room:IsClear() check handles back-to-back Bosses (i.e. XL floors)
			if (roomtype == RoomType.ROOM_SECRET_EXIT or (roomtype == RoomType.ROOM_BOSS and room:IsClear() and (prevRoomType == RoomType.ROOM_SECRET_EXIT or prevRoomType == RoomType.ROOM_BOSS))) and (musicJingles[Music.MUSIC_JINGLE_BOSS_OVER]["timeleft"] > 0 or musicJingles[Music.MUSIC_JINGLE_BOSS_OVER2]["timeleft"] > 0 or musicJingles[Music.MUSIC_JINGLE_BOSS_OVER3]["timeleft"] > 0) then
				--Isaac.DebugString("skipping crossfade for Boss Room or Secret Exit Room")
				skipCrossfade = true
			else
				musicJingles[Music.MUSIC_JINGLE_BOSS_OVER]["timeleft"] = 0
				musicJingles[Music.MUSIC_JINGLE_BOSS_OVER2]["timeleft"] = 0
				musicJingles[Music.MUSIC_JINGLE_BOSS_OVER3]["timeleft"] = 0
			end
			
			if not skipCrossfade then
				local musictrack = getMusicTrack()
				if musictrack == Music.MUSIC_BOSS_OVER_TWISTED then
					musicPlay(musictrack)
				else
					musicCrossfade(musictrack)
				end
			end
		else
			--if we change rooms while waiting for game start jingle, update "nexttrack"
			local currentMusicId = musicmgr:GetCurrentMusicID()
			if musicJingles[currentMusicId] and musicJingles[currentMusicId]["timeleft"] > 0 then
				waitingforgamestjingle = false --trick getMusicTrack into giving us the track early
				musicJingles[currentMusicId]["nexttrack"] = getMusicTrack()
				waitingforgamestjingle = true
			end
		end
		
		if usernolayers or MMC.DisableMusicLayers then
			musicmgr:DisableLayer()
		end
		
		--NOTE: moved treasure/sound jingle initalization to musicPlay
		
		--moved from getMusicTrack to here so we can use musicPlay instead of musicCrossfade
		if room:GetType() == RoomType.ROOM_TREASURE and room:IsFirstVisit() and (Game():IsGreedMode() or level:GetStage() ~= LevelStage.STAGE4_3) and not room:IsMirrorWorld() and not ascent then
			local rng = math.random(0,3)
			local treasurejingle
			if rng == 0 then
				treasurejingle = Music.MUSIC_JINGLE_TREASUREROOM_ENTRY_0
			elseif rng == 1 then
				treasurejingle = Music.MUSIC_JINGLE_TREASUREROOM_ENTRY_1
			elseif rng == 2 then
				treasurejingle = Music.MUSIC_JINGLE_TREASUREROOM_ENTRY_2
			elseif rng == 3 then
				treasurejingle = Music.MUSIC_JINGLE_TREASUREROOM_ENTRY_3
			end
			musicPlay(treasurejingle, getStageMusic())
		end
	end
end)

MusicModCallback:AddCallback(ModCallbacks.MC_POST_NPC_INIT, function(self, ent)
	local room = Game():GetRoom()
	local roomtype = room:GetType()
	
	if roomtype == RoomType.ROOM_BOSS and room:GetBossID() == 63 then
		musicCrossfade(Music.MUSIC_HUSH_BOSS)
	end
end, EntityType.ENTITY_HUSH)

--[[MusicModCallback:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, function()
    modSaveData["darkhome"] = 5
end, EntityType.ENTITY_DOGMA)]]

function MusicModCallback:PlayDogmaOutro(entity)
    if entity.Variant ~= 1 and entity:IsDead() then
        modSaveData["darkhome"] = 5
    end
    --for whatever reason the NPC death doesn't trigger for dogma and
    --this function stops running the same frame dogma starts the death
    --animation so I moved the death jingle to post_render
    
    --[[local sprite = entity:GetSprite()
    local anim = sprite:GetAnimation()
    if anim == "Death" then
        local frame = sprite:GetFrame()
        if frame == 80 then
            musicPlay(Music.MUSIC_JINGLE_DOGMA_OVER)
        end
    end]]
end
MusicModCallback:AddCallback(ModCallbacks.MC_NPC_UPDATE, MusicModCallback.PlayDogmaOutro, EntityType.ENTITY_DOGMA)

--handle Angel Statue fights
function MusicModCallback:StartAngelFight()
	local room = Game():GetRoom()
	local roomtype = room:GetType()
	
	if roomtype == RoomType.ROOM_ANGEL or roomtype == RoomType.ROOM_SUPERSECRET then
		musicCrossfade(getGenericBossMusic())
	end
end

function MusicModCallback:EndAngelFight()
	local room = Game():GetRoom()
	local roomtype = room:GetType()
	
	if (roomtype == RoomType.ROOM_ANGEL or roomtype == RoomType.ROOM_SUPERSECRET) and Isaac.CountBosses() <= 1 then
		musicCrossfade(getGenericBossDeathJingle(), Music.MUSIC_BOSS_OVER)
	end
end

MusicModCallback:AddCallback(ModCallbacks.MC_POST_NPC_INIT, MusicModCallback.StartAngelFight, EntityType.ENTITY_URIEL)
MusicModCallback:AddCallback(ModCallbacks.MC_POST_NPC_INIT, MusicModCallback.StartAngelFight, EntityType.ENTITY_GABRIEL)

MusicModCallback:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, MusicModCallback.EndAngelFight, EntityType.ENTITY_URIEL)
MusicModCallback:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, MusicModCallback.EndAngelFight, EntityType.ENTITY_GABRIEL)
--end Angel Statue fight functions

MusicModCallback:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, function()
	waitingforgamestjingle = true
	roomclearbefore = false
	challengedonebefore = false
	challengeactivebefore = false
	previousgreedwave = 0
	previousbosscount = 0
	satanfightstage = 0
	ultragreedfightstage = 0
	strangedoorstatebefore = DoorState.STATE_INIT
	foundknifepiecebefore = false
	devildoorspawnedbefore = false
	angeldoorspawnedbefore = false
	
	for i,v in pairs(musicJingles) do
		v["timeleft"] = 0
	end
	
	Isaac.SaveModData(MusicModCallback, json.encode(modSaveData))
end)

MusicModCallback:AddCallback(ModCallbacks.MC_EXECUTE_CMD, function(self, cmd, params)
	if cmd == "mmclayer" then
		if params == "0" then
			usernolayers = true
			modSaveData["usernolayers"] = usernolayers
			Isaac.SaveModData(MusicModCallback, json.encode(modSaveData))
			--Isaac.SaveModData(MusicModCallback, "0") --legacy
			musicmgr:DisableLayer()
			return "Disabled music layers.\n"
		elseif params == "1" then
			usernolayers = false
			modSaveData["usernolayers"] = usernolayers
			Isaac.SaveModData(MusicModCallback, json.encode(modSaveData))
			--Isaac.SaveModData(MusicModCallback, "1") --legacy
			return "Enabled music layers.\n"
		end
	end
end)

local NightmarePlaying = false
MusicModCallback:AddCallback(ModCallbacks.MC_POST_RENDER, function()
	if inbadstage then return end
	
	local room = Game():GetRoom()
	local level = Game():GetLevel()
	local roomclearnow = room:IsClear()
	local challengedonenow = room:IsAmbushDone()
	local challengeactivenow = room:IsAmbushActive()
	local roomdesc = Game():GetLevel():GetCurrentRoomDesc()
	local currentMusicId = musicmgr:GetCurrentMusicID()
	local ispaused = Game():IsPaused()
	local curseoflabyrinth = (level:GetCurses() & LevelCurse.CURSE_OF_LABYRINTH) == LevelCurse.CURSE_OF_LABYRINTH
	
	for i,v in pairs(musicJingles) do
		if v["timeleft"] > 0 then
			v["timeleft"] = v["timeleft"] - 1
			if v["timeleft"] == 0 then
				--Isaac.DebugString("music jingle "..tostring(i).." ended")
				if v["gamestart"] then
					waitingforgamestjingle = false
				end
				if v["nexttrack"] then
					--Isaac.DebugString("nexttrack found to be "..tostring(v["nexttrack"]))
					if v["nexttrack"] == Music.MUSIC_BOSS_OVER_TWISTED then
						musicPlay(v["nexttrack"])
					else
						musicCrossfade(v["nexttrack"])
					end
					v["nexttrack"] = nil
				else --failsafe for game start jingles, but nexttrack should be set for those, too
					if room:GetType() ~= RoomType.ROOM_BOSS or room:IsClear() then
						musicCrossfade(getMusicTrack())
					end
				end
				return
			end
		end
	end
	
	if room:GetFrameCount() < 10 and (currentMusicId == Music.MUSIC_JINGLE_GAME_START or currentMusicId == Music.MUSIC_JINGLE_GAME_START_ALT) then
		waitingforgamestjingle = true
	end
	
	--upon reset, play new music immediately
	if waitingforgamestjingle and (currentMusicId ~= Music.MUSIC_JINGLE_GAME_START and currentMusicId ~= Music.MUSIC_JINGLE_GAME_START_ALT) then
		waitingforgamestjingle = false
		if room:GetType() == RoomType.ROOM_BOSS and not room:IsClear() then
			musicCrossfade(getBossMusic())
		else
			musicCrossfade(getMusicTrack())
		end
		return
	end
	
	--renamed treasure_jingle_timer and treasure_volume
	if soundJingleTimer then
		if soundJingleTimer > 0 then
			if not soundJingleVolume then
				--Isaac.DebugString("sliding volume down because sound jingle is playing")
				musicmgr:VolumeSlide(0.1, 0.05)
				soundJingleVolume = true
			end
			soundJingleTimer = soundJingleTimer - 1
		else
			soundJingleTimer = nil
			soundJingleVolume = false
			musicmgr:VolumeSlide(1, 0.05)
			--Isaac.DebugString("sliding volume up because sound jingle ended")
		end
	end
	
	--this is necessary for the music to play after Dream Catcher animations
    if (currentMusicId == Music.MUSIC_JINGLE_NIGHTMARE or (NightmarePlaying and NightmareScene.IsDogmaNightmare() == false)) and Game():GetHUD():IsVisible() then
		for i,v in pairs(musicJingles) do
			v["timeleft"] = 0
		end
		musicCrossfade(getStageMusic())
	end
	
	if room:GetType() == RoomType.ROOM_MINIBOSS or roomdesc.SurpriseMiniboss then
		local currentbosscount = Isaac.CountBosses()
		
		if currentbosscount == 0 and previousbosscount > 0 then
			musicCrossfade(Music.MUSIC_JINGLE_CHALLENGE_OUTRO, Music.MUSIC_BOSS_OVER) --minibosses play Challenge music in Repentance
		end
		
		previousbosscount = currentbosscount
	end
	
	if Game():IsGreedMode() then
		local currentgreedwave = Game():GetLevel().GreedModeWave
		local totalWaves
		
		if Game().Difficulty == Difficulty.DIFFICULTY_GREEDIER then
			totalWaves = 12
		else
			totalWaves = 11
		end
		
		if room:GetType() == RoomType.ROOM_BOSS then
			local currentbosscount = Isaac.CountBosses()
			
			if currentbosscount > 0 and room:GetFrameCount() == 1 then
				ultragreedfightstage = 0
				satanfightstage = 0
				musicCrossfade(getBossMusic())
			end
			
			if room:GetFrameCount() > 1 then
				if room:GetBossID() == 62 then
					if ultragreedfightstage == 0 then
						if currentbosscount == 0 then
							ultragreedfightstage = 2
							musicCrossfade(Music.MUSIC_BOSS_OVER)
							return
						end
						ultragreedfightstage = 1
						musicCrossfade(getBossMusic())
					elseif ultragreedfightstage == 1 then
						for i,v in ipairs(Isaac.GetRoomEntities()) do
							if v.Type == EntityType.ENTITY_ULTRA_GREED then
								if v:ToNPC().State == 9001 then
									ultragreedfightstage = 2
									musicCrossfade(Music.MUSIC_BOSS_OVER) --don't play boss over jingle for Ultra Greed
								end
								break
							end
						end
					end
				elseif room:GetBossID() == 55 then --for the "Mega Satan in Greed Mode" mod
					if satanfightstage == 0 and room:GetFrameCount() > 10 and not room:IsClear() then
						local playertable = Isaac.FindByType(EntityType.ENTITY_PLAYER,0) --variant 0 is true players, i.e. not co-op babies
						for i,entity in pairs(playertable) do
							--TODO: check Soul of the Forgotten?
							local tempPlayer = entity:ToPlayer()
							if tempPlayer and tempPlayer.Position.Y < 540 then
								musicCrossfade(Music.MUSIC_SATAN_BOSS)
								satanfightstage = 3
								break
							end
						end
					end
					if currentbosscount == 0 and previousbosscount > 0 then --this doesn't actually occur for the "Mega Satan in Greed Mode" mod without this mod's help
						musicCrossfade(getGenericBossDeathJingle(), Music.MUSIC_BOSS_OVER)
					end
				else --the room right before Ultra Greed's room
					if currentbosscount > 0 and previousbosscount == 0 then
						musicCrossfade(getGenericBossMusic())
					end
					
					if currentbosscount == 0 and previousbosscount > 0 then
						musicCrossfade(getGenericBossDeathJingle(), Music.MUSIC_BOSS_OVER)
					end
				end
			end
			
			previousbosscount = currentbosscount
		else
			if level:GetStage() == LevelStage.STAGE6_GREED then
				if room:GetType() == RoomType.ROOM_DEFAULT then
					if currentgreedwave < (totalWaves - 2) then
						if roomclearbefore and not roomclearnow then
							musicCrossfade(Music.MUSIC_CHALLENGE_FIGHT)
						end
						if roomclearnow and not roomclearbefore then
							musicCrossfade(Music.MUSIC_JINGLE_CHALLENGE_OUTRO, Music.MUSIC_SHOP_ROOM)
						end
					end
				end
			end
			
			if room:GetType() == RoomType.ROOM_DEFAULT then
				if roomclearbefore and not roomclearnow then
					if currentgreedwave == (totalWaves - 2) or currentgreedwave == (totalWaves - 1) then
						musicCrossfade(getGenericBossMusic())
					elseif currentgreedwave == totalWaves then
						musicCrossfade(Music.MUSIC_SATAN_BOSS)
					end
				elseif roomclearnow and not roomclearbefore then
					if currentgreedwave == (totalWaves - 2) or currentgreedwave == (totalWaves - 1) then
						musicCrossfade(getGenericBossDeathJingle(), Music.MUSIC_BOSS_OVER)
					elseif currentgreedwave == totalWaves then
						musicCrossfade(Music.MUSIC_BOSS_OVER) --no boss over jingle after Devil Deal Wave
					end
				end
			end
		end
		
		previousgreedwave = currentgreedwave
	else --Normal or Hard Mode (i.e. not Greed Mode)
		if room:GetType() == RoomType.ROOM_CHALLENGE or room:GetType() == RoomType.ROOM_BOSSRUSH then
			--for some reason boss rush music wasnt being triggered here
			--but was working fine in getMusicTrack()
			if challengeactivenow and not challengeactivebefore then
				local challengeMusicToPlay
				if room:GetType() == RoomType.ROOM_BOSSRUSH then
					challengeMusicToPlay = Music.MUSIC_BOSS_RUSH
				else
					challengeMusicToPlay = Music.MUSIC_CHALLENGE_FIGHT
				end
				musicCrossfade(challengeMusicToPlay)
			end
			--make sure boss rush music is played, not challenge music
			if challengeactivenow and not challengedonenow and room:GetType() == RoomType.ROOM_BOSSRUSH then
				musicCrossfade(Music.MUSIC_BOSS_RUSH)
			end
			if challengedonenow and not challengedonebefore then
				if room:GetType() == RoomType.ROOM_BOSSRUSH then
					musicCrossfade(Music.MUSIC_JINGLE_BOSS_RUSH_OUTRO, Music.MUSIC_BOSS_OVER)
				else
					musicCrossfade(Music.MUSIC_JINGLE_CHALLENGE_OUTRO, Music.MUSIC_BOSS_OVER)
				end
			end
		elseif room:GetType() == RoomType.ROOM_BOSS then
			local currentbosscount = Isaac.CountBosses()
			
			if currentbosscount > 0 and room:GetFrameCount() == 1 then
				satanfightstage = 0
				musicCrossfade(getBossMusic())
			end
			
			if room:GetFrameCount() > 1 then
				if room:GetBossID() == 24 then
					if satanfightstage == 0 and currentbosscount > 1 then
						musicCrossfade(getGenericBossMusic())
						satanfightstage = 1
					elseif satanfightstage == 1 and currentbosscount == 1 then
						musicCrossfade(Music.MUSIC_SATAN_BOSS)
						satanfightstage = 2
					end
				elseif room:GetBossID() == 55 then
					if satanfightstage == 0 and room:GetFrameCount() > 10 and not room:IsClear() then
						local playertable = Isaac.FindByType(EntityType.ENTITY_PLAYER,0) --variant 0 is true players, i.e. not co-op babies
						for i,entity in pairs(playertable) do
							--TODO: check Soul of the Forgotten?
							local tempPlayer = entity:ToPlayer()
							if tempPlayer and tempPlayer.Position.Y < 540 then
								musicCrossfade(Music.MUSIC_SATAN_BOSS)
								satanfightstage = 3
								break
							end
						end
					end
				else
					satanfightstage = 0
				end
			end
            
            --check for ultra greed outside of greed mode
            if currentbosscount == 0 and room:GetBossID() == 62 and Game().Difficulty == 1 then
                local ultragreeds = Isaac.FindByType(406)
                if #ultragreeds > 0 then
                    if ultragreeds[1]:ToNPC().State < 9001 then
                        currentbosscount = 1
                    end
                end
            end
			
			if currentbosscount == 0 and previousbosscount > 0 then
				if (level:GetStage() == LevelStage.STAGE3_2 or (level:GetStage() == LevelStage.STAGE3_1 and curseoflabyrinth)) and room:GetBossID() == 8 and level:GetStageType() >= StageType.STAGETYPE_REPENTANCE then
					musicCrossfade(Music.MUSIC_NULL)
				elseif (level:GetStage() == LevelStage.STAGE4_2 or (level:GetStage() == LevelStage.STAGE4_1 and curseoflabyrinth)) and room:GetBossID() == 88 and level:GetStageType() >= StageType.STAGETYPE_REPENTANCE then
					musicCrossfade(Music.MUSIC_JINGLE_MOTHER_OVER, Music.MUSIC_BOSS_OVER)
				else
					musicCrossfade(getGenericBossDeathJingle(), Music.MUSIC_BOSS_OVER)
				end
			end
			
			previousbosscount = currentbosscount
		elseif (level:GetStage() == LevelStage.STAGE3_2 or (level:GetStage() == LevelStage.STAGE3_1 and curseoflabyrinth)) and level:GetStageType() < StageType.STAGETYPE_REPENTANCE then
			local topDoor = room:GetDoor(DoorSlot.UP0)
			if topDoor and topDoor.TargetRoomType == RoomType.ROOM_SECRET_EXIT then
				local strangedoorstatenow = topDoor.State
				
				if strangedoorstatebefore == DoorState.STATE_CLOSED and strangedoorstatenow == DoorState.STATE_OPEN then
					musicPlay(Music.MUSIC_STRANGE_DOOR_JINGLE, getMusicTrack())
				end
				
				strangedoorstatebefore = strangedoorstatenow
			end
		elseif room:HasCurseMist() then
			local foundknifepiecenow
			
			local knifetable = Isaac.FindByType(EntityType.ENTITY_PICKUP,PickupVariant.PICKUP_COLLECTIBLE,CollectibleType.COLLECTIBLE_KNIFE_PIECE_2)
			if next(knifetable) == nil then
				foundknifepiecenow = false
			else
				foundknifepiecenow = true
			end
			
			if foundknifepiecebefore and not foundknifepiecenow then
				musicPlay(Music.MUSIC_MOTHERS_SHADOW_INTRO, Music.MUSIC_MINESHAFT_ESCAPE)
			end
			
			foundknifepiecebefore = foundknifepiecenow
		end
	end
	
	--PLAY TWISTED HOME MUSIC AFTER SLEEPING IN MOM'S BED
	if level:GetStage() == LevelStage.STAGE8 then
        local dogmaNightmare = false
        --check for dogma nightmare even if the music has been replaced
        if currentMusicId == Music.MUSIC_JINGLE_NIGHTMARE_ALT or (NightmarePlaying and NightmareScene.IsDogmaNightmare()) then
            dogmaNightmare = true
        end
		if modSaveData["darkhome"] == 0 and dogmaNightmare then
			modSaveData["darkhome"] = 1
		end
		if modSaveData["darkhome"] == 1 and dogmaNightmare and Game():GetHUD():IsVisible() then
			musicPlay(Music.MUSIC_ISAACS_HOUSE)
			modSaveData["darkhome"] = 2
		end
		if modSaveData["darkhome"] >= 2 and room:IsClear() then
			if not musicmgr:IsLayerEnabled() then
				musicmgr:EnableLayer()
			end
		end
		if modSaveData["darkhome"] == 2 then
			if room:GetRoomShape() == RoomShape.ROOMSHAPE_1x2 then
				local leftDoor = room:GetDoor(DoorSlot.LEFT0)
				if leftDoor and leftDoor.State == DoorState.STATE_CLOSED then
					modSaveData["darkhome"] = 3
					musicCrossfade(Music.MUSIC_DOGMA_INTRO)
				end
			end
		end
		if modSaveData["darkhome"] == 3 and Game():GetHUD():IsVisible() then
			musicPlay(Music.MUSIC_DOGMA_BOSS)
			modSaveData["darkhome"] = 4
		end
		--darkhome is set to 5 after killing Dogma
		--PLAY DOGMA DEATH JINGLE
		if modSaveData["darkhome"] == 5 then
		    dogmadeathjingledelay = dogmadeathjingledelay - 1
		    if dogmadeathjingledelay == 0 then
			musicPlay(Music.MUSIC_JINGLE_DOGMA_OVER)
			modSaveData["darkhome"] = 6
		    end
		else
		    dogmadeathjingledelay = 170
		end
	end
	
	--MINES/ASHPIT II RAIL BUTTONS
	if not modSaveData["railcomplete"] and (level:GetStage() == LevelStage.STAGE2_2 or (level:GetStage() == LevelStage.STAGE2_1 and curseoflabyrinth)) and level:GetStageType() >= StageType.STAGETYPE_REPENTANCE then
		local roomdescflags = roomdesc.Flags
		if (roomdescflags & RoomDescriptor.FLAG_RED_ROOM) == 0 then
			for i = 1, room:GetGridSize() do
				local gridentity = room:GetGridEntity(i)
				if gridentity and gridentity:GetType() == GridEntityType.GRID_PRESSURE_PLATE and gridentity:GetVariant() == 3 then
					--found a rail button (variant 3)
					local railbuttonpressednow = (gridentity.State == 3) --State 3 is pressed
					local roomidx = roomdesc.SafeGridIndex
					if railbuttonpressednow and not modSaveData["railbuttons"][tostring(roomidx)] then
						modSaveData["railbuttons"][tostring(roomidx)] = true
						
						--now check if this is the third button pressed
						local numrailbuttonspressed = 0
						for j,v in pairs(modSaveData["railbuttons"]) do
							if v then
								numrailbuttonspressed = numrailbuttonspressed + 1
							end
						end
						
						if numrailbuttonspressed == 3 then
							musicPlay(Music.MUSIC_JINGLE_SECRETROOM_FIND, getMusicTrack())
							modSaveData["railcomplete"] = true
						end
					end
					break
				end
			end
		end
	end
	
	--SECRET ROOM DOORS
	for i=0,7 do
		local door = room:GetDoor(i)
		if door then
			if door.TargetRoomType == RoomType.ROOM_SECRET or door.TargetRoomType == RoomType.ROOM_SUPERSECRET or door.TargetRoomType == RoomType.ROOM_ULTRASECRET then
				if door:GetVariant() == DoorVariant.DOOR_UNLOCKED and (doorprevvariants[i] == DoorVariant.DOOR_HIDDEN or door.TargetRoomType == RoomType.ROOM_ULTRASECRET) then
					if Game():GetLevel():GetRoomByIdx(door.TargetRoomIndex).VisitedCount == 0 and not modSaveData["secretjingles"][tostring(door.TargetRoomIndex)] then
						modSaveData["secretjingles"][tostring(door.TargetRoomIndex)] = true
						local icanseeforever = level:GetCanSeeEverything()
						local xrayvision = false
						local playertable = Isaac.FindByType(EntityType.ENTITY_PLAYER,0) --variant 0 is true players, i.e. not co-op babies
						for i,entity in pairs(playertable) do
							local tempPlayer = entity:ToPlayer()
							xrayvision = xrayvision or (tempPlayer and tempPlayer:HasCollectible(CollectibleType.COLLECTIBLE_XRAY_VISION))
						end
						if (not icanseeforever and not xrayvision) or door.TargetRoomType == RoomType.ROOM_ULTRASECRET then
							musicPlay(Music.MUSIC_JINGLE_SECRETROOM_FIND, getMusicTrack())
						end
					end
				end
			end
		end
	end
	
	for i=0,7 do
		local door = room:GetDoor(i)
		if door then
			local devildoorspawnednow = (door.TargetRoomType == RoomType.ROOM_DEVIL)
			local angeldoorspawnednow = (door.TargetRoomType == RoomType.ROOM_ANGEL)
			
			--TODO: prevent these sound effects from playing when generating with Red Key?
			if devildoorspawnednow and not devildoorspawnedbefore then
				SFXManager():Stop(soundJingles[Music.MUSIC_JINGLE_DEVILROOM_FIND]["id"])
				musicPlay(Music.MUSIC_JINGLE_DEVILROOM_FIND, Music.MUSIC_NULL)
				devildoorspawnedbefore = devildoorspawnednow
			end
			if angeldoorspawnednow and not angeldoorspawnedbefore then
				SFXManager():Stop(soundJingles[Music.MUSIC_JINGLE_HOLYROOM_FIND]["id"])
				musicPlay(Music.MUSIC_JINGLE_HOLYROOM_FIND, Music.MUSIC_NULL)
				angeldoorspawnedbefore = angeldoorspawnednow
			end
		end
	end
	
	for i=0,7 do
		local door = room:GetDoor(i)
		if door then
			doorprevvariants[i] = door:GetVariant()
		end
	end
	challengedonebefore = challengedonenow
	challengeactivebefore = challengeactivenow
	roomclearbefore = roomclearnow
    if NightmarePlaying then NightmarePlaying = false end
end)
if REPENTOGON then
    MusicModCallback:AddCallback(ModCallbacks.MC_POST_NIGHTMARE_SCENE_RENDER, function()
        NightmarePlaying = true
    end)
end
    
MMC.GetMusicTrack = getMusicTrack
MMC.GetBossTrack = getBossMusic
MMC.GetStageTrack = getStageMusic
MMC.GetGenericBossTrack = getGenericBossMusic
MMC.AddMusicCallback = addMusicCallback
MMC.RemoveMusicCallback = removeMusicCallback
MMC.GetCorrectedTrackNum = correctedTrackNum
-- MMC.GetCallbacks = function() return Callbacks end
MMC.GetSaveData = function() return modSaveData end
MMC.InCustomStage = function() return inbadstage end
MMC.Manager = function() return overridemusicmgr end
MMC.DisableMusicLayers = false
MMC.Initialised = true
