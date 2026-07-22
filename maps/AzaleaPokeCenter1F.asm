AzaleaPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, AZALEA_TOWN, 1
	warp_event  6,  7, AZALEA_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalBugsyScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  8,  4, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokeCenter1FCooltrainermScript, -1
	object_event 11,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FGentlemanText, -1
	object_event  8,  1, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FSightseermText, -1
	object_event  2,  5, SPRITE_MATRON, SPRITEMOVEDATA_WANDER, 2, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FPokefanfText, -1

PokemonJournalBugsyScript:
	setflag ENGINE_READ_BUGSY_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje"
	line "especial: ¡Líder"
	cont "Bugsy!"

	para "Dicen que Bugsy"
	line "ganó tantas veces"

	para "el Concurso de"
	line "Captura que ya no"

	para "participa."
	done

AzaleaPokeCenter1FCooltrainermScript:
	checktime (1 << EVE) | (1 << NITE)
	iftrue_jumptextfaceplayer .NiteText
	jumpthistextfaceplayer

	text "Para alguien que"
	line "hace # Balls,"

	para "Kurt no es muy"
	line "buen entrenador."

	para "Tiene un #mon,"
	line "pero casi no"

	para "lo usa."
	done

.NiteText:
	text "Kurt y el Prof."
	line "Oak son viejos"
	cont "amigos."

	para "También son"
	line "cercanos a Agatha,"

	para "antigua miembro"
	line "del Alto Mando."
	done

AzaleaPokeCenter1FGentlemanText:
	text "¿Tus #mon"
	line "saben movs. MO?"

	para "Esos movs. se"
	line "usan aunque tu"

	para "#mon esté"
	line "debilitado."
	done

AzaleaPokeCenter1FSightseermText:
	text "Ese tal Bill creó"
	line "el sistema para"

	para "guardar #mon"
	line "en un PC."

	para "El PC de Bill"
	line "guarda hasta 20"
	cont "#mon por Caja."
	done

AzaleaPokeCenter1FPokefanfText:
	text "¿Sabes qué es"
	line "un Bonguri?"

	para "Se abre, se vacía"
	line "por dentro y se"

	para "le pone un"
	line "dispositivo"
	cont "especial."

	para "Así puedes atrapar"
	line "#mon con ella."

	para "Antes de que se"
	line "inventaran las"
	cont "# Balls,"

	para "todos usaban"
	line "Bonguris."
	done
