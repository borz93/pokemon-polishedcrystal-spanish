SeafoamIslandsB2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 25, 15, SEAFOAM_ISLANDS_B1F, 3
	warp_event 15,  7, SEAFOAM_ISLANDS_B1F, 4
	warp_event 13, 13, SEAFOAM_ISLANDS_B1F, 5
	warp_event  7, 15, SEAFOAM_ISLANDS_B1F, 6
	warp_event 35,  7, SEAFOAM_ISLANDS_B3F, 1
	warp_event 28,  9, SEAFOAM_ISLANDS_B3F, 2
	warp_event 35, 15, SEAFOAM_ISLANDS_B3F, 3
	warp_event  4, 13, SEAFOAM_ISLANDS_B3F, 4

	def_coord_events

	def_bg_events
	bg_event  7,  9, BGEVENT_ITEM + PEARL, EVENT_SEAFOAM_ISLANDS_B2F_HIDDEN_PEARL_1
	bg_event 35, 13, BGEVENT_ITEM + PEARL, EVENT_SEAFOAM_ISLANDS_B2F_HIDDEN_PEARL_2

	def_object_events
	object_event 11,  4, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSkierCady, -1
	object_event 16,  5, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderShaun, -1
	object_event 25,  8, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderBryce, -1
	itemball_event 15, 16, WATER_STONE, 1, EVENT_SEAFOAM_ISLANDS_B2F_WATER_STONE

GenericTrainerSkierCady:
	generictrainer SKIER, CADY, EVENT_BEAT_SKIER_CADY, SkierCadySeenText, SkierCadyBeatenText

	text "¡Menudo"
	line "combatazo!"
	done

GenericTrainerBoarderShaun:
	generictrainer BOARDER, SHAUN, EVENT_BEAT_BOARDER_SHAUN, BoarderShaunSeenText, BoarderShaunBeatenText

	text "¡Vale, pasa"
	line "cuando quieras!"
	done

GenericTrainerBoarderBryce:
	generictrainer BOARDER, BRYCE, EVENT_BEAT_BOARDER_BRYCE, BoarderBryceSeenText, BoarderBryceBeatenText

	text "Hay entrenadores"
	line "por todas partes."
	done

SkierCadySeenText:
	text "Para el frío,"
	line "prueba ropa de"
	cont "abrigo y algo"
	cont "caliente!"
	done

SkierCadyBeatenText:
	text "¡Argh, hasta"
	line "aquí he llegado!"
	done

BoarderShaunSeenText:
	text "¡Eh, eh, me"
	line "estorbas! ¡Vale!"
	done

BoarderShaunBeatenText:
	text "Me han dado"
	line "una paliza…"
	done

BoarderBryceSeenText:
	text "Me pregunto"
	line "para qué habrás"
	cont "venido hasta"
	cont "aquí."
	done

BoarderBryceBeatenText:
	text "He perdido hasta"
	line "aquí…"
	done
