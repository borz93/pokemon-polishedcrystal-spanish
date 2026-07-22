VermilionSSAnneSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 14
	warp_event  3,  7, VERMILION_CITY, 14

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionSSAnneSpeechHouseGrampsText, -1
	object_event  5,  4, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionSSAnneSpeechHouseBeautyText, -1

VermilionSSAnneSpeechHouseGrampsText:
	text "Una vez al año,"
	line "un crucero"
	cont "llamado S.S.Anne"

	para "atracaba aquí, en"
	line "Carmín."

	para "Así fue, hasta que"
	line "un año ocurrió"
	cont "una tragedia."

	para "Algo salió mal"
	line "y el barco"

	para "se hundió en el"
	line "mar, para no"
	cont "volver jamás."
	done

VermilionSSAnneSpeechHouseBeautyText:
	text "Vi una maqueta"
	line "del S.S.Anne"

	para "en un Museo"
	line "Oceánico lejano."
	done
