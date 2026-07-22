SafariZoneWardensHome_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, FUCHSIA_CITY, 5
	warp_event  5,  7, FUCHSIA_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPSTD, picturebookshelf
	bg_event  5,  0, BGEVENT_JUMPTEXT, WardenPhotoText
	bg_event  7,  0, BGEVENT_JUMPTEXT, SafariZonePhotoText
	bg_event  8,  1, BGEVENT_JUMPTEXT, WardensHouseCuriosText
	bg_event  9,  1, BGEVENT_JUMPTEXT, WardensHouseCuriosText

	def_object_events
	object_event  2,  4, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftruefwd .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	jumpthisopenedtext

	text "Mucha gente se"
	line "decepcionó"

	para "cuando cerró la"
	line "Zona Safari,"

	para "pero el abuelo"
	line "es tan tozudo…"
	done

WardensGranddaughterText1:
	text "Mi abuelo es el"
	line "Guarda de la"
	cont "Zona Safari."

	para "Al menos lo"
	line "era…"

	para "Decidió irse de"
	line "vacaciones y"

	para "se fue solo al"
	line "extranjero."

	para "Dejó de dirigir"
	line "la Zona Safari"
	cont "así, sin más."
	done


WardenPhotoText:
	text "Es una foto de"
	line "un anciano"
	cont "sonriente"

	para "rodeado de"
	line "#mon."
	done

SafariZonePhotoText:
	text "Es una foto de"
	line "una gran llanura"

	para "con #mon raros"
	line "retozando."
	done

WardensHouseCuriosText:
	text "Es una vitrina"
	line "llena de"

	para "fósiles y viejos"
	line "objetos #mon."
	done
