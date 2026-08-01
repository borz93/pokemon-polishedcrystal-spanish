SaffronCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SaffronCityFlyPoint

	def_warp_events
	warp_event 28,  3, FIGHTING_DOJO, 1
	warp_event 34,  3, SAFFRON_GYM, 1
	warp_event 27, 11, SAFFRON_MART, 2
	warp_event  9, 29, SAFFRON_POKECENTER_1F, 1
	warp_event 29, 29, MR_PSYCHICS_HOUSE, 1
	warp_event  6,  3, SAFFRON_TRAIN_STATION, 2
	warp_event 19, 21, SILPH_CO_1F, 1
	warp_event  9, 11, COPYCATS_HOUSE_1F, 1
	warp_event 18,  1, ROUTE_5_SAFFRON_CITY_GATE, 3
	warp_event  0, 18, ROUTE_7_SAFFRON_GATE, 3
	warp_event  0, 19, ROUTE_7_SAFFRON_GATE, 4
	warp_event 16, 35, ROUTE_6_SAFFRON_GATE, 1
	warp_event 17, 35, ROUTE_6_SAFFRON_GATE, 2
	warp_event 39, 18, ROUTE_8_SAFFRON_GATE, 1
	warp_event 39, 19, ROUTE_8_SAFFRON_GATE, 2
	warp_event 34, 11, POKEMON_TRAINER_FAN_CLUB, 1
	warp_event  5, 29, SAFFRON_ORRE_SPEECH_HOUSE, 1
	warp_event 13, 29, SAFFRON_BOOK_SPEECH_HOUSE, 1
	warp_event 23, 29, SAFFRON_HITMONTOP_KID_HOUSE, 1
	warp_event 13, 11, SAFFRON_RICH_SPEECH_HOUSE, 1
	warp_event 20, 21, SILPH_CO_1F, 2

	def_coord_events

	def_bg_events
	bg_event 21,  5, BGEVENT_JUMPTEXT, SaffronCitySignText
	bg_event 33,  5, BGEVENT_JUMPTEXT, SaffronGymSignText
	bg_event 27,  5, BGEVENT_JUMPTEXT, FightingDojoSignText
	bg_event 15, 21, BGEVENT_JUMPTEXT, SilphCoSignText
	bg_event 27, 29, BGEVENT_JUMPTEXT, MrPsychicsHouseSignText
	bg_event  9,  5, BGEVENT_JUMPTEXT, SaffronCityMagnetTrainStationSignText
	bg_event 31, 11, BGEVENT_JUMPTEXT, PokemonTrainerFanClubSignText
	bg_event  5, 21, BGEVENT_JUMPTEXT, SaffronTrainerTips1Text
	bg_event 35, 25, BGEVENT_JUMPTEXT, SaffronTrainerTips2Text

	def_object_events
	object_event  7, 14, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityLass1Script, -1
	object_event 18, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronCityPokefanMScript, -1
	object_event 32,  7, SPRITE_COOL_DUDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityCooltrainerMText, -1
	object_event 19, 25, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityCooltrainerFText, -1
	object_event 35, 14, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityFisherScript, -1
	object_event 15, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityYoungster1Text, -1
	object_event 32, 23, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityYoungster2Text, -1
	object_event 14,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityLass2Text, -1
	object_event  3, 24, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_UP_DOWN, 4, 0, (1 << MORN) | (1 << EVE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityBlackBelt1Text, -1
	object_event  4, 25, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, (1 << DAY) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityBlackBelt2Text, -1
	object_event 22,  8, SPRITE_PSYCHIC, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 4, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCitySuperNerdText, -1
	object_event 22, 22, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 4, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityScientistText, -1
	object_event 11, 22, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 4, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCitySilphEmployeeText, -1

SaffronCityFlyPoint:
	setflag ENGINE_FLYPOINT_SAFFRON
	endcallback

SaffronCityLass1Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer SaffronCityLass1Text_ReturnedMachinePart
	jumpthistextfaceplayer

	text "Una niña que es"
	line "experta en imitar"

	para "a la gente vive"
	line "aquí."

	para "Incluso imita a la"
	line "persona con quien"

	para "conversa. Es"
	line "confuso."
	done

SaffronCityPokefanMScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer SaffronCityPokefanMText_ReturnedMachinePart
	jumpthistextfaceplayer

	text "¿Viniste de"
	line "Johto?"

	para "Puedes volver"
	line "rápido a casa si"
	cont "el Tren Imán"
	cont "funciona."
	done

SaffronCityFisherScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer SaffronCityFisherText_ReturnedMachinePart
	jumpthistextfaceplayer

	text "ñam… ñam…"

	para "Oí que se avecinan"
	line "grandes problemas"
	cont "en la Central"
	cont "Eléctrica."

	para "ñam… ñam…"
	done


SaffronCityLass1Text_ReturnedMachinePart:
	text "La chica Copycat"
	line "parecía triste."

	para "Dijo que perdió"
	line "su Muñeco #"
	cont "favorito:"
	cont "Clefairy."
	done


SaffronCityPokefanMText_ReturnedMachinePart:
	text "¿Viniste de"
	line "Johto?"

	para "Puedes volver"
	line "rápido a casa"
	cont "subiéndote al Tren"
	cont "Imán."
	done

SaffronCityCooltrainerMText:
	text "Fui al Gimnasio,"
	line "listo para"
	cont "combates contra"
	cont "entrenadores…"

	para "Resulta que me"
	line "encontré en el"

	para "Dojo de Lucha de"
	line "al lado."

	para "Vaya, qué"
	line "bochorno pasé."
	done

SaffronCityCooltrainerFText:
	text "Esto es Silph S.A,"
	line "famosa por"
	cont "mercancía #mon."

	para "En el pasado, el"
	line "Team Rocket quería"

	para "la compañía por"
	line "eso."
	done


SaffronCityFisherText_ReturnedMachinePart:
	text "ñam… ñam…"

	para "Oí que hubo"
	line "grandes problemas"
	cont "en la Central"
	cont "Eléctrica."

	para "ñam… ñam…"
	line "¡Ah, estoy lleno!"
	done

SaffronCityYoungster1Text:
	text "Entrar en un"
	line "callejón por"

	para "primera vez me"
	line "pone algo"
	cont "ansioso."
	done

SaffronCityYoungster2Text:
	text "Hay un lugar"
	line "llamado Casa de"

	para "Entrenadores en"
	line "Ciudad Verde donde"

	para "se reúnen"
	line "entrenadores de"
	cont "todas partes."
	done

SaffronCityLass2Text:
	text "Nuestra ciudad"
	line "salió en un"
	cont "programa de"
	cont "radio."

	para "Es agradable oír"
	line "elogios de tu"

	para "ciudad, pero"
	line "también da un"
	cont "poco de"
	cont "bochorno."
	done

SaffronCityBlackBelt1Text:
	text "Cada mañana al"
	line "despertar corro"

	para "dos vueltas"
	line "alrededor de la"
	cont "ciudad."

	para "¡Es una gran forma"
	line "de empezar el"
	cont "día!"
	done

SaffronCityBlackBelt2Text:
	text "Si fuera un"
	line "objeto, sería"
	cont "Ataque X."

	para "Rebosante de"
	line "poder, y la X lo"

	para "hace sonar guay."
	done

SaffronCitySuperNerdText:
	text "Hubo un tiempo en"
	line "que se creía que"

	para "los #mon"
	line "Psíquico eran los"
	cont "más fuertes, y los"
	cont "Bicho los más"
	cont "débiles."

	para "¡La ironía es"
	line "que Bicho es"
	cont "supereficaz"
	cont "contra Psíquico!"
	done

SaffronCityScientistText:
	text "El Scope Silph"
	line "original tenía"
	cont "fallos, así que"

	para "hemos trabajado"
	line "sin descanso en su"
	cont "sucesor: ¡El"
	cont "Scope Silph 2!"
	done

SaffronCitySilphEmployeeText:
	text "Silph lleva el"
	line "nombre de un"
	cont "espíritu mítico"
	cont "del aire."

	para "Qué tiene que ver"
	line "eso con el negocio"

	para "de la compañía, no"
	line "tengo ni idea."
	done

SaffronCitySignText:
	text "Ciudad Azafrán"

	para "Reluciente Tierra"
	line "Dorada del"
	cont "Comercio"
	done

SaffronGymSignText:
	text "Gimnasio #mon"
	line "de Ciudad Azafrán"
	cont "Líder: Sabrina"

	para "¡La Maestra de los"
	line "#mon Psíquico!"
	done

FightingDojoSignText:
	text "¡Todos"
	line "Bienvenidos!"
	cont "Dojo de Lucha"
	done

SilphCoSignText:
	text "Silph S.A"
	line "Edificio de"
	cont "Oficinas"
	done

MrPsychicsHouseSignText:
	text "Casa del"
	line "Sr.Psíquico"
	done

SaffronCityMagnetTrainStationSignText:
	text "Estación del Tren"
	line "Imán de Ciudad"
	cont "Azafrán"
	done

PokemonTrainerFanClubSignText:
	text "Club de Fans de"
	line "Entrenadores"
	cont "#mon"

	para "Muchos"
	line "entrenadores han"
	cont "garabateado sus"
	cont "nombres aquí…"
	done

SaffronTrainerTips1Text:
	text "Consejos de"
	line "entrenador"

	para "¡El nuevo Scope"
	line "Silph 2 identifica"

	para "incluso a los"
	line "#mon mejor"
	cont "disfrazados!"
	done

SaffronTrainerTips2Text:
	text "Consejos de"
	line "entrenador"

	para "Usa Cebo Balls"
	line "al principio de"
	cont "un combate. Luego,"
	cont "usa Turno Balls."

	para "Cuestan más que"
	line "las Poké Balls,"

	para "pero son más"
	line "convenientes."
	done
