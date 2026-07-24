ValenciaIsland_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ValenciaIslandFlyPoint

	def_warp_events
	warp_event 18, 19, IVYS_LAB, 1
	warp_event  5, 19, IVYS_HOUSE, 1
	warp_event  3, 11, VALENCIA_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  8, 12, BGEVENT_JUMPTEXT, ValenciaIslandSignText
	bg_event 11,  5, BGEVENT_JUMPTEXT, ValenciaIslandGoneFishingSignText
	bg_event 13,  5, BGEVENT_JUMPTEXT, ValenciaIslandLockedDoorText
	bg_event 15, 19, BGEVENT_JUMPTEXT, IvysLabSignText
	bg_event 13,  3, BGEVENT_JUMPTEXT, IvysHouseSignText

	def_object_events
	object_event  7,  8, SPRITE_COOL_DUDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ValenciaIslandCooltrainermText, -1
	object_event 10, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ValenciaIslandYoungsterScript, -1

ValenciaIslandFlyPoint:
	setflag ENGINE_FLYPOINT_VALENCIA
	endcallback

ValenciaIslandCooltrainermText:
	text "En esa casa"
	line "viven un par de"
	cont "entrenadores"
	cont "fuertes."

	para "Son madre e"
	line "hija… ¿O quizá"
	cont "hijo?"

	para "Bueno, ahora"
	line "están de"
	cont "vacaciones."
	done

ValenciaIslandYoungsterScript:
	readvar VAR_PLAYERGENDER
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "La Prof. Ivy"
	line "está buenísima,"
	cont "¿No crees?"
	done

.Text2:
	text "Serás mona, pero"
	line "la Prof. Ivy"
	cont "está buenísima!"
	done

ValenciaIslandSignText:
	text "Isla Valencia"

	para "Naranjas Amargas"
	line "y Brisas Dulces"
	done

ValenciaIslandGoneFishingSignText:
	text "Pescando"

	para "(De vacaciones"
	line "en Alola!)"
	done

ValenciaIslandLockedDoorText:
	text "Está cerrado…"
	done

IvysLabSignText:
	text "Investig. Ivy"
	line "№.2 Bahía"
	done

IvysHouseSignText:
	text "Casa de Ivy"
	done
