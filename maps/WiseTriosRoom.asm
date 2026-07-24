WiseTriosRoom_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_WISETRIOSROOM_SAGE_BLOCKS
	scene_const SCENE_WISETRIOSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, WiseTriosRoomCallback

	def_warp_events
	warp_event  7,  4, BELLCHIME_TRAIL, 1
	warp_event  7,  5, BELLCHIME_TRAIL, 2
	warp_event  1,  4, ECRUTEAK_HOUSE, 5

	def_coord_events
	coord_event  7,  4, SCENE_WISETRIOSROOM_SAGE_BLOCKS, WiseTriosRoom_CannotEnterTinTowerScript

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WiseTriosRoomSage1Text, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  6,  7, SPRITE_ELDER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WiseTriosRoomSage2Text, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  7,  5, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WiseTriosRoomSage3Text, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  4,  2, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerElderGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  4,  6, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerElderMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  6,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerElderKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2

	object_const_def
	const WISETRIOSROOM_ELDER1
	const WISETRIOSROOM_ELDER2
	const WISETRIOSROOM_ELDER3
	const WISETRIOSROOM_ELDER4
	const WISETRIOSROOM_ELDER5
	const WISETRIOSROOM_ELDER6

WiseTriosRoomCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftruefwd .NoWiseTrio
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftruefwd .WiseTrio2
	checkkeyitem CLEAR_BELL
	iftruefwd .WiseTrio2
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

.WiseTrio2:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

.NoWiseTrio:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

WiseTriosRoom_CannotEnterTinTowerScript:
	turnobject WISETRIOSROOM_ELDER3, UP
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, WISETRIOSROOM_ELDER3, 20
	follow PLAYER, WISETRIOSROOM_ELDER3
	applymovement PLAYER, WiseTriosRoomSageBlocksPlayerMovement
	stopfollow
	turnobject PLAYER, RIGHT
	showtext WiseTriosRoomSage3BlocksExitText
	applymovement WISETRIOSROOM_ELDER3, WiseTriosRoomSageReturnsMovement
	turnobject WISETRIOSROOM_ELDER3, LEFT
	end

TrainerElderGaku:
	trainer ELDER, GAKU, EVENT_BEAT_ELDER_GAKU, ElderGakuSeenText, ElderGakuBeatenText, 0, .Script, TRAINERPAL_GAKU

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Ah, ¿Así que eres"
	line "tú quien afirma"

	para "haber visto a"
	line "Suicune, Entei y"
	cont "Raikou mientras"
	cont "dormían?"

	para "¡Increíble!"

	para "Cuenta la leyenda"
	line "que no se les"
	cont "puede ver"
	cont "mientras duermen…"
	done

TrainerElderMasa:
	trainer ELDER, MASA, EVENT_BEAT_ELDER_MASA, ElderMasaSeenText, ElderMasaBeatenText, 0, .Script, TRAINERPAL_MASA

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "En el pasado,"
	line "había aquí dos"
	cont "torres de nueve"
	cont "niveles."

if DEF(FAITHFUL)
	para "La Torre de"
	line "Latón, que se"
	cont "decía que"
else
	para "La Torre Gong,"
	line "que se decía que"
endc

	para "despertaba a los"
	line "#mon, y la"
	cont "Torre Campana,"

	para "donde se decía que"
	line "los #mon"
	cont "descansaban."

	para "La vista desde lo"
	line "alto de las torres"

	para "debió de ser"
	line "magnífica."

	para "Por entonces, un"
	line "#mon inmenso,"

	para "color plateado,"
	line "se decía que hacía"

	para "su nido en lo alto"
if DEF(FAITHFUL)
	line "de la Torre de"
	cont "Latón."
else
	line "de la Torre Gong."
endc

	para "Sin embargo…"

	para "Hace unos 150"
	line "años, un rayo"

	para "golpeó una de las"
	line "torres."

	para "Quedó envuelta en"
	line "llamas que"
	cont "ardieron durante"
	cont "tres días."

	para "Un aguacero"
	line "repentino por fin"
	cont "apagó el fuego."

	para "Y así es como"
	line "surgió la Torre"
	cont "Quemada."
	done

TrainerElderKoji:
	trainer ELDER, KOJI, EVENT_BEAT_ELDER_KOJI, ElderKojiSeenText, ElderKojiBeatenText, 0, .Script, TRAINERPAL_KOJI

.Script:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue_jumptext SageKojiAfterBattleFinalText
	pause 10
	showemote EMOTE_SHOCK, WISETRIOSROOM_ELDER6, 20
	opentext
	writetext SageKojiAfterBattleQuestionText
	promptbutton
	writetext SageKojiAfterBattleSpeechText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_ELDER6, WiseTriosRoomSageAllowsPassageMovement
	turnobject WISETRIOSROOM_ELDER6, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	setscene SCENE_WISETRIOSROOM_NOOP
	end

WiseTriosRoomSageBlocksPlayerMovement:
	step_left
	step_left
	step_end

WiseTriosRoomSageReturnsMovement:
	step_right
	step_down
	step_end

WiseTriosRoomSageAllowsPassageMovement:
	step_right
	step_down
	step_end

WiseTriosRoomSage1Text:
	text "Asombroso…"

	para "Suicune, Entei y"
	line "Raikou han"
	cont "despertado de su"
	cont "sueño…"

	para "¿Se está"
	line "cumpliendo la"
	cont "leyenda?"
	done

WiseTriosRoomSage2Text:
	text "Entrenamos en la"
	line "Torre Quemada,"
	cont "pero nunca oímos"

	para "que se abriera un"
	line "agujero ahí antes."
	cont "Debió de ser hecho"

	para "deliberadamente"
	line "por alguien."
	done

WiseTriosRoomSage3BlocksExitText:
	text "A la Torre Campana"
	line "pueden entrar"

	para "quienes porten la"
	line "Medalla del"
	cont "Gimnasio de Iris."

	para "Sin embargo, ahora"
	line "que Suicune,"

	para "Raikou y Entei han"
	line "despertado, te"

	para "¡pido que te"
	line "abstengas de"
	cont "entrar!"
	done

WiseTriosRoomSage3Text:
	text "Nosotros, el Trío"
	line "Sabio, somos los"

	para "protectores de los"
	line "#mon"
	cont "legendarios."
	done

ElderGakuSeenText:
	text "Cuenta la leyenda"
	line "que al surgir"

	para "un entrenador con"
	line "la capacidad de"

	para "tocar las almas de"
	line "los #mon, un"
	cont "#mon vendrá a"

	para "poner a prueba a"
	line "ese entrenador en"
	cont "la Torre Campana."

	para "¡La leyenda se ha"
	line "cumplido!"

	para "¡El #mon"
	line "legendario Suicune"
	cont "ha llegado!"

	para "Nosotros, el Trío"
	line "Sabio, pondremos a"

	para "prueba tu valía"
	line "para entrar."
	done

ElderGakuBeatenText:
	text "¿Más fuerte de lo"
	line "que pensábamos?"
	cont "Quizás…"
	done

ElderMasaSeenText:
	text "¿Se puede confiar"
	line "en ti con la"
	cont "verdad?"

	para "Debo comprobar tu"
	line "valía."
	done

ElderMasaBeatenText:
	text "…Te diré la"
	line "verdad…"
	done

ElderKojiSeenText:
	text "¡Déjame ver tu"
	line "poder!"
	done

ElderKojiBeatenText:
	text "¡Demasiado"
	line "fuerte! ¿Por qué?"
	done

SageKojiAfterBattleQuestionText:
	text "Tú… ¿Eres el"
	line "entrenador"

	para "esperado por el"
	line "#mon"
	cont "legendario?"
	done

SageKojiAfterBattleSpeechText:
	text "Ya veo…"

	para "A nosotros, el"
	line "Trío Sabio, se nos"

	para "dio la"
	line "responsabilidad de"

	para "proteger a los"
	line "#mon"
	cont "legendarios."
	cont "Debemos permitir"

	para "el paso solo a"
	line "quienes posean el"

	para "poder y el alma de"
	line "la verdad."

	para "Adelante, por"
	line "favor, entra en la"
	cont "Torre Campana."

	para "Suicune te pondrá"
	line "a prueba."
	done

SageKojiAfterBattleFinalText:
	text "Adelante, por"
	line "favor."

	para "Suicune te pondrá"
	line "a prueba."
	done
