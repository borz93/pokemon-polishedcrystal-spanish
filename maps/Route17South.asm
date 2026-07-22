Route17South_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route17SouthAlwaysOnBikeCallback

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 11, 69, BGEVENT_ITEM + MAX_ETHER, EVENT_ROUTE_17_SOUTH_HIDDEN_MAX_ETHER
	bg_event 10, 121, BGEVENT_ITEM + MAX_ELIXIR, EVENT_ROUTE_17_SOUTH_HIDDEN_MAX_ELIXIR
	bg_event  9, 62, BGEVENT_JUMPTEXT, Route17SouthNotice1Text
	bg_event  9, 69, BGEVENT_JUMPTEXT, Route17SouthTrainerTips1Text
	bg_event  9, 92, BGEVENT_JUMPTEXT, Route17SouthTrainerTips2Text
	bg_event  9, 99, BGEVENT_JUMPTEXT, Route17SouthNotice2Text

	def_object_events
	object_event 12,  7, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBikerDale, -1
	object_event  4, 15, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBikerReilly, -1
	object_event 18, 22, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBikerJacob, -1
	object_event  2, 35, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBikerDan, -1
	object_event  3, 54, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBikerGlenn, -1
	object_event 11, 63, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBikerJoel, -1
	object_event 13, 70, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBikerAiden, -1
	object_event  3, 84, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBikerTeddy, -1
	object_event  6, 126, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1, 27, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRoughneckBrian, -1
	object_event  6, 40, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerRoughneckTheron, -1
	object_event  4, 89, SPRITE_ROUGHNECK, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerRoughneckMarkey, -1

Route17SouthAlwaysOnBikeCallback:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	endcallback

GenericTrainerBikerReilly:
	generictrainer BIKER, REILLY, EVENT_BEAT_BIKER_REILLY, BikerReillySeenText, BikerReillyBeatenText

	text "¡No te confíes,"
	line "gamberro de"
	cont "Johto!"
	done

BikerReillySeenText:
	text "¡Eh, tú! ¿Eres de"
	line "Johto, eh?"
	done

BikerReillyBeatenText:
	text "¡Vaya, qué"
	line "patada!"
	done

GenericTrainerBikerJoel:
	generictrainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText

	text "Parezco guay,"
	line "pero soy débil,"
	cont "así que no soy tan"
	cont "guay."

	para "Tengo que"
	line "entrenar más…"
	done

BikerJoelSeenText:
	text "Vaya. ¡Qué"
	line "bicicleta tan"
	cont "guay!"
	done

BikerJoelBeatenText:
	text "Pero no solo"
	line "pareces guay…"
	done

GenericTrainerBikerGlenn:
	generictrainer BIKER, GLENN, EVENT_BEAT_BIKER_GLENN, BikerGlennSeenText, BikerGlennBeatenText

	text "Ir sin manos se"
	line "considera guay"
	cont "en el Camino"
	cont "Ciclista."
	done

BikerGlennSeenText:
	text "¡Eh! ¿Quieres un"
	line "combate de"
	cont "velocidad?"
	done

BikerGlennBeatenText:
	text "¡Uy! ¡Vaya par"
	line "que tienes!"
	done

GenericTrainerBikerDale:
	generictrainer BIKER, DALE, EVENT_BEAT_BIKER_DALE, BikerDaleSeenText, BikerDaleBeatenText

	text "¡Eres tan guay!"
	line "¡No haces nada a"
	cont "medias!"
	done

BikerDaleSeenText:
	text "¡Vas a perder!"
	line "¡Tengo un"
	cont "presentimiento!"
	done

BikerDaleBeatenText:
	text "Quizá mi"
	line "presentimiento"
	cont "estaba un poco"
	cont "equivocado…"
	done

GenericTrainerBikerJacob:
	generictrainer BIKER, JACOB, EVENT_BEAT_BIKER_JACOB, BikerJacobSeenText, BikerJacobBeatenText

	text "¿Chopper? Oh,"
	line "¡hablaba de mi"
	cont "bicicleta!"
	done

BikerJacobSeenText:
	text "¡Modificar mi"
	line "chopper cuesta"

	para "un montón de"
	line "dinero! ¡Necesito"
	cont "trabajo!"
	done

BikerJacobBeatenText:
	text "Argh. ¡Fallé!"
	done

GenericTrainerBikerAiden:
	generictrainer BIKER, AIDEN, EVENT_BEAT_BIKER_AIDEN, BikerAidenSeenText, BikerAidenBeatenText

	text "¡Gaon gaooon!"
	line "¡Buwaribaribari…!"

	para "¡Ahí está, mi"
	line "imitación de motor"
	cont "ha evolucionado!"
	done

BikerAidenSeenText:
	text "¡Vrum vrum!"
	line "¡Baribaribaribari!"

	para "¿Qué te parece mi"
	line "imitación de"
	cont "motor?"
	done

BikerAidenBeatenText:
	text "Hnnff… hnnff…"
	line "Sin aliento…"
	done

GenericTrainerBikerDan:
	generictrainer BIKER, DAN, EVENT_BEAT_BIKER_DAN, BikerDanSeenText, BikerDanBeatenText

	text "Me encanta esta"
	line "melodía"
	cont "melancólica."

	para "Me pega muy"
	line "bien…"
	done

BikerDanSeenText:
	text "¡Parara parapara"
	line "para-parara!"

	para "Mi bocina suena"
	line "genial, ¿no"
	cont "crees?"
	done

BikerDanBeatenText:
	text "Paaraaraaaaa…"
	done

GenericTrainerBikerTeddy:
	generictrainer BIKER, TEDDY, EVENT_BEAT_BIKER_TEDDY, BikerTeddySeenText, BikerTeddyBeatenText

	text "¡Me encanta cómo"
	line "combates también!"

	cont "¡Considérame un"
	cont "fan!"
	done

BikerTeddySeenText:
	text "¡Eh, qué Bici tan"
	line "guay llevas!"
	done

BikerTeddyBeatenText:
	text "Buen trabajo."
	done

GenericTrainerRoughneckBrian:
	generictrainer ROUGHNECK, BRIAN, EVENT_BEAT_ROUGHNECK_BRIAN, RoughneckBrianSeenText, RoughneckBrianBeatenText

	text "¡Nos vemos!"
	line "¡Vuelve cuando"
	cont "quieras!"
	done

RoughneckBrianSeenText:
	text "Eh, ¿quién te dijo"
	line "que podías montar"
	cont "en este camino?"
	done

RoughneckBrianBeatenText:
	text "¡Choque!"
	done

GenericTrainerRoughneckTheron:
	generictrainer ROUGHNECK, THERON, EVENT_BEAT_ROUGHNECK_THERON, RoughneckTheronSeenText, RoughneckTheronBeatenText

	text "¿Quieres unirte a"
	line "mi equipo?"

	para "¿No quieres"
	line "intentarlo?"
	done

RoughneckTheronSeenText:
	text "Te endureceré."
	line "Ahora, ven"
	cont "conmigo."
	done

RoughneckTheronBeatenText:
	text "Perdí. ¡Perdí!"
	done

GenericTrainerRoughneckMarkey:
	generictrainer ROUGHNECK, MARKEY, EVENT_BEAT_ROUGHNECK_MARKEY, RoughneckMarkeySeenText, RoughneckMarkeyBeatenText

	text "¡Muy bien!"

	para "¡Ese grito de"
	line "combate fue"
	cont "genial!"
	done

RoughneckMarkeySeenText:
	text "¡Eh eh eh!"
	line "¡Estás en mi"
	cont "camino!"

	para "¡EN MI CAMINO!"
	done

RoughneckMarkeyBeatenText:
	text "Muy bien,"
	line "¡gracias!"
	done

Route17SouthNotice1Text:
	text "Es un aviso."

	para "¡Cuidado con los"
	line "objetos"
	cont "descartados!"
	done

Route17SouthTrainerTips1Text:
	text "Consejos de"
	line "entrenador"

	para "Todos los #mon"
	line "son únicos."

	para "Dos #mon de la"
	line "misma especie y"
	cont "nivel pueden"

	para "lucir, actuar y"
	line "crecer de forma"
	cont "distinta."
	done

Route17SouthTrainerTips2Text:
	text "Consejos de"
	line "entrenador"

	para "Abre el menú"
	line "Start para"
	cont "quedarte quieto"
	cont "en una"
	cont "pendiente."
	done

Route17SouthNotice2Text:
	text "Es un aviso."

	para "¡No tires la"
	line "partida, tira"
	cont "Poké Balls en su"
	cont "lugar!"
	done
