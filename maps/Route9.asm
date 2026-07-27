Route9_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 21,  7, BGEVENT_JUMPTEXT, Route9SignText
	bg_event 51, 15, BGEVENT_ITEM + ETHER, EVENT_ROUTE_9_HIDDEN_ETHER
	bg_event 42, 12, BGEVENT_ITEM + SOFT_SAND, EVENT_ROUTE_9_HIDDEN_SOFT_SAND
	bg_event 39,  3, BGEVENT_JUMPTEXT, Route9AdvancedTipsSignText

	def_object_events
	object_event 25, 11, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperDean, -1
	object_event 43,  8, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPicnickerHeidi, -1
	object_event 15,  4, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerCamperSid, -1
	object_event 16, 15, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPicnickerEdna, -1
	object_event 34,  3, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerTim, -1
	object_event 44, 15, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerHikerSidney, -1
	itemball_event 26,  2, MAX_POTION, 1, EVENT_ROUTE_9_MAX_POTION
	tmhmball_event 45,  2, TM_FLASH_CANNON, EVENT_ROUTE_9_TM_FLASH_CANNON
	cuttree_event  4,  8, EVENT_ROUTE_9_CUT_TREE

GenericTrainerCamperDean:
	generictrainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText

	text "Mis #mon ya"
	line "salieron heridos"

	para "antes de entrar"
	line "al Túnel Roca."

	para "Mejor los llevo ya"
	line "a un Centro"
	cont "#mon."
	done

GenericTrainerPicnickerHeidi:
	generictrainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText

	text "Horneamos muchas"
	line "cosas ricas y las"

	para "compartimos todos."
	line "¡Son deliciosas!"
	done

GenericTrainerCamperSid:
	generictrainer CAMPER, SID, EVENT_BEAT_CAMPER_SID, CamperSidSeenText, CamperSidBeatenText

	text "Perdona. No"
	line "estabas tirando"
	cont "basura. Fue mi"
	cont "error."
	done

GenericTrainerPicnickerEdna:
	generictrainer PICNICKER, EDNA, EVENT_BEAT_PICNICKER_EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText

	text "Ahorrar energía es"
	line "importante, pero"

	para "el medio ambiente"
	line "importa aún más."
	done

GenericTrainerHikerTim:
	generictrainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText

	text "Los combates son"
	line "concentración."
	done

GenericTrainerHikerSidney:
	generictrainer HIKER, SIDNEY, EVENT_BEAT_HIKER_SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText

	text "La Central"
	line "Eléctrica está al"
	cont "otro lado de un"
	cont "riachuelo."
	done

CamperDeanSeenText:
	text "Vine a explorar el"
	line "Túnel Roca."
	done

CamperDeanBeatenText:
	text "¡Uy! Peligro, tío."
	done

PicnickerHeidiSeenText:
	text "¿Has ido alguna"
	line "vez de picnic?"

	para "¡Es tan"
	line "divertido!"
	done

PicnickerHeidiBeatenText:
	text "¡Oooh!"
	done

CamperSidSeenText:
	text "¡Eh, tú!"
	line "¡No tires basura!"
	done

CamperSidBeatenText:
	text "Solo lo estaba"
	line "señalando…"
	done

PicnickerEdnaSeenText:
	text "Nadie debería"
	line "dejar basura"
	cont "atrás."
	done

PicnickerEdnaBeatenText:
	text "Ohh… Perdí…"
	done

HikerTimSeenText:
	text "♪ Ella vendrá por"
	line "el Monte Plateado"
	cont "cuando venga… ♪"

	para "El Monte Plateado"
	line "está en Johto,"
	cont "¿No?"
	done

HikerTimBeatenText:
	text "Estaba muy"
	line "ocupado cantando…"
	done

HikerSidneySeenText:
	text "Te diré un"
	line "secreto."

	para "¡Pero antes,"
	line "combatimos!"
	done

HikerSidneyBeatenText:
	text "¡Oh, vaya!"
	line "Perdí eso…"
	done

Route9SignText:
	text "Ruta 9"

	para "Ciudad Celeste -"
	line "Túnel Roca"
	done

Route9AdvancedTipsSignText:
	text "¡Consejo"
	line "avanzado!"

	para "Un #mon con una"
	line "Toxisfera se"
	cont "envenena, y uno"

	para "con una Llamasfera"
	line "se quema."

	para "Pero la Habilidad"
	line "Agallas convierte"

	para "eso en ventaja"
	line "subiendo el"
	cont "Ataque!"
	done
