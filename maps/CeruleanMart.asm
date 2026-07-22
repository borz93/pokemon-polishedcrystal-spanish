CeruleanMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CERULEAN_CITY, 6
	warp_event  3,  7, CERULEAN_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_CERULEAN
	object_event  1,  6, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanMart_CooltrainerMText, -1
	object_event  7,  2, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanMart_CooltrainerFText, -1

CeruleanMart_CooltrainerMText:
	text "Te cruzarás con"
	line "muchos"
	cont "entrenadores de"
	cont "camino al Cabo"
	cont "Celeste."

	para "Quieren ver cómo"
	line "se comparan con"

	para "otros"
	line "entrenadores."
	done

CeruleanMart_CooltrainerFText:
	text "Misty es casi la"
	line "única persona del"

	para "pueblo que vence a"
	line "los entrenadores"
	cont "del Cabo Celeste."
	done
