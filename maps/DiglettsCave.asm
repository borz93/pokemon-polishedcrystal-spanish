DiglettsCave_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 37, 15, VERMILION_CITY, 10
	warp_event 39, 13, DIGLETTS_CAVE, 5
	warp_event 37,  5, ROUTE_2_NORTH, 4
	warp_event 39,  3, DIGLETTS_CAVE, 6
	warp_event 37, 31, DIGLETTS_CAVE, 2
	warp_event  5,  5, DIGLETTS_CAVE, 4

	def_coord_events

	def_bg_events
	bg_event  8, 15, BGEVENT_ITEM + MAX_REVIVE, EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REVIVE
	bg_event 34, 33, BGEVENT_ITEM + MAX_REPEL, EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REPEL

	def_object_events
	object_event 11, 15, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DiglettsCaveFossilManiacScript, -1
	object_event  5, 13, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerGerard, -1
	object_event 25, 31, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerHikerDent, -1
	object_event 16, 21, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBlackbeltInigo, -1
	object_event  9, 20, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerSmith, -1
	object_event 37, 13, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, DiglettsCavePokefanMText, -1
	object_event 20, 27, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, DiglettsCaveCooltrainerfText, -1
	itemball_event 13, 28, RARE_BONE, 1, EVENT_DIGLETTS_CAVE_RARE_BONE

DiglettsCaveFossilManiacScript:
	faceplayer
	opentext
	writetext .GreetingText
	promptbutton
	special Special_ChooseItem
	iffalse_jumpopenedtext .NoItemText
	special GetFossilManiacPrice
	iffalse_jumpopenedtext .WrongItemText
	special ItemManiac_SelectQuantity
	iffalse_jumpopenedtext .NoItemText
	special MultiplyMoneyByQuantity
	writetext .OfferText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .NoItemText
	special TakeItemFromMemWithQuantity
	waitsfx
	playsound SFX_TRANSACTION
	special Give_hMoneyTemp
	special PlaceMoneyTopRight
	jumpthisopenedtext

	text "¡Eh, gracias!"

	para "Apuesto a que"
	line "puedo venderlo"
	cont "por mucho más de"
	cont "lo que te di. ¡Ja!"

	para "¡Eso es el"
	line "negocio!"
	done

.GreetingText:
	text "Oye, mira esto."
	line "¡Tengo una oferta"
	cont "genial para ti!"

	para "¿Sabes que"
	line "aparecen fósiles"
	cont "#mon en rocas?"

	para "Si encuentras uno,"
	line "tráemelo."

	para "Te lo pagaré bien."
	done

.OfferText:
	text "¡Oye, genial! Deja"
	line "que lo vea."

	para "Te doy"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text " por él."
	cont "¿Qué me dices?"
	done

.WrongItemText:
	text "No, esto no sirve."
	line "No vale la pena."
	done

.NoItemText:
	text "…No, nada"
	line "interesante en tu"
	cont "Bolso."

	para "En fin. ¡Quizá la"
	line "próxima vez!"
	done

GenericTrainerHikerGerard:
	generictrainer HIKER, GERARD, EVENT_BEAT_HIKER_GERARD, .SeenText, .BeatenText

	text "Este sitio me pone"
	line "muy nervioso."

	para "¿Y si un Diglett"
	line "me ataca de"
	cont "repente?"
	done

.SeenText:
	text "¡Aah! ¡Creo que"
	line "esa roca se movió!"
	done

.BeatenText:
	text "Debieron ser"
	line "imaginaciones"
	cont "mías."
	done

GenericTrainerHikerDent:
	generictrainer HIKER, DENT, EVENT_BEAT_HIKER_DENT, .SeenText, .BeatenText

	text "Encajaré bien con"
	line "el equipo"
	cont "musculoso del"
	cont "Gimnasio Plateado."
	cont "¡Jojo!"
	done

.SeenText:
	text "Voy camino a"
	line "Ciudad Plateada."

	para "Su Gimnasio tipo"
	line "Roca es perfecto"
	cont "para un tipo"
	cont "musculoso como yo!"
	done

.BeatenText:
	text "¡Jojo!"
	line "¡Alguien más"
	cont "musculoso que yo!"
	done

GenericTrainerBlackbeltInigo:
	generictrainer BLACKBELT_T, INIGO, EVENT_BEAT_BLACKBELT_INIGO, .SeenText, .BeatenText

	text "Hacer ruido no te"
	line "hace mejor"
	cont "luchador, pero"

	para "puede intimidar a"
	line "tus rivales."
	done

.SeenText:
	text "¡Prepárate para"
	line "el combate!"
	cont "¡HUA-JA!"
	done

.BeatenText:
	text "¡HIIYAAAH!"
	done

GenericTrainerEngineerSmith:
	generictrainer ENGINEER, SMITH, EVENT_BEAT_ENGINEER_SMITH, .SeenText, .BeatenText

	text "Esos Diglett son"
	line "ingenieros"
	cont "natos."
	done

.SeenText:
	text "¿Cómo creó Diglett"
	line "un túnel tan"
	cont "largo?"
	done

.BeatenText:
	text "¡Increíble!"
	done

DiglettsCaveCooltrainerfText:
	text "Mira todos estos"
	line "Diglett tan"
	cont "monos!"

	para "¡Juro que vi uno"
	line "con la nariz azul!"
	done

DiglettsCavePokefanMText:
	text "Un montón de"
	line "Diglett salieron"
	cont "de la tierra! Fue"

	para "impactante."

	para "Oí que los Diglett"
	line "de Isla Canela se"
	cont "ven diferentes."
	done
