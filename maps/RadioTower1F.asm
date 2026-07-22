RadioTower1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 11
	warp_event  3,  7, GOLDENROD_CITY, 11
	warp_event 15,  0, RADIO_TOWER_2F, 2

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, RadioTower1FDirectoryText
	bg_event 13,  0, BGEVENT_JUMPTEXT, RadioTower1FLuckyChannelSignText

	def_object_events
	object_event  8,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLuckyNumberManScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 14,  6, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FWhitneyScript, EVENT_GOLDENROD_GYM_WHITNEY
	object_event  5,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FReceptionistScript, -1
	object_event 17,  5, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower1FLassText, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower1FYoungsterText, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  6, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower1FRadioCardWomanScript, EVENT_GOLDENROD_CITY_CIVILIANS

	object_const_def
	const RADIOTOWER1F_FELICITY
	const RADIOTOWER1F_WHITNEY

RadioTower1FReceptionistScript:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower1FReceptionistNoToursText
	jumpthistextfaceplayer

	text "¡Bienvenido!"
	done

RadioTower1FLuckyNumberManScript:
	faceplayer
	opentext
	writetext RadioTower1FLuckyNumberManAskToPlayText
	waitbutton
	checkevent EVENT_INTRODUCED_FELICITY
	iftruefwd .introduced
	writetext IntroduceFelicityText
	waitbutton
	setevent EVENT_INTRODUCED_FELICITY
.introduced
	writetext ExplainLuckyNumberShowText
	promptbutton
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftruefwd .skip
	special Special_ResetLuckyNumberShowFlag
.skip
	special Special_PrintTodaysLuckyNumber
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue_jumpopenedtext RadioTower1FLuckyNumberManComeAgainText
	writetext RadioTower1FLuckyNumberManTodayIdIsText
	promptbutton
	closetext
	applymovement RADIOTOWER1F_FELICITY, RadioTower1FLuckyNumberManGoToPCMovement
	opentext
	writetext RadioTower1FLuckyNumberManCheckIfMatchText
	promptbutton
	waitsfx
	writetext RadioTower1FLuckyNumberManDotDotDotText
	playsound SFX_DEX_FANFARE_20_49
	special Special_CheckForLuckyNumberWinners
	closetext
	applymovement RADIOTOWER1F_FELICITY, RadioTower1FLuckyNumberManReturnToPlayerMovement
	opentext
	ifequalfwd 5, .FirstPlace
	ifequalfwd 4, .SecondPlace
	ifequalfwd 3, .ThirdPlace
	ifequalfwd 2, .FourthPlace
	ifequalfwd 1, .FifthPlace
	jumpthisopenedtext

	text "No, ninguno de tus"
	line "números de ID"
	cont "coincide."
	done

.FirstPlace:
	giveitem MASTER_BALL
	writetext WonFirstPlaceText
	special ShowItemIcon
	playsound SFX_1ST_PLACE
	sjumpfwd .Finish

.SecondPlace:
	giveitem BOTTLE_CAP
	writetext WonSecondPlaceText
	special ShowItemIcon
	playsound SFX_2ND_PLACE
	sjumpfwd .Finish

.ThirdPlace:
	giveitem PP_MAX
	writetext WonThirdPlaceText
	special ShowItemIcon
	playsound SFX_2ND_PLACE
	sjumpfwd .Finish

.FourthPlace:
	giveitem PP_UP
	writetext WonFourthPlaceText
	special ShowItemIcon
	playsound SFX_3RD_PLACE
	sjumpfwd .Finish

.FifthPlace:
	giveitem RARE_CANDY
	writetext WonFifthPlaceText
	special ShowItemIcon
	playsound SFX_3RD_PLACE
.Finish:
	waitsfx
	promptbutton
	iffalse_jumpopenedtext RadioTower1FLuckyNumberManNoRoomForYourPrizeText
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	jumpthisopenedtext

RadioTower1FLuckyNumberManComeAgainText:
	text "Vuelve mañana"
	line "para el próximo"
	cont "Número de la"
	cont "Suerte."
	done

RadioTower1FRadioCardWomanScript:
	checkevent EVENT_GOLDENROD_GYM_WHITNEY
	iftrue_jumptextfaceplayer RadioTower1FRadioCardWomanTuneInText
	faceplayer
	opentext
	writetext RadioTower1FRadioCardWomanOfferQuizText
	yesorno
	iffalse_jumpopenedtext RadioTower1FRadioCardWomanNotTakingQuizText
	writetext RadioTower1FRadioCardWomanQuestion1Text
	yesorno
	iffalsefwd .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion2Text
	yesorno
	iffalsefwd .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion3Text
	yesorno
	iftruefwd .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion4Text
	yesorno
	iftruefwd .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion5Text
	yesorno
	iftruefwd .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanYouWinText
	promptbutton
	givespecialitem RADIO_CARD
	writetext RadioTower1FPokegearIsARadioText
	promptbutton
	setflag ENGINE_RADIO_CARD
	writetext RadioTower1FRadioCardWomanTuneInText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, RADIOTOWER1F_WHITNEY, 15
	applymovement RADIOTOWER1F_WHITNEY, RadioTower1FWhitneyApproachesMovementData
	turnobject PLAYER, RIGHT
	showtext RadioTower1FWhitney2Text
	applymovement RADIOTOWER1F_WHITNEY, RadioTower1FWhitneyLeaves1MovementData
	turnobject PLAYER, LEFT
	applymovement RADIOTOWER1F_WHITNEY, RadioTower1FWhitneyLeaves2MovementData
	disappear RADIOTOWER1F_WHITNEY
	end

.WrongAnswer:
	playsound SFX_WRONG
	jumpthisopenedtext

	text "Ay, madre."
	line "Lo siento, pero"

	para "te has"
	line "equivocado."
	cont "¡Vuelve a"
	cont "intentarlo!"
	done

GenericTrainerGruntM3:
	generictrainer GRUNTM, 3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText

	text "Eres demasiado"
	line "fuerte."

	para "Nuestro plan"
	line "podría"
	cont "arruinarse. Debo"
	cont "avisar a los"
	cont "demás…"
	done

RadioTower1FWhitneyScript:
	showtextfaceplayer RadioTower1FWhitney1Text
	turnobject RADIOTOWER1F_WHITNEY, LEFT
	end

RadioTower1FLuckyNumberManGoToPCMovement:
	step_right
	turn_head_up
	step_end

RadioTower1FLuckyNumberManReturnToPlayerMovement:
	step_left
	turn_head_up
	step_end

RadioTower1FWhitneyApproachesMovementData:
	step_up
	step_up
	step_left
	step_end

RadioTower1FWhitneyLeaves1MovementData:
	step_up
	step_left
	step_left
	step_end

RadioTower1FWhitneyLeaves2MovementData:
	step_left
	step_left
	step_left
	step_left
	step_end


RadioTower1FReceptionistNoToursText:
	text "Hola. Lo siento,"
	line "pero hoy no"
	cont "ofrecemos"
	cont "visitas."
	done

RadioTower1FLuckyNumberManAskToPlayText:
	text "Hola, ¿vienes por"
	line "el Show del"
	cont "Número de la"
	cont "Suerte?"
	done

IntroduceFelicityText:
	text "Soy Felicity, tu"
	line "encargada de hoy."
	done

ExplainLuckyNumberShowText:
	text "¿Quieres que"
	line "revise los"
	cont "números de ID de"
	cont "tus #mon?"

	para "Si tienes suerte,"
	line "ganas un premio."
	done

RadioTower1FLuckyNumberManTodayIdIsText:
	text "El número de ID"
	line "de la suerte de"
	cont "hoy es "
	text_ram wStringBuffer3
	text "."
	done

RadioTower1FLuckyNumberManCheckIfMatchText:
	text "Vamos a ver si"
	line "tienes suerte."
	done

RadioTower1FLuckyNumberManDotDotDotText: ; text > text
	text "……"
	line "……"
	done

WonFirstPlaceText:
	text "¡Vaya! ¡Tienes"
	line "una coincidencia"
	cont "perfecta de los"
	cont "cinco números!"

	para "¡Tenemos un"
	line "ganador del gran"
	cont "premio!"

	para "¡Has ganado una"
	line "Master Ball!"
	done

WonSecondPlaceText:
	text "¡Oye! ¡Has"
	line "acertado los"
	cont "últimos cuatro"
	cont "números!"

	para "¡Ganaste el"
	line "segundo premio,"
	cont "una rara Chapa"
	cont "Plateada!"
	done

WonThirdPlaceText:
	text "¡Oye! ¡Has"
	line "acertado los"
	cont "últimos tres"
	cont "números!"

	para "¡Ganaste el"
	line "tercer premio,"
	cont "un PP Max!"
	done

WonFourthPlaceText:
	text "Vaya, has"
	line "acertado los"
	cont "últimos dos"
	cont "números."

	para "Ganaste el"
	line "cuarto premio,"
	cont "un PP Más."
	done

WonFifthPlaceText:
	text "Vaya, has"
	line "acertado el"
	cont "último número."

	para "Ganaste el quinto"
	line "premio, un"
	cont "Caramelo Raro."
	done


RadioTower1FLuckyNumberManNoRoomForYourPrizeText:
	text "No te queda"
	line "espacio para tu"
	cont "premio."

	para "Haz hueco y vuelve"
	line "enseguida."
	done

RadioTower1FRadioCardWomanOfferQuizText:
	text "Tenemos una"
	line "campaña especial"
	cont "de preguntas"
	cont "ahora mismo."

	para "Responde bien"
	line "cinco preguntas"
	cont "para ganar una"
	cont "Tarjeta de Radio."

	para "Deslízala en tu"
	line "#gear para"

	para "escuchar la radio"
	line "en cualquier"
	cont "momento y lugar."

	para "¿Quieres hacer el"
	line "cuestionario?"
	done

RadioTower1FRadioCardWomanQuestion1Text:
	text "Pregunta 1:"

	para "¿Hay algún #mon"
	line "que aparece solo"
	cont "por la mañana?"
	done

RadioTower1FRadioCardWomanQuestion2Text:
	text "¡Correcto!"
	line "Pregunta 2:"

	para "Nidorina solo"
	line "puede ser"
	cont "hembra. ¿Verdad?"
	done

RadioTower1FRadioCardWomanQuestion3Text:
	text "¡En el blanco!"
	line "Pregunta 3:"

	para "¿Puede Magikarp"
	line "aprender algún"
	cont "movimiento por"
	cont "MT?"
	done

RadioTower1FRadioCardWomanQuestion4Text:
	text "¡Vas muy bien!"
	line "Pregunta 4:"

	para "¿Usa Kurt, el"
	line "creador de"
	cont "Balls, bonguris"

	para "como"
	line "ingredientes?"
	done

RadioTower1FRadioCardWomanQuestion5Text:
	text "¡Vaya! ¡Otra vez"
	line "acertaste! Aquí"
	cont "va la última"
	cont "pregunta:"

	para "¿Tienen las"
	line "tragaperras de la"

	para "Sala de Juegos de"
	line "Trigal un"
	cont "Charmander en sus"
	cont "carretes?"
	done

RadioTower1FRadioCardWomanYouWinText:
	text "¡Bingo!"
	line "¡Acertaste!"
	cont "¡Felicidades!"

	para "Aquí tienes tu"
	line "premio, ¡una"
	cont "Tarjeta de Radio!"
	done

RadioTower1FPokegearIsARadioText:
	text "¡El #gear de"
	line "<PLAYER> ahora"
	cont "también hace de"
	cont "radio!"
	done

RadioTower1FRadioCardWomanTuneInText:
	text "Sintoniza nuestros"
	line "programas de"
	cont "radio."
	done

RadioTower1FRadioCardWomanNotTakingQuizText:
	text "Ah. Ya veo. Ven a"
	line "verme si cambias"
	cont "de opinión."
	done

RadioTower1FLassText:
	text "Ben es un DJ"
	line "fabuloso."

	para "¡Su dulce voz me"
	line "hace derretir!"
	done

RadioTower1FYoungsterText:
	text "Me encanta Mary,"
	line "de #mon Talk."

	para "Aunque solo sé"
	line "cómo suena su"
	cont "voz."
	done

GruntM3SeenText:
	text "¡Por fin hemos"
	line "tomado la Torre"
	cont "de Radio!"

	para "¡Ahora todos"
	line "podrán vivir el"

	para "verdadero terror"
	line "del Team Rocket!"

	para "¡Te mostraremos lo"
	line "aterradores que"
	cont "somos!"
	done

GruntM3BeatenText:
	text "¡Muy fuerte!"
	line "Debemos"
	cont "vigilarte…"
	done

RadioTower1FWhitney1Text:
	text "¡Hola! ¡Soy"
	line "Blanca!"

	para "Oí sobre el"
	line "cuestionario para"
	cont "ganar una Tarjeta"
	cont "de Radio,"

	para "así que vine a por"
	line "una…"

	para "¡Pero este"
	line "cuestionario es"
	cont "muy difícil!"
	done

RadioTower1FWhitney2Text:
	text "Blanca: Vaya,"
	line "¡lo lograste!"

	para "Pensé que la"
	line "cuarta respuesta"
	cont "era bonguris…"

	para "¡Uy! ¡Debería"
	line "volver al"
	cont "Gimnasio!"
	done

RadioTower1FDirectoryText:
	text "1F Recepción"
	line "2F Ventas"

	para "3F Personal"
	line "4F Producción"

	para "5F Despacho del"
	line "   Director"
	done

RadioTower1FLuckyChannelSignText:
	text "¡Canal de la"
	line "Suerte!"

	para "¡Gana con números"
	line "de ID #mon!"

	para "¡Intercambia tus"
	line "#mon para tener"
	cont "distintos números"
	cont "de ID!"
	done
