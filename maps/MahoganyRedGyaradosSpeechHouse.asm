MahoganyRedGyaradosSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, MAHOGANY_TOWN, 2
	warp_event  3,  7, MAHOGANY_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyRedGyaradosSpeechHouseBlackBeltText, -1
	object_event  6,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyRedGyaradosSpeechHouseTeacherScript, -1

MahoganyRedGyaradosSpeechHouseTeacherScript:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue_jumptextfaceplayer MahoganyRedGyaradosSpeechHouseTeacherText_RocketsInRadioTower
	jumpthistextfaceplayer

	text "¿Mi programa de"
	line "radio favorito?"
	cont "Música #mon."
	done

MahoganyRedGyaradosSpeechHouseBlackBeltText:
	text "Oí que apareció"
	line "un Gyarados rojo"
	cont "en el lago."

	para "Qué raro, ya que"
	line "hasta los"

	para "Gyarados normales"
	line "son raros en ese"
	cont "lago…"
	done

MahoganyRedGyaradosSpeechHouseTeacherText_RocketsInRadioTower:
	text "He estado oyendo"
	line "risas en la"

	para "radio…"
	line "Da escalofríos."
	done
