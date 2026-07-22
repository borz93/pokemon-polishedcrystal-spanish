Route36NationalParkGate_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_ROUTE36NATIONALPARKGATE_NOOP
	scene_script DoNothingScript, SCENE_ROUTE36NATIONALPARKGATE_UNUSED
	scene_script Route36NationalParkGateLeaveContestEarlyScene, SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route36NationalParkGateCheckIfContestRunning
	callback MAPCALLBACK_OBJECTS, Route36NationalParkGateCheckIfContestAvailable

	def_warp_events
	warp_event  0,  4, NATIONAL_PARK, 1
	warp_event  0,  5, NATIONAL_PARK, 2
	warp_event  9,  4, ROUTE_36, 1
	warp_event  9,  5, ROUTE_36, 2

	def_coord_events

	def_bg_events
	bg_event  6,  0, BGEVENT_JUMPTEXT, BugCatchingContestExplanationText

	def_object_events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36OfficerScriptContest, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  2,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1BScript, EVENT_BUG_CATCHING_CONTESTANT_1B
	object_event  4,  5, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2BScript, EVENT_BUG_CATCHING_CONTESTANT_2B
	object_event  2,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3BScript, EVENT_BUG_CATCHING_CONTESTANT_3B
	object_event  6,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4BScript, EVENT_BUG_CATCHING_CONTESTANT_4B
	object_event  2,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5BScript, EVENT_BUG_CATCHING_CONTESTANT_5B
	object_event  5,  6, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6BScript, EVENT_BUG_CATCHING_CONTESTANT_6B
	object_event  3,  6, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7BScript, EVENT_BUG_CATCHING_CONTESTANT_7B
	object_event  4,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8BScript, EVENT_BUG_CATCHING_CONTESTANT_8B
	object_event  6,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9BScript, EVENT_BUG_CATCHING_CONTESTANT_9B
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10BScript, EVENT_BUG_CATCHING_CONTESTANT_10B
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36NationalParkGateOfficerScript, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY

	object_const_def
	const ROUTE36NATIONALPARKGATE_OFFICER1
	const ROUTE36NATIONALPARKGATE_BUG_CATCHER1
	const ROUTE36NATIONALPARKGATE_BUG_MANIAC
	const ROUTE36NATIONALPARKGATE_COOLTRAINER_M
	const ROUTE36NATIONALPARKGATE_POKEFAN_M
	const ROUTE36NATIONALPARKGATE_BUG_CATCHER2
	const ROUTE36NATIONALPARKGATE_YOUNGSTER1
	const ROUTE36NATIONALPARKGATE_LASS
	const ROUTE36NATIONALPARKGATE_BUG_CATCHER3
	const ROUTE36NATIONALPARKGATE_YOUNGSTER2
	const ROUTE36NATIONALPARKGATE_YOUNGSTER3
	const ROUTE36NATIONALPARKGATE_OFFICER2

Route36NationalParkGateCheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftruefwd .BugContestIsRunning
	setscene SCENE_ROUTE36NATIONALPARKGATE_NOOP
	endcallback

.BugContestIsRunning:
	setscene SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	endcallback

Route36NationalParkGateCheckIfContestAvailable:
	checkevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	iftruefwd .Return
	readvar VAR_WEEKDAY
	ifequalfwd TUESDAY, .SetContestOfficer
	ifequalfwd THURSDAY, .SetContestOfficer
	ifequalfwd SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftruefwd .SetContestOfficer
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	endcallback

.SetContestOfficer:
	appear ROUTE36NATIONALPARKGATE_OFFICER1
	disappear ROUTE36NATIONALPARKGATE_OFFICER2
.Return:
	endcallback

Route36NationalParkGateLeaveContestEarlyScene:
	sdefer .Script
	end

.Script:
	turnobject PLAYER, UP
	opentext
	readvar VAR_CONTESTMINUTES
	addval $1
	setquantity
	writetext Route35NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalsefwd .GoBackToContest
	writetext Route36NationalParkGateOfficer1WaitHereForAnnouncementText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	callasm DisableDynPalUpdates
	scall .CopyContestants
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	applymovement PLAYER, Route36NationalParkGatePlayerWaitWithContestantsMovement
	pause 15
	callasm SetBlackObjectPals
	callasm ClearSavedObjPals
	callasm EnableDynPalUpdatesNoApply
	callasm _UpdateSprites
	callasm DelayFrame
	callasm FadeInPalettes
	jumpstd bugcontestresults

.GoBackToContest:
	writetext Route35NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 35, 18
	end

.CopyContestants:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftruefwd .Not1
	appear ROUTE36NATIONALPARKGATE_BUG_CATCHER1
.Not1:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftruefwd .Not2
	appear ROUTE36NATIONALPARKGATE_BUG_MANIAC
.Not2:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftruefwd .Not3
	appear ROUTE36NATIONALPARKGATE_COOLTRAINER_M
.Not3:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftruefwd .Not4
	appear ROUTE36NATIONALPARKGATE_POKEFAN_M
.Not4:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftruefwd .Not5
	appear ROUTE36NATIONALPARKGATE_BUG_CATCHER2
.Not5:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftruefwd .Not6
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER1
.Not6:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftruefwd .Not7
	appear ROUTE36NATIONALPARKGATE_LASS
.Not7:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftruefwd .Not8
	appear ROUTE36NATIONALPARKGATE_BUG_CATCHER3
.Not8:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftruefwd .Not9
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER2
.Not9:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftruefwd .Not10
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER3
.Not10:
	special UpdateSprites
	end

Route36OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .ContestNotOn
	ifequalfwd MONDAY, .ContestNotOn
	ifequalfwd WEDNESDAY, .ContestNotOn
	ifequalfwd FRIDAY, .ContestNotOn
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftruefwd Route36Officer_ContestHasConcluded
	faceplayer
	opentext
	callstd daytotext
	writetext Route35NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse_jumpopenedtext Route35NationalParkGateOfficer1TakePartInFutureText
	readvar VAR_PARTYCOUNT
	ifgreater $1, .LeaveMonsWithOfficer
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route35NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	waitsfx
	writetext Route35NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route35NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special Special_GiveParkBalls
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	special Special_SelectRandomBugContestContestants
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 35, 18
	end

.ContestNotOn:
	jumptextfaceplayer Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText

.LeaveMonsWithOfficer:
	readvar VAR_PARTYCOUNT
	ifless $6, .ContinueLeavingMons
	readvar VAR_BOXSPACE
	iffalse_jumpopenedtext Route35NationalParkGateOfficer1MakeRoomText
.ContinueLeavingMons:
	special CheckFirstMonIsEgg
	iftrue_jumpopenedtext Route35NationalParkGateOfficer1EggAsFirstMonText
	writetext Route35NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse_jumpopenedtext Route35NationalParkGateOfficer1ChooseMonAndComeBackText
	special ContestDropOffMons
	iftrue_jumpopenedtext Route35NationalParkGateOfficer1FirstMonCantBattleText
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route35NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route35NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump .ResumeStartingContest

Route36Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_PRIZE
	iffalse_jumptextfaceplayer Route35NationalParkGateOfficer1ContestIsOverText
	faceplayer
	opentext
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	readmem wBugContestOfficerPrize
	verbosegiveitem ITEM_FROM_MEM
	iffalse_jumpopenedtext Route36NationalParkGateOfficer1WellHoldPrizeText
	clearevent EVENT_CONTEST_OFFICER_HAS_PRIZE
	endtext

Route36NationalParkGateOfficerScript:
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	jumptextfaceplayer Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText

BugCatchingContestant1BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant1BStillCompetingText
	jumpthistextfaceplayer

	text "Don: Vaya, me"
	line "venciste. Eres"
	cont "bastante bueno."
	done

BugCatchingContestant2BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant2BStillCompetingText
	jumpthistextfaceplayer

	text "Lou: Te envidio."
	line "Yo no lo logré"
	cont "esta vez."
	done

BugCatchingContestant3BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant3BStillCompetingText
	jumpthistextfaceplayer

	text "Nick: ¡Bien"
	line "hecho! Voy a criar"
	cont "mejor a mis"
	cont "#mon."
	done

BugCatchingContestant4BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant4BStillCompetingText
	jumpthistextfaceplayer

	text "William: ¿Eres el"
	line "ganador? ¿Qué"
	cont "atrapaste?"
	done

BugCatchingContestant5BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant5BStillCompetingText
	jumpthistextfaceplayer

	text "Benny: ¡Felicida-"
	line "des! ¡Te has"
	cont "ganado mi"
	cont "respeto!"
	done

BugCatchingContestant6BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant6BStillCompetingText
	jumpthistextfaceplayer

	text "Barry: Ese #mon"
	line "que atrapaste…"
	cont "¡es genial!"
	done

BugCatchingContestant7BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant7BStillCompetingText
	jumpthistextfaceplayer

	text "Cindy: ¿Ganaste?"
	line "¡Genial!"

	para "¿Te apetece"
	line "buscar #mon"
	cont "bicho conmigo?"
	done

BugCatchingContestant8BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant8BStillCompetingText
	jumpthistextfaceplayer

	text "Josh: Yo… no"
	line "puedo creer que"
	cont "perdí atrapando"
	cont "bichos…"
	done

BugCatchingContestant9BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant9BStillCompetingText
	jumpthistextfaceplayer

	text "Johnny: La próxima"
	line "vez, voy a ganar."
	done

BugCatchingContestant10BScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse_jumptextfaceplayer BugCatchingContestant10BStillCompetingText
	jumpthistextfaceplayer

	text "Kipp: ¿Me das"
	line "algún consejo?"

	para "Quiero estudiar"
	line "tu estilo."
	done

Route36NationalParkGatePlayerWaitWithContestantsMovement:
	run_step_down
	run_step_right
	turn_head_up
	step_end

Route36NationalParkGateOfficer1WaitHereForAnnouncementText:
	text "Vale. Espera aquí"
	line "para el anuncio"

	para "de los ganadores."
	done

Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText:
	text "Algunos #mon"
	line "solo se ven en el"
	cont "Parque."
	done


BugCatchingContestant1BStillCompetingText:
	text "Don: La suerte"
	line "cuenta mucho en"
	cont "esto."

	para "Nunca sabes qué"
	line "#mon"
	cont "aparecerá."
	done


BugCatchingContestant2BStillCompetingText:
	text "Lou: ¿Ganas con"
	line "#mon grandes?"
	done


BugCatchingContestant3BStillCompetingText:
	text "Nick: Quizás"
	line "consigas más"
	cont "puntos por un"

	para "#mon de color"
	line "poco común."
	done


BugCatchingContestant4BStillCompetingText:
	text "William: Bueno,"
	line "estoy contento"

	para "porque atrapé el"
	line "#mon que quería."
	done


BugCatchingContestant5BStillCompetingText:
	text "Benny: Atrapé un"
	line "Scyther antes,"
	cont "pero no gané."
	done


BugCatchingContestant6BStillCompetingText:
	text "Barry: Es más"
	line "fácil ganar si"

	para "consigues un"
	line "#mon bicho de"
	cont "nivel alto."

	para "Pero creo que"
	line "también cuentan"
	cont "otros puntos."
	done


BugCatchingContestant7BStillCompetingText:
	text "Cindy: ¡Me"
	line "encantan los"
	cont "#mon bicho!"
	done


BugCatchingContestant8BStillCompetingText:
	text "Josh: ¡Oí que"
	line "alguien ganó con"
	cont "un Caterpie!"
	done


BugCatchingContestant9BStillCompetingText:
	text "Johnny: Vaya."
	line "Pensé que"
	cont "puntuaría más…"
	done


BugCatchingContestant10BStillCompetingText:
	text "Kipp: Estudio"
	line "mucho, pero no"

	para "es suficiente para"
	line "ganar."
	done

Route36NationalParkGateOfficer1WellHoldPrizeText:
	text "Vaya… Tu Mochila"
	line "está llena."

	para "Guardaremos tu"
	line "premio, pero solo"
	cont "por hoy."

	para "Haz hueco, y luego"
	line "ven a verme."
	done

Route36NationalParkGateOfficer1HeresThePrizeText:
	text "¿<PLAYER>?"

	para "Aquí está el"
	line "premio que te"
	cont "guardábamos."
	done
