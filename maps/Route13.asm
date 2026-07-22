Route13_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 35, 13, BGEVENT_JUMPTEXT, Route13TrainerTips1Text
	bg_event 53,  5, BGEVENT_JUMPTEXT, Route13TrainerTips2Text
	bg_event 51, 11, BGEVENT_JUMPTEXT, Route13SignText
	bg_event 17, 13, BGEVENT_JUMPTEXT, Route13DirectionsSignText
	bg_event 36, 13, BGEVENT_ITEM + CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM
	bg_event  5, 15, BGEVENT_ITEM + OVAL_STONE, EVENT_ROUTE_13_HIDDEN_OVAL_STONE

	def_object_events
	object_event  5,  5, SPRITE_CAMPER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCamperClark, -1
	object_event 16,  6, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPicnickerGinger, -1
	object_event 60, 11, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerBird_keeperPerry, -1
	object_event 64,  1, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperBret, -1
	object_event 34,  5, SPRITE_CAMPER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCamperTanner, -1
	object_event 65,  9, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPicnickerPiper, -1
	object_event 52,  6, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleTimandsue1, -1
	object_event 53,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleTimandsue2, -1
	object_event 38,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokefanmJoshua, -1
	object_event 14, 10, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerHikerKenny, -1
	object_event 25,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPokefanmAlex, -1
	object_event 21, 13, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route13GrampsScript, -1
	cuttree_event 54,  4, EVENT_ROUTE_13_CUT_TREE

Route13GrampsScript:
	special CheckIfTrendyPhraseIsLucky
	iftruefwd .lucky
	jumpthistextfaceplayer

	text "No veo la Isla"
	line "Suerte hoy…"

	para "¡Pero sé que ha"
	line "aparecido antes!"
	done

.lucky
	jumpthistextfaceplayer

	text "¡Hoy veo la Isla"
	line "Suerte!"
	cont "¡Qué espectáculo!"
	done

GenericTrainerCamperClark:
	generictrainer CAMPER, CLARK, EVENT_BEAT_CAMPER_CLARK, .SeenText, .BeatenText

	text "No importa qué"
	line "tipo de"
	cont "preparación"
	cont "hicieras."

	para "Si pierdes,"
	line "pierdes."
	done

.SeenText:
	text "¡Recoge agua!"
	line "¡No dejes que se"
	cont "apague el fuego!"

	para "¡Cuidado con los"
	line "#mon salvajes!"

	para "¡Vamos,"
	line "Hoguera!"
	done

.BeatenText:
	text "Pfuuuuhh…"
	done

GenericTrainerPicnickerGinger:
	generictrainer PICNICKER, GINGER, EVENT_BEAT_PICNICKER_GINGER, .SeenText, .BeatenText

	text "¡Puedes"
	line "comunicarte con"
	cont "#mon silbando,"
	cont "en vez de con"
	cont "palabras!"
	done

.SeenText:
	text "¿Por qué siempre"
	line "me dan ganas de"
	cont "silbar al aire"
	cont "libre?"
	done

.BeatenText:
	text "¡Tuiiii!"
	done

GenericTrainerBird_keeperPerry:
	generictrainer BIRD_KEEPER, PERRY, EVENT_BEAT_BIRD_KEEPER_PERRY, Bird_keeperPerrySeenText, Bird_keeperPerryBeatenText

	text "Tus #mon están"
	line "notablemente bien"
	cont "entrenados."
	done

Bird_keeperPerrySeenText:
	text "La Agilidad es el"
	line "atributo clave de"
	cont "los #mon ave."
	done

Bird_keeperPerryBeatenText:
	text "Me venciste con tu"
	line "velocidad…"
	done

GenericTrainerBird_keeperBret:
	generictrainer BIRD_KEEPER, BRET, EVENT_BEAT_BIRD_KEEPER_BRET, Bird_keeperBretSeenText, Bird_keeperBretBeatenText

	text "Si los acicalas,"
	line "los #mon se"
	cont "ponen contentos."
	done

Bird_keeperBretSeenText:
	text "Mira mis #mon."
	line "Fíjate en su"

	para "color y su"
	line "plumaje."
	done

Bird_keeperBretBeatenText:
	text "¡Caramba!"
	line "¡No fue"
	cont "suficiente!"
	done

GenericTrainerCamperTanner:
	generictrainer CAMPER, TANNER, EVENT_BEAT_CAMPER_TANNER, .SeenText, .BeatenText

	text "Pensé que sería"
	line "fácil dejarte"
	cont "fuera de combate…"
	done

.SeenText:
	text "¡Puedo encajar un"
	line "combate rápido"
	cont "mientras preparo"
	cont "una comida!"
	done

.BeatenText:
	text "Oh, tengo"
	line "hambre…"
	done

GenericTrainerPicnickerPiper:
	generictrainer PICNICKER, PIPER, EVENT_BEAT_PICNICKER_PIPER, .SeenText, .BeatenText

	text "La forma en que"
	line "caminabas me hizo"
	cont "pensar que podría"
	cont "ganar."
	done

.SeenText:
	text "¿Qué tal si"
	line "sacamos a tus"

	para "#mon y a los"
	line "míos para un"
	cont "combate?"
	done

.BeatenText:
	text "Oh, qué mala"
	line "suerte…"
	done

GenericTrainerCoupleTimandsue1:
	generictrainer COUPLE, TIMANDSUE1, EVENT_BEAT_COUPLE_TIM_AND_SUE, .SeenText, .BeatenText

	text "Tim: Si la"
	line "venciste, ¡debes"
	cont "ser fuerte!"
	done

.SeenText:
	text "Tim: Te daré una"
	line "pequeña pista."

	para "¡Mi novia es más"
	line "fuerte que yo!"
	done

.BeatenText:
	text "Tim: ¡Eres el más"
	line "fuerte!"
	done

GenericTrainerCoupleTimandsue2:
	generictrainer COUPLE, TIMANDSUE2, EVENT_BEAT_COUPLE_TIM_AND_SUE, .SeenText, .BeatenText

	text "Sue: Esa fuerza"
	line "tuya…"
	cont "¡Yo la tengo!"

	para "¿Estás enamorado?"
	done

.SeenText:
	text "Sue: Las mujeres"
	line "que no se toman"

	para "en serio el amor"
	line "podrían salir"
	cont "heridas."
	done

.BeatenText:
	text "Sue: Ja ja…"
	done

GenericTrainerPokefanmAlex:
	generictrainer POKEFANM, ALEX, EVENT_BEAT_POKEFANM_ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText

	text "¿No desea todo"
	line "el mundo ser rey"
	cont "algún día?"
	done

PokefanmAlexSeenText:
	text "¡Inclínate ante mi"
	line "#mon real!"
	done

PokefanmAlexBeatenText:
	text "¡Cómo… Cómo te"
	line "atreves a burlarte"
	cont "de la realeza!"
	done

GenericTrainerPokefanmJoshua:
	generictrainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText

	text "Parece que tienes"
	line "muchos #mon,"

	para "pero Pikachu sigue"
	line "siendo el mejor."
	done

PokefanmJoshuaSeenText:
	text "¡Nijiji! ¿Quieres"
	line "combatir contra mi"
	cont "banda de Pikachu?"
	done

PokefanmJoshuaBeatenText:
	text "¡Pi-Pikachu!"
	done

GenericTrainerHikerKenny:
	generictrainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText

	text "Las formaciones"
	line "geológicas no"
	cont "parecen cambiar."

	para "Pero en realidad"
	line "cambian, poco a"
	cont "poco."
	done

HikerKennySeenText:
	text "Debería ir al"
	line "Túnel Roca a por"
	cont "un Onix."
	done

HikerKennyBeatenText:
	text "Perdí…"
	done

Route13TrainerTips1Text:
	text "Consejos de"
	line "entrenador"

	para "¡Mira! Justo ahí,"
	line "al lado izquierdo"
	cont "del poste."
	done

Route13TrainerTips2Text:
	text "Consejos de"
	line "entrenador"

	para "Algunos #mon"
	line "necesitan objetos"
	cont "para evolucionar."

	para "Si tienes suerte,"
	line "un #mon salvaje"

	para "¡puede llevar su"
	line "propio objeto de"
	cont "evolución!"
	done

Route13SignText:
	text "Ruta 13"

	para "Norte hacia el"
	line "Puente Silencio"
	done

Route13DirectionsSignText:
	text "Norte hacia Pueblo"
	line "Lavanda"

	para "Oeste hacia Ciudad"
	line "Fucsia"
	done
