PewterPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, PEWTER_CITY, 4
	warp_event  6,  7, PEWTER_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalBrockScript

	def_object_events
	pc_nurse_event  5, 1
	pokemon_event  2,  3, JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, PewterJigglypuffText, -1
	object_event  8,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, trade, NPC_TRADE_CHRIS, -1
	object_event 11,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterPokeCenter1FTeacherText, -1
	object_event  3,  3, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterPokeCenter1FChildText, -1

PokemonJournalBrockScript:
	setflag ENGINE_READ_BROCK_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: ¡Líder"
	cont "Brock!"

	para "Brock casi nunca"
	line "ríe, pero dicen"

	para "que no puede parar"
	line "si empieza."
	done

PewterJigglypuffText:
	text "Jigglypuff:"
	line "♪ Puu pupuu. ♪"
	done

PewterPokeCenter1FTeacherText:
	text "…Sí, y el"
	line "gimnasio de Isla"
	cont "Canela"

	para "desapareció. Me"
	line "quedé asombrada."

	para "…¿Sí? Estoy al"
	line "teléfono. ¡Vete!"
	done

PewterPokeCenter1FChildText:
	text "La mayoría de"
	line "#mon se"
	cont "adormilan si"

	para "oyen cantar a"
	line "Jigglypuff."

	para "Hay varios"
	line "movimientos que"

	para "solo se usan si"
	line "un #mon duerme."
	done
