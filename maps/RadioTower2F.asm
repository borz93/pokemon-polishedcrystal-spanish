DEF BLUE_CARD_POINT_CAP EQU 30

RadioTower2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, RadioTower2FSalesSignText
	bg_event  5,  0, BGEVENT_JUMPTEXT, RadioTower2FOaksPKMNTalkSignText
	bg_event 13,  0, BGEVENT_JUMPTEXT, RadioTower2FPokemonRadioSignText

	def_object_events
	object_event 14,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Buena, -1
	object_event  6,  6, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FSuperNerdText, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower2FTeacherScript, -1
	object_event  1,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  7,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGruntM6, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FBlackBelt1Text, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FBlackBelt2Text, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	pokemon_event 12,  1, JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, RadioTowerJigglypuffText, -1
	object_event 12,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  3,  6, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FRockerText, EVENT_GOLDENROD_CITY_CIVILIANS

	object_const_def
	const RADIOTOWER2F_BUENA

RadioTower2FTeacherScript:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower2FTeacherText_Rockets
	jumpthistextfaceplayer

	text "Las nanas de la"
	line "radio duermen"
	cont "a los #mon."
	done

GenericTrainerGruntM4:
	generictrainer GRUNTM, 4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText

	text "¡No dejaremos que"
	line "arruines nuestros"
	cont "planes de retorno!"
	done

GenericTrainerGruntM5:
	generictrainer GRUNTM, 5, EVENT_BEAT_ROCKET_GRUNTM_5, GruntM5SeenText, GruntM5BeatenText

	text "No siempre somos"
	line "malvados. Solo"
	cont "hacemos lo que"
	cont "queremos."
	done

GenericTrainerGruntM6:
	generictrainer GRUNTM, 6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText

	text "Nuestros líderes"
	line "quieren tomar"
	cont "este lugar."

	para "Tienen un gran"
	line "plan. Me pregunto"
	cont "qué será."
	done

GenericTrainerGruntF2:
	generictrainer GRUNTF, 2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText

	text "Me has vencido, ¡y"
	line "no lo olvidaré!"
	done

Buena:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower2FBuenaPasswordIsHelpText
	faceplayer
	opentext
	checkevent EVENT_MET_BUENA
	iffalsefwd .Introduction
	checkflag ENGINE_BUENAS_PASSWORD_2
	iftruefwd .PlayedAlready
	readvar VAR_HOUR
	ifless EVE_HOUR, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalsefwd .TuneIn
	checkkeyitem BLUE_CARD
	iffalsefwd .NoBlueCard
	readvar VAR_BLUECARDBALANCE
	ifequalfwd BLUE_CARD_POINT_CAP, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext RadioTower2FBuenaDoYouKnowPasswordText
	special AskRememberPassword
	iffalsefwd .ForgotPassword
	writetext RadioTower2FBuenaJoinTheShowText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, RadioTower2FPlayerWalksToMicrophoneMovement
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	showtext RadioTower2FBuenaEveryoneSayPasswordText
	turnobject RADIOTOWER2F_BUENA, DOWN
	reanchormap
	special SpecialBuenasPassword
	closetext
	iffalsefwd .WrongAnswer
	showtext RadioTower2FBuenaCorrectAnswerText
	readvar VAR_BLUECARDBALANCE
	addval $1
	writevar VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	showtext RadioTower2FBuenaThanksForComingText
	special Special_FadeOutMusic
	pause 20
	special RestartMapMusic
	readvar VAR_BLUECARDBALANCE
	ifequalfwd BLUE_CARD_POINT_CAP, .BlueCardCapped1
	end

.Introduction:
	writetext RadioTower2FBuenaShowIntroductionText
	promptbutton
	setevent EVENT_MET_BUENA
	verbosegivekeyitem BLUE_CARD
.TuneIn:
	writetext RadioTower2FBuenaTuneInToMyShowText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered0
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftruefwd .OfferedNumberBefore
.Registered0:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.ForgotPassword:
	writetext RadioTower2FBuenaComeBackAfterListeningText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special Special_FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext RadioTower2FBuenaAlreadyPlayedText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered1
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftruefwd .OfferedNumberBefore
.Registered1:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

.WrongAnswer:
	setflag ENGINE_BUENAS_PASSWORD_2
	showtext RadioTower2FBuenaDidYouForgetText
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	showtext RadioTower2FBuenaThanksForComingText
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special Special_FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.NoBlueCard:
	writetext RadioTower2FBuenaNoBlueCardText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered2
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftruefwd .OfferedNumberBefore
.Registered2:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.BlueCardCapped0:
	writetext RadioTower2FBuenaCardIsFullText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftruefwd .OfferedNumberBefore
.Registered3:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.TooEarly:
	writetext RadioTower2FBuenaTuneInAfterSixText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered4
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftruefwd .OfferedNumberBefore
.Registered4:
	end

.BlueCardCapped1:
	checkcellnum PHONE_BUENA
	iftruefwd .HasNumber
	pause 20
	turnobject RADIOTOWER2F_BUENA, DOWN
	pause 15
	turnobject PLAYER, UP
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftruefwd .OfferedNumberBefore
	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	opentext
	writetext RadioTower2FBuenaOfferPhoneNumberText
	sjumpfwd .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext RadioTower2FBuenaOfferNumberAgainText
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	writetext RadioTower2FRegisteredBuenasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
	writetext RadioTower2FBuenaCallMeText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext RadioTower2FBuenaSadRejectedText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext RadioTower2FBuenaYourPhoneIsFullText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
.HasNumber:
	end

RadioTowerBuenaPrizeReceptionist:
	checkkeyitem BLUE_CARD
	iffalse_jumptextfaceplayer RadioTower2FBuenaReceptionistNoCardText
	pokemart MARTTYPE_BLUECARD, 0

RadioTower2FPlayerWalksToMicrophoneMovement:
	slow_step_down
	slow_step_right
	step_end

RadioTower2FSuperNerdText:
	text "Puedes escuchar"
	line "la radio donde"
	cont "sea. ¡Sintoniza!"
	done

RadioTower2FRockerText:
	text "Tengo una"
	line "entrevista de"
	cont "radio para"

	para "promocionar mi"
	line "último tema."

	para "He tocado ante"
	line "grandes multi-"
	cont "tudes antes,"

	para "pero vaya que"
	line "estoy nervioso."
	done

RadioTower2FTeacherText_Rockets:
	text "¿Por qué querrían"
	line "tomar la Torre"
	cont "de Radio?"
	done

RadioTowerJigglypuffText:
	text "Jigglypuff:"
	line "Jiggly…"
	done

RadioTower2FBlackBelt1Text:
	text "Perdón. Solo"
	line "personal auto-"
	cont "rizado más allá."

	para "Antes no era"
	line "así."

	para "Algo anda mal"
	line "con el"
	cont "Director…"
	done

RadioTower2FBlackBelt2Text:
	text "Puedes mirar"
	line "donde quieras."

	para "El Director es"
	line "amable otra vez,"
	cont "como antes."
	done

GruntM4SeenText:
	text "Hace tres años,"
	line "el Team Rocket"
	cont "se disolvió."

	para "¡Pero nos estamos"
	line "volviendo a"
	cont "reunir aquí!"
	done

GruntM4BeatenText:
	text "¡Agh! No te hagas"
	line "el listo."
	done

GruntM5SeenText:
	text "¡Somos el Team"
	line "Rocket, explota-"
	cont "mos a los #mon!"

	para "¡Nos encanta ser"
	line "malos! ¿Damos"
	cont "miedo?"
	done

GruntM5BeatenText:
	text "¿Te crees un"
	line "héroe?"
	done

GruntM6SeenText:
	text "¡Eh, eh! ¡Fuera de"
	line "nuestro camino!"
	done

GruntM6BeatenText:
	text "Argh. Me rindo."
	done

GruntF2SeenText:
	text "¡Jajaja!"

	para "¡Qué aburrimiento!"
	line "¡Fue tan sencillo"

	para "apoderarse de este"
	line "lugar!"

	para "¡Venga,"
	line "entretenme!"
	done

GruntF2BeatenText:
	text "¿Q-quién eres?"
	done

RadioTower2FBuenaShowIntroductionText:
	text "Buena: ¡Hola!"
	line "¡Soy Buena!"

	para "¿Conoces el"
	line "programa de radio"
	cont "Contraseña?"

	para "Si me dices la"
	line "contraseña del"

	para "programa, ganas"
	line "puntos."

	para "Guarda esos"
	line "puntos y"

	para "cámbialos con esa"
	line "señorita de ahí"

	para "¡por premios"
	line "geniales!"

	para "¡Aquí tienes!"

	para "¡Es tu propia"
	line "tarjeta de"
	cont "puntos!"
	done

RadioTower2FBuenaTuneInToMyShowText:
	text "Buena: ¡Sintoniza"
	line "mi programa"
	cont "Contraseña!"
	done

RadioTower2FBuenaDoYouKnowPasswordText:
	text "Buena: ¡Hola!"
	line "¿Sintonizaste mi"
	cont "programa de radio?"

	para "¿Recuerdas la"
	line "contraseña de hoy?"
	done

RadioTower2FBuenaJoinTheShowText:
	text "Buena: ¡Vaya!"
	line "¡Gracias!"

	para "¿Cómo era tu"
	line "nombre?"

	para "…¡<PLAYER>, ya!"

	para "Vamos, <PLAYER>."
	line "Entra en el show."
	done

RadioTower2FBuenaEveryoneSayPasswordText:
	text "Buena: ¿Todos"
	line "listos?"

	para "¡Quiero oíros"
	line "gritar la"

	para "contraseña de hoy"
	line "para <PLAYER>!"
	done

RadioTower2FBuenaComeBackAfterListeningText:
	text "Buena: Vuelve"
	line "cuando escuches"

	para "mi programa, ¿Ok?"
	line "¡Hasta luego!"
	done

RadioTower2FBuenaAlreadyPlayedText:
	text "Buena: Perdón…"

	para "Solo tienes una"
	line "oportunidad al"
	cont "día."

	para "¡Vuelve mañana"
	line "para otro"
	cont "intento!"
	done

RadioTower2FBuenaCorrectAnswerText:
	text "Buena: ¡BIEN!"
	line "¡Es correcto!"

	para "¡Sí sintonizaste!"
	line "¡Qué feliz estoy!"

	para "¡Ganaste un"
	line "punto! ¡Felici-"
	cont "dades!"
	done

RadioTower2FBuenaDidYouForgetText:
	text "Buena: Ay…"
	line "No era eso…"

	para "¿Olvidaste la"
	line "contraseña?"
	done

RadioTower2FBuenaThanksForComingText:
	text "Buena: ¡Sí!"
	line "Nuestro"
	cont "concursante fue"

	para "<PLAYER>."
	line "¡Gracias por"
	cont "venir!"

	para "¡Espero que"
	line "todos los"
	cont "oyentes"

	para "también vengan!"
	line "¡Os espero!"
	done

RadioTower2FBuenaPasswordIsHelpText:
	text "Buena: ¿Eh?"
	line "¿La contraseña"
	cont "de hoy?"

	para "¡AYUDA, claro!"
	done

RadioTower2FBuenaCardIsFullText:
	text "Buena: Tu Tarjeta"
	line "Azul está llena."

	para "¡Cámbiala por un"
	line "premio genial!"
	done

RadioTower2FBuenaTuneInAfterSixText:
	text "Buena: ¡Sintoniza"
	line "Contraseña cada"

	assert EVE_HOUR == 12 + 5
	para "noche desde las"
	line "cinco hasta"
	cont "medianoche!"

	para "¡Sintoniza y"
	line "luego visítame!"
	done

RadioTower2FBuenaNoBlueCardText:
	text "Buena: ¿No"
	line "trajiste tu"
	cont "Tarjeta Azul?"

	para "No puedo darte"
	line "puntos si no"
	cont "la tienes."
	done

RadioTower2FBuenaOfferPhoneNumberText:
	text "Buena: ¡Oh! Tu"
	line "Tarjeta Azul llegó"

	para "a {d:BLUE_CARD_POINT_CAP} puntos hoy."
	line "¡Es increíble!"

	para "Mmm… No hay premio"
	line "por llegar a"
	cont "{d:BLUE_CARD_POINT_CAP} puntos, pero…"

	para "Vienes tan"
	line "seguido,"
	cont "<PLAYER>."

	para "¡Te haré una"
	line "oferta especial!"

	para "¿Quieres mi"
	line "número de"
	cont "teléfono?"
	done

RadioTower2FBuenaOfferNumberAgainText:
	text "Buena: <PLAYER>,"
	line "¿Quieres"
	cont "registrar mi"

	para "número de"
	line "teléfono?"
	done

RadioTower2FRegisteredBuenasNumberText:
	text "<PLAYER> registró"
	line "el número de"
	cont "Buena."
	done

RadioTower2FBuenaCallMeText:
	text "Buena: ¡Espero"
	line "tener noticias"
	cont "tuyas!"
	done

RadioTower2FBuenaSadRejectedText:
	text "Buena: Ay… Es un"
	line "premio especial…"
	done

RadioTower2FBuenaYourPhoneIsFullText:
	text "Buena: <PLAYER>,"
	line "tu lista de"
	cont "teléfonos"

	para "no tiene sitio"
	line "para mí…"
	done

RadioTower2FBuenaReceptionistNoCardText:
	text "No puedes cambiar"
	line "puntos sin tu"
	cont "Tarjeta Azul."

	para "¡No olvides tu"
	line "Tarjeta Azul!"
	done

RadioTower2FSalesSignText:
	text "2F Ventas"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "El #mon Talk"
	line "del Prof. Oak"

	para "¡El programa más"
	line "popular del aire!"
	done

RadioTower2FPokemonRadioSignText:
	text "En Cualquier Lugar"
	line "Radio #mon"
	done
