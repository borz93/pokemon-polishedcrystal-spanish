CeladonCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeladonCityFlyPoint

	def_warp_events
	warp_event  8,  9, CELADON_DEPT_STORE_1F, 1
	warp_event 20,  9, CELADON_MANSION_1F, 1
	warp_event 20,  3, CELADON_MANSION_1F, 3
	warp_event 21,  3, CELADON_MANSION_1F, 3
	warp_event 33,  9, CELADON_POKECENTER_1F, 1
	warp_event 22, 19, CELADON_GAME_CORNER, 1
	warp_event 27, 19, CELADON_GAME_CORNER_PRIZE_ROOM, 1
	warp_event 14, 29, CELADON_GYM, 1
	warp_event 25, 29, CELADON_CAFE, 1
	warp_event 29, 29, CELADON_CHIEF_HOUSE, 1
	warp_event 35, 29, CELADON_HOTEL_1F, 1
	warp_event 13,  9, CELADON_HOME_DECOR_STORE_1F, 1
	warp_event  4, 29, CELADON_UNIVERSITY_1F, 1
	warp_event 29,  9, EUSINES_HOUSE, 1
	warp_event 33, 19, CELADON_OLD_MAN_SPEECH_HOUSE, 1
	warp_event 37, 19, CELADON_DEVELOPMENT_SPEECH_HOUSE, 1
	warp_event  9,  9, CELADON_DEPT_STORE_1F, 2
	warp_event 23, 19, CELADON_GAME_CORNER, 2
	warp_event  5, 29, CELADON_UNIVERSITY_1F, 2

	def_coord_events

	def_bg_events
	bg_event 11, 18, BGEVENT_JUMPTEXT, CeladonCitySignText
	bg_event 15, 31, BGEVENT_JUMPTEXT, CeladonGymSignText
	bg_event  3, 31, BGEVENT_JUMPTEXT, CeladonUniversitySignText
	bg_event 10,  9, BGEVENT_JUMPTEXT, CeladonCityDeptStoreSignText
	bg_event 14,  9, BGEVENT_JUMPTEXT, CeladonCityHomeDecorStoreSignText
	bg_event 17,  9, BGEVENT_JUMPTEXT, CeladonCityMansionSignText
	bg_event 21, 21, BGEVENT_JUMPTEXT, CeladonCityGameCornerSignText
	bg_event 27, 21, BGEVENT_JUMPTEXT, CeladonCityPrizeExchangeSignText
	bg_event 23, 29, BGEVENT_JUMPTEXT, CeladonCityCafeSignText
	bg_event 33, 29, BGEVENT_JUMPTEXT, CeladonCityHotelSignText
	bg_event 33, 21, BGEVENT_JUMPTEXT, CeladonCityTrainerTips1Text
	bg_event 21, 15, BGEVENT_JUMPTEXT, CeladonCityTrainerTips2Text
	bg_event 41, 21, BGEVENT_ITEM + PP_UP, EVENT_CELADON_CITY_HIDDEN_PP_UP

	def_object_events
	object_event  4, 15, SPRITE_RICH_BOY, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityScript, -1
	object_event 30, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityFisherText, -1
	pokemon_event 31, 11, POLIWRATH, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, CeladonCityPoliwrathText, -1
	object_event 24, 24, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityTeacher1Text, -1
	object_event 17, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityGramps1Text, -1
	object_event 12, 31, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityGramps2Text, -1
	object_event 22, 13, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityYoungster1Text, -1
	object_event 27, 32, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityYoungster2Text, -1
	object_event 12, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityTeacher2Text, -1
	object_event 10, 22, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityLassText_PCC, -1
	object_event 45, 10, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_7_SNORLAX
	object_event 35, 23, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityLassText, -1
	itemball_event 39,  7, MAX_ETHER, 1, EVENT_CELADON_CITY_MAX_ETHER
	cuttree_event 32, 34, EVENT_CELADON_CITY_CUT_TREE

CeladonCityFlyPoint:
	setflag ENGINE_FLYPOINT_CELADON
	endcallback

CeladonCityScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SWAGGER_INTRO
	iftruefwd CeladonCityTutorSwaggerScript
	writetext CeladonCityRichBoyText
	waitbutton
	setevent EVENT_LISTENED_TO_SWAGGER_INTRO
CeladonCityTutorSwaggerScript:
	writetext Text_CeladonCityTutorSwagger
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_CeladonCityTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval SWAGGER
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "¡Pues adiós!"
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "…¿No tienes"
	line "una Hoja Plata?"
	cont "Qué pena."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Mira! Tu #-"
	line "mon ha aprendido"
	cont "Contoneo!"
	done

CeladonCityRichBoyText:
	text "¿A que mi traje"
	line "deslumbra?"

	para "¡La gente gira"
	line "la cabeza cuando"
	cont "contoneo por la"
	cont "calle!"

	para "¡La gente me"
	line "adora!"

	para "Hoy estoy de"
	line "humor generoso."
	done

Text_CeladonCityTutorSwagger:
	text "Enseñaré a tu"
	line "#mon a"

	para "Contonearse por"
	line "solo una Hoja"
	cont "Plata."
	done


Text_CeladonCityTutorQuestion:
	text "¿Quieres que le"
	line "enseñe Contoneo"
	cont "a tu #mon?"
	done



CeladonCityFisherText:
	text "Este Poliwrath es"
	line "mi compañero."

	para "Antes era Mansa,"
	line "pero la encargada"

	para "del condominio"
	line "de aquí nos"

	para "preparó un té con"
	line "una Hoja Menta"

	para "que la volvió"
	line "más Alegre!"
	done

CeladonCityPoliwrathText:
	text "Poliwrath: ¡Croac!"
	done

CeladonCityTeacher1Text:
	text "He perdido en las"
	line "tragaperras otra"
	cont "vez…"

	para "Las chicas también"
	line "jugamos ahora."

	para "Deberías"
	line "probarlas también."
	done

CeladonCityGramps1Text:
	text "Grimer han estado"
	line "apareciendo"
	cont "últimamente."

	para "¿Ves ese estanque"
	line "frente a la casa?"

	para "Ahí viven Grimer"
	line "ahora."

	para "¿De dónde habrán"
	line "salido? Es un"
	cont "problema serio…"
	done

CeladonCityGramps2Text:
	text "¡Nihihi! ¡Este"
	line "Gimnasio mola!"

	para "¡Solo entran"
	line "chicas!"
	done

CeladonCityYoungster1Text:
	text "¿Quieres saber"
	line "un secreto?"

	para "El Condominio"
	line "Azulona tiene una"
	cont "puerta trasera"
	cont "secreta."
	done

CeladonCityYoungster2Text:
	text "El restaurante de"
	line "allí tiene un"
	cont "concurso de comer."

	para "Hay una"
	line "concursante de la"

	para "región de Sinnoh"
	line "este año."

	para "Verla comer me da"
	line "sensación de"
	cont "hinchazón…"
	done

CeladonCityTeacher2Text:
	text "Los Grandes"
	line "Almacenes Azulona"

	para "tienen la mejor y"
	line "mayor selección."

	para "Si no lo tienen"
	line "allí, no lo"
	cont "encontrarás en"
	cont "ningún sitio."

	para "Vaya… Parezco"
	line "una dependienta."
	done

CeladonCityLassText_PCC:
	text "¡Me encanta estar"
	line "rodeada de"
	cont "edificios altos!"

	para "¿Es verdad que el"
	line "Centro #mon de"

	para "Ciudad Trigal se"
	line "hizo mucho, mucho"
	cont "más grande?"

	para "¡Qué guay! Ojalá"
	line "tuviéramos algo"
	cont "así en Kanto…"
	done

CeladonCityLassText:
	text "Dan #mon como"
	line "premios en la"
	cont "Sala de Juegos."

	para "Pobrecitos…"
	done

CeladonCitySignText:
	text "Ciudad Azulona"

	para "La Ciudad de los"
	line "Sueños Arcoíris"
	done

CeladonGymSignText:
	text "Ciudad Azulona"
	line "Gimnasio #mon"
	cont "Líder: Erika"

	para "La Princesa Amante"
	line "de la Naturaleza"
	done

CeladonUniversitySignText:
	text "Universidad"
	line "Azulona"

	para "“Crecer a Través"
	line "del Estudio”"
	done

CeladonCityDeptStoreSignText:
	text "¡Encuentra lo que"
	line "necesitas en los"
	cont "Grandes Almacenes"
	cont "Azulona!"
	done

CeladonCityHomeDecorStoreSignText:
	text "Grandes Almacenes"
	line "Ala de Decoración"
	done

CeladonCityMansionSignText:
	text "Condominio"
	line "Azulona"
	done

CeladonCityGameCornerSignText:
	text "El Parque para"
	line "Todos: la Sala de"
	cont "Juegos Azulona"
	done

CeladonCityPrizeExchangeSignText:
	text "Monedas por"
	line "premios!"
	cont "Canje de Premios"
	done

CeladonCityCafeSignText:
	text "Restaurante"
	line "Azulona"

	para "¡Concurso de comer"
	line "todo el día hoy!"
	done

CeladonCityHotelSignText:
	text "Hotel Azulona"

	para "¡Relájate en"
	line "nuestra piscina!"
	done

CeladonCityTrainerTips1Text:
	text "Consejo Entrenador"

if DEF(FAITHFUL)
	para "Prot. Equipo"
else
	para "Prot. Equipo"
endc
	line "protege a tus"
	cont "#mon de bajadas"
	cont "de estadísticas."

	para "¡Compra objetos en"
	line "los Grandes"
	cont "Almacenes Azulona!"
	done

CeladonCityTrainerTips2Text:
	text "Consejo Entrenador"

	para "Eevee tiene mucho"
	line "potencial."

	para "Prueba a exponerlo"
	line "a lugares, horas"
	cont "del día y piedras"
	cont "evolutivas"
	cont "distintas."
	done
