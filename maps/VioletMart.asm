VioletMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VIOLET_CITY, 1
	warp_event  3,  7, VIOLET_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_VIOLET
	object_event  7,  6, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletMartGrannyText, -1
	object_event  5,  2, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletMartCooltrainerMText, -1

VioletMartGrannyText:
	text "Al principio,"
	line "un #mon recién"
	cont "atrapado puede ser"
	cont "débil."

	para "Pero con el tiempo"
	line "se hará fuerte."

	para "Es importante"
	line "tratar a los"
	cont "#mon"
	cont "con amor."
	done

VioletMartCooltrainerMText:
	text "Los #mon pueden"
	line "llevar objetos"
	cont "como Poción o"
	cont "Antídoto."

	para "Pero no parecen"
	line "saber usar"

	para "objetos hechos"
	line "por personas."
	done
