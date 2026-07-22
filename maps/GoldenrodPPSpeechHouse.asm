GoldenrodPPSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 7
	warp_event  3,  7, GOLDENROD_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  1,  4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPPSpeechHouseFisherText, -1
	object_event  5,  3, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPPSpeechHouseLassText, -1

GoldenrodPPSpeechHouseFisherText:
	text "Una vez, en pleno"
	line "combate, mi"

	para "#mon no podía"
	line "usar movimientos."

	para "Los Puntos de"
	line "Poder, o PP, de"

	para "sus movimientos"
	line "se habían"
	cont "agotado."
	done

GoldenrodPPSpeechHouseLassText:
	text "A veces, un"
	line "#mon sano no"
	cont "puede"

	para "usar sus"
	line "movimientos."

	para "Si pasa eso,"
	line "cúralo en un"
	cont "Centro #mon o"
	cont "usa un objeto."
	done
