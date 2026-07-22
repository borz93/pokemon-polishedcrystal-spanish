EcruteakCherishBallHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 16
	warp_event  4,  7, ECRUTEAK_CITY, 16

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCherishBallHouseGrampsScript, -1
	object_event  5,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCherishBallHouseGrannyText, -1

EcruteakCherishBallHouseGrampsScript:
	checkevent EVENT_GOT_CHERISH_BALL_FROM_ECRUTEAK
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem CHERISH_BALL
	iffalse_endtext
	setevent EVENT_GOT_CHERISH_BALL_FROM_ECRUTEAK
	jumpthisopenedtext

.Text2:
	text "Siempre"
	line "atesoraré el"

	para "tiempo que pasé"
	line "con mis #mon."
	done

.Text1:
	text "He vivido una"
	line "vida larga, y"

	para "tengo recuerdos"
	line "que atesoraré"
	cont "para siempre."

	para "Toma esto y crea"
	line "un nuevo recuerdo"
	cont "que atesorar."
	done

EcruteakCherishBallHouseGrannyText:
	text "La moda cambia"
	line "con los años,"

	para "pero Ciudad Iris"
	line "sigue siendo tan"
	cont "tradicional."
	done
