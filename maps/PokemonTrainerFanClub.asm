PokemonTrainerFanClub_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6, 17, SAFFRON_CITY, 16
	warp_event  7, 17, SAFFRON_CITY, 16

	def_coord_events

	def_bg_events
	bg_event  0, 10, BGEVENT_READ, PokemonJournalBrunoScript
	bg_event  1, 10, BGEVENT_READ, PokemonJournalBrunoScript

	def_object_events

PokemonJournalBrunoScript:
	setflag ENGINE_READ_BRUNO_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje"
	line "especial: ¡Bruno"
	cont "del Alto Mando!"

	para "Dicen que Bruno"
	line "se unió al Alto"

	para "Mando por su"
	line "ambición de"

	para "combatir a los"
	line "mejores"
	cont "entrenadores."
	done
