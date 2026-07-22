StormyBeach_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 30,  4, MURKY_SWAMP, 1
	warp_event 31,  4, MURKY_SWAMP, 2
	warp_event 20, 10, HIDDEN_TREE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 17,  6, BGEVENT_ITEM + STARDUST, EVENT_STORMY_BEACH_HIDDEN_STARDUST
	bg_event 20,  9, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_STORMY_BEACH
	bg_event 21,  9, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_STORMY_BEACH

	def_object_events
	object_event  5, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfBarbara, -1
	object_event 14,  8, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperJulian, -1
	object_event 28,  7, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerCamperFelix, -1
	object_event 24, 11, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPicnickerLily, -1
	object_event 22, 16, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SWIM_AROUND, 1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, StormyBeachSwimmermText, -1
	object_event 32, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, StormyBeachGrampsText, -1
	itemball_event 34,  7, ZINC, 1, EVENT_STORMY_BEACH_ZINC
	smashrock_event 16, 6
	smashrock_event 17, 7
	smashrock_event 12, 9
	smashrock_event 18, 10

GenericTrainerSwimmerfBarbara:
	generictrainer SWIMMERF, BARBARA, EVENT_BEAT_SWIMMERF_BARBARA, .SeenText, .BeatenText

	text "Las corrientes me"
	line "arrastran…"
	done

.SeenText:
	text "Descansaba un"
	line "rato, pero"
	cont "siempre estoy"
	cont "lista para"
	cont "luchar!"
	done

.BeatenText:
	text "Fue un buen"
	line "combate, aunque"
	cont "perdí."
	done

GenericTrainerBird_keeperJulian:
	generictrainer BIRD_KEEPER, JULIAN, EVENT_BEAT_BIRD_KEEPER_JULIAN, .SeenText, .BeatenText

	text "Es más difícil"
	line "volar en sitios"
	cont "tormentosos como"
	cont "este."
	done

.SeenText:
	text "Entreno a mis"
	line "#mon de tipo"
	cont "Volador aquí."

	para "¿Quieres"
	line "ayudarme?"
	done

.BeatenText:
	text "Perdí…"
	line "¡Qué pena!"
	done

GenericTrainerCamperFelix:
	generictrainer CAMPER, FELIX, EVENT_BEAT_CAMPER_FELIX, .SeenText, .BeatenText

	text "¡Vamos a hacer"
	line "una barbacoa"
	cont "luego!"

	para "Solo necesito leña"
	line "para mi #mon"
	cont "la encienda."
	done

.SeenText:
	text "Busco leña."

	para "¿Quieres ayudar?"
	done

.BeatenText:
	text "Lo tomaré como"
	line "un no…"
	done

GenericTrainerPicnickerLily:
	generictrainer PICNICKER, LILY, EVENT_BEAT_PICNICKER_LILY, .SeenText, .BeatenText

	text "Vine a hacer un"
	line "picnic, ¡pero"
	cont "olvidé la"
	cont "comida!"
	cont "¡Qué bochorno!"
	done

.SeenText:
	text "¡Tengo hambre!"
	done

.BeatenText:
	text "¡Combatía con el"
	line "estómago vacío!"
	done

StormyBeachSwimmermText:
	text "Estamos de"
	line "acampada,"

	para "pero el tiempo no"
	line "pinta muy bien…"
	done

StormyBeachGrampsText:
	text "¿Lo sientes en el"
	line "aire? Se acerca"
	cont "una tormenta."

	para "Un buen augurio"
	line "para quien quiera"
	cont "explorar el"
	cont "pantano."
	done
