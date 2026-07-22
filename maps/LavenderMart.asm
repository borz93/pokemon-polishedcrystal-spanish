LavenderMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 5
	warp_event  3,  7, LAVENDER_TOWN, 5

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_LAVENDER
	object_event  6,  6, SPRITE_HIKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderMartPokefanMText, -1
	object_event  9,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderMartRockerText, -1

LavenderMartPokefanMText:
	text "El Repelente es"
	line "necesario si vas"

	para "a explorar una"
	line "cueva."

	para "Aunque me gusta"
	line "explorar, todavía"

	para "no he ido a todas"
	line "las cuevas."
	done

LavenderMartRockerText:
	text "Oí hablar de un"
	line "artesano que hace"

	para "Balls a medida en"
	line "el pueblo de"

	para "Azalea, en Johto."
	line "Ojalá tuviera"
	cont "alguna."
	done
