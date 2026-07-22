SaffronRichSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 20
	warp_event  3,  7, SAFFRON_CITY, 20

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronRichSpeechHouseRichBoyText, -1

SaffronRichSpeechHouseRichBoyText:
	text "Las casas son"
	line "caras en Azafrán."

	para "Si quieres vivir"
	line "aquí, necesitas"

	para "mucho dinero, o"
	line "buscar un"
	cont "compañero de piso."
	done
