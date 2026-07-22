CeladonMansionRoof_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  1,  1, CELADON_MANSION_3F, 1
	warp_event  6,  1, CELADON_MANSION_3F, 4
	warp_event  2,  5, CELADON_MANSION_ROOF_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_LEFT, MapCeladonMansionRoofSignpost0Script

	def_object_events
	object_event  7,  5, SPRITE_FAT_GUY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonMansionRoofFisherText, -1

MapCeladonMansionRoofSignpost0Script:
	jumpthistext

	text "Hay pintadas"
	line "en la pared…"

	para "<PLAYER> añadió"
	line "un bigote!"
	done

CeladonMansionRoofFisherText:
	text "¡Los sitios altos"
	line "me encantan!"

	para "Diría que lo único"
	line "que ama las"

	para "alturas tanto como"
	line "yo es el humo!"
	done
