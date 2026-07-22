Route1617Gate2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, ROUTE_16_17_GATE_2F, -1

	def_coord_events

	def_bg_events
	bg_event  1,  2, BGEVENT_UP, Route1617Gate2FBinoculars1
	bg_event  6,  2, BGEVENT_UP, Route1617Gate2FBinoculars2

	def_object_events
	object_event 2, 5, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route1617Gate2FPsychicScript, -1

Route1617Gate2FPsychicScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_TRICK_ROOM_INTRO
	iftruefwd Route1617Gate2FTutorTrickRoomScript
	writetext Route1617Gate2FPsychicText
	waitbutton
	setevent EVENT_LISTENED_TO_TRICK_ROOM_INTRO
Route1617Gate2FTutorTrickRoomScript:
	writetext Text_Route1617Gate2FTutorTrickRoom
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Route1617Gate2FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval TRICK_ROOM
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Qué pena."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Pero antes"
	line "necesitaré una"
	cont "Hoja Plata,"

	para "así que vuelve"
	line "cuando consigas"
	cont "una."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Mi técnica es"
	line "bastante astuta,"
	cont "¿no crees?"
	done

Route1617Gate2FBinoculars1:
	jumpthistext

	text "Miraste por los"
	line "prismáticos."

	para "¡Son los Grandes"
	line "Almacenes de"
	cont "Azulona!"
	done

Route1617Gate2FBinoculars2:
	jumpthistext

	text "Miraste por los"
	line "prismáticos."

	para "¡Hay un camino"
	line "largo sobre el"
	cont "agua!"
	done

Route1617Gate2FPsychicText:
	text "Hay un Psíquico"
	line "no muy lejos de"
	cont "aquí"

	para "que puede cambiar"
	line "su entorno en un"
	cont "combate #mon."

	para "Es una inspiración"
	line "para mí, así que"
	cont "trabajé en mi"
	cont "propia técnica."
	done

Text_Route1617Gate2FTutorTrickRoom:
	text "Puedo enseñar a"
	line "tu #mon el"
	cont "movimiento Zona"
	cont "Extraña."

	para "Esto deja que los"
	line "#mon lentos"
	cont "superen en"
	cont "velocidad a los"
	cont "rápidos un rato."
	done

Text_Route1617Gate2FTutorQuestion:
	text "¿Una Hoja Plata"
	line "es un precio"
	cont "justo?"
	done
