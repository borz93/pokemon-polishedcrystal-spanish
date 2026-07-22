Route34Coast_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7, 47, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermFrank, -1
	object_event 10, 21, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermNadar, -1
	object_event  7, 61, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSwimmermConrad, -1
	object_event  8, 43, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfCaroline, -1
	object_event  8,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfNatalia, -1
	object_event 12, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherFrancis, -1
	object_event  7, 32, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBird_keeperTony, -1
	object_event  3, 37, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_ITEMBALL, PLAYEREVENT_ITEMBALL, PEARL_STRING, 1, EVENT_ROUTE_34_COAST_PEARL_STRING

GenericTrainerSwimmermFrank:
	generictrainer SWIMMERM, FRANK, EVENT_BEAT_SWIMMERM_FRANK, .SeenText, .BeatenText

	text "Mar, arena, sol"
	line "y #mon!"

	para "¿Qué más podría"
	line "querer un tipo?"
	done

.SeenText:
	text "Estoy de"
	line "vacaciones con mi"
	cont "esposa, pero vale,"
	cont "te combatiré."
	done

.BeatenText:
	text "No me importa,"
	line "¡estoy de"
	cont "vacaciones!"
	done

TrainerSwimmermNadar:
	trainer SWIMMERM, NADAR, EVENT_BEAT_SWIMMERM_NADAR, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERM

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "¿Practico natación"
	line "o entreno con mis"
	cont "#mon?"

	para "Menudo dilema."
	done

.SeenText:
	text "¡La natación es mi"
	line "especialidad!"

	para "¡Los combates"
	line "#mon también!"
	done

.BeatenText:
	text "¿Perdí en mi"
	line "propia"
	cont "especialidad?"
	done

GenericTrainerSwimmermConrad:
	generictrainer SWIMMERM, CONRAD, EVENT_BEAT_SWIMMERM_CONRAD, .SeenText, .BeatenText

	text "Los rayos UV se"
	line "reflejan en las"
	cont "olas."

	para "Nunca olvides la"
	line "crema solar."
	done

.SeenText:
	text "Crema puesta,"
	line "gafas listas…"

	para "¡Estoy motivado"
	line "para las olas!"
	done

.BeatenText:
	text "¡Uf! Esta vez me"
	line "ganaron las olas."
	done

GenericTrainerSwimmerfCaroline:
	generictrainer SWIMMERF, CAROLINE, EVENT_BEAT_SWIMMERF_CAROLINE, .SeenText, .BeatenText

	text "Nos alojamos en"
	line "Ciudad Trigal,"
	cont "pero"

	para "esta Ruta es una"
	line "excursión"
	cont "encantadora!"
	done

.SeenText:
	text "Mi esposo y yo"
	line "estamos aquí de"
	cont "vacaciones."
	done

.BeatenText:
	text "¡Oh! Qué pena."
	done

GenericTrainerSwimmerfNatalia:
	generictrainer SWIMMERF, NATALIA, EVENT_BEAT_SWIMMERF_NATALIA, .SeenText, .BeatenText

	text "Creo que compré"
	line "el bikini"
	cont "equivocado."

	para "La verdad es que"
	line "no es mi color."
	done

.SeenText:
	text "Me compré un"
	line "bikini nuevo."

	para "Es lo último en"
	line "moda."
	done

.BeatenText:
	text "¡Bah!"
	done

GenericTrainerFisherFrancis:
	generictrainer FISHER, FRANCIS, EVENT_BEAT_FISHER_FRANCIS, .SeenText, .BeatenText

	text "No importa si gano"
	line "o pierdo."

	para "Solo quiero"
	line "divertirme y"
	cont "seguir pescando."
	done

.SeenText:
	text "Me gusta pescar"
	line "#mon en lugares"
	cont "exóticos."
	done

.BeatenText:
	text "¡Oh! ¡Qué gran"
	line "pesca!"
	done

GenericTrainerBird_keeperTony:
	generictrainer BIRD_KEEPER, BIRD_KEEPER_TONY, EVENT_BEAT_BIRD_KEEPER_TONY, .SeenText, .BeatenText

	text "Todo el mundo dice"
	line "que el pájaro es"
	cont "la palabra."
	done

.SeenText:
	text "¿Has oído hablar"
	line "del pájaro?"
	done

.BeatenText:
	text "¿No sabes lo del"
	line "pájaro?"
	done
