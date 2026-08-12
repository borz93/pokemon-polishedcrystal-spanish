EcruteakCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, EcruteakCityFlyPoint

	def_warp_events
	warp_event 35, 26, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 27, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 23, 11, ECRUTEAK_HOUSE, 1
	warp_event 17,  9, ECRUTEAK_SHRINE_OUTSIDE, 3
	warp_event 18,  9, ECRUTEAK_SHRINE_OUTSIDE, 4
	warp_event 23, 27, ECRUTEAK_POKECENTER_1F, 1
	warp_event  5, 21, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 23, 21, DANCE_THEATRE, 1
	warp_event 29, 21, ECRUTEAK_MART, 2
	warp_event  6, 27, ECRUTEAK_GYM, 1
	warp_event 13, 27, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event  5, 16, VALERIES_HOUSE, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1
	warp_event  0, 20, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 21, ROUTE_38_ECRUTEAK_GATE, 4
	warp_event 29, 27, ECRUTEAK_CHERISH_BALL_HOUSE, 1
	warp_event 13, 16, ECRUTEAK_DESTINY_KNOT_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 15, 21, BGEVENT_JUMPTEXT, EcruteakCitySign
	bg_event  7, 27, BGEVENT_JUMPTEXT, EcruteakGymSign
	bg_event 21, 21, BGEVENT_JUMPTEXT, EcruteakDanceTheaterSign
	bg_event  7,  9, BGEVENT_JUMPTEXT, BurnedTowerSign
	bg_event 15, 11, BGEVENT_JUMPTEXT, EcruteakShrineSign
	bg_event 21, 11, BGEVENT_JUMPTEXT, EcruteakBarrierStationSign
	bg_event  9, 15, BGEVENT_JUMPTEXT, EcruteakCityAdvancedTips
	bg_event 25, 14, BGEVENT_ITEM + HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION
	bg_event 33, 16, BGEVENT_ITEM + RARE_CANDY, EVENT_ECRUTEAK_CITY_HIDDEN_RARE_CANDY
	bg_event  1, 19, BGEVENT_ITEM + ULTRA_BALL, EVENT_ECRUTEAK_CITY_HIDDEN_ULTRA_BALL
	bg_event  6,  6, BGEVENT_ITEM + ETHER, EVENT_ECRUTEAK_CITY_HIDDEN_ETHER

	def_object_events
	object_event 20, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityGramps1Text, -1
	object_event 20, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityGramps2Text, -1
	object_event 20, 26, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityLass1Text, -1
	object_event  8, 10, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  9, 22, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 11, 16, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityYoungsterText, -1
	object_event  3, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityGramps3Text, EVENT_ECRUTEAK_CITY_GRAMPS
	object_event 11, 11, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityHexManiacText, -1
	object_event 11, 11, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCitySightseerMText, -1
	pokemon_event 12, 11, SMEARGLE, SPRITEMOVEDATA_POKEMON, (1 << MORN) | (1 << DAY), PAL_MON_BROWN, EcruteakCitySmeargleText, -1
	object_event 16,  9, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_ARCH_TREE_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_COMMAND, end, NULL, -1
	object_event 19,  9, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_ARCH_TREE_RIGHT, 0, 0, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_COMMAND, end, NULL, -1

EcruteakCityFlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	endcallback

EcruteakCityLass2Script:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue_jumptextfaceplayer EcruteakCityLass2Text_ReleasedBeasts
	jumpthistextfaceplayer

	text "La torre que"
	line "solía estar"
	cont "aquí…"

	para "Mi abuela me dijo"
	line "que antes era"
	cont "mucho más alta."
	done

EcruteakCityFisherScript:
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue_jumptextfaceplayer EcruteakCityFisherText_JasmineReturned
	jumpthistextfaceplayer

	text "Oí un rumor sobre"
	line "el Faro de Ciudad"
	cont "Olivo."

	para "El #mon que"
	line "sirve de baliza"

	para "enfermó. Parece"
	line "que están en"
	cont "problemas."
	done

EcruteakCityGramps1Text:
	text "Ciudad Iris solía"
	line "tener dos torres:"

	para "una al este y otra"
	line "al oeste."
	done

EcruteakCityGramps2Text:
	text "Ah, niño."
	line "¿Has aprendido a"

	para "bailar como las"
	line "Chicas Kimono?"

	para "Si vas a su Teatro"
	line "de Baile, un"

	para "anciano peculiar"
	line "te dará algo"
	cont "bonito, según oí."
	done

EcruteakCityLass1Text:
	text "Voy a que"
	line "bendigan a mi"
	cont "#mon en el"
	cont "santuario."

	para "¿Quieres venir"
	line "conmigo?"
	done

EcruteakCityHexManiacText:
	text "Espíritus de"
	line "#mon rondan"
	cont "este lugar…"
	done

EcruteakCitySightseerMText:
	text "Ciudad Iris tiene"
	line "una historia tan"
	cont "increíble."

	para "Smeargle y yo"
	line "viajamos hasta"
	cont "aquí para"
	cont "dibujarla."
	done

EcruteakCitySmeargleText:
	text "Smeargle: ¡Smeer!"
	done


EcruteakCityLass2Text_ReleasedBeasts:
	text "Tres #mon"
	line "enormes huyeron en"
	cont "direcciones"
	cont "distintas. ¿Qué"
	cont "eran?"
	done


EcruteakCityFisherText_JasmineReturned:
	text "El #mon del"
	line "Faro de Ciudad"
	cont "Olivo se ha"
	cont "curado."

	para "Los barcos pueden"
	line "navegar de noche"
	cont "otra vez."
	done

EcruteakCityYoungsterText:
	text "Oí que hay #mon"
	line "descontrolados en"

	para "el Lago de la"
	line "Furia. Me gustaría"
	cont "ver eso."
	done

EcruteakCityGramps3Text:
	text "En el pasado"
	line "lejano…"

	para "Esta torre se"
	line "quemó en un"
	cont "incendio. Tres"

	para "#mon sin nombre"
	line "perecieron en"
	cont "ella."

	para "Un #mon de"
	line "colores del"
	cont "arcoíris"

	para "descendió del"
	line "cielo y los"
	cont "resucitó…"

	para "Es una leyenda que"
	line "han transmitido"

	para "los Líderes del"
	line "Gimnasio de"
	cont "Ciudad Iris."

	para "¿Yo?"

	para "Fui entrenador"
	line "hace mucho"
	cont "tiempo. ¡Jojojo!"
	done

EcruteakCitySign:
	text "Ciudad Iris"
	line "Una Ciudad"
	cont "Histórica"

	para "Donde el Pasado"
	line "se Encuentra con"
	cont "el Presente"
	done

EcruteakGymSign:
	text "Gimnasio #mon"
	line "de Ciudad Iris"
	cont "Líder: Morty"

	para "El Vidente"
	line "Místico del Futuro"
	done

EcruteakCityAdvancedTips:
	text "¡Consejos"
	line "avanzados!"

	para "Algunos #mon"
	line "que encuentres"
	cont "pueden"

	para "tener una"
	line "habilidad rara,"
	cont "también conocida"
	cont "como Habilidad"
	cont "Oculta."

	para "Un #mon que"
	line "eclosiona también"

	para "tiene una baja"
	line "probabilidad de"
	cont "tener una"
	cont "Habilidad Oculta."
	done

EcruteakDanceTheaterSign:
	text "Teatro de Baile"
	line "de Ciudad Iris"
	done

BurnedTowerSign:
	text "Torre Quemada"

	para "Fue destruida por"
	line "un fuego"
	cont "misterioso."

	para "Por favor,"
	line "mantente alejado,"
	cont "es peligroso."
	done

EcruteakShrineSign:
	text "Santuario de"
	line "Ciudad Iris"

	para "“La vida es la"
	line "llama de una"
	cont "lámpara ante el"
	cont "viento.”"
	done

EcruteakBarrierStationSign:
	text "Estación Barrera"
	line "a la Torre"
	cont "Campana"

	para "Prohibido el Paso"
	line "a los Indignos"
	done
