LyrasHouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 4
	warp_event  3,  7, NEW_BARK_TOWN, 4
	warp_event  0,  0, LYRAS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_UP, LyrasFridgeScript
	bg_event  8,  1, BGEVENT_JUMPTEXT, LyrasSinkText
	bg_event  9,  1, BGEVENT_JUMPTEXT, LyrasStoveText
	bg_event  5,  1, BGEVENT_UP, LyrasTVScript

	def_object_events
	object_event  2,  3, SPRITE_DAD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LyrasDadScript, -1

LyrasDadScript:
	faceplayer
	opentext
	checkevent EVENT_LYRA_IN_HER_ROOM
	iffalsefwd .LyraInside
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftruefwd .LyraTraining
	jumpthisopenedtext

	text "¡Hola, <PLAYER>!"
	line "Lyra no está."

	para "Ha estado"
	line "ocupada"
	cont "ayudando al"
	cont "profesor."
	done

.LyraInside
	jumpthisopenedtext

	text "¡Hola, <PLAYER>!"
	line "Lyra está arriba."

	para "Está jugando con"
	line "su #mon,"
	cont "como siempre."
	done

.LyraTraining
	jumpthisopenedtext

	text "¡Hola, <PLAYER>!"
	line "Lyra no está."

	para "Está consiguiendo"
	line "medallas por"
	cont "todo Johto!"
	done




LyrasFridgeScript:
	jumpthistext

	text "A ver qué hay"
	line "en la nevera…"

	para "¡Agua Fresca y"
	line "bolas de arroz!"
	done

LyrasSinkText:
	text "El fregadero"
	line "está impecable."
	done

LyrasStoveText:
	text "Hay curry"
	line "cociendo a fuego"
	cont "lento."
	done

LyrasTVScript:
	jumpthistext

	text "Hay una peli en"
	line "la tele: una"
	cont "chica con"

	para "coletas"
	line "caminando por un"
	cont "camino de"
	cont "ladrillos."

	para "¡Yo también"
	line "debería irme ya!"
	done
