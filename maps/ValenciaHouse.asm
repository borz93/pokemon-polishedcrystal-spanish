ValenciaHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VALENCIA_ISLAND, 3
	warp_event  3,  7, VALENCIA_ISLAND, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, ValenciaHouseLassText, -1

ValenciaHouseLassText:
	text "¡La Prof. Ivy es"
	line "genial!"

	para "Curó a mis #mon"
	line "cuando estaban"
	cont "enfermos!"
	done
