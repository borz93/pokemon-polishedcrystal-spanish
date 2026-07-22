RuinsOfAlphInnerChamber_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_RUINSOFALPHINNERCHAMBER_NOOP
	scene_script RuinsOfAlphInnerChamberStrangePresenceScene, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE

	def_callbacks

	def_warp_events
	warp_event 10, 13, RUINS_OF_ALPH_ENTRANCE_CHAMBER, 3
	warp_event  3, 15, RUINS_OF_ALPH_HO_OH_CHAMBER, 3
	warp_event  4, 15, RUINS_OF_ALPH_HO_OH_CHAMBER, 4
	warp_event 15,  3, RUINS_OF_ALPH_KABUTO_CHAMBER, 3
	warp_event 16,  3, RUINS_OF_ALPH_KABUTO_CHAMBER, 4
	warp_event  3, 21, RUINS_OF_ALPH_OMANYTE_CHAMBER, 3
	warp_event  4, 21, RUINS_OF_ALPH_OMANYTE_CHAMBER, 4
	warp_event 15, 24, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 3
	warp_event 16, 24, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 4

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  8,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 11,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 14,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 17,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  2,  8, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5,  8, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  8,  8, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 11,  8, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 14,  8, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 17,  8, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  2, 13, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5, 13, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 14, 13, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 17, 13, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  2, 18, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5, 18, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  8, 18, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 11, 18, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 14, 18, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 17, 18, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  2, 24, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5, 24, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  8, 24, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 11, 24, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 14, 24, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event 17, 24, BGEVENT_JUMPTEXT, RuinsofAlphStatueText

	def_object_events
	object_event  3,  7, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, RuinsOfAlphInnerChamberFisherText, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event 14, 14, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, RuinsOfAlphInnerChamberTeacherText, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event 11, 19, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RuinsOfAlphInnerChamberGrampsText, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event  7, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, RuinsOfAlphInnerChamberScientistText, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS

RuinsOfAlphInnerChamberStrangePresenceScene:
	sdefer .Script
	end

.Script:
	showtext RuinsOfAlphStrangePresenceText
	setscene SCENE_RUINSOFALPHINNERCHAMBER_NOOP
	setevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	digmod 5, RUINS_OF_ALPH_OUTSIDE
	end

RuinsOfAlphStrangePresenceText:
	text "Hay una presencia"
	line "extraña aquí…"
	done

RuinsOfAlphInnerChamberFisherText:
	text "Es una sala"
	line "grande, pero no"
	cont "hay nada aquí."
	done

RuinsOfAlphInnerChamberTeacherText:
	text "Este lugar tiene"
	line "algo místico."

	para "Hasta se siente"
	line "algo etéreo."
	done

RuinsOfAlphInnerChamberGrampsText:
	text "Las ruinas no han"
	line "sido robadas ni"
	cont "alteradas."

	para "Algo aquí debe"
	line "hacer que la gente"
	cont "quiera"
	cont "preservarlas."
	done

RuinsOfAlphInnerChamberScientistText:
	text "¡Los patrones de"
	line "la pared parecen"
	cont "palabras!"

	para "Y esos paneles de"
	line "piedra deslizantes"

	para "parecen ser"
	line "señales de algún"
	cont "tipo."

	para "Creo que hacen"
	line "aparecer #mon,"

	para "pero no está claro"
	line "aún…"
	done
