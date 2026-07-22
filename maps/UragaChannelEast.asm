UragaChannelEast_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, SCARY_CAVE_1F, 1

	def_coord_events

	def_bg_events
	bg_event 45,  5, BGEVENT_JUMPTEXT, UragaChannelSignText
	bg_event  3, 13, BGEVENT_JUMPTEXT, ScaryCaveEastSignText
	bg_event 33,  4, BGEVENT_ITEM + NUGGET, EVENT_URAGA_CHANNEL_EAST_HIDDEN_NUGGET
	bg_event 34, 14, BGEVENT_ITEM + PEARL, EVENT_URAGA_CHANNEL_EAST_HIDDEN_PEARL
	bg_event 22, 12, BGEVENT_ITEM + BOTTLE_CAP, EVENT_URAGA_CHANNEL_EAST_HIDDEN_BOTTLE_CAP
	bg_event  9, 11, BGEVENT_ITEM + STAR_PIECE, EVENT_URAGA_CHANNEL_EAST_HIDDEN_STAR_PIECE

	def_object_events
	object_event  5,  2, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSwimmerfWoda, -1
	object_event 22,  7, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainermKieran, -1
	object_event 34, 15, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBikerTyrone, -1
	object_event 10,  3, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_ITEMBALL, PLAYEREVENT_ITEMBALL, DIVE_BALL, 1, EVENT_URAGA_CHANNEL_EAST_DIVE_BALL
	itemball_event 20,  8, EVIOLITE, 1, EVENT_URAGA_CHANNEL_EAST_EVIOLITE

GenericTrainerSwimmerfWoda:
	generictrainer SWIMMERF, WODA, EVENT_BEAT_SWIMMERF_WODA, .SeenText, .BeatenText

	text "Las fuertes"
	line "corrientes de"
	cont "aquí son un buen"
	cont "sitio para"
	cont "entrenar."
	done

.SeenText:
	text "¿Viniste aquí a"
	line "entrenar también?"
	done

.BeatenText:
	text "¡No necesitas"
	line "más"
	cont "entrenamiento!"
	done

GenericTrainerCooltrainermKieran:
	generictrainer COOLTRAINERM, KIERAN, EVENT_BEAT_COOLTRAINERM_KIERAN, .SeenText, .BeatenText

	text "No pude"
	line "conseguir mi"
	cont "#mon."

	para "Necesito"
	line "centrarme de"
	cont "nuevo en el"
	cont "juego."
	done

.SeenText:
	text "¡Empieza el"
	line "combate #mon!"
	done

.BeatenText:
	text "Fin del juego."
	done

GenericTrainerBikerTyrone:
	generictrainer BIKER, TYRONE, EVENT_BEAT_BIKER_TYRONE, .SeenText, .BeatenText

	text "Me caí al agua"
	line "mientras"
	cont "presumía en el"
	cont "Ciclocarril."

	para "Luego las"
	line "fuertes"
	cont "corrientes me"
	cont "arrastraron aquí."
	done

.SeenText:
	text "¡Cof! ¡Glup!"
	done

.BeatenText:
	text "…¡Jadeo!"
	done

UragaChannelSignText:
	text "Canal Uraga"
	done

ScaryCaveEastSignText:
	text "Hay pintadas en"
	line "este cartel…"

	para "“Esta cueva da"
	line "miedo!”"
	done
