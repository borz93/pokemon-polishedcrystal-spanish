SafariZoneEast_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 24, SAFARI_ZONE_HUB, 3
	warp_event  2, 25, SAFARI_ZONE_HUB, 4
	warp_event  2,  6, SAFARI_ZONE_NORTH, 1
	warp_event  2,  7, SAFARI_ZONE_NORTH, 2
	warp_event 27, 11, SAFARI_ZONE_EAST_REST_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  6, 24, BGEVENT_JUMPTEXT, SafariZoneEastAreaSignText
	bg_event 28, 12, BGEVENT_JUMPTEXT, SafariZoneEastRestHouseSignText
	bg_event  8,  6, BGEVENT_JUMPTEXT, SafariZoneEastTrainerTipsSignText

	def_object_events
	object_event  9, 11, SPRITE_COWGIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCowgirlApril, -1
	itemball_event 22, 15, CARBOS, 1, EVENT_SAFARI_ZONE_EAST_CARBOS
	itemball_event  7, 13, SILVERPOWDER, 1, EVENT_SAFARI_ZONE_EAST_SILVERPOWDER
	itemball_event  5,  3, FULL_RESTORE, 1, EVENT_SAFARI_ZONE_EAST_FULL_RESTORE

GenericTrainerCowgirlApril:
	generictrainer COWGIRL, APRIL, EVENT_BEAT_COWGIRL_APRIL, CowgirlAprilSeenText, CowgirlAprilBeatenText

	text "A veces ves 10"
	line "del mismo"

	para "#mon, todos en"
	line "fila!"
	done

CowgirlAprilSeenText:
	text "¡Yija!"
	line "Acabo de"
	cont "atrapar toda una"
	cont "manada de #mon!"
	done

CowgirlAprilBeatenText:
	text "¡Vaya chasco!"
	done

SafariZoneEastAreaSignText:
	text "Zona Safari"
	line "Este"
	done

SafariZoneEastRestHouseSignText:
	text "Casa de Descanso"
	done

SafariZoneEastTrainerTipsSignText:
	text "Consejos útiles"

	para "Busca #mon"
	line "raros de noche"
	cont "o por la mañana!"
	done
