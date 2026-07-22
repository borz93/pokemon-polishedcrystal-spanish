Route10PokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, ROUTE_10_NORTH, 1
	warp_event  6,  7, ROUTE_10_NORTH, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalAgathaScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  8,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route10PokeCenter1FGymGuyScript, -1
	object_event  9,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route10PokeCenter1FGentlemanText, -1
	object_event  2,  3, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route10PokeCenter1FCooltrainerfText, -1

PokemonJournalAgathaScript:
	setflag ENGINE_READ_AGATHA_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial:"
	cont "¡Exmiembro"
	cont "Agatha!"

	para "De jóvenes,"
	line "Agatha y el Prof."
	cont "Oak eran rivales"

	para "que competían por"
	line "ser los mejores"
	cont "entrenadores."
	done

Route10PokeCenter1FGymGuyScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "El Encargado de"
	line "la Central"
	cont "Eléctrica busca"

	para "a un entrenador"
	line "#mon fuerte."

	para "Necesita ayuda"
	line "para recuperar"

	para "algo que le"
	line "robaron."
	done

.Text2:
	text "Oí que el Team"
	line "Rocket se reunió"

	para "en Johto, pero"
	line "se deshizo"
	cont "enseguida."

	para "No sabía nada"
	line "de eso."
	done

Route10PokeCenter1FGentlemanText:
	text "¿Un Centro"
	line "#mon cerca de"
	cont "una cueva?"

	para "Qué"
	line "conveniente."
	done

Route10PokeCenter1FCooltrainerfText:
	text "Cuando sales"
	line "fuera, se ve"

	para "el tejado de un"
	line "edificio grande."

	para "Eso es la"
	line "Central"
	cont "Eléctrica."
	done
