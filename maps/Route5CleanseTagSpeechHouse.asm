Route5CleanseTagSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_5, 4
	warp_event  3,  7, ROUTE_5, 4

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  2,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route5CleanseTagHouseGrannyScript, -1
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route5CleanseTagHouseTeacherText, -1

Route5CleanseTagHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEANSE_TAG
	iftruefwd .GotCleanseTag
	writetext Route5CleanseTagHouseGrannyText1
	promptbutton
	verbosegiveitem CLEANSE_TAG
	iffalsefwd .NoRoom
	setevent EVENT_GOT_CLEANSE_TAG
.GotCleanseTag:
	writetext Route5CleanseTagHouseGrannyText2
	waitbutton
.NoRoom:
	endtext

Route5CleanseTagHouseGrannyText1:
	text "¡Aaaah!"

	para "Siento una"
	line "sombra siniestra"
	cont "sobre ti."

	para "¡Toma esto para"
	line "ahuyentarla!"
	done

Route5CleanseTagHouseGrannyText2:
	text "Estabas en"
	line "peligro mortal,"
	cont "pero ya estás"
	cont "protegido."
	done

Route5CleanseTagHouseTeacherText:
	text "Mi abuela se"
	line "dedica a ahuyentar"

	para "lo que ella cree"
	line "que son espíritus"
	cont "malignos."

	para "Siento que te"
	line "asustara."
	done
