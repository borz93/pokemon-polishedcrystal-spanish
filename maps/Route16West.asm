Route16West_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 37,  1, PSYCHIC_INVERS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 22,  7, BGEVENT_ITEM + RARE_CANDY, EVENT_ROUTE_16_WEST_HIDDEN_RARE_CANDY

	def_object_events
	object_event 56,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassGina, -1
	object_event 17,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerLassAlice, -1
	object_event  9, 10, SPRITE_COSPLAYER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCosplayerKuroko, -1
	object_event 40, 13, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerfSera, -1
	object_event  6,  4, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyNicole, -1
	itemball_event 42, 16, METRONOME_I, 1, EVENT_ROUTE_16_WEST_METRONOME
	itemball_event 50,  3, PP_UP, 1, EVENT_ROUTE_16_WEST_PP_UP
	itemball_event 21,  4, MAX_REVIVE, 1, EVENT_ROUTE_16_WEST_MAX_REVIVE
	cuttree_event 57,  4, EVENT_ROUTE_16_WEST_CUT_TREE
	cuttree_event 67,  3, EVENT_ROUTE_16_NORTH_CUT_TREE

GenericTrainerLassGina:
	generictrainer LASS, GINA, EVENT_BEAT_LASS_GINA, .SeenText, .BeatenText

	text "¡Mis sandalias"
	line "finas son taaan"
	cont "monas! ♥"
	done

.SeenText:
	text "¡Mira mi look"
	line "nuevo!"
	done

.BeatenText:
	text "Si hubiera"
	line "gastado en"
	cont "Pociones en vez"
	cont "de ropa…"
	done

GenericTrainerLassAlice:
	generictrainer LASS, ALICE, EVENT_BEAT_LASS_ALICE, .SeenText, .BeatenText

	text "En realidad soy"
	line "chico… ¡No se lo"
	cont "digas a nadie!"
	done

.SeenText:
	text "¡Nuestras miradas"
	line "se cruzaron!"

	para "¡Ahora debes salir"
	line "conmigo! ♥"

	para "No espera, quiero"
	line "decir, ¡debemos"
	cont "combatir!"
	done

.BeatenText:
	text "¿Cómo puedes ser"
	line "tan cruel?"
	done

GenericTrainerCosplayerKuroko:
	generictrainer COSPLAYER, KUROKO, EVENT_BEAT_COSPLAYER_KUROKO, .SeenText, .BeatenText

	text "Una vez un"
	line "entrenador me tiró"
	cont "una # Ball!"
	done

.SeenText:
	text "¿Ves qué realista"
	line "es mi cosplay?"
	done

.BeatenText:
	text "¡Es que no"
	line "aprecias el arte!"
	done

GenericTrainerCooltrainerfSera:
	generictrainer COOLTRAINERF, SERA, EVENT_BEAT_COOLTRAINERF_SERA, .SeenText, .BeatenText

	text "Salí vestida de"
	line "Cosplayer, pero"

	para "el traje de"
	line "Entr. Élite es"
	cont "más intimidante."
	done

.SeenText:
	text "¿Crees que puedes"
	line "conmigo?"
	done

.BeatenText:
	text "¡Felicidades! ♥"
	done

GenericTrainerBeautyNicole:
	generictrainer BEAUTY, BEAUTY_NICOLE, EVENT_BEAT_BEAUTY_NICOLE, .SeenText, .BeatenText

	text "Los #mon monos"
	line "también pueden"
	cont "ser fuertes!"
	done

.SeenText:
	text "¿A que mis #mon"
	line "son los más monos?"
	done

.BeatenText:
	text "Son monos hasta"
	line "debilitados…"
	done
