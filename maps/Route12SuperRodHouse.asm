Route12SuperRodHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_12_SOUTH, 1
	warp_event  3,  7, ROUTE_12_SOUTH, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route12SuperRodHouseFishingGuruScript, -1

Route12SuperRodHouseFishingGuruScript:
	checkevent EVENT_GOT_SUPER_ROD
	iftrue_jumptextfaceplayer .GaveSuperRodText
	faceplayer
	opentext
	writetext OfferSuperRodText
	yesorno
	iffalsefwd .Refused
	writetext GiveSuperRodText
	promptbutton
	verbosegivekeyitem SUPER_ROD
	iffalsefwd .NoRoom
	setevent EVENT_GOT_SUPER_ROD
	jumpthisopenedtext

.GaveSuperRodText:
	text "Prueba a pescar"
	line "donde haya"
	cont "agua."

	para "Recuerda que"
	line "puedes atrapar"

	para "#mon distintos"
	line "con cada caña."
	done

.Refused:
	writetext DontWantSuperRodText
	waitbutton
.NoRoom:
	endtext

OfferSuperRodText:
	text "Soy el hermano"
	line "menor del Gurú"
	cont "de la Pesca."

	para "Veo que te"
	line "gusta pescar."

	para "¡No me cabe"
	line "ninguna duda!"

	para "¿Ves? Sé que"
	line "tengo razón."
	done

GiveSuperRodText:
	text "¡Sí, sí! Tal y"
	line "como pensaba!"

	para "¡Toma,"
	line "aficionado! Es"
	cont "una Caña Super."
	done

DontWantSuperRodText:
	text "¿Eh? ¿Me"
	line "engañaron los"
	cont "ojos?"
	done
