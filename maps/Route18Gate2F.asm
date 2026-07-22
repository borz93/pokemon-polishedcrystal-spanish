Route18Gate2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, ROUTE_18_GATE_2F, -1

	def_coord_events

	def_bg_events
	bg_event  1,  2, BGEVENT_UP, Route18Gate2FBinoculars1
	bg_event  6,  2, BGEVENT_UP, Route18Gate2FBinoculars2

	def_object_events

Route18Gate2FBinoculars1:
	jumpthistext

	text "Miraste por los"
	line "prismáticos."

	para "¡Pueblo Paleta"
	line "está al oeste!"
	done

Route18Gate2FBinoculars2:
	jumpthistext

	text "Miraste por los"
	line "prismáticos."

	para "¡Hay gente"
	line "nadando!"
	done
