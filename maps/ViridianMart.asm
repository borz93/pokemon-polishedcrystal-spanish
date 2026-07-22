ViridianMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VIRIDIAN_CITY, 4
	warp_event  3,  7, VIRIDIAN_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_VIRIDIAN
	object_event  7,  2, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianMartLassText, -1
	object_event  1,  6, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianMartCooltrainerMText, -1

ViridianMartLassText:
	text "El Líder de"
	line "Gimnasio de aquí"
	cont "es genial."

	para "Es el único sin"
	line "una"
	cont "especialidad de"
	cont "tipo."

	para "Le gusta tener a"
	line "la gente"
	cont "adivinando."
	done

ViridianMartCooltrainerMText:
	text "¿Has estado en"
	line "Canela?"

	para "Es una isla muy"
	line "al sur de aquí."
	done
