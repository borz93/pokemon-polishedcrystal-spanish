VermilionPollutionSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 13
	warp_event  3,  7, VERMILION_CITY, 13

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionPollutionSpeechHouseBreederText, -1
	object_event  5,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionPollutionSpeechHouseCooltrainerMText, -1

VermilionPollutionSpeechHouseBreederText:
	text "Carmín es un lugar"
	line "maravilloso,"

	para "pero en un puerto"
	line "así hay que"
	cont "vigilar"
	cont "la contaminación!"
	done

VermilionPollutionSpeechHouseCooltrainerMText:
	text "Gracias a todos"
	line "los cruceros que"
	cont "van y vienen,"

	para "recibimos"
	line "visitantes de"
	cont "todas partes!"
	done
