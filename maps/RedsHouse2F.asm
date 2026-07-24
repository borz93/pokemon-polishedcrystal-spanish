RedsHouse2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  0, REDS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPTEXT, RedsHouse2FPCText
	bg_event  3,  5, BGEVENT_JUMPTEXT, RedsHouse2FSNESText
	bg_event  4,  1, BGEVENT_READ, PokemonJournalProfOakScript
	bg_event  5,  1, BGEVENT_READ, PokemonJournalProfOakScript

	def_object_events

PokemonJournalProfOakScript:
	setflag ENGINE_READ_PROF_OAK_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje"
	line "especial: ¡El"
	cont "Prof. Oak!"

	para "Los nietos de"
	line "Samuel Oak, Blue"
	cont "y Daisy, viven"

	para "cerca de su"
	line "laboratorio en"
	cont "Pueblo Paleta."

	para "Se rumorea que su"
	line "primo Samson vive"

	para "en la lejana"
	line "región de Alola."
	done

RedsHouse2FPCText:
	text "Parece que no se"
	line "usa desde hace"
	cont "mucho…"
	done

RedsHouse2FSNESText:
	text "<PLAYER> jugó a la"
	line "SNES."

	para "Mejor date prisa…"
	line "¡No hay tiempo"
	cont "que perder!"
	done
