CeladonUniversityWillowsOffice_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, CELADON_UNIVERSITY_2F, 3
	warp_event  4,  5, CELADON_UNIVERSITY_2F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  0, BGEVENT_JUMPTEXT, CeladonUniversityWillowsOfficeBlackboardText
	bg_event  1,  0, BGEVENT_JUMPTEXT, CeladonUniversityWillowsOfficeBlackboardText
	bg_event  2,  1, BGEVENT_JUMPTEXT, CeladonUniversityWillowsOfficeBookshelf1Text
	bg_event  3,  1, BGEVENT_JUMPTEXT, CeladonUniversityWillowsOfficeBookshelf2Text
	bg_event  5,  2, BGEVENT_RIGHT, CeladonUniversityWillowsOfficeComputer

	def_object_events
	object_event  0,  2, SPRITE_WILLOW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityWillowsOfficeWillowText, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityWillowsOfficeScientistText, -1

CeladonUniversityWillowsOfficeWillowText:
	text "¡Hola! Soy el"
	line "Prof. Willow."

	para "Superviso a"
	line "Candela, Blanche"
	cont "y Spark en su"

	para "docencia e"
	line "investigación."

	para "Puede que los"
	line "veas en clase."

	para "También estudio"
	line "hábitats y"
	cont "distribución de"
	cont "#mon."

	para "Estoy muy"
	line "ocupado, pero"

	para "mis excelentes"
	line "ayudantes hacen"
	cont "que todo avance."
	done

CeladonUniversityWillowsOfficeScientistText:
	text "¡Trabajo como"
	line "ayudante del"
	cont "Prof. Willow!"

	para "Catalogo mis"
	line "observaciones"
	cont "de la Ruta 7."

	para "Hoy vi 42"
	line "Raticate y"
	cont "37 Pidgeotto…"
	cont "¡y un Vulpix!"
	done

CeladonUniversityWillowsOfficeBlackboardText:
	text "Alguien escribió"
	line "“NO BORRAR”"
	cont "con una flecha"

	para "hacia un"
	line "garabato"
	cont "ilegible…"
	done

CeladonUniversityWillowsOfficeBookshelf1Text:
	text "Es un libro"
	line "sobre nichos"
	cont "ecológicos"

	para "y cómo los #mon"
	line "encajan en su"
	cont "entorno."
	done

CeladonUniversityWillowsOfficeBookshelf2Text:
	text "Es un folleto"
	line "promocional de"
	cont "la Zona Safari."

	para "Tiene muchos"
	line "#mon de"
	cont "aspecto exótico."
	done

CeladonUniversityWillowsOfficeComputer:
	jumpthistext

	text "“Sistema de"
	line "Transf. #mon”"
	cont "está en"
	cont "pantalla."
	done
