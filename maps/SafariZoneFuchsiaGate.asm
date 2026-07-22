SafariZoneFuchsiaGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, SAFARI_ZONE_HUB, 1
	warp_event  5,  0, SAFARI_ZONE_HUB, 2
	warp_event  4,  7, FUCHSIA_CITY, 6
	warp_event  5,  7, FUCHSIA_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, SafariZoneFuchsiaGateOfficerText, -1

SafariZoneFuchsiaGateOfficerText:
	text "¡Hola!"

	para "El Guardián no"
	line "está, así que no"

	para "estamos con el"
	line "juego Safari"
	cont "ahora."

	para "Tendrás que traer"
	line "tus propias"

	para "Balls si quieres"
	line "atrapar algún"
	cont "#mon."
	done
