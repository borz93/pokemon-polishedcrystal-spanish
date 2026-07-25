SafariZoneWest_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 22,  2, SAFARI_ZONE_NORTH, 8
	warp_event 23,  2, SAFARI_ZONE_NORTH, 9
	warp_event 28,  2, SAFARI_ZONE_NORTH, 3
	warp_event 29,  2, SAFARI_ZONE_NORTH, 4
	warp_event 31, 24, SAFARI_ZONE_HUB, 5
	warp_event 31, 25, SAFARI_ZONE_HUB, 6
	warp_event 13, 13, SAFARI_ZONE_WEST_REST_HOUSE_1, 1
	warp_event  5,  5, SAFARI_ZONE_WEST_REST_HOUSE_2, 1

	def_coord_events

	def_bg_events
	bg_event 26, 24, BGEVENT_JUMPTEXT, SafariZoneWestAreaSignText
	bg_event 14, 14, BGEVENT_JUMPTEXT, SafariZoneWestRestHouseSignText
	bg_event 28,  6, BGEVENT_JUMPTEXT, SafariZoneWestTrainerTips1SignText
	bg_event 19,  5, BGEVENT_JUMPTEXT, SafariZoneWestTrainerTips2SignText
	bg_event 13,  6, BGEVENT_ITEM + NUGGET, EVENT_SAFARI_ZONE_WEST_HIDDEN_NUGGET

	def_object_events
	object_event 22, 23, SPRITE_LASS, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassDuplica, -1
	object_event 23, 12, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperAmos, -1
	object_event 12, 19, SPRITE_TAMER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerTamerBrett, -1
	itemball_event 14,  9, MAX_REVIVE, 1, EVENT_SAFARI_ZONE_WEST_MAX_REVIVE

GenericTrainerLassDuplica:
	generictrainer LASS, DUPLICA, EVENT_BEAT_LASS_DUPLICA, LassDuplicaSeenText, LassDuplicaBeatenText

	text "¡Se me dan genial"
	line "las imitaciones!"

	para "Algún día seré"
	line "entrenadora del"
	cont "Gimnasio de"
	cont "Fucsia e imitaré"
	cont "a Sachiko."
	done

GenericTrainerCamperAmos:
	generictrainer CAMPER, AMOS, EVENT_BEAT_CAMPER_AMOS, CamperAmosSeenText, CamperAmosBeatenText

	text "Buscaré por todas"
	line "partes nuevos"
	cont "#mon."
	done

GenericTrainerTamerBrett:
	generictrainer TAMER, BRETT, EVENT_BEAT_TAMER_BRETT, TamerBrettSeenText, TamerBrettBeatenText

	text "Hay que mandar a"
	line "los #mon con"
	cont "confianza."

	para "Ganar Medallas"
	line "ayuda con eso."
	done

LassDuplicaSeenText:
	text "Para usar bien a"
	line "Ditto, debes"
	cont "conocer todos los"
	cont "#mon!"
	done

LassDuplicaBeatenText:
	text "Tengo mucho que"
	line "aprender."
	done

CamperAmosSeenText:
	text "Muchos #mon"
	line "viven en la Zona"
	cont "Safari."

	para "¡Vine a"
	line "atraparlos a"
	cont "todos!"
	done

CamperAmosBeatenText:
	text "Perdí porque"
	line "tengo que"
	cont "entrenarlos más!"
	done

TamerBrettSeenText:
	text "¿Sabes cómo"
	line "tratar con #mon"
	cont "agresivos?"
	done

TamerBrettBeatenText:
	text "¡Sí, sabes!"
	done

SafariZoneWestAreaSignText:
	text "Zona Safari"
	line "Zona Oeste"
	done

SafariZoneWestRestHouseSignText:
	text "Casa de Descanso"
	done

SafariZoneWestTrainerTips1SignText:
	text "Consejos"

	para "Los #mon de"
	line "tipo Fuego no se"
	cont "queman,"

	para "los de tipo"
	line "Eléctrico no se"
	cont "paralizan,"

	para "y los de tipo"
	line "Hielo no se"
	cont "congelan."
	done

SafariZoneWestTrainerTips2SignText:
	text "Consejos"

	para "En una tormenta"
	line "de arena, los"
	cont "#mon de tipo"
	cont "Roca mejoran su"
	cont "Def. Esp."
	done
