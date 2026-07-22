GoldenrodDeptStore1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, GOLDENROD_CITY, 9
	warp_event  8,  7, GOLDENROD_CITY, 24
	warp_event 15,  0, GOLDENROD_DEPT_STORE_2F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, GoldenrodDeptStore1FDirectoryText

	def_object_events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore1FReceptionistText, -1
	object_event  5,  4, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore1FPokefanFText, -1
	object_event  5,  5, SPRITE_CHILD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore1FBugCatcherText, -1
	object_event 11,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore1FGentlemanText, -1

GoldenrodDeptStore1FReceptionistText:
	text "Bienvenido a los"
	line "Grandes Almacenes"
	cont "de Trigal."
	done

GoldenrodDeptStore1FGentlemanText:
	text "Los Grandes"
	line "Almacenes tienen"
	cont "buena selección."

	para "Pero algunos"
	line "artículos solo"

	para "están disponibles"
	line "como premios de"
	cont "la Sala de Juegos."
	done

GoldenrodDeptStore1FPokefanFText:
	text "¡Hoy tengo ganas"
	line "de comprar!"
	done

GoldenrodDeptStore1FBugCatcherText:
	text "Mamá es buena"
	line "buscando gangas."

	para "Siempre compra"
	line "cosas más"
	cont "baratas."
	done

GoldenrodDeptStore1FDirectoryText:
	text "1F Mostrador"

	para "2F Mercado"
	line "   del Entren."

	para "3F Zona de"
	line "   Combate"

	para "4F Botiquín"

	para "5F Rincón MT"

	para "6F Plaza"
	line "   Tranquila"

	para "Mirador"
	done
