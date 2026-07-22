CherrygrovePokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, CHERRYGROVE_CITY, 2
	warp_event  6,  7, CHERRYGROVE_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalRedScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  1,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygrovePokeCenter1FTeacherScript, -1
	object_event  8,  1, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygrovePokeCenter1FFisherText, -1
	object_event 11,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygrovePokeCenter1FGentlemanText, -1
	object_event  9,  4, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygrovePokeCenter1FLadyText, -1

PokemonJournalRedScript:
	setflag ENGINE_READ_RED_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje"
	line "especial: ¡el"
	cont "Entrenador Red!"

	para "Dicen que Red"
	line "venció a su rival"

	para "Blue por el título"
	line "de Campeón de la"
	cont "Liga #mon"
	cont "en récord de"
	cont "tiempo."
	done

CherrygrovePokeCenter1FTeacherScript:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "El Centro de"
	line "Comunicación de"
	cont "arriba se acaba"
	cont "de construir."

	para "Pero todavía lo"
	line "están terminando."
	done

.Text2:
	text "El Centro de"
	line "Comunicación de"
	cont "arriba se acaba"
	cont "de construir."

	para "¡Ya he"
	line "intercambiado"
	cont "#mon allí!"
	done

CherrygrovePokeCenter1FFisherText:
	text "Es genial. Puedo"
	line "guardar cualquier"
	cont "cantidad de"
	cont "#mon, y es"
	cont "todo gratis."
	done

CherrygrovePokeCenter1FGentlemanText:
	text "Ese PC es gratis"
	line "para cualquier"
	cont "entrenador."
	done

CherrygrovePokeCenter1FLadyText:
	text "La Revista #mon"
	line "tiene historias"
	cont "fascinantes!"

	para "Vengo a los"
	line "Centros #mon"
	cont "por los últimos"
	cont "números, pero no"

	para "es el único sitio"
	line "con suscripción."
	done
