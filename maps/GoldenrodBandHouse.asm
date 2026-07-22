GoldenrodBandHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 20
	warp_event  3,  7, GOLDENROD_CITY, 20

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodBandHouseRocker1Text, -1
	object_event  6,  4, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodBandHouseRocker2Text, -1
	object_event  2,  4, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodBandHouseCooltrainerFText, -1

GoldenrodBandHouseRocker1Text:
	text "Toco la guitarra"
	line "en nuestro grupo"
	cont "de versiones."

	para "¡Escúchanos en"
	line "el Canal"
	cont "Variedades!"
	done

GoldenrodBandHouseRocker2Text:
	text "La música y la"
	line "pasión siempre"

	para "están de moda."
	line "¡No lo olvides!"
	done

GoldenrodBandHouseCooltrainerFText:
	text "A la gente le"
	line "gustan distintos"
	cont "tipos de música,"

	para "pero cada uno"
	line "tiene derecho a"
	cont "su opinión."

	para "¡No seas odioso!"
	done
