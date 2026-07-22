GoldenrodDeptStore4F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_5F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_3F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, GoldenrodDeptStore4FDirectoryText

	def_object_events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_GOLDENROD_4F, -1
	object_event  5,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, PAL_NPC_GREEN, GoldenrodDeptStore4FGameboyKidScript, -1
	object_event 11,  7, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore4FCooltrainerMText, -1
	object_event  7,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore4FBugCatcherText, -1

GoldenrodDeptStore4FGameboyKidScript:
	showtextfaceplayer GoldenrodDeptStore4FGameboyKidText
	turnobject LAST_TALKED, DOWN
	end

GoldenrodDeptStore4FCooltrainerMText:
	text "Oye. Me encantan"
	line "los #mon"
	cont "fuertes."

	para "Les doy Proteína"
	line "para subirles"
	cont "el Ataque."
	done

GoldenrodDeptStore4FBugCatcherText:
	text "Hay cuatro #mon"
	line "que evolucionan"

	para "con un Cable"
	line "Enlace:"

	para "¡Machoke,"
	line "Graveler,"
	cont "Kadabra y"
	cont "Haunter!"
	done

GoldenrodDeptStore4FGameboyKidText:
	text "Algunos #mon"
	line "solo evolucionan"

	para "si llevan cierto"
	line "objeto."

	para "Conozco cuatro:"
	line "Poliwhirl, Onix,"

	para "Slowpoke y, eh,"
	line "Scyther."

	para "Sé que hay más."
	done

GoldenrodDeptStore4FDirectoryText:
	text "¡Vamos a"
	line "potenciar a tu"
	cont "#mon!"

	para "4F Botiquín"
	done
