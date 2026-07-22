IlexForest_MapScriptHeader:
	def_scene_scripts
	scene_script IlexForestFarfetchdQuestScene, SCENE_ILEXFOREST_FARFETCHD_QUEST
	scene_script IlexForestCutSceneScene, SCENE_ILEXFOREST_CUT_SCENE
	scene_const SCENE_ILEXFOREST_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, IlexForestFarfetchdCallback

	def_warp_events
	warp_event  3,  7, ROUTE_34_ILEX_FOREST_GATE, 3
	warp_event  5, 44, ILEX_FOREST_AZALEA_GATE, 1
	warp_event  5, 45, ILEX_FOREST_AZALEA_GATE, 2
	warp_event 25, 24, HIDDEN_TREE_GROTTO, 1

	def_coord_events
	coord_event  9, 31, SCENE_ILEXFOREST_NOOP, IlexForestApprenticeTrigger

	def_bg_events
	bg_event  5, 19, BGEVENT_JUMPTEXT, IlexForestSignpost
	bg_event 17, 33, BGEVENT_JUMPTEXT, IlexForestTrainerTips
	bg_event 13,  9, BGEVENT_ITEM + ETHER, EVENT_ILEX_FOREST_HIDDEN_ETHER
	bg_event 24, 16, BGEVENT_ITEM + SUPER_POTION, EVENT_ILEX_FOREST_HIDDEN_SUPER_POTION
	bg_event  3, 19, BGEVENT_ITEM + FULL_HEAL, EVENT_ILEX_FOREST_HIDDEN_FULL_HEAL
	bg_event 20,  9, BGEVENT_JUMPTEXT, Text_IlexForestMossRock
	bg_event 10, 24, BGEVENT_UP, IlexForestShrineScript
	bg_event 25, 24, BGEVENT_ITEM + SILVER_LEAF, EVENT_ILEX_FOREST_HIDDEN_SILVER_LEAF_1
	bg_event 19,  8, BGEVENT_ITEM + SILVER_LEAF, EVENT_ILEX_FOREST_HIDDEN_SILVER_LEAF_2
	bg_event 25, 23, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ILEX_FOREST
	bg_event 26, 23, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ILEX_FOREST

	def_object_events
	object_event 16, 33, SPRITE_FARFETCH_D, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestFarfetchdScript, EVENT_ILEX_FOREST_FARFETCHD
	object_event  7, 30, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestCharcoalMasterScript, EVENT_ILEX_FOREST_CHARCOAL_MASTER
	object_event 10, 31, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_KURT
	object_event  5, 26, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_IlexForestLass, EVENT_ILEX_FOREST_LASS
	object_event 10, 26, SPRITE_CELEBI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_CELEBI
	object_event  9, 25, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestLyraScript, EVENT_ILEX_FOREST_LYRA
	object_event  9, 30, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestCharcoalApprenticeScript, EVENT_ILEX_FOREST_APPRENTICE
	object_event 17, 16, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestHeadbuttGuyScript, -1
	object_event 14,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerBugCatcherWayne, -1
	object_event  4, 16, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, IlexForestHoneyBoyText, EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	cuttree_event 10, 27, EVENT_ILEX_FOREST_CUT_TREE
	itemball_event 22, 34, REVIVE, 1, EVENT_ILEX_FOREST_REVIVE
	itemball_event 11, 19, X_ATTACK, 1, EVENT_ILEX_FOREST_X_ATTACK
	itemball_event 25, 17, ANTIDOTE, 1, EVENT_ILEX_FOREST_ANTIDOTE
	itemball_event 29,  3, MULCH, 1, EVENT_ILEX_FOREST_MULCH

	object_const_def
	const ILEXFOREST_FARFETCHD
	const ILEXFOREST_BLACK_BELT
	const ILEXFOREST_KURT
	const ILEXFOREST_LASS
	const ILEXFOREST_CELEBI
	const ILEXFOREST_LYRA
	const ILEXFOREST_YOUNGSTER

IlexForestCutSceneScene:
	sdefer IlexForestFinishCelebiEventScript
IlexForestFarfetchdQuestScene:
	end

IlexForestFarfetchdCallback:
	checkevent EVENT_GOT_HM01_CUT
	iftruefwd .Static
	readmem wFarfetchdPosition
	ifequalfwd  1, .PositionOne
	ifequalfwd  2, .PositionTwo
	ifequalfwd  3, .PositionThree
	ifequalfwd  4, .PositionFour
	ifequalfwd  5, .PositionFive
	ifequalfwd  6, .PositionSix
	ifequalfwd  7, .PositionSeven
	ifequalfwd  8, .PositionEight
	ifequalfwd  9, .PositionNine
	ifequalfwd 10, .PositionTen
.Static:
	endcallback

.PositionOne:
	moveobject ILEXFOREST_FARFETCHD, 16, 33
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionTwo:
	moveobject ILEXFOREST_FARFETCHD, 17, 27
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionThree:
	moveobject ILEXFOREST_FARFETCHD, 22, 26
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionFour:
	moveobject ILEXFOREST_FARFETCHD, 31, 24
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionFive:
	moveobject ILEXFOREST_FARFETCHD, 30, 33
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionSix:
	moveobject ILEXFOREST_FARFETCHD, 26, 37
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionSeven:
	moveobject ILEXFOREST_FARFETCHD, 24, 33
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionEight:
	moveobject ILEXFOREST_FARFETCHD, 17, 31
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionNine:
	moveobject ILEXFOREST_FARFETCHD, 12, 37
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionTen:
	moveobject ILEXFOREST_FARFETCHD, 8, 30
	appear ILEXFOREST_FARFETCHD
	endcallback

IlexForestCharcoalApprenticeScript:
	checkevent EVENT_HERDED_FARFETCHD
	iftrue_jumptextfaceplayer IlexForestApprenticeAfterText
	setscene SCENE_ILEXFOREST_FARFETCHD_QUEST
	jumpthistextfaceplayer

	text "Vaya… Mi jefe se"
	line "va a poner"
	cont "furioso…"

	para "El Farfetch'd que"
	line "corta árboles"

	para "para el carbón se"
	line "me escapó."

	para "No puedo ir a"
	line "buscarlo aquí en"
	cont "el Encinar."

	para "Es demasiado"
	line "grande, oscuro y"
	cont "aterrador para"
	cont "mí…"
	done

IlexForestFarfetchdScript:
	faceplayer
	readmem wFarfetchdPosition
	ifequalfwd  0, .Position1
	showcrytext Text_Kwaaaa, FARFETCH_D
	readmem wFarfetchdPosition
	ifequalfwd  2, .Position2
	ifequalfwd  3, .Position3
	ifequalfwd  4, .Position4
	ifequalfwd  5, .Position5
	ifequalfwd  6, .Position6
	ifequalfwd  7, .Position7
	ifequalfwd  8, .Position8
	ifequalfwd  9, .Position9
	ifequal 10, DoNothingScript

.Position1:
	faceplayer
	opentext
	writetext Text_ItsTheMissingPokemon
	promptbutton
	writetext Text_Kwaaaa
	cry FARFETCH_D
	waitbutton
	closetext
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos1_Pos2
.NewPosition2:
	moveobject ILEXFOREST_FARFETCHD, 17, 27
	setval 2
.NewPosition:
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	writemem wFarfetchdPosition
	end

.Position2:
	readvar VAR_FACING
	ifequalfwd DOWN, .Position2_Down
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos2_Pos3
.NewPosition3:
	moveobject ILEXFOREST_FARFETCHD, 22, 26
	setval 3
	sjump .NewPosition

.Position2_Down:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos2_Pos8
.NewPosition8:
	moveobject ILEXFOREST_FARFETCHD, 17, 31
	setval 8
	sjump .NewPosition

.Position3:
	readvar VAR_FACING
	ifequalfwd LEFT, .Position3_Left
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos3_Pos4
.NewPosition4:
	moveobject ILEXFOREST_FARFETCHD, 31, 24
	setval 4
	sjump .NewPosition

.Position3_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos3_Pos2
	sjump .NewPosition2

.Position4:
	readvar VAR_FACING
	ifequalfwd UP, .Position4_Up
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos4_Pos5
.NewPosition5:
	moveobject ILEXFOREST_FARFETCHD, 30, 33
	setval 5
	sjump .NewPosition

.Position4_Up:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos4_Pos3
	sjump .NewPosition3

.Position5:
	readvar VAR_FACING
	ifequalfwd UP, .Position5_Up
	ifequalfwd LEFT, .Position5_Left
	ifequalfwd RIGHT, .Position5_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos5_Pos6
.NewPosition6:
	moveobject ILEXFOREST_FARFETCHD, 26, 37
	setval 6
	sjump .NewPosition

.Position5_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos5_Pos7
.NewPosition7:
	moveobject ILEXFOREST_FARFETCHD, 24, 33
	setval 7
	sjump .NewPosition

.Position5_Up:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos5_Pos4_Up
	sjump .NewPosition4

.Position5_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos5_Pos4_Right
	sjump .NewPosition4

.Position6:
	readvar VAR_FACING
	ifequalfwd RIGHT, .Position6_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos6_Pos7
	sjump .NewPosition7

.Position6_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos6_Pos5
	sjump .NewPosition5

.Position7:
	readvar VAR_FACING
	ifequalfwd DOWN, .Position7_Down
	ifequalfwd LEFT, .Position7_Left
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos7_Pos8
	sjump .NewPosition8

.Position7_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos7_Pos6
	sjump .NewPosition6

.Position7_Down:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos7_Pos5
	sjump .NewPosition5

.Position8:
	readvar VAR_FACING
	ifequalfwd UP, .Position8_Up
	ifequalfwd LEFT, .Position8_Left
	ifequalfwd RIGHT, .Position8_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos8_Pos9
	moveobject ILEXFOREST_FARFETCHD, 12, 37
	setval 9
	sjump .NewPosition

.Position8_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos8_Pos7
	sjump .NewPosition7

.Position8_Up:
.Position8_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos8_Pos2
	sjump .NewPosition2

.Position9:
	readvar VAR_FACING
	ifequalfwd DOWN, .Position9_Down
	ifequalfwd RIGHT, .Position9_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos9_Pos10
	appear ILEXFOREST_BLACK_BELT
	setevent EVENT_CHARCOAL_KILN_BOSS
	setevent EVENT_HERDED_FARFETCHD
	moveobject ILEXFOREST_FARFETCHD, 8, 30
	setval 10
	sjump .NewPosition

.Position9_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos9_Pos8_Right
	sjump .NewPosition8

.Position9_Down:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos9_Pos8_Down
	sjump .NewPosition8

IlexForestFinishCelebiEventScript:
	setevent EVENT_TIME_TRAVEL_FINISHED
	clearevent EVENT_TIME_TRAVELING
	setscene SCENE_ILEXFOREST_FARFETCHD_QUEST
	pause 30
	showemote EMOTE_SHOCK, ILEXFOREST_LYRA, 15
	applyonemovement ILEXFOREST_LYRA, slow_step_down
	turnobject ILEXFOREST_LYRA, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext Text_IlexForestLyraWorried
	waitbutton
	writetext Text_IlexForestLyraArmorSuit
	waitbutton
	closetext
	follow ILEXFOREST_LYRA, PLAYER
	applyonemovement ILEXFOREST_LYRA, slow_step_up
	stopfollow
	turnobject PLAYER, UP
	turnobject ILEXFOREST_LYRA, DOWN
	setlasttalked ILEXFOREST_LYRA
	opentext
	sjumpfwd IlexForestLyraContinueScript

IlexForestLyraScript:
	faceplayer
	opentext
	writetext Text_IlexForestLyraArmorSuit
	promptbutton
IlexForestLyraContinueScript:
	verbosegiveitem ARMOR_SUIT
	iffalse_endtext
	setevent EVENT_GOT_ARMOR_SUIT
	writetext Text_IlexForestLyraGoodbye
	waitbutton
	closetext
	readvar VAR_FACING
	ifequalfwd LEFT, .NotBlockingPath
	applymovement PLAYER, MovementData_PlayerStepAside
.NotBlockingPath
	applymovement ILEXFOREST_LYRA, MovementData_IlexForestLyraLeaves
	disappear ILEXFOREST_LYRA
	end

IlexForestApprenticeTrigger:
	showemote EMOTE_SHOCK, ILEXFOREST_YOUNGSTER, 15
	turnobject PLAYER, UP
	sjump IlexForestCharcoalApprenticeScript

IlexForestCharcoalMasterScript:
	checkevent EVENT_GOT_HM01_CUT
	iftrue_jumptextfaceplayer Text_CharcoalMasterTalkAfter
	faceplayer
	opentext
	writetext Text_CharcoalMasterIntro
	promptbutton
	verbosegivetmhm HM_CUT
	setevent EVENT_GOT_HM01_CUT
	writetext Text_CharcoalMasterOutro
	waitbutton
	closetext
	setevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_ILEX_FOREST_APPRENTICE
	setevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
	clearevent EVENT_CHARCOAL_KILN_FARFETCH_D
	clearevent EVENT_CHARCOAL_KILN_APPRENTICE
	clearevent EVENT_CHARCOAL_KILN_BOSS
	end

IlexForestHeadbuttGuyScript:
	faceplayer
	opentext
	checkkeyitem WING_CASE
	iftruefwd IlexForestTutorHeadbuttScript
	writetext Text_HeadbuttIntro
	promptbutton
	verbosegivekeyitem WING_CASE
	writetext Text_HeadbuttIntro2
	waitbutton
	setevent EVENT_LISTENED_TO_HEADBUTT_INTRO
IlexForestTutorHeadbuttScript:
	writetext Text_IlexForestTutorHeadbutt
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_IlexForestTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval HEADBUTT
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "De acuerdo,"
	line "entonces."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Oh, pero no"
	line "tienes ninguna"
	cont "Hoja Plata."

	para "A veces las"
	line "encuentras en"
	cont "Oddish salvajes,"

	para "o tiradas en el"
	line "suelo."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Sacude árboles"
	line "con Golpe"
	cont "Cabeza. A veces,"
	cont "caen #mon"
	cont "dormidos."
	done

GenericTrainerBugCatcherWayne:
	generictrainer BUG_CATCHER, WAYNE, EVENT_BEAT_BUG_CATCHER_WAYNE, BugCatcherWayneSeenText, BugCatcherWayneBeatenText

	text "Un #mon que"
	line "nunca había"
	cont "visto cayó del"
	cont "árbol cuando usé"
	cont "Golpe Cabeza."

	para "Debería usar"
	line "Golpe Cabeza en"
	cont "otros lugares"
	cont "también."
	done

IlexForestShrineScript:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalsefwd .DontDoCelebiEvent
	checkkeyitem GS_BALL
	iftruefwd .AskCelebiEvent
.DontDoCelebiEvent:
	checkevent EVENT_TIME_TRAVEL_FINISHED
	iftruefwd .DontDoGiovanniEvent
	checkpoke CELEBI
	iftruefwd .StartGiovanniEvent
.DontDoGiovanniEvent
	jumptext Text_IlexForestShrine

.AskCelebiEvent:
	opentext
	writetext Text_ShrineCelebiEvent
	yesorno
	iftruefwd .CelebiEvent
	endtext

.CelebiEvent:
	takekeyitem GS_BALL
	clearevent EVENT_FOREST_IS_RESTLESS
	setevent EVENT_AZALEA_TOWN_KURT
	disappear ILEXFOREST_LASS
	clearevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	writetext Text_InsertGSBall
	waitbutton
	closetext
	pause 20
	showemote EMOTE_SHOCK, PLAYER, 20
	special Special_FadeOutMusic
	applymovement PLAYER, IlexForestPlayerStepsDownMovement
	pause 30
	turnobject PLAYER, DOWN
	pause 20
	clearflag ENGINE_HAVE_EXAMINED_GS_BALL
	special Special_CelebiShrineEvent
	loadwildmon CELEBI, 30
	startbattle
	reloadmapafterbattle
	pause 20
	special CheckBattleCaughtResult
	iffalse DoNothingScript
	setflag ENGINE_PLAYER_CAUGHT_CELEBI
	appear ILEXFOREST_KURT
	applymovement ILEXFOREST_KURT, IlexForestKurtStepsUpMovement
	showtext Text_KurtCaughtCelebi
	applymovement ILEXFOREST_KURT, IlexFOrestKurtStepsDownMovement
	disappear ILEXFOREST_KURT
	end

.StartGiovanniEvent:
	showtext Text_IlexForestShrine
	showemote EMOTE_SHOCK, PLAYER, 15
	appear ILEXFOREST_CELEBI
	playsound SFX_BALL_POOF
	turnobject PLAYER, DOWN
	waitsfx
	pause 15
	cry CELEBI
	waitsfx
	pause 15
	applymovement ILEXFOREST_CELEBI, MovementData_CelebiDance
	pause 15
	showtext Text_CelebiDancedBeautifully
	playsound SFX_JUMP_OVER_LEDGE
	applymovement ILEXFOREST_CELEBI, MovementData_CelebiHop
	applyonemovement PLAYER, slow_step_down
	waitsfx
	special Special_FadeOutMusic
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	moveobject ILEXFOREST_LYRA, 5, 26
	appear ILEXFOREST_LYRA
	applymovement ILEXFOREST_LYRA, MovementData_IlexForestLyraApproaches
	turnobject PLAYER, LEFT
	showtext Text_IlexForestLyraHello
	special RestartMapMusic
	pause 30
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	special LoadMapPalettes
	turnobject ILEXFOREST_CELEBI, DOWN
	pause 30
	special FadeInPalettes_EnableDynNoApply
	waitsfx
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, UP
	pause 15
	turnobject ILEXFOREST_LYRA, UP
	turnobject PLAYER, DOWN
	pause 15
	turnobject ILEXFOREST_LYRA, RIGHT
	turnobject PLAYER, LEFT
	showtext Text_IlexForestLyraWhatWasThat
	cry CELEBI
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, MovementData_PlayerStepBack
	waitsfx
	playsound SFX_PROTECT
	applymovement ILEXFOREST_CELEBI, MovementData_CelebiFloat
	waitsfx
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	pause 30
	waitsfx
	disappear ILEXFOREST_CELEBI
	disappear ILEXFOREST_LYRA
	setevent EVENT_TIME_TRAVELING
	warp ROUTE_22_PAST, 6, 7
	end

MovementData_Farfetchd_Pos1_Pos2:
	big_step_up
MovementData_Farfetched_Pos8_Pos2:
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_Farfetchd_Pos2_Pos3:
	run_step_up
	run_step_up
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_down
	step_end

MovementData_Farfetchd_Pos4_Pos5:
	big_step_down
MovementData_Farfetchd_Pos2_Pos8:
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end

MovementData_Farfetchd_Pos3_Pos4:
MovementData_Farfetched_Pos7_Pos5:
	big_step_right
MovementData_Farfetched_Pos8_Pos7:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end

MovementData_Farfetchd_Pos3_Pos2:
	run_step_up
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	step_end

MovementData_Farfetchd_Pos4_Pos3:
	run_step_left
	jump_step_left
	run_step_left
	run_step_left
	step_end

MovementData_Farfetchd_Pos5_Pos6:
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
MovementData_Farfetchd_Pos5_Pos7:
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	step_end

MovementData_Farfetched_Pos5_Pos4_Up:
	run_step_up
	run_step_up
	run_step_up
	run_step_right
	run_step_up
	step_end

MovementData_Farfetched_Pos5_Pos4_Right:
	run_step_right
	turn_head_up
	step_sleep_1
	turn_head_down
	step_sleep_1
	turn_head_up
	step_sleep_1
	run_step_down
	run_step_down
	fix_facing
	jump_step_up
	step_sleep_8
	step_sleep_8
	remove_fixed_facing
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end

MovementData_Farfetched_Pos6_Pos7:
	run_step_left
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	run_step_right
	run_step_up
	run_step_up
	step_end

MovementData_Farfetched_Pos6_Pos5:
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end

MovementData_Farfetched_Pos7_Pos8:
	run_step_up
	run_step_up
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	step_end

MovementData_Farfetched_Pos7_Pos6:
	run_step_down
	run_step_down
	run_step_left
	run_step_down
	run_step_down
	run_step_right
	run_step_right
	run_step_right
	step_end

MovementData_Farfetched_Pos8_Pos9:
	run_step_down
	run_step_left
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end

MovementData_Farfetched_Pos9_Pos10:
	run_step_left
	run_step_left
	fix_facing
	jump_step_right
	step_sleep_8
	step_sleep_8
	remove_fixed_facing
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end

MovementData_Farfetched_Pos9_Pos8_Right:
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end

MovementData_Farfetched_Pos9_Pos8_Down:
	run_step_left
	run_step_left
	fix_facing
	jump_step_right
	step_sleep_8
	step_sleep_8
	remove_fixed_facing
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end

IlexForestKurtStepsUpMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

IlexFOrestKurtStepsDownMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

IlexForestPlayerStepsDownMovement:
	fix_facing
	slow_step_down
	remove_fixed_facing
	step_end

MovementData_CelebiDance:
	slow_step_left
	slow_step_right
	slow_step_right
	slow_step_left
	step_sleep_4
	turn_head_up
	step_sleep_4
	turn_head_left
	step_sleep_4
	turn_head_down
	step_sleep_4
	turn_head_right
	step_sleep_4
	turn_head_up
	step_sleep_4
	turn_head_left
	step_sleep_4
	turn_head_down
	step_sleep_4
	turn_head_right
	step_sleep_4
	turn_head_up
	step_sleep_4
	step_end

MovementData_CelebiHop:
	jump_step_down
	slow_step_up
	step_end

MovementData_CelebiFloat:
	turn_head_down
	fix_facing
	slow_step_up
	slow_step_up
	slow_step_up
	remove_fixed_facing
	step_end

MovementData_PlayerStepBack:
	fix_facing
	slow_step_right
	remove_fixed_facing
	step_end

MovementData_IlexForestLyraApproaches:
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	step_end

MovementData_PlayerStepAside:
	slow_step_right
	turn_head_left
	step_end

MovementData_IlexForestLyraLeaves:
	slow_step_down
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	step_end


IlexForestApprenticeAfterText:
	text "¡Vaya! ¡Muchas"
	line "gracias!"

	para "El #mon de mi"
	line "jefe no me hace"
	cont "caso porque no"
	cont "tengo Medalla."
	done

Text_ItsTheMissingPokemon:
	text "¡Es el #mon"
	line "desaparecido!"
	done

Text_Kwaaaa:
	text "Farfetch'd: ¡Kwaa!"
	done

Text_CharcoalMasterIntro:
	text "¡Ah! ¡Mi"
	line "Farfetch'd!"

	para "¿Lo encontraste"
	line "para nosotros,"
	cont "chico?"

	para "Sin él, no"
	line "podríamos cortar"

	para "árboles para"
	line "carbón."

	para "¡Gracias, chico!"

	para "Ahora, cómo"
	line "puedo"
	cont "agradecértelo…"

	para "¡Ya sé! Toma,"
	line "quédate con"
	cont "esto."
	done

Text_CharcoalMasterOutro:
	text "Esa es la MO"
	line "Corte. Cualquier"

	para "#mon compatible"
	line "puede usar Corte"

	para "para talar árboles"
	line "pequeños."

	para "No hace falta que"
	line "se lo enseñes"

	para "a menos que"
	line "quieras que use"
	cont "Corte en batalla."

	para "Claro que"
	line "necesitas la"

	para "Medalla de"
	line "Azalea para"
	cont "usarlo fuera de"
	cont "batalla."
	done

Text_CharcoalMasterTalkAfter:
	text "¿Quieres ser"
	line "aprendiz de"

	para "carbonero"
	line "conmigo?"

	para "¡En diez años"
	line "serás de"
	cont "primera!"
	done

Text_HeadbuttIntro:
	text "¿Qué estoy"
	line "haciendo?"

	para "Sacudo árboles"
	line "con Golpe Cabeza."

	para "A veces saco a"
	line "un #mon,"

	para "a veces solo sus"
	line "plumas."

	para "¡Pero hasta eso"
	line "es útil!"

	para "Parece hacer a"
	line "mis propios"
	cont "#mon un poco"
	cont "más fuertes."

	para "Es divertido."
	line "¡Toma, pruébalo"
	cont "tú también!"

	para "Solo necesitarás"
	line "un Estuche para"
	cont "guardar alguna"
	cont "Ala delicada…"
	done

Text_HeadbuttIntro2:
	text "Ah, ¿y si ninguno"
	line "de tus #mon"
	cont "sabe Golpe Cabeza?"

	para "¡No hay problema!"
	done

Text_IlexForestTutorHeadbutt:
	text "Puedo enseñar"
	line "Golpe Cabeza a tu"

	para "#mon a cambio"
	line "de una Hoja"
	cont "Plata."
	done


Text_IlexForestTutorQuestion:
	text "¿Debería"
	line "enseñarle"
	cont "Golpe Cabeza a tu"
	cont "#mon?"
	done



Text_IlexForestLass:
	text "¿Le pasó algo al"
	line "guardián del"
	cont "bosque?"
	done

Text_IlexForestMossRock:
	text "La roca está"
	line "cubierta de"
	cont "musgo."

	para "Se siente"
	line "agradablemente"
	cont "fresca."
	done

IlexForestSignpost:
	text "El Encinar está"
	line "tan cubierto de"

	para "árboles que no"
	line "se ve el cielo."

	para "Ten cuidado con"
	line "los objetos que"
	cont "puedan haberse"
	cont "caído."
	done

IlexForestTrainerTips:
	text "Consejos de"
	line "Entrenador"

	para "Mientras tengas"
	line "una MO en tu"
	cont "Mochila,"

	para "y un #mon en tu"
	line "equipo que sea"

	para "compatible con"
	line "ella, puedes usar"

	para "el movimiento"
	line "fuera de batalla."

	para "¡Ni siquiera"
	line "tienes que"
	cont "enseñárselo!"
	done

Text_IlexForestShrine:
	text "Santuario del"
	line "Encinar…"

	para "Es en honor al"
	line "protector del"
	cont "bosque…"
	done

Text_ShrineCelebiEvent:
	text "Santuario del"
	line "Encinar…"

	para "Es en honor al"
	line "protector del"
	cont "bosque…"

	para "¿Eh? ¿Qué es"
	line "esto?"

	para "Es un agujero."
	line "Parece que la GS"

	para "Ball encajaría"
	line "dentro."

	para "¿Quieres poner la"
	line "GS Ball aquí?"
	done

Text_InsertGSBall:
	text "<PLAYER> puso la"
	line "GS Ball."
	done

Text_KurtCaughtCelebi:
	text "Uf, ¡vaya cosa"
	line "más increíble!"

	para "<PLAYER>, eso fue"
	line "fantástico."
	cont "¡Gracias!"

	para "Las leyendas"
	line "sobre ese"
	cont "Santuario eran"
	cont "reales después"
	cont "de todo."

	para "Quizás la leyenda"
	line "de que quien lo"
	cont "toca"

	para "desaparece"
	line "también sea"
	cont "cierta…"

	para "Me siento"
	line "inspirado por lo"
	cont "que acabo de ver."

	para "¡Me motiva a"
	line "hacer mejores"
	cont "Balls!"

	para "¡Me voy!"
	done

Text_CelebiDancedBeautifully:
	text "¡Celebi bailó"
	line "bellamente!"
	done

Text_IlexForestLyraHello:
	text "Lyra: Hola,"
	line "<PLAYER>. ¿Has"
	cont "oído la leyenda"
	cont "del santuario?"

	para "Dicen que la"
	line "gente desaparece"

	para "cuando lo tocan."
	done

Text_IlexForestLyraWhatWasThat:
	text "Lyra: …"
	line "¿Qué fue eso?"
	done

Text_IlexForestLyraWorried:
	text "Lyra: …¿<PLAYER>?"
	line "¿De verdad"
	cont "volviste?"

	para "¡Te extrañé"
	line "tanto! Celebi me"

	para "envió aquí y tú"
	line "habías"
	cont "desaparecido…"

	para "¡Pensé que"
	line "estarías atrapado"
	cont "en el pasado para"
	cont "siempre!"

	para "…"

	para "Al menos ahora"
	line "ambos volvimos"
	cont "a salvo a nuestro"
	cont "tiempo."
	done

Text_IlexForestLyraArmorSuit:
	text "Lyra: ¿Qué"
	line "extraña aventura"
	cont "tuviste tú solo?"

	para "Se te cayó esta…"
	line "cosa cuando"
	cont "Celebi te trajo"
	cont "de vuelta…"
	done

Text_IlexForestLyraGoodbye:
	text "Lyra: Vaya que"
	line "fue un día"
	cont "extraño."

	para "Estoy agotada,"
	line "será mejor que"
	cont "me vaya."

	para "Tú también"
	line "deberías"
	cont "descansar,"
	cont "<PLAYER>."

	para "¡Nos vemos!"
	done

BugCatcherWayneSeenText:
	text "¡No te acerques"
	line "así a hurtadillas!"

	para "¡Asustaste a un"
	line "#mon y se fue!"
	done

BugCatcherWayneBeatenText:
	text "No había visto ese"
	line "#mon antes…"
	done

IlexForestHoneyBoyText:
	text "Estoy untando"
if DEF(FAITHFUL)
	line "Miel en el"
	cont "suelo."
else
	line "Miel Dulce en"
	cont "el suelo."
endc

	para "El #mon de mi"
	line "hermana lo"
	cont "recoge."

	para "Ayuda a atraer"
	line "#mon del mismo"

	para "nivel que el mío,"
	line "así que es una"
	cont "pelea justa."
	done
