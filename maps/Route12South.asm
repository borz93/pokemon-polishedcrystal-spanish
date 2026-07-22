Route12South_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11, 57, ROUTE_12_SUPER_ROD_HOUSE, 1
	warp_event  0, 42, ROUTE_11_GATE, 3
	warp_event  0, 43, ROUTE_11_GATE, 4
	warp_event 10,  1, ROUTE_12_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 11, 43, BGEVENT_JUMPTEXT, Route12SignText
	bg_event 14, 15, BGEVENT_ITEM + ELIXIR, EVENT_ROUTE_12_HIDDEN_ELIXIR

	def_object_events
	object_event  7,  7, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherMartin, -1
	object_event 14, 33, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherStephen, -1
	object_event 12, 63, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerFisherBarney, -1
	object_event 10, 74, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherKyler, -1
	object_event 10, 24, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperJustin, -1
	object_event  7, 57, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBird_keeperGail, -1
	object_event 10, 39, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleVicandtara1, -1
	object_event 10, 38, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleVicandtara2, -1
	object_event 14, 89, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	itemball_event  5, 68, CALCIUM, 1, EVENT_ROUTE_12_CALCIUM
	itemball_event  5, 82, NUGGET, 1, EVENT_ROUTE_12_NUGGET
	cuttree_event  6, 71, EVENT_ROUTE_12_CUT_TREE_1
	cuttree_event  9, 79, EVENT_ROUTE_12_CUT_TREE_2

GenericTrainerFisherMartin:
	generictrainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText

	text "Soy demasiado"
	line "impaciente para"
	cont "pescar…"
	done

FisherMartinSeenText:
	text "La paciencia es la"
	line "clave tanto en la"
	cont "pesca como en"
	cont "#mon."
	done

FisherMartinBeatenText:
	text "¡Gwaaah!"
	done

GenericTrainerFisherStephen:
	generictrainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText

	text "¿Has escuchado la"
	line "radio de Kanto?"

	para "Tenemos buena"
	line "variedad aquí."
	done

FisherStephenSeenText:
	text "Me siento tan a"
	line "gusto pescando"
	cont "mientras escucho"
	cont "mi radio."
	done

FisherStephenBeatenText:
	text "¡Mi estúpida radio"
	line "me distrajo!"
	done

GenericTrainerFisherBarney:
	generictrainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText

	text "Creo que la"
	line "electricidad es lo"

	para "más importante en"
	line "nuestra vida"
	cont "diaria."

	para "Si no lo fuera,"
	line "la gente no habría"

	para "montado tal"
	line "escándalo cuando"

	para "la Central"
	line "Eléctrica dejó de"
	cont "funcionar."
	done

FisherBarneySeenText:
	text "¿Qué es lo más"
	line "importante en"
	cont "nuestra vida"
	cont "diaria?"
	done

FisherBarneyBeatenText:
	text "¡La respuesta"
	line "viene a"
	cont "continuación!"
	done

GenericTrainerFisherKyler:
	generictrainer FISHER, KYLER, EVENT_BEAT_FISHER_KYLER, .SeenText, .BeatenText

	text "¿En serio? ¿Mejor"
	line "que capturar"
	cont "#mon nuevos"
	cont "siempre,"

	para "es bueno"
	line "entrenarlos?"
	done

.SeenText:
	text "¡Los combates"
	line "#mon atraen a"
	cont "la gente!"
	done

.BeatenText:
	text "¡Mi cubo de"
	line "#mon está"
	cont "vacío!"
	done

GenericTrainerBird_keeperJustin:
	generictrainer BIRD_KEEPER, BIRD_KEEPER_JUSTIN, EVENT_BEAT_BIRD_KEEPER_JUSTIN, .SeenText, .BeatenText

	text "Como el viento ha"
	line "cambiado, me"
	cont "quedaré quieto…"
	done

.SeenText:
	text "¿Eh? ¡El viento ha"
	line "cambiado de"
	cont "dirección!"
	done

.BeatenText:
	text "Uf…"
	done

GenericTrainerBird_keeperGail:
	generictrainer BIRD_KEEPER, GAIL, EVENT_BEAT_BIRD_KEEPER_GAIL, .SeenText, .BeatenText

	text "¿Chuun-Chuun?"
	line "¡Chunchun!"
	done

.SeenText:
	text "BASABASABASA-"
	line "BASABASA!"
	done

.BeatenText:
	text "Pyopyopyopyo…"
	done

GenericTrainerCoupleVicandtara1:
	generictrainer COUPLE, VICANDTARA1, EVENT_BEAT_COUPLE_VIC_AND_TARA, .SeenText, .BeatenText

	text "Vic: Tara ya me"
	line "vio humillado…"
	done

.SeenText:
	text "Vic: ¡Muy bien!"
	line "¡Podré lucirme"
	cont "ante Tara!"
	done

.BeatenText:
	text "Vic: Oh no, ¡mis"
	line "planes!"
	done

GenericTrainerCoupleVicandtara2:
	generictrainer COUPLE, VICANDTARA2, EVENT_BEAT_COUPLE_VIC_AND_TARA, .SeenText, .BeatenText

	text "Tara: Aunque mi"
	line "novio perdió,"
	cont "sigue siendo"
	cont "maravilloso."
	done

.SeenText:
	text "Tara: Me encanta"
	line "mirar la cara de"
	cont "mi novio mientras"
	cont "combate!"
	done

.BeatenText:
	text "Tara: Oh no,"
	line "oh no…"
	done

Route12SignText:
	text "Ruta 12"

	para "Norte a Pueblo"
	line "Lavanda"
	done
