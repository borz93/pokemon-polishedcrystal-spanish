KurtsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, KurtsHouseKurtCallback

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 4
	warp_event  4,  7, AZALEA_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_JUMPSTD, radio2
	bg_event  8,  0, BGEVENT_JUMPTEXT, KurtsHouseOakPhotoText
	bg_event  9,  0, BGEVENT_JUMPTEXT, KurtsHouseOakPhotoText
	bg_event  5,  1, BGEVENT_READ, PokemonJournalProfWestwoodScript
	bg_event  2,  1, BGEVENT_READ, PokemonJournalProfWestwoodScript
	bg_event  3,  1, BGEVENT_READ, PokemonJournalProfWestwoodScript
	bg_event  4,  1, BGEVENT_JUMPTEXT, KurtsHouseCelebiStatueText

	def_object_events
	object_event  3,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt1, EVENT_KURTS_HOUSE_KURT_1
	object_event  5,  3, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsGranddaughter1, EVENT_KURTS_HOUSE_GRANDDAUGHTER_1
	object_event 14,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt2, EVENT_KURTS_HOUSE_KURT_2
	object_event 11,  4, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsGranddaughter2, EVENT_KURTS_HOUSE_GRANDDAUGHTER_2
	pokemon_event  6,  3, SLOWPOKE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, KurtsHouseSlowpokeText, EVENT_KURTS_HOUSE_SLOWPOKE

	object_const_def
	const KURTSHOUSE_KURT1
	const KURTSHOUSE_TWIN1
	const KURTSHOUSE_KURT2
	const KURTSHOUSE_TWIN2

KurtsHouseKurtCallback:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iffalsefwd .Done
	checkevent EVENT_FOREST_IS_RESTLESS
	iftruefwd .Done
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd .MakingBalls
	disappear KURTSHOUSE_KURT2
	appear KURTSHOUSE_KURT1
	disappear KURTSHOUSE_TWIN2
	appear KURTSHOUSE_TWIN1
	endcallback

.MakingBalls:
	disappear KURTSHOUSE_KURT1
	appear KURTSHOUSE_KURT2
	disappear KURTSHOUSE_TWIN1
	appear KURTSHOUSE_TWIN2
.Done:
	endcallback

Kurt1:
	faceplayer
	opentext
	checkevent EVENT_KURT_GAVE_YOU_APRICORN_BOX
	iftruefwd .GotApricornBox
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftruefwd .ClearedSlowpokeWell
	writetext KurtsHouseKurtMakingBallsMustWaitText
	waitbutton
	closetext
	special Special_FadeOutMusic
	setevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	readvar VAR_FACING
	ifequalfwd UP, .RunAround
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtExitHouseMovement
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.RunAround:
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtGoAroundPlayerThenExitHouseMovement
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.ClearedSlowpokeWell:
	writetext KurtsHouseKurtHonoredToMakeBallsText
	promptbutton
	verbosegivekeyitem APRICORN_BOX
	setevent EVENT_KURT_GAVE_YOU_APRICORN_BOX
.GotApricornBox:
	checkevent EVENT_GAVE_KURT_RED_APRICORN
	iftruefwd .GiveLevelBall
	checkevent EVENT_GAVE_KURT_BLU_APRICORN
	iftruefwd .GiveLureBall
	checkevent EVENT_GAVE_KURT_YLW_APRICORN
	iftruefwd .GiveMoonBall
	checkevent EVENT_GAVE_KURT_GRN_APRICORN
	iftruefwd .GiveFriendBall
	checkevent EVENT_GAVE_KURT_WHT_APRICORN
	iftrue .GiveFastBall
	checkevent EVENT_GAVE_KURT_BLK_APRICORN
	iftrue .GiveHeavyBall
	checkevent EVENT_GAVE_KURT_PNK_APRICORN
	iftrue .GiveLoveBall
	checkevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	iftrue .CanGiveGSBallToKurt
.NoGSBall:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftruefwd .CheckApricorns
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftruefwd .CheckApricorns
	writetext KurtsHouseKurtBallsFromApricornsText
	waitbutton
.CheckApricorns:
	callasm .CheckHaveAnyApricorns
	iftruefwd .AskApricorn
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue_jumpopenedtext KurtsHouseKurtTurnedOutGreatText
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue_jumpopenedtext KurtsHouseKurtBallsFromApricornsText
	endtext

.CheckHaveAnyApricorns:
	xor a
	ld hl, wApricorns
	or [hl]
rept NUM_APRICORNS - 1
	inc hl
	or [hl]
endr
	ldh [hScriptVar], a
	ret

.AskApricorn:
	writetext KurtsHouseKurtAskYouHaveAnApricornText
	promptbutton
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	special Special_SelectApricornForKurt
	iffalse_jumpopenedtext KurtsHouseKurtThatsALetdownText
	ifequalfwd BLU_APRICORN, .Blu
	ifequalfwd YLW_APRICORN, .Ylw
	ifequalfwd GRN_APRICORN, .Grn
	ifequalfwd WHT_APRICORN, .Wht
	ifequalfwd BLK_APRICORN, .Blk
	ifequalfwd PNK_APRICORN, .Pnk
; .Red
	setevent EVENT_GAVE_KURT_RED_APRICORN
	sjumpfwd .GaveKurtApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	sjumpfwd .GaveKurtApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	sjumpfwd .GaveKurtApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	sjumpfwd .GaveKurtApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	sjumpfwd .GaveKurtApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	sjumpfwd .GaveKurtApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
.GaveKurtApricorns:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	writetext KurtsHouseKurtGetStartedText
	waitbutton
	closetext
	follow KURTSHOUSE_KURT1, PLAYER
	applymovement KURTSHOUSE_KURT1, KurtsHouseFollowKurt_MovementData
	stopfollow
	pause 15
	turnobject KURTSHOUSE_KURT1, DOWN
	showtext KurtsHouseKurtItWillTakeADayText
	applymovement PLAYER, KurtsHouseStepAwayFromKurt_MovementData
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	pause 35
	warpfacing UP, KURTS_HOUSE, 3, 3
	sjump Kurt1

.ThatTurnedOutGreat:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	jumpopenedtext KurtsHouseKurtTurnedOutGreatText

.GiveLevelBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LEVEL_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	sjump .ThatTurnedOutGreat

.GiveLureBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LURE_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump .ThatTurnedOutGreat

.GiveMoonBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar MOON_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump .ThatTurnedOutGreat

.GiveFriendBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar FRIEND_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump .ThatTurnedOutGreat

.GiveFastBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar FAST_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump .ThatTurnedOutGreat

.GiveHeavyBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar HEAVY_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump .ThatTurnedOutGreat

.GiveLoveBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LOVE_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump .ThatTurnedOutGreat

.CanGiveGSBallToKurt:
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftruefwd .GaveGSBallToKurt
	checkkeyitem GS_BALL
	iffalse .NoGSBall
	writetext KurtsHouseKurtWhatIsThatText
	waitbutton
	closetext
	setevent EVENT_GAVE_GS_BALL_TO_KURT
	takekeyitem GS_BALL
	setflag ENGINE_KURT_MAKING_BALLS
	end

.GaveGSBallToKurt:
	checkflag ENGINE_KURT_MAKING_BALLS
	iffalsefwd .NotMakingBalls
	writetext KurtsHouseKurtImCheckingItNowText
	waitbutton
	jumpopenedtext KurtsHouseKurtAhHaISeeText

.NotMakingBalls:
	writetext KurtsHouseKurtThisBallStartedToShakeText
	waitbutton
	closetext
	setevent EVENT_FOREST_IS_RESTLESS
	clearevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	clearevent EVENT_GAVE_GS_BALL_TO_KURT
	special Special_FadeOutMusic
	pause 20
	showemote EMOTE_SHOCK, KURTSHOUSE_KURT1, 30
	readvar VAR_FACING
	ifequalfwd UP, .GSBallRunAround
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtExitHouseMovement
	sjumpfwd .KurtHasLeftTheBuilding

.GSBallRunAround:
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtGoAroundPlayerThenExitHouseMovement
.KurtHasLeftTheBuilding:
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	clearevent EVENT_AZALEA_TOWN_KURT
	waitsfx
	special RestartMapMusic
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_CELEBI_EVENT
	end

Kurt2:
	faceplayer
	opentext
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftruefwd KurtScript_ImCheckingItNow
KurtMakingBallsScript:
	checkevent EVENT_BUGGING_KURT_TOO_MUCH
	iffalsefwd Script_FirstTimeBuggingKurt
	writetext KurtsHouseKurtDontBotherMeText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

Script_FirstTimeBuggingKurt:
	writetext KurtsHouseKurtGranddaughterHelpingWorkFasterText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	setevent EVENT_BUGGING_KURT_TOO_MUCH
	end

KurtScript_ImCheckingItNow:
	writetext KurtsHouseKurtImCheckingItNowText
	waitbutton
	turnobject LAST_TALKED, UP
	jumpopenedtext KurtsHouseKurtAhHaISeeText

KurtsGranddaughter1:
	faceplayer
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd KurtsGranddaughter2Subscript
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue_jumptext KurtsGranddaughterFunText
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue_jumptext KurtsGranddaughterLonelyText
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue_jumptext KurtsGranddaughterDadText
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue_jumptext KurtsGranddaughterSlowpokeBackText
	checkevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	iftrue_jumptext KurtsGranddaughterLonelyText
	jumpthistext

	text "Los Slowpoke se"
	line "fueron… ¿Se los"

	para "llevó gente"
	line "mala?"
	done

KurtsGranddaughter2:
	faceplayer
KurtsGranddaughter2Subscript:
	opentext
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftruefwd .GSBall
	writetext KurtsGranddaughterHelpText
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end

.GSBall:
	writetext KurtsGranddaughterGSBallText
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end

PokemonJournalProfWestwoodScript:
	setflag ENGINE_READ_PROF_WESTWOOD_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial:"
	cont "¡Prof.Westwood!"

	para "El Prof.Westwood V"
	line "enseña en la"
	cont "Universidad"
	cont "Azulona."

	para "La investigación"
	line "de su ancestro en"
	cont "1925 llevó al"

	para "desarrollo de las"
	line "# Balls"
	cont "modernas."
	done

KurtsHouseKurtGoAroundPlayerThenExitHouseMovement:
	big_step_right
KurtsHouseKurtExitHouseMovement:
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end

KurtsHouseFollowKurt_MovementData:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_up
	step_up
	step_end

KurtsHouseStepAwayFromKurt_MovementData:
	step_down
	step_left
	step_left
	step_end

KurtsHouseKurtMakingBallsMustWaitText:
	text "¿Eh? ¿Quién eres?"

	para "¿<PLAYER>, no?"
	line "¿Quieres que"
	cont "haga Balls?"

	para "Lo siento, pero"
	line "eso tendrá que"
	cont "esperar."

	para "¿Conoces al Team"
	line "Rocket? Ah, no te"

	para "preocupes. Te lo"
	line "diré igual."

	para "El Team Rocket es"
	line "una banda malvada"

	para "que usa #mon"
	line "para su trabajo"
	cont "sucio."

	para "Se suponía que"
	line "se habían"
	cont "disuelto hace"
	cont "tres años."

	para "En fin, están en"
	line "el pozo, cortando"

	para "¡colas de"
	line "Slowpoke para"
	cont "venderlas!"

	para "¡Así que voy a"
	line "darles una"
	cont "lección de dolor!"

	para "¡Aguanta,"
	line "Slowpoke! ¡El"
	cont "viejo Kurt va en"
	cont "camino!"
	done

KurtsHouseKurtHonoredToMakeBallsText:
	text "Kurt: ¡Hola,"
	line "<PLAYER>!"

	para "Te comportaste"
	line "como un héroe"
	cont "de verdad en el"
	cont "pozo."

	para "¡Me gusta tu"
	line "estilo!"

	para "Sería un honor"
	line "hacer Balls para"

	para "un entrenador"
	line "como tú."

	para "Pero antes,"
	line "necesitarás"
	cont "bonguris."

	para "¡Toma, ten esta"
	line "Caja Bonguri!"
	done

KurtsHouseKurtBallsFromApricornsText:
	text "Kurt: Hago Balls"
	line "con bonguris."

	para "Recógelos de los"
	line "árboles y"
	cont "tráemelos."

	para "Haré Balls con"
	line "ellos."
	done

KurtsHouseKurtAskYouHaveAnApricornText:
	text "Kurt: ¿Tienes un"
	line "Bonguri para mí?"

	para "¡Bien! Lo"
	line "convertiré en"
	cont "una Ball."
	done

KurtsHouseKurtGetStartedText:
	text "Kurt: ¡Empezaré"
	line "ahora mismo!"
	done

KurtsHouseKurtItWillTakeADayText:
	text "Kurt: Tardaré un"
	line "poco en hacerte"

	para "una Ball. Vuelve"
	line "más tarde por"
	cont "ella."
	done

KurtsHouseKurtThatsALetdownText:
	text "Kurt: Oh…"
	line "Qué decepción."
	done

KurtsHouseKurtDontBotherMeText:
	text "Kurt: ¡Estoy"
	line "trabajando! ¡No"
	cont "molestes!"
	done

KurtsHouseKurtJustFinishedYourBallText:
	text "Kurt: ¡Ah,"
	line "<PLAYER>! Acabo"
	cont "de terminar tu"
	cont "Ball. ¡Toma!"
	done

KurtsHouseKurtTurnedOutGreatText:
	text "Kurt: Quedó"
	line "genial."

	para "Prueba a atrapar"
	line "#mon con ella."
	done

KurtsHouseKurtGranddaughterHelpingWorkFasterText:
	text "Kurt: Ahora que"
	line "mi nieta me está"

	para "ayudando, puedo"
	line "trabajar más"
	cont "rápido."
	done

KurtsHouseKurtWhatIsThatText:
	text "¿Q-qué es eso?"

	para "Nunca había visto"
	line "algo así."

	para "Se parece mucho"
	line "a una # Ball,"

	para "pero parece ser"
	line "otra cosa."

	para "Déjame revisarla"
	line "por ti."
	done

KurtsHouseKurtImCheckingItNowText:
	text "La estoy"
	line "revisando ahora."
	done

KurtsHouseKurtAhHaISeeText:
	text "¡Ajá! ¡Ya veo!"
	line "Así que…"
	done

KurtsHouseKurtThisBallStartedToShakeText:
	text "¡<PLAYER>!"

	para "Esta Ball empezó"
	line "a temblar"
	cont "mientras la"
	cont "revisaba."

	para "¡Debe haber algo"
	line "en ella!"
	done


KurtsGranddaughterLonelyText:
	text "El abuelo se fue…"
	line "Estoy tan sola…"
	done

KurtsGranddaughterSlowpokeBackText:
	text "¡El Slowpoke que"
	line "me dio papá"
	cont "volvió!"

	para "¡Su cola también"
	line "está creciendo"
	cont "de nuevo!"
	done

KurtsGranddaughterDadText:
	text "Papá trabaja en"
	line "Silph, donde"
	cont "estudia # Balls."

	para "Debo quedarme en"
	line "casa con el"
	cont "abuelo y"
	cont "Slowpoke."
	done

KurtsGranddaughterHelpText:
	text "¡Ahora puedo"
	line "ayudar al"
	cont "abuelo!"

	para "¡Haremos buenas"
	line "Balls para ti,"
	cont "así que espera!"
	done

KurtsGranddaughterFunText:
	text "¡Es divertido"
	line "hacer Balls!"
	done

KurtsGranddaughterGSBallText:
	text "El abuelo está"
	line "revisando una"
	cont "Ball ahora."

	para "Así que espero"
	line "a que termine."
	done

KurtsHouseSlowpokeText:
	text "Slowpoke: …"
	line "¿Bostezo?"
	done

KurtsHouseOakPhotoText:
	text "…¿Un joven Prof."
	line "Oak?"
	done

KurtsHouseCelebiStatueText:
	text "Es una estatua"
	line "del protector"
	cont "del bosque."
	done
