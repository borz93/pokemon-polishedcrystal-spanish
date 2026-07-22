UnionCaveB1FNorth_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  3, RUINS_OF_ALPH_OUTSIDE, 8
	warp_event  3, 11, RUINS_OF_ALPH_OUTSIDE, 9
	warp_event 15, 23, UNION_CAVE_1F, 1

	def_coord_events

	def_bg_events
	bg_event 11, 23, BGEVENT_ITEM + X_SPEED, EVENT_UNION_CAVE_B1F_NORTH_HIDDEN_X_SPEED
	bg_event 13,  4, BGEVENT_ITEM + REVIVE, EVENT_UNION_CAVE_B1F_NORTH_HIDDEN_REVIVE

	def_object_events
	object_event  9,  4, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRuin_maniacLeland, -1
	object_event 13, 10, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerRuin_maniacPetry, -1
	tmhmball_event  5, 22, TM_SWIFT, EVENT_UNION_CAVE_B1F_NORTH_TM_SWIFT
	itemball_event 17, 21, X_DEFEND, 1, EVENT_UNION_CAVE_B1F_NORTH_X_DEFEND
	strengthboulder_event  7, 10

GenericTrainerRuin_maniacLeland:
	generictrainer RUIN_MANIAC, LELAND, EVENT_BEAT_RUIN_MANIAC_LELAND, .SeenText, .BeatenText

	text "Algún día"
	line "descubriré una"
	cont "nueva ruina y"
	cont "seré famoso."
	done

.SeenText:
	text "¡Sigo la pista"
	line "de un yacimiento"
	cont "antiguo!"
	done

.BeatenText:
	text "Me distrajeron"
	line "las pistas que"
	cont "dejaron los"
	cont "antiguos."
	done

GenericTrainerRuin_maniacPetry:
	generictrainer RUIN_MANIAC, PETRY, EVENT_BEAT_RUIN_MANIAC_PETRY, .SeenText, .BeatenText

	text "La historia"
	line "antigua es mi"
	cont "pasión,"

	para "pero para"
	line "investigarla bien"
	cont "usamos tecnología"
	cont "moderna."
	done

.SeenText:
	text "Iré a cualquier"
	line "lugar para"
	cont "investigar viejos"
	cont "secretos y mitos."
	done

.BeatenText:
	text "¿Cuál es el"
	line "secreto de tu"
	cont "poder?"
	done
