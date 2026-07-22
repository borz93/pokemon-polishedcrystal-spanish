Route3_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route3FlyPoint

	def_warp_events
	warp_event 68,  1, MOUNT_MOON_1F, 1
	warp_event 61,  3, ROUTE_3_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 63, 15, BGEVENT_JUMPTEXT, Route3MtMoonSquareSignText
	bg_event 11, 17, BGEVENT_ITEM + MOON_STONE, EVENT_ROUTE_3_HIDDEN_MOON_STONE
	bg_event  8, 15, BGEVENT_JUMPTEXT, Route3MeteoriteText
	bg_event  8, 17, BGEVENT_JUMPTEXT, Route3MeteoriteText
	bg_event  9, 17, BGEVENT_JUMPTEXT, Route3MeteoriteText
	bg_event 12, 15, BGEVENT_JUMPTEXT, Route3MeteoriteText
	bg_event 14, 17, BGEVENT_JUMPTEXT, Route3MeteoriteText
	bg_event 15, 17, BGEVENT_JUMPTEXT, Route3MeteoriteText

	def_object_events
	object_event 12,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterRegis, -1
	object_event 17,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerYoungsterJimmy, -1
	object_event 25,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerYoungsterWarren, -1
	object_event 30, 12, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerFirebreatherOtis, -1
	object_event 60, 10, SPRITE_FIREBREATHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerFirebreatherBurt, -1
	object_event 44,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBlackbeltManford, -1
	object_event 52, 18, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltAnder, -1
	object_event 38,  6, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerHikerBruce, -1
	object_event 61, 19, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerHikerDwight, -1
	object_event 14, 12, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoZacandjen1, -1
	object_event 15, 12, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoZacandjen2, -1
	itemball_event 36, 14, BIG_ROOT, 1, EVENT_ROUTE_3_BIG_ROOT

Route3FlyPoint:
	setflag ENGINE_FLYPOINT_MT_MOON
	endcallback

GenericTrainerYoungsterRegis:
	generictrainer YOUNGSTER, REGIS, EVENT_BEAT_YOUNGSTER_REGIS, .SeenText, .BeatenText

	text "¡Parece que"
	line "necesito más"
	cont "entrenamiento!"
	done

.SeenText:
	text "¿Chaval? ¡Cielos,"
	line "qué grosería!"

	para "¡Llámame Chico"
	line "Pantalón Corto!"
	done

.BeatenText:
	text "Eso es…"
	line "Chico Fracaso…"
	done

GenericTrainerYoungsterJimmy:
	generictrainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, .SeenText, .BeatenText

	text "Llevo pantalón"
	line "corto todo el año."

	para "Es mi política de"
	line "moda."
	done

.SeenText:
	text "¡Puedo correr como"
	line "el viento!"
	done

.BeatenText:
	text "¡Volado por el"
	line "viento!"
	done

GenericTrainerYoungsterWarren:
	generictrainer YOUNGSTER, WARREN, EVENT_BEAT_YOUNGSTER_WARREN, .SeenText, .BeatenText

	text "Parecías fuerte."

	para "Tenía miedo de"
	line "enfrentarme a"
	cont "ti…"
	done

.SeenText:
	text "Hmmm… No sé qué"
	line "hacer…"
	done

.BeatenText:
	text "Sabía que"
	line "perdería…"
	done

GenericTrainerFirebreatherOtis:
	generictrainer FIREBREATHER, OTIS, EVENT_BEAT_FIREBREATHER_OTIS, .SeenText, .BeatenText

	text "Cuando llueve, es"
	line "difícil conseguir"
	cont "ignición…"
	done

.SeenText:
	text "¡Ah! El clima está"
	line "tan bueno como"
	cont "siempre."
	done

.BeatenText:
	text "Hace sol, pero"
	line "estoy empapado…"
	done

GenericTrainerFirebreatherBurt:
	generictrainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, .SeenText, .BeatenText

	text "El mejor tragafue-"
	line "gos de Kanto, ese"
	cont "soy yo."

	para "Pero no el mejor"
	line "entrenador…"
	done

.SeenText:
	text "¡Acércate y échale"
	line "un vistazo!"
	done

.BeatenText:
	text "¡Ay! ¡Qué calor!"
	done

GenericTrainerBlackbeltManford:
	generictrainer BLACKBELT_T, MANFORD, EVENT_BEAT_BLACKBELT_MANFORD, .SeenText, .BeatenText

	text "¡Debiste"
	line "entrenar con un"
	cont "maestro famoso!"
	done

.SeenText:
	text "¡Cálmate y dame"
	line "la oportunidad de"
	cont "vencerte!"
	done

.BeatenText:
	text "Me han vencido en"
	line "mi propio juego…"
	done

GenericTrainerBlackbeltAnder:
	generictrainer BLACKBELT_T, ANDER, EVENT_BEAT_BLACKBELT_ANDER, .SeenText, .BeatenText

	text "¿Viniste desde"
	line "Johto?"

	para "¡Debes ser muy"
	line "perseverante!"
	done

.SeenText:
	text "¡Espera un"
	line "momento! ¡Ven a"
	cont "luchar!"
	done

.BeatenText:
	text "Lo lograste…"
	done

GenericTrainerHikerBruce:
	generictrainer HIKER, BRUCE, EVENT_BEAT_HIKER_BRUCE, .SeenText, .BeatenText

	text "Bueno, ¡supongo"
	line "que debo llevar"
	cont "mi Mochila otra"
	cont "vez!"
	done

.SeenText:
	text "¡Mi Mochila se me"
	line "clava en los"
	cont "hombros!"

	para "¡Tomaré un"
	line "descanso y"
	cont "combatiré!"
	done

.BeatenText:
	text "Feh."
	done

GenericTrainerHikerDwight:
	generictrainer HIKER, DWIGHT, EVENT_BEAT_HIKER_DWIGHT, .SeenText, .BeatenText

	text "Saludar a alguien"
	line "que no conoces…"

	para "¡Eso es lo mejor"
	line "de las montañas!"
	done

.SeenText:
	text "¡Paz!"

	para "Cuando conoces a"
	line "un desconocido en"
	cont "una ruta de"
	cont "montaña, solo"

	para "quieres paz,"
	line "¿verdad?"
	done

.BeatenText:
	text "Paz, ¡aunque haya"
	line "perdido!"
	done

GenericTrainerAceDuoZacandjen1:
	generictrainer ACE_DUO, ZACANDJEN1, EVENT_BEAT_ACE_DUO_ZAC_AND_JEN, .SeenText, .BeatenText

	text "Zac: Tu futuro"
	line "parece"
	cont "prometedor."
	done

.SeenText:
	text "Zac: ¿En serio"
	line "quieres"
	cont "combatirnos?"

	para "Tienes mucho"
	line "valor para ser"
	cont "tan joven."
	done

.BeatenText:
	text "Zac: No estabas"
	line "fanfarroneando…"
	done

GenericTrainerAceDuoZacandjen2:
	generictrainer ACE_DUO, ZACANDJEN2, EVENT_BEAT_ACE_DUO_ZAC_AND_JEN, .SeenText, .BeatenText

	text "Jen: Tengo ganas"
	line "de ver qué tipo"

	para "de entrenador"
	line "llegarás a ser."
	done

.SeenText:
	text "Jen: ¿Eh? ¿Quieres"
	line "enfrentarte a"
	cont "nosotros? ¡Genial!"
	done

.BeatenText:
	text "Jen: Eres mucho"
	line "más fuerte de lo"
	cont "que pensaba."
	done

Route3MeteoriteText:
	text "¡Nunca había visto"
	line "una piedra así!"

	para "¿Podría ser…"
	line "un meteorito del"
	cont "espacio?"
	done

Route3MtMoonSquareSignText:
	text "Túnel Monte Moon"
	done
