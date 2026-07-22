GuideGentsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 4
	warp_event  3,  7, CHERRYGROVE_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GuideGentsHouseGuideGentText, EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE

GuideGentsHouseGuideGentText:
	text "Cuando era joven,"
	line "era un entrenador"
	cont "de primera!"

	para "Un consejo:"
	line "¡Atrapa muchos"
	cont "#mon!"

	para "¡Trátalos a todos"
	line "con cariño!"
	done
