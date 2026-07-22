CherrygroveGymSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 3
	warp_event  3,  7, CHERRYGROVE_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygroveGymSpeechHousePokefanMText, -1
	object_event  5,  5, SPRITE_CHILD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygroveGymSpeechHouseBugCatcherText, -1

CherrygroveGymSpeechHousePokefanMText:
	text "¿Intentas ver"
	line "qué tal se te da"

	para "ser entrenador"
	line "#mon?"

	para "Mejor visita los"
	line "Gimnasios #mon"

	para "de todo Johto y"
	line "consigue Medallas."
	done

CherrygroveGymSpeechHouseBugCatcherText:
	text "Cuando sea mayor,"
	line "seré Líder de"
	cont "Gimnasio!"

	para "Hago que mis"
	line "#mon combatan"
	cont "con los de mi"
	cont "amigo para"

	para "hacerlos más"
	line "fuertes!"
	done
