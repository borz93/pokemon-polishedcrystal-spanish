UnionCaveB1FSouth_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, UNION_CAVE_1F, 2
	warp_event 17,  3, UNION_CAVE_B2F, 1
	warp_event  5, 33, MURKY_SWAMP, 3
	warp_event 17, 23, ROUTE_32_COAST, 1

	def_coord_events

	def_bg_events
	bg_event  2, 18, BGEVENT_ITEM + X_SP_DEF, EVENT_UNION_CAVE_B1F_SOUTH_HIDDEN_X_SP_DEF
	bg_event 12, 25, BGEVENT_ITEM + NUGGET, EVENT_UNION_CAVE_B1F_SOUTH_HIDDEN_NUGGET
	bg_event  4, 30, BGEVENT_ITEM + FULL_RESTORE, EVENT_UNION_CAVE_B1F_SOUTH_HIDDEN_FULL_RESTORE

	def_object_events
	object_event  5,  4, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokemaniacAndrew, -1
	object_event 17,  2, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokemaniacCalvin, -1
	object_event 16, 13, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerPhillip, -1
	object_event 14, 30, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerLeonard, -1
	object_event  3, 20, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerFirebreatherJay, -1
	object_event  7, 30, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSuper_nerdRory, -1
	object_event 12, 17, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRuin_maniacGlyn, -1
	strengthboulder_event 14, 4
	strengthboulder_event  8, 32
	smashrock_event 11, 15
	smashrock_event 12, 24
	itemball_event 14, 20, DUSK_STONE, 1, EVENT_UNION_CAVE_B1F_SOUTH_DUSK_STONE
	itemball_event  8, 26, SUPER_REPEL, 1, EVENT_UNION_CAVE_B1F_SOUTH_SUPER_REPEL
	itemball_event  2, 28, LIGHT_CLAY, 1, EVENT_UNION_CAVE_B1F_SOUTH_LIGHT_CLAY

GenericTrainerPokemaniacAndrew:
	generictrainer POKEMANIAC, ANDREW, EVENT_BEAT_POKEMANIAC_ANDREW, PokemaniacAndrewSeenText, PokemaniacAndrewBeatenText

	text "Solo yo y mis"
	line "#mon. Estoy"
	cont "loco de alegría."
	done

PokemaniacAndrewSeenText:
	text "¿Quién anda ahí?"

	para "¡Déjanos en paz"
	line "a mí y a mis"
	cont "#mon!"
	done

PokemaniacAndrewBeatenText:
	text "Vete…"
	line "¡Vete ya!"
	done

GenericTrainerPokemaniacCalvin:
	generictrainer POKEMANIAC, CALVIN, EVENT_BEAT_POKEMANIAC_CALVIN, PokemaniacCalvinSeenText, PokemaniacCalvinBeatenText

	text "Debería recopilar"
	line "y anunciar mis"
	cont "hallazgos."

	para "Quizá hasta me"
	line "haga famoso como"
	cont "el Prof.Elm."
	done

PokemaniacCalvinSeenText:
	text "Vine hasta aquí"
	line "para hacer mi"
	cont "investigación"
	cont "#mon."

	para "¡Déjame demostrar"
	line "mis hallazgos en"
	cont "un combate real!"
	done

PokemaniacCalvinBeatenText:
	text "¡Me lo"
	line "demostraste a mí!"
	done

GenericTrainerHikerPhillip:
	generictrainer HIKER, PHILLIP, EVENT_BEAT_HIKER_PHILLIP, HikerPhillipSeenText, HikerPhillipBeatenText

	text "Llevo perdido"
	line "mucho tiempo…"

	para "¡No me importa"
	line "estar aquí, pero"
	cont "tengo muchísima"
	cont "hambre!"
	done

HikerPhillipSeenText:
	text "Ha pasado tiempo"
	line "desde que vi a"
	cont "otra persona."

	para "No seas tímido."
	line "¡Combatamos!"
	done

HikerPhillipBeatenText:
	text "Uurggh…"
	done

GenericTrainerHikerLeonard:
	generictrainer HIKER, LEONARD, EVENT_BEAT_HIKER_LEONARD, HikerLeonardSeenText, HikerLeonardBeatenText

	text "Vivo aquí abajo."

	para "Tú también"
	line "podrías, si"
	cont "quisieras."

	para "Hay sitio de"
	line "sobra, ¿Sabes?"
	done

HikerLeonardSeenText:
	text "¡Vaya, vaya!"
	line "¡Un visitante!"
	done

HikerLeonardBeatenText:
	text "¡Jajaja! ¡Eres"
	line "un hueso duro!"
	done

GenericTrainerFirebreatherJay:
	generictrainer FIREBREATHER, JAY, EVENT_BEAT_FIREBREATHER_JAY, .SeenText, .BeatenText

	text "Una vez se me"
	line "incendió el"
	cont "sombrero."

	para "Parecía un Magmar…"
	line "¡pero dolió!"
	done

.SeenText:
	text "¡Aprendí a echar"
	line "fuego observando"
	cont "a mi #mon!"
	done

.BeatenText:
	text "Nuestro fuego no"
	line "pudo vencerte…"
	done

GenericTrainerSuper_nerdRory:
	generictrainer SUPER_NERD, RORY, EVENT_BEAT_SUPER_NERD_RORY, .SeenText, .BeatenText

	text "Un santiamén es"
	line "el nombre"
	cont "científico de la"
	cont "centésima de"
	cont "segundo."
	done

.SeenText:
	text "Esto acabará en"
	line "un santiamén."
	done

.BeatenText:
	text "Quizá me"
	line "equivoqué un"
	cont "poco…"
	done

GenericTrainerRuin_maniacGlyn:
	generictrainer RUIN_MANIAC, GLYN, EVENT_BEAT_RUIN_MANIAC_GLYN, .SeenText, .BeatenText

	text "Las rocas"
	line "esconden todo"
	cont "tipo de objetos"
	cont "interesantes."
	done

.SeenText:
	text "¡Mis #mon"
	line "nacieron de"
	cont "fósiles que"

	para "encontré en esta"
	line "misma cueva!"
	done

.BeatenText:
	text "¡Y perdieron en"
	line "esta misma"
	cont "cueva, también!"
	done
