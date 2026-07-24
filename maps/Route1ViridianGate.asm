Route1ViridianGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, VIRIDIAN_CITY, 6
	warp_event  5,  0, VIRIDIAN_CITY, 7
	warp_event  4,  7, ROUTE_1, 1
	warp_event  5,  7, ROUTE_1, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route1ViridianGateOfficerText, -1
	object_event  6,  4, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route1ViridianGateRockerText, -1

Route1ViridianGateOfficerText:
	text "Al sur está"
	line "Pueblo Paleta."

	para "Ahí vive el"
	line "Prof. Oak."
	done

Route1ViridianGateRockerText:
	text "Si lo piensas"
	line "bien,"

	para "¿No vamos TODOS"
	line "camino a Ciudad"
	cont "Verde?"
	done
