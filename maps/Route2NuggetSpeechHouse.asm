Route2NuggetSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_2_NORTH, 1
	warp_event  3,  7, ROUTE_2_NORTH, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  4, SPRITE_FAT_GUY, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2NuggetSpeechHouseFisherScript, -1

Route2NuggetSpeechHouseFisherScript:
	checkevent EVENT_GOT_NUGGET_FROM_GUY
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem NUGGET
	iffalse_endtext
	setevent EVENT_GOT_NUGGET_FROM_GUY
	jumpthisopenedtext

.Text2:
	text "Eso es una Pepita."

	para "No puedo darte"
	line "pepitas de"

	para "sabiduría, pero"
	line "¡algo es algo!"
	done

.Text1:
	text "¡Hola! Qué alegría"
	line "verte."

	para "Eres el primer"
	line "visitante en"
	cont "mucho tiempo."

	para "¡Estoy muy feliz!"
	line "Deja que te dé"
	cont "un regalito."
	done
