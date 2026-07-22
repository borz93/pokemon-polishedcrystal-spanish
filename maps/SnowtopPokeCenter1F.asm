SnowtopPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, SNOWTOP_MOUNTAIN_OUTSIDE, 2
	warp_event  6,  7, SNOWTOP_MOUNTAIN_OUTSIDE, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalProfWillowScript

	def_object_events
	pc_nurse_event  5, 1

PokemonJournalProfWillowScript:
	setflag ENGINE_READ_PROF_WILLOW_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje"
	line "especial: ¡la"
	cont "Prof. Willow!"

	para "Dicen que el sueño"
	line "de la Prof. Willow"

	para "es explorar"
	line "tierras inexplo-"
	cont "radas y documentar"

	para "especies de"
	line "#mon sin"
	cont "descubrir en su"
	cont "hábitat natural."
	done
