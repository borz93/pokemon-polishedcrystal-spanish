CopycatsHouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 8
	warp_event  3,  7, SAFFRON_CITY, 8
	warp_event  3,  0, COPYCATS_HOUSE_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CopycatsHouse1FPokefanMText, -1
	object_event  5,  4, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FPokefanFScript, -1
	pokemon_event  4,  5, BLISSEY, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, CopycatsHouse1FBlisseyText, -1

CopycatsHouse1FPokefanMText:
	text "A mi hija le gusta"
	line "imitar a la gente."

	para "Por eso, aquí le"
	line "pusieron el"

	para "apodo de"
	line "Copiona."
	done

CopycatsHouse1FPokefanFScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "Mi hija es tan"
	line "egocéntrica…"

	para "Solo tiene unas"
	line "pocas amigas."
	done

.Text2:
	text "Hace poco perdió"
	line "el #Muñeco que"

	para "le dio un chico"
	line "hace tres años."

	para "Desde entonces,"
	line "se le da aún"
	cont "mejor imitar…"
	done

CopycatsHouse1FBlisseyText:
	text "Blissey: ¡Bliisii!"
	done
