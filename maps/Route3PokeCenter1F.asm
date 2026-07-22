Route3PokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, ROUTE_3, 2
	warp_event  6,  7, ROUTE_3, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalKarenScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  9,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route3PokeCenter1FPokefanM1Text, -1
	object_event  2,  5, SPRITE_HIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route3PokeCenter1FPokefanM2Text, -1
	object_event 11,  3, SPRITE_CAMPER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route3PokeCenter1FYoungsterText, -1

PokemonJournalKarenScript:
	setflag ENGINE_READ_KAREN_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: Alto"
	cont "Mando Karen!"

	para "Dicen que Karen"
	line "empezó a"
	cont "entrenar #mon"
	cont "Siniestro"

	para "para superar su"
	line "mala reputación."
	done

Route3PokeCenter1FPokefanM1Text:
	text "Hace unos años"
	line "vendí un"

	para "Magikarp raro a"
	line "este chico…"

	para "Pensé que algo"
	line "iba mal con él."

	para "Resultó ser un"
	line "raro #mon"
	cont "shiny!"

	para "¡Podría haber"
	line "ganado más"
	cont "dinero!"
	done

Route3PokeCenter1FPokefanM2Text:
	text "Recuerdo que no"
	line "había nada"

	para "construido aquí"
	line "cuando subí."

	para "Ahora es más"
	line "cómodo."
	done

Route3PokeCenter1FYoungsterText:
	text "Hay muchos"
	line "entrenadores en"
	cont "la montaña."

	para "Y muchos #mon"
	line "salvajes."

	para "Nunca sabes con"
	line "quién o qué te"
	cont "toparás."
	done
