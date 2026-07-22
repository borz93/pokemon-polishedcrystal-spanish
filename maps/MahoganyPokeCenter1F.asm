MahoganyPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, MAHOGANY_TOWN, 4
	warp_event  6,  7, MAHOGANY_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalPryceScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  9,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyPokeCenter1FPokefanmText, -1
	object_event  1,  3, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyPokeCenter1FYoungsterText, -1
	object_event  2,  3, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyPokeCenter1FCooltrainerfText, -1

PokemonJournalPryceScript:
	setflag ENGINE_READ_PRYCE_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: ¡Líder"
	cont "Pryce!"

	para "El segundo"
	line "nombre de Pryce"
	cont "es Willow."

	para "Dicen que su"
	line "estilo de combate"
	cont "es flexible como"
	cont "un sauce en"

	para "invierno, por lo"
	line "que le llaman"
	cont "“el entrenador"
	cont "de invierno”."
	done

MahoganyPokeCenter1FPokefanmText:
	text "¿Qué es esto?"
	line "¿Ha vuelto el"
	cont "Team Rocket?"

	para "Vi a hombres de"
	line "negro en el Lago"
	cont "de la Furia…"
	done

MahoganyPokeCenter1FYoungsterText:
	text "Evito que mis"
	line "#mon"
	cont "evolucionen"
	cont "muy pronto."

	para "Les hago aprender"
	line "ciertos"
	cont "movimientos antes"
	cont "de evolucionar."
	done

MahoganyPokeCenter1FCooltrainerfText:
	text "Los #mon se"
	line "hacen más"
	cont "fuertes al"
	cont "evolucionar."

	para "Pero aprenden"
	line "movimientos más"
	cont "despacio."
	done
