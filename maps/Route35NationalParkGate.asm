Route35NationalParkGate_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_ROUTE35NATIONALPARKGATE_NOOP
	scene_script DoNothingScript, SCENE_ROUTE35NATIONALPARKGATE_UNUSED
	scene_script Route35NationalParkGateLeaveContestEarlyScene, SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route35NationalParkGate_CheckIfStillInContest
	callback MAPCALLBACK_OBJECTS, Route35NationalParkGate_CheckIfContestDay

	def_warp_events
	warp_event 15,  0, NATIONAL_PARK, 3
	warp_event 16,  0, NATIONAL_PARK, 4
	warp_event 15,  7, ROUTE_35, 3
	warp_event 16,  7, ROUTE_35, 3
	warp_event  0,  4, ROUTE_35_COAST_NORTH, 1
	warp_event  0,  5, ROUTE_35_COAST_NORTH, 2

	def_coord_events

	def_bg_events
	bg_event 17,  0, BGEVENT_JUMPTEXT, BugCatchingContestExplanationText

	def_object_events
	object_event 14,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35OfficerScriptContest, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event 18,  5, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route35NationalParkGateYoungsterText, EVENT_ROUTE_35_NATIONAL_PARK_GATE_BUG_MANIAC
	object_event 12,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateOfficerScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
	object_event  5,  2, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGatePokefanFScript, -1

	object_const_def
	const ROUTE35NATIONALPARKGATE_OFFICER1
	const ROUTE35NATIONALPARKGATE_BUG_MANIAC
	const ROUTE35NATIONALPARKGATE_OFFICER2

Route35NationalParkGate_CheckIfStillInContest:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftruefwd Route35NationalParkGate_Yes
	setscene SCENE_ROUTE35NATIONALPARKGATE_NOOP
	endcallback

Route35NationalParkGate_Yes:
	setscene SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	endcallback

Route35NationalParkGate_CheckIfContestDay:
	readvar VAR_WEEKDAY
	ifequalfwd TUESDAY, Route35NationalParkGate_IsContestDay
	ifequalfwd THURSDAY, Route35NationalParkGate_IsContestDay
	ifequalfwd SATURDAY, Route35NationalParkGate_IsContestDay
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue Route35NationalParkGate_Yes
	disappear ROUTE35NATIONALPARKGATE_OFFICER1
	appear ROUTE35NATIONALPARKGATE_BUG_MANIAC
	appear ROUTE35NATIONALPARKGATE_OFFICER2
	endcallback

Route35NationalParkGate_IsContestDay:
	appear ROUTE35NATIONALPARKGATE_OFFICER1
	disappear ROUTE35NATIONALPARKGATE_BUG_MANIAC
	disappear ROUTE35NATIONALPARKGATE_OFFICER2
	endcallback

Route35NationalParkGateLeaveContestEarlyScene:
	sdefer .Script
	end

.Script:
	applymovement PLAYER, Route35NationalParkGatePlayerApproachOfficer1Movement
	turnobject ROUTE35NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	readvar VAR_CONTESTMINUTES
	addval $1
	setquantity
	writetext Route35NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalsefwd Route35NationalParkGate_GoBackIn
	writetext Route35NationalParkGateOfficer1WaitAtNorthGateText
	waitbutton
	closetext
	jumpstd bugcontestresultswarp

Route35NationalParkGate_GoBackIn:
	writetext Route35NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 12, 47
	end

Route35OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, Route35NationalParkGate_NoContestToday
	ifequalfwd MONDAY, Route35NationalParkGate_NoContestToday
	ifequalfwd WEDNESDAY, Route35NationalParkGate_NoContestToday
	ifequalfwd FRIDAY, Route35NationalParkGate_NoContestToday
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue_jumptextfaceplayer Route35NationalParkGateOfficer1ContestIsOverText
	faceplayer
	opentext
	callstd daytotext
	writetext Route35NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalsefwd Route35NationalParkGate_DeclinedToParticipate
	readvar VAR_PARTYCOUNT
	ifgreater $1, Route35NationalParkGate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route35NationalParkGate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route35NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	writetext Route35NationalParkGatePlayerReceivedParkBallsText
	callasm ShowParkBallIcon
	playsound SFX_ITEM
	waitsfx
	writetext Route35NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	special Special_GiveParkBalls
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	special Special_SelectRandomBugContestContestants
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 12, 47
	end

Route35NationalParkGate_EnterContest:
	readvar VAR_FACING
	ifequalfwd LEFT, Route35NationalParkGate_FacingLeft
	applymovement PLAYER, Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement
	end

Route35NationalParkGate_FacingLeft:
	applyonemovement PLAYER, step_up
	end

Route35NationalParkGate_LeaveTheRestBehind:
	readvar VAR_PARTYCOUNT
	ifless 6, Route35NationalParkGate_LessThanFullParty
	readvar VAR_BOXSPACE
	iffalse_jumpopenedtext Route35NationalParkGateOfficer1MakeRoomText
Route35NationalParkGate_LessThanFullParty: ; 6a27d
	special CheckFirstMonIsEgg
	iftrue_jumpopenedtext Route35NationalParkGateOfficer1EggAsFirstMonText
	writetext Route35NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalsefwd Route35NationalParkGate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftruefwd Route35NationalParkGate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route35NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route35NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump Route35NationalParkGate_OkayToProceed

Route35NationalParkGate_DeclinedToParticipate:
	jumpopenedtext Route35NationalParkGateOfficer1TakePartInFutureText

Route35NationalParkGate_DeclinedToLeaveMonsBehind:
	jumpopenedtext Route35NationalParkGateOfficer1ChooseMonAndComeBackText

Route35NationalParkGate_FirstMonIsFainted:
	jumpopenedtext Route35NationalParkGateOfficer1FirstMonCantBattleText

Route35NationalParkGateOfficerScript:
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue_jumptextfaceplayer Route35NationalParkGateOfficer1ContestIsOverText
Route35NationalParkGate_NoContestToday:
	jumpthistextfaceplayer

	text "Hacemos Concursos"
	line "con regularidad"
	cont "en el parque."

	para "Deberías"
	line "intentarlo."
	done

Route35NationalParkGatePlayerApproachOfficer1Movement:
	step_down
	turn_head_left
	step_end

Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step_right
	step_up
	step_up
	step_end

Route35NationalParkGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_CHARM_INTRO
	iftruefwd Route35NationalParkGateTutorCharmScript
	writetext Route35NationalParkGatePokefanFText
	waitbutton
	setevent EVENT_LISTENED_TO_CHARM_INTRO
Route35NationalParkGateTutorCharmScript:
	writetext Text_Route35NationalParkGateTutorCharm
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Route35NationalParkGateTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval CHARM
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Ah, supongo que"
	line "tus #mon ya son"
	cont "bastante monos,"

	para "¡pero podrían ser"
	line "aún más monos!"
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Lo siento, pero no"
	line "puedo enseñar el"

	para "movimiento a menos"
	line "que tengas una"
	cont "Hoja Plateada."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Tu #mon ya es"
	line "más mono!"
	done

Route35NationalParkGateOfficer1AskToParticipateText:
	text "Hoy es "
	text_ram wStringBuffer3
	text "."
	line "Eso significa que"

	para "hoy hay Concurso"
	line "de Captura de"
	cont "Bichos."

	para "Las reglas son"
	line "sencillas."

	para "Con uno de tus"
	line "#mon, atrapa un"

	para "#mon bicho para"
	line "ser juzgado."

	para "¿Quieres"
	line "intentarlo?"
	done

Route35NationalParkGateOfficer1GiveParkBallsText:
	text "Aquí tienes las"
	line "Park Balls para el"
	cont "Concurso."
	done

Route35NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> obtuvo"
	line "{d:BUG_CONTEST_BALLS} Park Balls."
	done

Route35NationalParkGateOfficer1ExplainsRulesText:
	text "Quien atrape el"
	line "#mon bicho más"
	cont "fuerte, gana."

	para "Tienes {d:BUG_CONTEST_MINUTES}"
	line "minutos."

	para "Si te quedas sin"
	line "Park Balls, se"
	cont "acaba."

	para "Puedes quedarte"
	line "con el último"
	cont "#mon que"
	cont "atrapes."

	para "¡Sal y atrapa el"
	line "#mon bicho más"

	para "fuerte que"
	line "encuentres!"
	done

Route35NationalParkGateOfficer1AskToUseFirstMonText:
	text "Vaya…"

	para "Tienes más de un"
	line "#mon."

	para "Tendrás que usar"
	line "a "
	text_ram wStringBuffer3
	text ", el"

	para "primer #mon de"
	line "tu equipo."

	para "¿Te parece bien?"
	done

Route35NationalParkGateOfficer1WellHoldYourMonText:
	text "Vale, guardaremos"
	line "tus otros #mon"
	cont "mientras compites."
	done

Route35NationalParkGatePlayersMonLeftWithHelperText:
	text "Los #mon de"
	line "<PLAYER> se"
	cont "quedaron con el"
	cont "Ayudante del"
	cont "Concurso."
	done

Route35NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Elige el #mon"
	line "que vas a usar en"

	para "el Concurso, y"
	line "luego ven a"
	cont "verme."
	done

Route35NationalParkGateOfficer1TakePartInFutureText:
	text "Vale. Esperamos"
	line "que participes en"
	cont "el futuro."
	done

Route35NationalParkGateOfficer1FirstMonCantBattleText:
	text "Vaya…"
	line "El primer #mon"

	para "de tu equipo no"
	line "puede combatir."

	para "Cámbialo por el"
	line "#mon que"
	cont "quieras usar, y"

	para "luego ven a"
	line "verme."
	done

Route35NationalParkGateOfficer1MakeRoomText:
	text "Vaya…"
	line "Tanto tu equipo"

	para "como tu Caja PC"
	line "están llenos."

	para "No tienes hueco"
	line "para el #mon"
	cont "bicho que"
	cont "atrapes."

	para "Haz hueco en tu"
	line "equipo o en tu"

	para "Caja PC, y luego"
	line "ven a verme."
	done

Route35NationalParkGateOfficer1EggAsFirstMonText:
	text "Vaya…"
	line "Tienes un Huevo"

	para "como primer"
	line "#mon de tu"
	cont "equipo."

	para "Cámbialo por el"
	line "#mon que"
	cont "quieras usar, y"

	para "luego ven a"
	line "verme."
	done

Route35NationalParkGateOfficer1WantToFinishText:
	text "Aún te quedan "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line "minutos."

	para "¿Quieres terminar"
	line "ahora?"
	done

Route35NationalParkGateOfficer1WaitAtNorthGateText:
	text "Vale. Espera en la"
	line "Puerta Norte para"

	para "el anuncio de los"
	line "ganadores."
	done

Route35NationalParkGateOfficer1OkGoFinishText:
	text "Vale. Vuelve"
	line "afuera y termina,"
	cont "por favor."
	done

Route35NationalParkGateOfficer1ContestIsOverText:
	text "El Concurso de hoy"
	line "terminó."
	cont "Esperamos que"
	cont "participes en el"
	cont "futuro."
	done

Route35NationalParkGateYoungsterText:
	text "¿Cuándo será el"
	line "próximo Concurso"
	cont "de Captura de"
	cont "Bichos?"
	done

BugCatchingContestExplanationText:
	text "El Concurso de"
	line "Captura de Bichos"
	cont "se celebra los"

	para "martes, jueves y"
	line "sábados."

	para "No solo ganas un"
	line "premio por"

	para "participar,"
	line "también puedes"

	para "quedarte con el"
	line "#mon bicho que"

	para "tengas al final"
	line "del concurso."
	done

Route35NationalParkGatePokefanFText:
	text "Muchos #mon"
	line "vienen al Parque"

	para "Nacional con sus"
	line "entrenadores,"

	para "¡Y todos son tan,"
	line "tan monos!"

	para "¡Sí, los #mon"
	line "bicho también!"
	done

Text_Route35NationalParkGateTutorCharm:
	text "Puedo hacer que tu"
	line "#mon sea más"
	cont "mono con el"
	cont "movimiento"
	cont "Encanto."

	para "¡Ni los #mon"
	line "rivales querrán"

	para "golpearlo tan"
	line "fuerte después!"
	done

Text_Route35NationalParkGateTutorQuestion:
	text "Solo necesito una"
	line "Hoja Plateada,"

	para "¿puedo enseñar"
	line "Encanto? ¿Porfa?"
	done
