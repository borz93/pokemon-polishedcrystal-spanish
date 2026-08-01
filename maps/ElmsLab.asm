ElmsLab_MapScriptHeader:
	def_scene_scripts
	scene_script ElmsLabMeetElmScene, SCENE_ELMSLAB_MEET_ELM
	scene_script DoNothingScript, SCENE_ELMSLAB_CANT_LEAVE
	scene_script DoNothingScript, SCENE_ELMSLAB_NOOP
	scene_script DoNothingScript, SCENE_ELMSLAB_MEET_OFFICER
	scene_script DoNothingScript, SCENE_ELMSLAB_UNUSED
	scene_script DoNothingScript, SCENE_ELMSLAB_AIDE_GIVES_POTION
	scene_script DoNothingScript, SCENE_ELMSLAB_LYRA_BATTLE
	scene_script ElmsLabAideGivesPokeBallsScene, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS

	def_callbacks
	callback MAPCALLBACK_OBJECTS, ElmsLabCallback_MoveElm

	def_warp_events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	def_coord_events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript
	coord_event  5,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotions1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotions2
	coord_event  4,  6, SCENE_ELMSLAB_LYRA_BATTLE, LyraBattleScript

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  0,  7, BGEVENT_JUMPTEXT, ElmsLabTravelTip1Text
	bg_event  1,  7, BGEVENT_JUMPTEXT, ElmsLabTravelTip2Text
	bg_event  2,  7, BGEVENT_JUMPTEXT, ElmsLabTravelTip3Text
	bg_event  3,  7, BGEVENT_JUMPTEXT, ElmsLabTravelTip4Text
	bg_event  6,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  3, BGEVENT_JUMPTEXT, ElmsLabTrashcanText
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	def_object_events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_BALL_CUT_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_ENV_RED, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_BALL_CUT_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_ENV_BLUE, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_BALL_CUT_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_ENV_GREEN, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
	object_event  5, 11, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsLabLyraScript, EVENT_LYRA_IN_ELMS_LAB

	object_const_def
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OFFICER
	const ELMSLAB_LYRA

ElmsLabCallback_MoveElm:
	checkscene
	iftruefwd .Skip
	moveobject ELMSLAB_ELM, 3, 4
.Skip:
	endcallback

ElmsLabMeetElmScene:
	sdefer .Script
	end

.Script:
	follow PLAYER, ELMSLAB_LYRA
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	stopfollow
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	turnobject ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmText_Intro
.Loop:
	yesorno
	iftruefwd ElmsLab_ElmGetsEmail
	writetext ElmText_Refused
	sjump .Loop

ElmsLab_ElmGetsEmail:
if !DEF(DEBUG)
	writetext ElmText_Accepted
	promptbutton
	writetext ElmText_ResearchAmbitions
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
	turnobject ELMSLAB_ELM, DOWN
	showtext ElmText_GotAnEmail
	opentext
	turnobject ELMSLAB_ELM, RIGHT
	writetext ElmText_MissionFromMrPokemon
	waitbutton
endc
	closetext
	applyonemovement ELMSLAB_ELM, step_up
	turnobject PLAYER, UP
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement
	turnobject PLAYER, RIGHT
	showtext ElmText_ChooseAPokemon
	setscene SCENE_ELMSLAB_CANT_LEAVE
	end

ElmsLabAideGivesPokeBallsScene:
	sdefer .Script
	end

.Script:
	turnobject ELMSLAB_ELMS_AIDE, DOWN
	showemote EMOTE_SHOCK, ELMSLAB_ELMS_AIDE, 15
	applymovement ELMSLAB_ELMS_AIDE, AideWalksDownMovement
	showtext AideText_ThiefReturnedMon
	applymovement ELMSLAB_ELMS_AIDE, AideWalksBackMovement
	turnobject ELMSLAB_ELMS_AIDE, DOWN
	setscene SCENE_ELMSLAB_NOOP
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftruefwd .CheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
.CheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftruefwd .CheckOddSouvenir
	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
.CheckOddSouvenir:
	checkevent EVENT_GOT_ODD_SOUVENIR_FROM_ELM
	iftrue ElmCheckBattleScript
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue ElmGiveOddSouvenirScript
	checkevent EVENT_ELM_WANTS_TO_BATTLE
	iftrue ElmAskBattleScript
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalsefwd ElmCheckTogepiEgg
	scall ElmEggHatchedScript
	; need to reopen text boxes since ElmCheckGotEggAgain's
	; jumpopenedtext will close them.
	jumpthistext

	text "¿<PLAYER>? Creía"
	line "que había eclo-"
	cont "sionado el Huevo."

	para "¿Dónde está"
	line "el #mon?"
	done

ElmEggHatchedScript:
	setmonval TOGEPI
	special Special_FindThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setmonval TOGETIC
	special Special_FindThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setmonval TOGEKISS
	special Special_FindThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	sjumpfwd ElmCheckGotEggAgain

ElmCheckTogepiEgg:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalsefwd ElmCheckGotEggAgain
	checkevent EVENT_TOGEPI_HATCHED
	iftrue ElmEggHatchedScript
ElmCheckGotEggAgain:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue_jumpopenedtext ElmWaitingEggHatchText
	checkflag ENGINE_ZEPHYRBADGE
	iftrue_jumpopenedtext ElmAideHasEggText
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumpopenedtext ElmStudyingEggText
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumpopenedtext ElmDescribesMrPokemonText
	jumpthisopenedtext

	text "Si aparece un"
	line "#mon salvaje,"
	cont "que luche el tuyo!"
	done

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	showtext LabWhereGoingText
	applyonemovement PLAYER, step_up
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumptext ElmPokeBallText
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse_jumpopenedtext DidntChooseStarterText
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	givepoke CYNDAQUIL, PLAIN_FORM, 5, ORAN_BERRY
	writetext LyraChoosesStarterText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraPicksChikoritaMovement
	pause 15
	disappear ELMSLAB_POKE_BALL3
	opentext
	getmonname CHIKORITA, STRING_BUFFER_3
	writetext LyraReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	writetext LyraNicknamedChikoritaText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraAfterChikoritaMovement
	readvar VAR_FACING
	ifequalfwd RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	sjumpfwd ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumptext ElmPokeBallText
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse_jumpopenedtext DidntChooseStarterText
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	givepoke TOTODILE, PLAIN_FORM, 5, ORAN_BERRY
	writetext LyraChoosesStarterText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraPicksCyndaquilMovement
	pause 15
	disappear ELMSLAB_POKE_BALL1
	opentext
	getmonname CYNDAQUIL, STRING_BUFFER_3
	writetext LyraReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	writetext LyraNicknamedCyndaquilText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraAfterCyndaquilMovement
	applymovement PLAYER, AfterTotodileMovement
	sjumpfwd ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumptext ElmPokeBallText
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse_jumpopenedtext DidntChooseStarterText
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	givepoke CHIKORITA, PLAIN_FORM, 5, ORAN_BERRY
	writetext LyraChoosesStarterText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraPicksTotodileMovement
	pause 15
	disappear ELMSLAB_POKE_BALL2
	opentext
	getmonname TOTODILE, STRING_BUFFER_3
	writetext LyraReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	writetext LyraNicknamedTotodileText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraAfterTotodileMovement
	applymovement PLAYER, AfterChikoritaMovement
	; fallthrough

ElmDirectionsScript:
	turnobject PLAYER, UP
if !DEF(DEBUG)
	showtext ElmDirectionsText1
endc
	addcellnum PHONE_ELM
	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	showtext ElmDirectionsText2
	turnobject ELMSLAB_ELM, DOWN
	showtext ElmDirectionsText3
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_LYRA_BATTLE
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftruefwd .CanHeal
	jumpthisopenedtext

	text "Me pregunto qué"
	line "hará esto…"
	done

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftruefwd ElmsLabHealingMachine_HealParty
	endtext

ElmsLabHealingMachine_HealParty:
	special HealParty
	special SaveMusic
	playmusic MUSIC_NONE
	setval 1 ; Machine is in Elm's Lab
	special HealMachineAnim
	pause 30
	special RestoreMusic
	endtext

ElmAfterTheftDoneScript:
	waitendtext

ElmAfterTheftScript:
	writetext ElmAfterTheftText1
	checkkeyitem MYSTERY_EGG
	iffalse ElmAfterTheftDoneScript
	promptbutton
	writetext ElmAfterTheftText2
	waitbutton
	takekeyitem MYSTERY_EGG
	scall ElmJumpBackScript1
	writetext ElmAfterTheftText3
	waitbutton
	scall ElmJumpBackScript2
	writetext ElmAfterTheftText4
	promptbutton
	writetext ElmAfterTheftText5
	promptbutton
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	clearevent EVENT_LYRA_ROUTE_29
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	setscene SCENE_ELMSLAB_NOOP
	writetext ElmAfterTheftText6
	promptbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	showtext ElmAfterTheftText7
	end

ShowElmTogepiScript:
	writetext ShowElmTogepiText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	setevent EVENT_SHOWED_TOGEPI_TO_ELM
	opentext
	writetext ShowElmTogepiText2
	promptbutton
	writetext ShowElmTogepiText3
	promptbutton
ElmGiveOddSouvenirScript:
	writetext ElmGiveOddSouvenirText1
	promptbutton
	verbosegiveitem ODD_SOUVENIR
	iffalse_endtext
	setevent EVENT_GOT_ODD_SOUVENIR_FROM_ELM
	writetext ElmGiveOddSouvenirText2
	waitbutton
	checkevent EVENT_BATTLED_PROF_ELM
	iffalsefwd ElmAlsoBattleScript
	endtext

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	promptbutton
	verbosegiveitem MASTER_BALL
	iffalse_endtext
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
	checkevent EVENT_BATTLED_PROF_ELM
	iftrue_endtext
ElmAlsoBattleScript:
	writetext ElmByTheWayText
	waitbutton
	sjumpfwd ElmAskBattleScript

ElmCheckBattleScript:
	checkevent EVENT_BATTLED_PROF_ELM
	iftrue_jumpopenedtext ElmText_CallYou
	checkevent EVENT_BEAT_FALKNER
	iffalse_jumpopenedtext ElmText_CallYou
	writetext ElmBeforeBattleText
	waitbutton
ElmAskBattleScript:
	setevent EVENT_ELM_WANTS_TO_BATTLE
	writetext ElmAskBattleText
	yesorno
	iffalse_jumpopenedtext ElmRefusedBattleText
	writetext ElmSeenText
	waitbutton
	closetext
	winlosstext ElmWinText, ElmLoseText
	setlasttalked ELMSLAB_ELM
	readvar VAR_BADGES
	ifless 2, .Team1
	ifless 4, .Team2
	ifless 8, .Team3
	loadtrainer PROF_ELM, 4
	sjumpfwd .GotTeam
.Team1:
	loadtrainer PROF_ELM, 1
	sjumpfwd .GotTeam
.Team2:
	loadtrainer PROF_ELM, 2
	sjumpfwd .GotTeam
.Team3:
	loadtrainer PROF_ELM, 3
.GotTeam:
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	clearevent EVENT_ELM_WANTS_TO_BATTLE
	setevent EVENT_BATTLED_PROF_ELM
	startbattle
	reloadmap
	special HealParty
	jumpthistextfaceplayer

	text "Elm: Estoy"
	line "orgulloso de ti,"
	cont "<PLAYER>."

	para "Hice bien en"
	line "confiarte un"
	cont "#mon."
	done

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	promptbutton
	verbosegivekeyitem S_S_TICKET
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	special Special_FadeOutMusic
	pause 10
	readvar VAR_FACING
	ifequalfwd UP, .Shortest
	ifequalfwd DOWN, .Longest
	disappear ELMSLAB_LYRA
	moveobject ELMSLAB_LYRA, 4, 7
	scall .LyraEntryShort
	scall .LyraAnnouncesGymChallenge
	turnobject PLAYER, RIGHT
	sjumpfwd .Continue

.Longest
	disappear ELMSLAB_LYRA
	moveobject ELMSLAB_LYRA, 4, 6
	appear ELMSLAB_LYRA
	applymovement ELMSLAB_LYRA, LyraRunsInMoreMovement
	turnobject ELMSLAB_ELM, UP
	turnobject ELMSLAB_LYRA, RIGHT
	turnobject PLAYER, LEFT
	scall .LyraAnnouncesGymChallenge
	turnobject PLAYER, DOWN
	sjumpfwd .Continue

.Shortest
	disappear ELMSLAB_LYRA
	moveobject ELMSLAB_LYRA, 5, 8
	scall .LyraEntryShort
	scall .LyraAnnouncesGymChallenge
	turnobject PLAYER, UP

.Continue
	faceplayer
	playmusic MUSIC_PROF_ELM
	showtext ElmAfterTicketText
	setevent EVENT_LYRA_IN_HER_ROOM
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	end

.LyraAnnouncesGymChallenge
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	showtext LyraAnnouncesGymChallengeText
	applymovement ELMSLAB_LYRA, LyraLeavesMovement
	disappear ELMSLAB_LYRA
	pause 10
	end

.LyraEntryShort
	appear ELMSLAB_LYRA
	applymovement ELMSLAB_LYRA, LyraRunsInMovement
	turnobject ELMSLAB_ELM, DOWN
	turnobject ELMSLAB_LYRA, UP
	turnobject PLAYER, DOWN
	end

ElmJumpBackScript1:
	closetext
	readvar VAR_FACING
	scalltable .JumpBackScript1Table
	end
.JumpBackScript1Table
	dw ElmJumpDownScript
	dw ElmJumpUpScript
	dw ElmJumpLeftScript
	dw ElmJumpRightScript

ElmJumpBackScript2:
	closetext
	readvar VAR_FACING
	scalltable .JumpBackScript2Table
	end
.JumpBackScript2Table
	dw ElmJumpUpScript
	dw ElmJumpDownScript
	dw ElmJumpRightScript
	dw ElmJumpLeftScript

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

LyraBattleScript:
	turnobject ELMSLAB_LYRA, DOWN
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	showtext ElmsLabLyraChallengeText
	applymovement ELMSLAB_LYRA, LyraBattleMovement
	turnobject PLAYER, RIGHT
	winlosstext ElmsLabLyraWinText, ElmsLabLyraLossText
	setlasttalked ELMSLAB_LYRA
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	loadtrainer LYRA1, LYRA1_1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	iftruefwd .AfterYourDefeat
	sjumpfwd .AfterVictorious

.Totodile:
	loadtrainer LYRA1, LYRA1_2
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	iftruefwd .AfterVictorious
	sjumpfwd .AfterYourDefeat

.Chikorita:
	loadtrainer LYRA1, LYRA1_3
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	iftruefwd .AfterVictorious
	sjumpfwd .AfterYourDefeat

.AfterVictorious:
	showtext ElmsLabLyraText_YouWon
	sjumpfwd .FinishLyra

.AfterYourDefeat:
	showtext ElmsLabLyraText_YouLost
.FinishLyra:
	turnobject ELMSLAB_LYRA, UP
	opentext
	writetext ElmsLabLyraThankYouText
	waitbutton
	turnobject ELMSLAB_LYRA, LEFT
	writetext ElmsLabLyraSeeYouText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ELMSLAB_LYRA, LyraLeavesMovement
	disappear ELMSLAB_LYRA
	special HealParty
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	playmapmusic
	end

AideScript_WalkPotions1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotions
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotions2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotions
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotions:
	opentext
	writetext AideText_GiveYouPotions
	promptbutton
	verbosegiveitem POTION
	setscene SCENE_ELMSLAB_NOOP
	jumpopenedtext AideText_AlwaysBusy

ElmsAideScript:
	checkevent EVENT_GOT_RIVALS_EGG
	iftrue_jumptextfaceplayer AideText_AlwaysBusy
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue_jumptextfaceplayer AideText_AfterTheft
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumptextfaceplayer AideText_AlwaysBusy
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue_jumptextfaceplayer AideText_TheftTestimony
	jumptextfaceplayer AideText_AlwaysBusy

MeetCopScript2:
	applyonemovement PLAYER, step_left
MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	turnobject ELMSLAB_OFFICER, LEFT
	showtext ElmsLabOfficerText1
	disappear ELMSLAB_LYRA
	moveobject ELMSLAB_LYRA, 5, 8
	appear ELMSLAB_LYRA
	applymovement ELMSLAB_LYRA, LyraRunsInMovement
	turnobject ELMSLAB_OFFICER, DOWN
	showtext ElmsLabLyraTheftInnocentText
	pause 10
	turnobject ELMSLAB_OFFICER, LEFT
	opentext
	writetext ElmsLabOfficerText2
	promptbutton
	special SpecialNameRival
	writetext ElmsLabOfficerText3
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraStepsAsideMovement
	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER
	pause 10
	turnobject ELMSLAB_LYRA, UP
	turnobject PLAYER, DOWN
	showtext ElmsLabLyraTheftGoodbyeText
	applymovement ELMSLAB_LYRA, LyraLeavesMovement
	disappear ELMSLAB_LYRA
	setscene SCENE_ELMSLAB_NOOP
	pause 10
	applymovement PLAYER, MeetCopScript_GiveEgg
	opentext
	sjump ElmAfterTheftScript

ElmsLabLyraScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iffalse_jumptextfaceplayer ElmsLabLyraWhichPokemonText
	jumpthistextfaceplayer

	text "¡Tu #mon"
	line "también es mono!"
	done

ElmsLabWindow:
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue_jumptext ElmsLabWindowText1
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue_jumptext ElmsLabWindowText2
	jumptext ElmsLabWindowText1

ElmsLabPC:
	jumpthistext

	text "Observaciones"
	line "sobre evolución"
	cont "de #mon"

	para "…Dice en la"
	line "pantalla…"
	done

ElmsLab_WalkUpToElmMovement:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_left
	step_end

LyraPicksChikoritaMovement:
	step_right
LyraPicksTotodileMovement:
	step_right
LyraPicksCyndaquilMovement:
	step_right
	step_right
	step_up
	step_end

LyraAfterChikoritaMovement:
	step_down
	step_left
	step_left
	step_left
	turn_head_up
	step_end

LyraAfterTotodileMovement:
	step_down
	step_left
	step_left
	turn_head_up
	step_end

LyraAfterCyndaquilMovement:
	step_down
	step_left
	turn_head_up
	step_end

LyraBattleMovement:
	step_down
	turn_head_left
	step_end

LyraLeavesMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

LyraRunsInMoreMovement:
	step_up
LyraRunsInMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

LyraStepsAsideMovement:
	step_left
	turn_head_right
	step_end

MeetCopScript_WalkUp:
	step_up
	step_up
	turn_head_right
	step_end

MeetCopScript_GiveEgg:
	step_right
	turn_head_up
	step_end

OfficerLeavesMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

AideWalksRight1:
	step_right
	step_right
	turn_head_up
	step_end

AideWalksRight2:
	step_right
	step_right
	step_right
	turn_head_up
	step_end

AideWalksLeft1:
	step_left
	step_left
	turn_head_down
	step_end

AideWalksLeft2:
	step_left
	step_left
	step_left
	turn_head_down
	step_end

AideWalksDownMovement:
	step_right
	step_right
	step_down
	step_end

AideWalksBackMovement:
	step_up
	step_left
	step_left
	step_end

ElmJumpUpMovement:
	fix_facing
	run_step_up
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	run_step_down
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	run_step_left
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	run_step_right
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement:
	step_right
	step_right
	step_up
	turn_head_down
	step_end

AfterCyndaquilMovement:
	step_left
	step_up
	turn_head_up
	step_end

AfterTotodileMovement:
	step_left
	step_left
	step_up
	turn_head_up
	step_end

AfterChikoritaMovement:
	step_left
	step_left
	step_left
	step_up
	turn_head_up
	step_end

ElmText_Intro:
	text "Elm: ¡<PLAYER>!"
	line "¡Aquí estás!"

if !DEF(DEBUG)
	para "Hola a ti también,"
	line "Lyra."

	para "Necesitaba pediros"
	line "un favor a ambos."

	para "Veréis…"

	para "Estoy escribiendo"
	line "un artículo que"

	para "quiero presentar"
	line "en una conferencia"

	para "Pero hay algunas"
	line "cosas que aún no"

	para "acabo de"
	line "entender."

	para "¡Así que!"

	para "Me gustaría que"
	line "los dos criarais"

	para "unos #mon que"
	line "he capturado hace"
	cont "poco."
endc
	done

ElmText_Accepted:
	text "¡Gracias,"
	line "<PLAYER>!"

	para "¡Sois una gran"
	line "ayuda!"
	done

ElmText_Refused:
	text "Pero… Por favor,"
	line "necesito vuestra"
	cont "ayuda."
	done

ElmText_ResearchAmbitions:
	text "Cuando anuncie mis"
	line "hallazgos, seguro"

	para "que profundizare-"
	line "mos un poco más en"

	para "los misterios"
	line "de los #mon."

	para "¡Podéis contar"
	line "con ello!"
	done

ElmText_GotAnEmail:
	text "¡Vaya! ¡Me ha"
	line "llegado un email!"

	para "………………"
	line "Ajá… Ajá…"

	para "Vale…"
	done

ElmText_MissionFromMrPokemon:
	text "Escuchad. Conozco"
	line "un Sr. #mon."

	para "Siempre encuentra"
	line "rarezas y presume"
	cont "de ellas."

	para "Bueno, me llegó"
	line "un email suyo"

	para "diciendo que esta"
	line "vez va en serio."

	para "Es intrigante,"
	line "pero estamos"
	cont "liados con lo de"
	cont "los #mon…"

	para "¡Esperad!"

	para "¡Ya sé!"

	para "<PLAYER>, ¿Podéis"
	line "ir en nuestro"
	cont "lugar?"
	done

ElmText_ChooseAPokemon:
	text "Quiero que criéis"
	line "a uno de estos"
	cont "#mon."

	para "Están en estas"
	line "Balls."

	para "Seréis su primer"
	line "compañero,"
	cont "<PLAYER>!"

	para "¡Venga, elige uno!"
	done


LabWhereGoingText:
	text "Elm: ¡Esperad!"
	line "¿Adónde vais?"
	done

TakeCyndaquilText:
	text "Elm: ¿Te llevas a"
	line "Cyndaquil, el"
	cont "#mon de fuego?"
	done

TakeTotodileText:
	text "Elm: ¿Quieres a"
	line "Totodile, el"
	cont "#mon de agua?"
	done

TakeChikoritaText:
	text "Elm: Así que te"
	line "gusta Chikorita,"
	cont "el #mon planta?"
	done

DidntChooseStarterText:
	text "Elm: Piénsatelo"
	line "bien."

	para "Tu compañero es"
	line "importante."
	done

ChoseStarterText:
	text "Elm: Yo también"
	line "creo que es un"
	cont "gran #mon."
	done

ElmDirectionsText1:
	text "Sr. #mon vive"
	line "un poco más allá"

	para "de Ciudad Cerezo,"
	line "la siguiente"
	cont "ciudad."

	para "Es casi un"
	line "camino directo,"

	para "así que no tiene"
	line "pérdida."

	para "Pero por si acaso,"
	line "aquí tienes mi"
	cont "número."

	para "Llámame si surge"
	line "algo."
	done

ElmDirectionsText2:
	text "Si tu #mon está"
	line "herido, cúralo"

	para "con esta máquina."

	para "Puedes usarla"
	line "cuando quieras."
	done

ElmDirectionsText3:
	text "¡<PLAYER>, cuento"
	line "contigo!"
	done

GotElmsNumberText:
	text "<PLAYER> consiguió"
	line "el número de Elm."
	done

ElmDescribesMrPokemonText:
	text "Sr. #mon va a"
	line "todas partes y"
	cont "encuentra rarezas."

	para "Lástima que solo"
	line "sean raras y no"
	cont "muy útiles…"
	done

ElmPokeBallText:
	text "Hay un #mon"
	line "atrapado por"
	cont "el Prof. Elm."
	done


ElmsLabHealingMachineText2:
	text "¿Quieres curar a"
	line "tu #mon?"
	done

ElmAfterTheftText1:
	text "Elm: <PLAYER>, esto"
	line "es terrible…"

	para "Ah, sí, ¿Cuál era"
	line "el gran descubri-"
	cont "miento del Sr."
	cont "#mon?"
	done

ElmAfterTheftText2:
	text "<PLAYER> le dio el"
	line "Huevo Enigma"
	cont "al Prof. Elm."
	done

ElmAfterTheftText3:
	text "Elm: ¿Esto?"
	done

ElmAfterTheftText4:
	text "Pero… ¿Es un"
	line "Huevo #mon?"

	para "Si lo es, es un"
	line "gran descubrim."
	done

ElmAfterTheftText5:
	text "Elm: ¡¿Qué?!"

if !DEF(DEBUG)
	para "¿El Prof. Oak te"
	line "dio una #dex?"

	para "<PLAYER>, ¿Ss eso"
	line "cierto? ¡E-eso es"
	cont "increíble!"

	para "Es un genio"
	line "para ver el"
	cont "potencial de la"
	cont "gente como"
	cont "entrenadores."

	para "Vaya, <PLAYER>."
	line "Puede que tengas"

	para "lo que hace falta"
	line "para ser Campeona."

	para "Parece que te"
	line "llevas genial"
	cont "con los #mon"
	cont "también."

	para "Deberías afrontar"
	line "el reto de los"
	cont "Gimnasios #mon."

	para "El más cercano"
	line "sería el de"
	cont "Ciudad Malva."
endc
	done

ElmAfterTheftText6:
	text "…<PLAYER>. El"
	line "camino al"

	para "campeonato será"
	line "largo."

	para "Antes de irte,"
	line "asegúrate de"
	cont "hablar con tu"
	cont "madre."
	done

ElmAfterTheftText7:
	text "Y llámame a mí"
	line "también a veces."

	para "Si quieres saber"
	line "cómo podrían"

	para "evolucionar tus"
	line "#mon, entonces"

	para "mi investigación"
	line "será invaluable."
	done

ElmStudyingEggText:
	text "Elm: No te"
	line "rindas. Te llamaré"

	para "si averiguo algo"
	line "sobre ese Huevo."
	done

ElmAideHasEggText:
	text "Elm: ¿<PLAYER>?"
	line "¿No has visto a"
	cont "mi ayudante?"

	para "Debería haberte"
	line "dado el Huevo"

	para "en el Centro"
	line "#mon de Ciudad"
	cont "Malva."

	para "Seguro que lo"
	line "acabas de perder."
	cont "Intenta alcanzarlo"
	cont "allí."
	done

ElmWaitingEggHatchText:
	text "Elm: Oye, ¿Ha"
	line "cambiado el Huevo?"
	done


ShowElmTogepiText1:
	text "Elm: <PLAYER>,"
	line "¡tienes buen"
	cont "aspecto!"
	done

ShowElmTogepiText2:
	text "¿Qué?"
	line "¿Ese #mon?!"
	done

ShowElmTogepiText3:
	text "¡El Huevo eclo-"
	line "sionó! Así que"
	cont "los #mon nacen"
	cont "de Huevos…"

	para "No, quizá no"
	line "todos los #mon."

	para "Vaya, aún queda"
	line "mucha investi-"
	cont "gación por hacer."
	done

ElmGiveOddSouvenirText1:
	text "¡Gracias,"
	line "<PLAYER>! Nos"
	cont "ayudas a desvelar"

	para "los misterios de"
	line "los #mon."

	para "Quiero que tengas"
	line "esto como muestra"
	cont "de agradecimiento."
	done

ElmGiveOddSouvenirText2:
	text "Es una rareza que"
	line "me dio el"
	cont "Sr. #mon."

	para "Me dijo que es un"
	line "recuerdo de su"

	para "viaje a una isla"
	line "tropical."

	para "Al parecer, hay"
	line "algunas especies"

	para "de #mon a las"
	line "que les gusta"
	cont "llevarlo."
	done

ElmText_CallYou:
	text "Elm: <PLAYER>, te"
	line "llamaré si surge"
	cont "algo."
	done

AideText_AfterTheft:
	text "…Suspiro… Ese"
	line "#mon robado."

	para "Me pregunto cómo"
	line "estará."

	para "Dicen que #mon"
	line "criado por"

	para "alguien malo"
	line "se vuelve malo."
	done

AideText_ThiefReturnedMon:
	text "¡<PLAYER>!"
	line "¡No te lo vas a"
	cont "creer!"

	para "El chico que se"
	line "llevó al #mon"
	cont "del Profesor…"

	para "…¡Volvió a"
	line "devolverlo!"

	para "Pero el Prof. Elm"
	line "le dijo…"

	para "“Parece que el"
	line "#mon te tiene"
	cont "mucho cariño."

	para "Los #mon dan lo"
	line "mejor de sí con"
	cont "quien quieren."

	para "Creo que debería"
	line "quedarse contigo”"

	para "…¿No es conmove-"
	line "dor? ¡Me hizo"
	cont "llorar!"

	para "Vi la cara del"
	line "chico al irse."

	para "¡Parecía tan"
	line "feliz!"
	done

ElmGiveMasterBallText1:
	text "Elm: ¡Hola,"
	line "<PLAYER>! Gracias"
	cont "a ti, mi"

	para "investigación va"
	line "genial."

	para "Toma esto como"
	line "muestra de mi"
	cont "agradecimiento."
	done

ElmGiveMasterBallText2:
	text "¡La Master Ball"
	line "es la mejor!"

	para "Es la Ball"
	line "definitiva. ¡Atra-"
	cont "pa cualquier"
	cont "#mon sin fallo!"

	para "Solo se les da a"
	line "investigadores"
	cont "#mon expertos."

	para "Creo que le puedes"
	line "sacar mucho más"

	para "partido que yo,"
	line "<PLAYER>!"
	done

ElmGiveTicketText1:
	text "Elm: ¡<PLAYER>!"
	line "¡Aquí estás!"

	para "Te llamé porque"
	line "tengo algo para"
	cont "ti."

	para "¿Ves? Es un"
	line "Billete S.S."

	para "Ahora puedes"
	line "atrapar #mon"
	cont "en Kanto."

	para "También puedes"
	line "retar nuevos"
	cont "Gimnasios."

	para "Si consigues ocho"
	line "medallas más,"

	para "el Alto Mando"
	line "te retará"

	para "con todas sus"
	line "fuerzas."
	done

ElmGiveTicketText2:
	text "El barco sale"
	line "desde Ciudad Olivo"

	para "Pero ya lo sabías,"
	line "<PLAYER>."

	para "Al fin y al cabo,"
	line "has viajado por"
	cont "todas partes con"
	cont "tus #mon."

	para "¡Ah, eso me"
	line "recuerda!"

	para "La Torre Batalla"
	line "acaba de abrir"
	cont "cerca de Ciudad"
	cont "Olivo."

	para "Un campeon como"
	line "tú lo hará genial"
	cont "compitiendo allí!"
	done

LyraAnnouncesGymChallengeText:
	text "Lyra: ¡Ahí estás,"
	line "<PLAYER>!"

	para "Vi tu combate"
	line "contra el Campeón"
	cont "en la tele."

	para "¡Fuiste"
	line "increíble!"

	para "Me inspiraste"
	line "de verdad,"
	cont "<PLAYER>."

	para "Aunque no llegue a"
	line "ese nivel…"
	cont "quiero intentarlo."

	para "Quiero ver de qué"
	line "soy capaz."

	para "Prof. Elm, siento"
	line "no poder seguir"
	cont "ayudando aquí."

	para "Voy a retar todos"
	line "los Gimnasios"

	para "de Johto y llegar"
	line "a la Liga #mon."

	para "¡Deséame suerte!"
	line "¡Hasta luego!"
	done

ElmAfterTicketText:
	text "Elm: Bueno,"
	line "<PLAYER>, ahora"

	para "cada uno tiene"
	line "su propio viaje."

	para "Me pregunto si"
	line "ella llegará"
	cont "antes a la Liga."

	para "¡Dale recuerdos"
	line "al Prof. Oak"
	cont "de Kanto!"
	done

ElmBeforeBattleText:
	text "Elm: ¡<PLAYER>!"
	line "¿Qué tal va tu"
	cont "viaje #mon?"
	done

ElmByTheWayText:
	text "Ya que estás"
	line "aquí, <PLAYER>…"
	done

ElmAskBattleText:
	text "Me vendría bien"
	line "practicar combates"

	para "contra un entren-"
	line "ador con talento"
	cont "como tú."

	para "¿Qué me dices,"
	line "<PLAYER>?"
	done

ElmSeenText:
	text "Enséñame cuánto"
	line "has crecido desde"

	para "que dejaste Pueblo"
	line "Primavera."
	done

ElmWinText:
	text "¡Asombroso!"
	done

ElmLoseText:
	text "¿Me lo has puesto"
	line "fácil?"
	done

ElmRefusedBattleText:
	text "Si tus #mon"
	line "necesitan curarse,"

	para "usa la máquina"
	line "de aquí."
	done


AideText_GiveYouPotions:
	text "<PLAYER>, quiero"
	line "que tengas esto"
	cont "para tu recado."
	done

AideText_AlwaysBusy:
	text "Solo somos dos,"
	line "así que siempre"
	cont "estamos liados."
	done

AideText_TheftTestimony:
	text "Hubo un ruido"
	line "fuerte afuera…"

	para "Cuando fuimos a"
	line "mirar, alguien"
	cont "robó un #mon."

	para "Es increíble que"
	line "alguien haga eso."

	para "…Suspiro… Ese"
	line "#mon robado."

	para "Me pregunto cómo"
	line "estará."

	para "Dicen que #mon"
	line "criado por"

	para "alguien malo"
	line "se vuelve malo."
	done

ElmsLabOfficerText1:
	text "Oí que robaron"
	line "un #mon aquí."

	para "¡Regla número uno!"
	line "“El criminal"

	para "siempre vuelve a"
	line "la escena del"
	cont "crimen…”"

	para "Vaya… ¿Así que"
	line "tú eres el ladrón?"
	done

ElmsLabOfficerText2:
	text "¿Qué?"

	para "¿Te enfrentaste a"
	line "un entrenador así?"

	para "¿Por casualidad"
	line "sabes su nombre?"
	done

ElmsLabOfficerText3:
	text "¡Vale! Así que"
	line "se llama <RIVAL>."

	para "¡Gracias por"
	line "ayudar en mi"
	cont "investigación!"
	done

ElmsLabLyraWhichPokemonText:
	text "¿Qué #mon vas"
	line "a elegir,"
	cont "<PLAYER>?"
	done

LyraChoosesStarterText:
	text "Lyra: ¡Pues yo"
	line "elijo este!"
	done

LyraReceivedStarterText:
	text "Lyra recibió a"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

LyraNicknamedChikoritaText:
	text "Lyra: ¡Es tan"
	line "mona! La llamaré"
	cont "Chicory!"
	done

LyraNicknamedCyndaquilText:
	text "Lyra: ¡Es tan"
	line "mona! La llamaré"
	cont "Cinder!"
	done

LyraNicknamedTotodileText:
	text "Lyra: ¡Es tan"
	line "mona! La llamaré"
	cont "Toto!"
	done


ElmsLabLyraChallengeText:
	text "Lyra: ¡<PLAYER>!"
	line "¡Vamos a conocer"

	para "a nuestros #mon"
	line "con un combate!"
	done

ElmsLabLyraWinText:
	text "Buen trabajo,"
	line "<PLAYER>!"
	done

ElmsLabLyraLossText:
	text "¡Bien! ¡Gané!"
	done

ElmsLabLyraText_YouWon:
ElmsLabLyraText_YouLost:
	text "¡Fue un combate"
	line "emocionante!"
	done

ElmsLabLyraThankYouText:
	text "Gracias por el"
	line "#mon, Prof."
	cont "Elm."
	done

ElmsLabLyraSeeYouText:
	text "<PLAYER>, ¡Nos"
	line "vemos luego!"

	para "¡Disfruta de tu"
	line "recado!"
	done

ElmsLabLyraTheftInnocentText:
	text "Lyra: ¡Un momento!"
	line "¡<PLAYER> no tiene"
	cont "nada que ver!"

	para "Vi a un chico"
	line "pelirrojo espiando"
	cont "el edificio!"
	done

ElmsLabLyraTheftGoodbyeText:
	text "Lyra: <PLAYER>,"
	line "me alegra que"

	para "entendiera que"
	line "eres inocente."

	para "Espero que haga"
	line "que el ladrón"
	cont "devuelva el"
	cont "#mon…"

	para "Bueno, ¡Nos"
	line "vemos luego!"
	done

ElmsLabWindowText1:
	text "La ventana está"
	line "abierta."

	para "Entra una brisa"
	line "agradable."
	done

ElmsLabWindowText2:
	text "¡Entró por"
	line "aquí!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> abrió un"
	line "libro."

	para "Consejo de viaje 1"

	para "Pulsa Start para"
	line "abrir el Menú."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> abrió un"
	line "libro."

	para "Consejo de viaje 2"

	para "¡Guarda tu"
	line "progreso guardando"
	cont "desde el menú!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> abrió un"
	line "libro."

	para "Consejo de viaje 3"

	para "Abre tu Bolso y"
	line "pulsa Select para"
	cont "mover objetos."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> abrió un"
	line "libro."

	para "Consejo de viaje 4"

	para "Revisa los"
	line "movimientos de tu"
	cont "#mon."

	para "Pulsa el botón A"
	line "para cambiar de"
	cont "movimiento."
	done

ElmsLabTrashcanText:
	text "Ahí está el"
	line "envoltorio del"
	cont "aperitivo que"
	cont "comió el Prof.Elm…"
	done
