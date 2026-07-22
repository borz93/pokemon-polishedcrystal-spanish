CeladonPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, CELADON_CITY, 5
	warp_event  6,  7, CELADON_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalErikaScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  2,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumpstd, happinesschecknpc, -1
	object_event  1,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonPokeCenter1FPharmacistText, -1
	object_event 11,  5, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonPokeCenter1FCooltrainerfText, -1
	object_event 11,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonPokeCenter1FLassText, -1

PokemonJournalErikaScript:
	setflag ENGINE_READ_ERIKA_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: ¡Líder"
	cont "Erika!"

	para "Se rumorea que"
	line "si espías el"
	cont "Gimnasio de"
	cont "Azulona,"

	para "a menudo verás"
	line "a Erika dormir."
	done

CeladonPokeCenter1FPharmacistText:
	text "El escondite"
	line "del Team Rocket"

	para "estaba en el"
	line "sótano de la Sala"
	cont "de Juegos."

	para "Ah, espera. Eso"
	line "fue hace tres"
	cont "años."

	para "Me pregunto para"
	line "qué se usa ahora."
	done

CeladonPokeCenter1FCooltrainerfText:
	text "Erika domina"
	line "los #mon de"
	cont "tipo planta."

	para "Te hará pagar si"
	line "no te andas"
	cont "con ojo."
	done

CeladonPokeCenter1FLassText:
	text "Erika no es solo"
	line "Líder de"
	cont "Gimnasio."

	para "También da clases"
	line "en la Universidad"
	cont "Azulona."
	done
