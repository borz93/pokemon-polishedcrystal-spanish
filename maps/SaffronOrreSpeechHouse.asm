SaffronOrreSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 17
	warp_event  3,  7, SAFFRON_CITY, 17

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronOrreSpeechHouseSilphEmployeeText, -1
	object_event  5,  4, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronOrreSpeechHouseCooltrainerMText, -1

SaffronOrreSpeechHouseSilphEmployeeText:
	text "Oí hablar de un"
	line "método para"
	cont "sellar el corazón"
	cont "de un #mon"

	para "y obligarlo a"
	line "atacar personas."

	para "¿Cómo puede"
	line "alguien hacerle"
	cont "algo tan horrible"
	cont "a un #mon?!"
	done

SaffronOrreSpeechHouseCooltrainerMText:
	text "Acabamos de"
	line "volver de ver a"

	para "un amigo en otra"
	line "región."

	para "Tuvo muchos"
	line "problemas con dos"
	cont "bandas criminales,"

	para "pero un talentoso"
	line "entrenador se"
	cont "ofreció a"
	cont "salvarlos."
	done
