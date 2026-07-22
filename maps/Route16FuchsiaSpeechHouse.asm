Route16FuchsiaSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_16_NORTH, 1
	warp_event  3,  7, ROUTE_16_NORTH, 1

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route16FuchsiaSpeechHouseSuperNerdText, -1
	object_event  5,  4, SPRITE_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route16FuchsiaSpeechHouseLadyText, -1

Route16FuchsiaSpeechHouseSuperNerdText:
	text "Si bajas por el"
	line "Camino Ciclista,"

	para "acabarás en"
	line "Ciudad Fucsia."
	done

Route16FuchsiaSpeechHouseLadyText:
	text "La persona que"
	line "vivía aquí"

	para "se mudó hace"
	line "tres años."

	para "¿Dónde habrá"
	line "ido?"
	done
