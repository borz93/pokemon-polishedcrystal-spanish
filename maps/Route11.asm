Route11_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 45,  8, ROUTE_11_GATE, 1
	warp_event 45,  9, ROUTE_11_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  5,  7, BGEVENT_JUMPTEXT, Route11SignText
	bg_event 44,  5, BGEVENT_ITEM + REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE

	def_object_events
	object_event 32, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterOwen, -1
	object_event 30,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterJason, -1
	object_event 21,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterAlfie, -1
	object_event 40,  7, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPsychicHerman, -1
	object_event 12,  6, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicFidel, -1
	object_event 24, 14, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicUri, -1
	object_event 38,  1, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerBernie, -1
	object_event 38, 14, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerCamden, -1
	object_event  9,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGuitaristmRoger, -1
	object_event 10, 16, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGuitaristfRitsuko, -1
	fruittree_event 44,  2, FRUITTREE_ROUTE_11, GANLON_BERRY, PAL_NPC_PURPLE
	tmhmball_event 44, 13, TM_VENOSHOCK, EVENT_ROUTE_11_TM_VENOSHOCK

GenericTrainerYoungsterOwen:
	generictrainer YOUNGSTER, OWEN, EVENT_BEAT_YOUNGSTER_OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText

	text "Luché limpio y"
	line "con honor."

	para "No me arrepiento"
	line "de nada."
	done

YoungsterOwenSeenText:
	text "No hay trampas en"
	line "los #mon."

	para "¡Mantengámoslo"
	line "limpio y justo!"
	done

YoungsterOwenBeatenText:
	text "¿Eh? ¿Cómo pasó"
	line "esto?"
	done

GenericTrainerYoungsterJason:
	generictrainer YOUNGSTER, JASON, EVENT_BEAT_YOUNGSTER_JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText

	text "Voy a atrapar más"
	line "#mon en la"
	cont "hierba."
	done

YoungsterJasonSeenText:
	text "Pica y hace"
	line "cosquillas un"

	para "poco al llevar"
	line "pantalón corto en"
	cont "la hierba."
	done

YoungsterJasonBeatenText:
	text "¡Ayayay!"
	line "¡Me aplastaron!"
	done

GenericTrainerYoungsterAlfie:
	generictrainer YOUNGSTER, ALFIE, EVENT_BEAT_YOUNGSTER_ALFIE, .SeenText, .BeatenText

	text "Todo es más"
	line "divertido cuando"
	cont "es competición."
	done

.SeenText:
	text "¡Tres, dos, uno,"
	line "YA!"
	done

.BeatenText:
	text "Juego, set y"
	line "partido."
	done

GenericTrainerPsychicHerman:
	generictrainer PSYCHIC_T, HERMAN, EVENT_BEAT_PSYCHIC_HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText

	text "…"

	para "Perdí con los ojos"
	line "cerrados…"
	done

PsychicHermanSeenText: ; text > text
PsychicHermanBeatenText:
	text "…"
	done

GenericTrainerPsychicFidel:
	generictrainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText

	text "Fuerza en la"
	line "convicción…"

	para "Eres fuerte porque"
	line "crees en tus"
	cont "#mon."
	done

PsychicFidelSeenText:
	text "Puedo verlo…"

	para "Todo lo que hay"
	line "que ver de ti…"
	done

PsychicFidelBeatenText:
	text "No pude prever tu"
	line "poder…"
	done

GenericTrainerPsychicUri:
	generictrainer PSYCHIC_T, URI, EVENT_BEAT_PSYCHIC_URI, .SeenText, .BeatenText

	text "El Prof.Oak no me"
	line "da una #dex."
	cont "¿Por qué será?"
	done

.SeenText:
	text "Pasó una mañana:"
	line "un chico con"
	cont "poderes psíquicos"
	cont "despertó en su"

	para "cama transformado"
	line "en Kadabra!"
	done

.BeatenText:
	text "¿Leyenda urbana?"
	line "¿Qué es eso?"
	done

GenericTrainerEngineerBernie:
	generictrainer ENGINEER, BERNIE, EVENT_BEAT_ENGINEER_BERNIE, .SeenText, .BeatenText

	text "¡Corre la voz de"
	line "ahorrar energía!"
	done

.SeenText:
	text "¡Cuidado! ¡Estoy"
	line "tendiendo unos"
	cont "cables!"
	done

.BeatenText:
	text "¡Eso fue"
	line "electrizante!"
	done

GenericTrainerEngineerCamden:
	generictrainer ENGINEER, CAMDEN, EVENT_BEAT_ENGINEER_CAMDEN, .SeenText, .BeatenText

	text "Construir un"
	line "puente y un"
	cont "equipo de #mon"

	para "requieren ambos"
	line "conocimiento y"
	cont "habilidad."
	done

.SeenText:
	text "¡Aprendí"
	line "ingeniería en la"
	cont "Universidad de"
	cont "Azulona!"
	done

.BeatenText:
	text "¡Apagado!"
	done

GenericTrainerGuitaristmRoger:
	generictrainer GUITARISTM, ROGER, EVENT_BEAT_GUITARISTM_ROGER, .SeenText, .BeatenText

	text "¡No te rindas sin"
	line "pelear!"
	done

.SeenText:
	text "Desconocidos"
	line "pasando por la"
	cont "calle,"

	para "por azar dos"
	line "miradas distintas"
	cont "se encuentran!"
	done

.BeatenText:
	text "¡Brilla, diamante"
	line "loco!"
	done

GenericTrainerGuitaristfRitsuko:
	generictrainer GUITARISTF, RITSUKO, EVENT_BEAT_GUITARISTF_RITSUKO, .SeenText, .BeatenText

	text "♪ Rock'n, rock'n'"
	line "roll radio… ♪"
	done

.SeenText:
	text "¡Eh ho, vamos!"
	done

.BeatenText:
	text "No hay éxito para"
	line "mí…"
	done

Route11SignText:
	text "Ruta 11"
	done
