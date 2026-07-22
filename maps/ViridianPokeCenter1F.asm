ViridianPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, VIRIDIAN_CITY, 5
	warp_event  6,  7, VIRIDIAN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalBlueScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  2,  4, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokeCenter1FCooltrainermScript, -1
	object_event  8,  4, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianPokeCenter1FCooltrainerfText, -1
	object_event  3,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianPokeCenter1FBugCatcherText, -1

PokemonJournalBlueScript:
	setflag ENGINE_READ_BLUE_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: ¡Líder"
	cont "Blue!"

	para "Dicen que Blue"
	line "visita a sus"
	cont "#mon queridos"

	para "cada año en la"
	line "Casa de las Almas."
	done

ViridianPokeCenter1FCooltrainermScript:
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue_jumptextfaceplayer .BlueText
	jumpthistextfaceplayer

	text "¿Dónde diablos"
	line "está el Líder"

	para "del Gimnasio"
	line "Verde? Quería"
	cont "retarlo."
	done

.BlueText:
	text "Hay entrenadores"
	line "fuertes en el"
	cont "Gimnasio Verde."

	para "¡Algún día me"
	line "uniré a ellos!"
	done

ViridianPokeCenter1FCooltrainerfText:
	text "Oí que el"
	line "gimnasio de Isla"
	cont "Canela"
	cont "desapareció."

	para "Me pregunto qué"
	line "fue de Blaine,"
	cont "el Líder."
	done

ViridianPokeCenter1FBugCatcherText:
	text "Mi sueño es ser"
	line "Líder de Gimnasio."
	done
