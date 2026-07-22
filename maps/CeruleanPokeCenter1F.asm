CeruleanPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, CERULEAN_CITY, 4
	warp_event  6,  7, CERULEAN_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalMistyScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  1,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanPokeCenter1FGymGuyScript, -1
	object_event  8,  4, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanPokeCenter1FSuperNerdText, -1

PokemonJournalMistyScript:
	setflag ENGINE_READ_MISTY_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: ¡Líder"
	cont "Misty!"

	para "Dicen que Misty"
	line "venera a Lorelei,"

	para "antigua miembro"
	line "del Alto Mando."
	done

CeruleanPokeCenter1FGymGuyScript:
	checkunits
	iftrue_jumptextfaceplayer .MetricText
	jumpthistextfaceplayer

	text "El Tren Imán"
	line "viaja a más de"

	para "340 mph. Va"
	line "entre Kanto y"
	cont "Johto"

	para "en un abrir y"
	line "cerrar de ojos."

	para "Eso hace que"
	line "Johto sea muy"
	cont "accesible."
	done

.MetricText:
	text "El Tren Imán"
	line "viaja a más de"

	para "550 km/h. Va"
	line "entre Kanto y"
	cont "Johto"

	para "en un abrir y"
	line "cerrar de ojos."

	para "Eso hace que"
	line "Johto sea muy"
	cont "accesible."
	done

CeruleanPokeCenter1FSuperNerdText:
	text "Para combatir,"
	line "prefiero usar"

	para "#mon que he"
	line "criado, aunque"

	para "sean más"
	line "débiles que uno"
	cont "#mon recién"
	cont "atrapado."
	done
