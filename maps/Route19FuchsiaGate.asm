Route19FuchsiaGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, FUCHSIA_CITY, 9
	warp_event  5,  0, FUCHSIA_CITY, 10
	warp_event  4,  7, ROUTE_19, 1
	warp_event  5,  7, ROUTE_19, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19FuchsiaGateOfficerScript, -1

Route19FuchsiaGateOfficerScript:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue_jumptextfaceplayer Route19FuchsiaGateOfficerText_RocksCleared
	jumpthistextfaceplayer

	text "El volcán de"
	line "Canela entró en"
	cont "erupción."

	para "Lanzó rocas que"
	line "bloquearon la"
	cont "Ruta 19"
	cont "indefinidamente."

	para "Me pregunto si la"
	line "gente de Canela"
	cont "está a salvo…"
	done

Route19FuchsiaGateOfficerText_RocksCleared:
	text "Ningún ciudadano"
	line "de Canela resultó"
	cont "herido"

	para "por la erupción."
	line "¡Qué bien!"
	done
