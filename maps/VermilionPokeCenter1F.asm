VermilionPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, VERMILION_CITY, 2
	warp_event  6,  7, VERMILION_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalLtSurgeScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  8,  2, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPokeCenter1FSightseerMScript, -1
	object_event  2,  5, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionPokeCenter1FSailorText, -1
	object_event  9,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionPokeCenter1FBugCatcherText, -1

PokemonJournalLtSurgeScript:
	setflag ENGINE_READ_LT_SURGE_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: ¡Líder"
	cont "Teniente Surge!"

	para "Dicen que fue"
	line "piloto en su"
	cont "país, América."

	para "Usaba la"
	line "electricidad"
	cont "generada por"
	cont "#mon para su"
	cont "avión."
	done

VermilionPokeCenter1FSightseerMScript:
	checkevent EVENT_VERMILION_CITY_SNORLAX
	iftrue_jumptextfaceplayer .SnorlaxText
	jumpthistextfaceplayer

	text "Hay un #mon"
	line "dormido tumbado"
	cont "frente a la"
	cont "Cueva Diglett."

	para "Es una"
	line "oportunidad"
	cont "fantástica,"

	para "¿pero cómo lo"
	line "despiertas?"
	done

.SnorlaxText:
	text "Antes había un"
	line "#mon dormido"

	para "tumbado frente a"
	line "la Cueva Diglett."

	para "Pero parece"
	line "haber"
	cont "desaparecido."
	done

VermilionPokeCenter1FSailorText:
	text "El Barco Rápido"
	line "es un buen sitio"

	para "para conocer y"
	line "combatir."
	done

VermilionPokeCenter1FBugCatcherText:
	text "¿Eh? Tienes"
	line "medallas que"
	cont "nunca había visto"
	cont "antes."

	para "Ah, ya veo. Las"
	line "conseguiste en"
	cont "Johto."
	done
