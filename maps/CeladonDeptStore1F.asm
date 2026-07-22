CeladonDeptStore1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, CELADON_CITY, 1
	warp_event  8,  7, CELADON_CITY, 17
	warp_event 15,  0, CELADON_DEPT_STORE_2F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore1FDirectoryText

	def_object_events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore1FReceptionistText, -1
	object_event 11,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore1FGentlemanText, -1
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore1FTeacherText, -1

CeladonDeptStore1FReceptionistText:
	text "¡Hola!"
	line "Bienvenido a los"
	cont "Grandes Almacenes"
	cont "de Azulona!"

	para "El directorio"
	line "está en la pared."
	done

CeladonDeptStore1FGentlemanText:
	text "Estos Grandes"
	line "Almacenes son de"
	cont "la misma cadena"

	para "que los de Ciudad"
	line "Trigal."

	para "Ambos se"
	line "renovaron al"
	cont "mismo tiempo."
	done

CeladonDeptStore1FTeacherText:
	text "Es la primera"
	line "vez que vengo."

	para "Es enorme…"

	para "Me temo que"
	line "me perderé."
	done

CeladonDeptStore1FDirectoryText:
	text "1F: Mostrador"
	line "    de Servicio"

	para "2F: Mercado"
	line "    del Entrenador"

	para "3F: Tienda Tec."

	para "4F: Regalos"
	line "    del Sabio"

	para "5F: Farmacia"

	para "6F: Terraza"
	line "    Patio"
	done
