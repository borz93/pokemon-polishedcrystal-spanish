Route19_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route19ClearSmashRocks
	callback MAPCALLBACK_TILES, Route19ClearRocks

	def_warp_events
	warp_event  7,  1, ROUTE_19_FUCHSIA_GATE, 3
	warp_event  5, 13, ROUTE_19_BEACH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 11, 15, BGEVENT_JUMPTEXT, Route19SignText
	bg_event 11, -1, BGEVENT_JUMPTEXT, CarefulSwimmingSignText
	bg_event  5,  3, BGEVENT_ITEM + REVIVE, EVENT_ROUTE_19_HIDDEN_REVIVE
	bg_event  3, 11, BGEVENT_ITEM + MAX_REVIVE, EVENT_ROUTE_19_HIDDEN_MAX_REVIVE
	bg_event  5, 15, BGEVENT_ITEM + PEARL, EVENT_ROUTE_19_HIDDEN_PEARL
	bg_event 13, 13, BGEVENT_ITEM + BIG_PEARL, EVENT_ROUTE_19_HIDDEN_BIG_PEARL

	def_object_events
	smashrock_event 11,  4, EVENT_ROUTE_19_ROCK
	smashrock_event  6, 3
	smashrock_event  4, 11
	smashrock_event 12, 13
	smashrock_event 13, 14
	object_event  8, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfDawn, -1
	object_event  9, 34, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSwimmermTucker, -1
	object_event 11, 20, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermJerome, -1
	object_event 13, 43, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermHarold, -1
	object_event 13, 51, SPRITE_COSPLAYER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCosplayerBrooke, -1
	object_event  9,  3, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route19Fisher1Script, -1
	object_event 11,  3, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19Fisher2Script, -1
	tmhmball_event 14, 52, TM_SCALD, EVENT_ROUTE_19_TM_SCALD

	object_const_def
	const ROUTE19_ROCK1

Route19ClearSmashRocks:
	disappear ROUTE19_ROCK1
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iffalsefwd .Done
	appear ROUTE19_ROCK1
.Done:
	endcallback

Route19ClearRocks:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftruefwd .Done
	changeblock 6, 4, $7a
	changeblock 8, 4, $7a
	changeblock 10, 4, $7a
	changeblock 6, 6, $7a
	changeblock 12, 6, $7a
	changeblock 8, 8, $7a
.Done:
	endcallback

GenericTrainerSwimmerfDawn:
	generictrainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText

	text "Es un nado rápido"
	line "entre Fucsia y"

	para "las Islas Espuma…"

	para "Vaya, qué gallina"
	line "es mi novio."
	cont "¡Qué blandengue!"
	done

GenericTrainerSwimmermTucker:
	generictrainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText

	text "Le… pedí a mi"
	line "novia que nadara"
	cont "a Fucsia…"
	cont "Jadeo…"
	done

GenericTrainerSwimmermJerome:
	generictrainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText

	text "Quizá sea malo"
	line "nadando, pero amo"
	cont "el mar."
	done

GenericTrainerSwimmermHarold:
	generictrainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText

	text "De noche, el mar"
	line "se vuelve negro."

	para "Se siente como si"
	line "fuera a"
	cont "tragarte."
	done

GenericTrainerCosplayerBrooke:
	generictrainer COSPLAYER, BROOKE, EVENT_BEAT_COSPLAYER_BROOKE, CosplayerBrookeSeenText, CosplayerBrookeBeatenText

	text "Hice este traje"
	line "para una fiesta"
	cont "elegante, pero me"

	para "gusta tanto que lo"
	line "uso también en"
	cont "otros sitios."
	done

Route19Fisher1Script:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iffalse_jumptextfaceplayer Route19Fisher1Text
	jumpthistextfaceplayer

	text "Estoy todo"
	line "sudado. ¡Hora de"
	cont "nadar!"
	done

Route19Fisher2Script:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iffalse_jumptextfaceplayer Route19EngineerText1
	jumpthistextfaceplayer

	text "Las obras por fin"
	line "terminaron."

	para "Ahora puedo"
	line "volver a pescar."
	done

SwimmerfDawnSeenText:
	text "¡Me da asco la"
	line "gente blandengue!"
	done

SwimmerfDawnBeatenText:
	text "Podría ganarte"
	line "nadando…"
	done

SwimmermTuckerSeenText:
	text "Jadeo, jadeo…"
	line "Solo… un poco…"

	para "más… hasta…"
	line "Fucsia…"
	done

SwimmermTuckerBeatenText:
	text "¡Me ahogo!"
	done

SwimmermJeromeSeenText:
	text "¿Nadar?"
	line "Se me da fatal."

	para "Solo estoy"
	line "chapoteando en"
	cont "estas aguas poco"
	cont "profundas."
	done

SwimmermJeromeBeatenText:
	text "Pensé que podría"
	line "ganar."
	done

SwimmermHaroldSeenText:
	text "¿Alguna vez has"
	line "nadado en el mar"
	cont "de noche?"
	done

SwimmermHaroldBeatenText: ; text > text
	text "Glub…"
	done

CosplayerBrookeSeenText:
	text "¡Disfrazarse es"
	line "tan divertido!"
	done

CosplayerBrookeBeatenText:
	text "¡Más te vale no"
	line "haber dañado mi"
	cont "traje!"
	done

Route19Fisher1Text:
	text "Lo siento. Esta"
	line "carretera está"
	cont "cerrada por obras."

	para "Si quieres llegar"
	line "a Isla Canela,"

	para "mejor ve al sur"
	line "desde Pueblo"
	cont "Paleta."
	done


Route19EngineerText1:
	text "Quién sabe cuánto"
	line "tardaría en mover"
	cont "esta roca…"
	done


Route19SignText:
	text "Ruta 19"

	para "Ciudad Fucsia -"
	line "Islas Espuma"
	done

CarefulSwimmingSignText:
	text "Ten cuidado si"
	line "nadas hacia las"
	cont "Islas Espuma."

	para "Policía de Fucsia"
	done
