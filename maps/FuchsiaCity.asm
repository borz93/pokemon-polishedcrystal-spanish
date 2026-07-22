FuchsiaCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, FuchsiaCityFlyPoint

	def_warp_events
	warp_event  5, 13, FUCHSIA_MART, 2
	warp_event  8, 27, FUCHSIA_GYM, 1
	warp_event 11, 27, FUCHSIA_BILL_SPEECH_HOUSE, 1
	warp_event 19, 27, FUCHSIA_POKECENTER_1F, 1
	warp_event 27, 27, SAFARI_ZONE_WARDENS_HOME, 1
	warp_event 18,  3, SAFARI_ZONE_FUCHSIA_GATE, 3
	warp_event 37, 22, ROUTE_15_FUCHSIA_GATE, 1
	warp_event 37, 23, ROUTE_15_FUCHSIA_GATE, 2
	warp_event  7, 33, ROUTE_19_FUCHSIA_GATE, 1
	warp_event  8, 33, ROUTE_19_FUCHSIA_GATE, 2
	warp_event 15, 27, FUCHSIA_SAFARI_BALL_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 21, 19, BGEVENT_JUMPTEXT, FuchsiaCitySignText
	bg_event  5, 29, BGEVENT_JUMPTEXT, FuchsiaGymSignText
	bg_event 21, 15, BGEVENT_JUMPTEXT, SafariZoneOfficeSignText
	bg_event 27, 29, BGEVENT_JUMPTEXT, WardensHomeSignText
	bg_event 17,  5, BGEVENT_JUMPTEXT, SafariZoneClosedSignText
	bg_event 13, 19, BGEVENT_JUMPTEXT, NoLitteringSignText
	bg_event  7,  7, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event 13,  7, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event 27,  7, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event 33,  7, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event 31, 13, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event  9, 15, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event 11, 35, BGEVENT_JUMPTEXT, FuchsiaCityCarefulSwimmingSignText
	bg_event 22, 13, BGEVENT_JUMPTEXT, SafariZoneOfficeClosedSignText
	bg_event 31, 27, BGEVENT_JUMPTEXT, HouseForSaleSignText
	bg_event 26, 12, BGEVENT_ITEM + NUGGET, EVENT_FUCHSIA_CITY_HIDDEN_NUGGET

	def_object_events
	object_event 19, 17, SPRITE_CAMPER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityYoungsterText, -1
	object_event 10,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityPokefanMText, -1
	object_event 16, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityTeacherText, -1
	object_event 28,  8, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityPokefanFText, -1
	cuttree_event 16, 19, EVENT_FUCHSIA_CITY_CUT_TREE
	fruittree_event 14, 17, FRUITTREE_FUCHSIA_CITY, LIECHI_BERRY, PAL_NPC_RED

FuchsiaCityFlyPoint:
	setflag ENGINE_FLYPOINT_FUCHSIA
	endcallback

FuchsiaCityYoungsterText:
	text "Uno del Alto"
	line "Mando fue Líder"

	para "del Gimnasio de"
	line "Fucsia."
	done

FuchsiaCityPokefanMText:
	text "La hija de Koga"
	line "lo sucedió como"

	para "Líder de Gimnasio"
	line "al unirse él al"
	cont "Alto Mando."
	done

FuchsiaCityTeacherText:
	text "El Juego Safari"
	line "está cancelado…"

	para "Al menos la Zona"
	line "Safari sigue"
	cont "abierta."

	para "Necesitarás un"
	line "#mon fuerte"
	cont "para explorarla,"
	cont "eso sí."
	done

FuchsiaCityPokefanFText:
	text "Cuando el"
	line "Guardián de la"
	cont "Zona Safari se"
	cont "fue,"

	para "no había nadie"
	line "para mantener el"
	cont "zoo del pueblo."

	para "Así que los"
	line "#mon fueron"
	cont "liberados de"
	cont "vuelta a la"
	cont "naturaleza."
	done

FuchsiaCitySignText:
	text "Ciudad Fucsia"

	para "¡Contempla el"
	line "Rosa Pasión!"
	done

FuchsiaGymSignText:
	text "Ciudad Fucsia"
	line "Gimnasio #mon"
	cont "Líder: Janine"

	para "La Ninja Maestra"
	line "Venenosa"
	done

SafariZoneOfficeSignText:
	text "Hay un aviso"
	line "aquí…"

	para "La Oficina de la"
	line "Zona Safari está"
	cont "cerrada hasta"
	cont "nuevo aviso."
	done

SafariZoneOfficeClosedSignText:
	text "Está cerrado…"
	done

WardensHomeSignText:
	text "Casa del"
	line "Guardián de la"
	cont "Zona Safari"
	done

SafariZoneClosedSignText:
	text "El Guardián está"
	line "viajando fuera."

	para "Por eso, el Juego"
	line "Safari está"
	cont "cancelado."
	done

NoLitteringSignText:
	text "No tirar basura."

	para "Por favor, llévate"
	line "tu basura."
	done

SafariZoneExhibitSignText:
	text "El cartel fue"
	line "arrancado…"
	done

HouseForSaleSignText:
	text "¿Qué es esto?"

	para "Casa en venta…"
	line "Nadie vive aquí."
	done

FuchsiaCityCarefulSwimmingSignText:
	text "Ten cuidado si"
	line "vas a nadar a"
	cont "las Islas Espuma."

	para "Policía de Fucsia"
	done
