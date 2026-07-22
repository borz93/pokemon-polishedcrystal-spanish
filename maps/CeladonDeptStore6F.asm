CeladonDeptStore6F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 15,  0, CELADON_DEPT_STORE_5F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore6FDirectoryText

	def_object_events
	object_event  9,  2, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore6FSuperNerdText, -1
	object_event 12,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore6FYoungsterText, -1
	object_event  5,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameboyKid1Script, -1
	object_event  6,  1, SPRITE_GAMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameboyKid2Script, -1

CeladonDeptStore3FGameboyKid1Script:
	showtextfaceplayer CeladonDeptStore3FGameboyKid1Text
	turnobject LAST_TALKED, DOWN
	end

CeladonDeptStore3FGameboyKid2Script:
	showtextfaceplayer CeladonDeptStore3FGameboyKid2Text
	turnobject LAST_TALKED, DOWN
	end

CeladonDeptStore6FSuperNerdText:
	text "Una máquina"
	line "expendedora con"
	cont "ruleta de"
	cont "premios…"

	para "Ya no se ven"
	line "de esas."
	done

CeladonDeptStore6FYoungsterText:
	text "Puedo jugar en"
	line "la tercera"
	cont "planta, y venir"

	para "aquí cuando"
	line "tenga sed!"

	para "¡Esta tienda es"
	line "genial!"
	done

CeladonDeptStore3FGameboyKid1Text:
	text "Cambié mi #mon"
	line "mientras"

	para "llevaba una"
	line "Mejora."
	done

CeladonDeptStore3FGameboyKid2Text:
	text "¡Genial! Por fin"
	line "tendré un"
	cont "Porygon!"

	para "Se me dan mal"
	line "las tragaperras,"

	para "así que nunca"
	line "tengo monedas"
	cont "suficientes…"

	para "¡Lo criaré con"
	line "una Mejora para"
	cont "evolucionarlo!"
	done

CeladonDeptStore6FDirectoryText:
	text "6F: Terraza"
	line "Máquinas Expend."
	done
