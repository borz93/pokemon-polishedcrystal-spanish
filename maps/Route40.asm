Route40_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, MonicaCallback

	def_warp_events
	warp_event  9,  5, ROUTE_40_BATTLE_TOWER_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 14, 10, BGEVENT_JUMPTEXT, Route40SignText
	bg_event  7,  8, BGEVENT_ITEM + HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

	def_object_events
	object_event  7, 11, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	object_event 13, 16, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmermSimon, -1
	object_event 18, 33, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSwimmermRandall, -1
	object_event  3, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfElaine, -1
	object_event  9, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfPaula, -1
	object_event 11, 13, SPRITE_BEACH_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route40BeachGirlText, -1
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route40PokefanMScript, -1
	object_event 13,  4, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route40PicnickerText, -1
	object_event 14,  8, SPRITE_BEACH_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40BeachGuyScript, -1
	object_event 16, 27, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40FisherScript, -1
	smashrock_event  8, 10
	smashrock_event  6, 9
	smashrock_event  7, 8

	object_const_def
	const ROUTE40_MONICA

MonicaCallback:
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .MonicaAppears
	disappear ROUTE40_MONICA
	endcallback

.MonicaAppears:
	appear ROUTE40_MONICA
	endcallback

GenericTrainerSwimmerfElaine:
	generictrainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText

	text "Diría que nado"
	line "mejor que tú."
	cont "¡Sí, señor!"
	done

GenericTrainerSwimmerfPaula:
	generictrainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText

	text "Mientras floto"
	line "así, las olas me"
	cont "arrastran."
	done

GenericTrainerSwimmermSimon:
	generictrainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText

	text "Ciudad Orquídea"
	line "está bastante"
	cont "lejos de aquí."
	done

GenericTrainerSwimmermRandall:
	generictrainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText

	text "Nadar ejercita"
	line "todo tu cuerpo."
	cont "Es saludable."
	done

Route40PokefanMScript:
	checkevent EVENT_BATTLE_TOWER_OPEN
	iftrue_jumptextfaceplayer Route40PokefanMText2
	jumpthistextfaceplayer

	text "¡Hm! ¡Hay un"
	line "edificio grande"
	cont "más adelante!"

	para "¿Qué será?"
	done

Route40BeachGuyScript:
	checkevent EVENT_BATTLE_TOWER_OPEN
	iftrue_jumptextfaceplayer Route40BeachGuyText2
	jumpthistextfaceplayer

	text "¡La Torre Batalla"
	line "está casi lista!"

	para "Entrenadores"
	line "vienen a Ciudad"
	cont "Olivo"

	para "de todo el mundo"
	line "para poner a"
	cont "prueba su fuerza."
	done

Route40FisherScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_KNOCK_OFF_INTRO
	iftruefwd .HeardIntro
	writetext .IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_KNOCK_OFF_INTRO
.HeardIntro:
	writetext .QuestionText
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	yesorno
	iffalsefwd .TutorRefused
	setval KNOCK_OFF
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Encontraré otra"
	line "cosa que hacer…"
	done

.IntroText:
	text "Estaba pescando"
	line "cuando un #mon"
	cont "saltó y tiró mi"

	para "¡caña al agua!"

	para "¿Cómo pescaré"
	line "algo ahora?"

	para "…Bueno, si no"
	line "puedo pescar,"
	cont "solo enseñaré."
	done

.QuestionText:
	text "Me das una Hoja"
	line "Plateada y"

	para "le enseño a tu"
	line "#mon Derribo."

	para "¿Qué tal?"
	done

.NoSilverLeaf
	waitbutton
	jumpthisopenedtext

	text "Sin Hoja, sin"
	line "movimiento. Mi"
	cont "tiempo no es"
	cont "gratis."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Derribo tira el"
	line "objeto equipado"

	para "para que no se"
	line "pueda usar en"
	cont "combate."

	para "¡Es tan"
	line "frustrante!"
	done

MonicaScript:
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue_jumptextfaceplayer MonicaMondayText
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, MonicaNotMondayScript
	faceplayer
	opentext
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftruefwd .MetMonica
	writetext MeetMonicaText
	promptbutton
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	promptbutton
	verbosegiveitem SHARP_BEAK
	iffalsefwd MonicaDoneScript
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	jumpthisopenedtext

	text "Luna: Es un"
	line "objeto que"
	cont "aumenta el poder"
	cont "de los"
	cont "movimientos tipo"
	cont "Volador."

	para "Deberías"
	line "equiparlo a un"
	cont "#mon ave."
	done

MonicaNotMondayScript:
	jumpthistextfaceplayer

	text "Luna: No creo que"
	line "hoy sea lunes."
	cont "Qué pena…"
	done

MonicaDoneScript:
	end

SwimmermSimonSeenText:
	text "Tienes que"
	line "calentar antes de"
	cont "entrar al agua."

	para "Eso es básico."
	done

SwimmermSimonBeatenText:
	text "¡Vale! ¡Me rindo!"
	done

SwimmermRandallSeenText:
	text "¡Eh, eres joven y"
	line "estás en forma!"

	para "¡No montes a tu"
	line "#mon! ¡Nada!"
	done

SwimmermRandallBeatenText:
	text "Uh-oh. Perdí…"
	done

SwimmerfElaineSeenText:
	text "¿Vas a Ciudad"
	line "Orquídea?"

	para "¿Un combate"
	line "rápido antes?"
	done

SwimmerfElaineBeatenText:
	text "¡Perdí ese"
	line "combate!"
	done

SwimmerfPaulaSeenText:
	text "Nada de flotador"
	line "para mí."

	para "¡Me aferro a un"
	line "#mon marino!"
	done

SwimmerfPaulaBeatenText:
	text "¡Uy, me siento"
	line "mareada!"
	done

Route40BeachGirlText:
	text "Acabo de comer en"
	line "el Café Olivo, así"

	para "que descanso antes"
	line "de nadar."
	done


Route40PokefanMText2:
	text "¡Hm! Mira a todos"
	line "esos entrenadores"
	cont "serios que"
	cont "llegan en masa."

	para "¿Qué? ¿Qué?"
	done

Route40PicnickerText:
	text "Vine a Ciudad"
	line "Olivo en barco"
	cont "para ver el"

	para "paisaje y"
	line "disfrutar del"
	cont "ambiente."

	para "Al ser un puerto,"
	line "se siente muy"
	cont "distinto de una"
	cont "gran ciudad."
	done


Route40BeachGuyText2:
	text "¿Has ido a la"
	line "Torre Batalla?"

	para "Creo que muchos"
	line "entrenadores"

	para "duros ya se han"
	line "reunido allí."

	para "Pero como tienes"
	line "tantas Medallas,"

	para "no deberías"
	line "hacerlo nada mal."
	done

MeetMonicaText:
	text "Luna: Encantada"
	line "de conocerte. Soy"

	para "Luna del lunes."
	done

MonicaGivesGiftText:
	text "Como muestra de"
	line "nuestra amistad,"
	cont "¡tengo un regalo"
	cont "para ti!"
	done


MonicaMondayText:
	text "Luna: Mis"
	line "hermanos y"
	cont "hermanas están"
	cont "por todas partes."

	para "¡A ver si puedes"
	line "encontrarlos a"
	cont "todos!"
	done


Route40SignText:
	text "Ruta 40"

	para "Ciudad Orquídea -"
	line "Ciudad Olivo"
	done
