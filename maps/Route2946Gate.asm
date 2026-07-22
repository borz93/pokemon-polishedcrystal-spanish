Route2946Gate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, ROUTE_46, 1
	warp_event  5,  0, ROUTE_46, 2
	warp_event  4,  7, ROUTE_29, 1
	warp_event  5,  7, ROUTE_29, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route29Route46GateOfficerText, -1
	object_event  6,  4, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route29Route46GateYoungsterText, -1

Route29Route46GateOfficerText:
	text "No puedes subir"
	line "salientes."

	para "Pero puedes saltar"
	line "desde ellos para"
	cont "atajar."
	done

Route29Route46GateYoungsterText:
	text "Más allá de aquí"
	line "aparecen #mon"
	cont "distintos."

	para "Si quieres"
	line "atraparlos todos,"

	para "tienes que mirar"
	line "por todas partes."
	done
