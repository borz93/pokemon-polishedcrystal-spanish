VermilionHouseFishingSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_JUMPTEXT, FishingDudesHousePhotoText

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, FishingDudeText, -1

FishingDudeText:
	text "Soy el Pescador"
	line "Mayor, líder de"
	cont "los Hnos. Pesca."

	para "¿Conoces al Gurú"
	line "de la Pesca en el"
	cont "Lago de la Furia?"

	para "Sueña con ver el"
	line "Magikarp más"
	cont "grande del mundo."

	para "Si no te importa,"
	line "¿podrías"
	cont "enseñarle los"

	para "Magikarp que"
	line "captures?"

	para "Quién sabe, quizá"
	line "captures el"
	cont "Magikarp soñado."
	done

FishingDudesHousePhotoText:
	text "Es una foto de"
	line "gente pescando…"

	para "Se lo están"
	line "pasando genial…"
	done
