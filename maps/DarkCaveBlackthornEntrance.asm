DarkCaveBlackthornEntrance_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 23,  3, ROUTE_45, 1
	warp_event  3, 25, DARK_CAVE_VIOLET_ENTRANCE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DarkCaveBlackthornEntrancePharmacistScript, -1
	itemball_event 21, 24, REVIVE, 1, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_REVIVE
	tmhmball_event  7, 22, TM_DARK_PULSE, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_TM_DARK_PULSE

DarkCaveBlackthornEntrancePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
	iftrue_jumpopenedtext .PharmacistText2
	writetext .PharmacistText1
	promptbutton
	verbosegiveitem BLACKGLASSES
	iffalse_endtext
	setevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
	jumpthisopenedtext

.PharmacistText2:
	text "Las Gafas Negras"
	line "aumentan el poder"
	cont "de los movimientos"
	cont "de tipo Siniestro."
	done

.PharmacistText1:
	text "¡Uy! ¡Qué susto"
	line "me diste!"

	para "Llevaba puestas"
	line "mis Gafas Negras,"

	para "así que no te vi"
	line "para nada."

	para "¿Qué estoy"
	line "haciendo aquí?"

	para "Oye, no te"
	line "preocupes por"
	cont "eso."

	para "Te daré unas"
	line "Gafas Negras,"
	cont "así que olvida"
	cont "que me viste, ¿ok?"
	done
