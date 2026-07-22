CeladonUniversityClassroom3_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, CELADON_UNIVERSITY_1F, 8
	warp_event  3, 11, CELADON_UNIVERSITY_1F, 8

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom3BlackboardText
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom3BlackboardText
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom3BlackboardText
	bg_event  6,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom3Bookshelf1Text
	bg_event  7,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom3Bookshelf2Text

	def_object_events
	object_event  2,  1, SPRITE_SPARK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom3SparkText, -1
	object_event  2,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << EVE) | (1 << NITE), PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom3TeacherText, -1
	object_event  4,  5, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom3ChildText, -1
	object_event  3,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom3LassText, -1
	object_event  4,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom3Super_nerdText, -1

CeladonUniversityClassroom3SparkText:
	text "¡Oye! Soy Spark."
	line "Enseño Ciencias--"

	para "ahora mismo,"
	line "#biología."

	para "Estudiamos cómo"
	line "se reproducen los"
	cont "#mon."

	para "El Prof. Elm es"
	line "pionero en el"
	cont "campo."

	para "¡Ah, lo conoces!"
	line "¿Es verdad que"
	cont "vive en su"
	cont "laboratorio?"
	done

CeladonUniversityClassroom3TeacherText:
	text "¿Buscas a Spark?"

	para "Volverá mañana"
	line "por la mañana."
	done

CeladonUniversityClassroom3ChildText:
	text "Los #mon"
	line "dentro de las #"
	cont "Ball se"

	para "convierten en luz,"
	line "y vuelven a"

	para "materia al salir."

	para "¡No te preocupes,"
	line "no les duele nada!"
	done

CeladonUniversityClassroom3LassText:
	text "Mi instructor dijo"
	line "que Magneton es"

	para "unión de tres"
	line "Magnemite, pero"

	para "Magneton pesa 10"
	line "veces más que"
	cont "Magnemite."

	para "¡¿Cómo puede"
	line "ser?!"
	done

CeladonUniversityClassroom3Super_nerdText:
	text "¿Has oído del"
	line "#mon Eléctrico"
	cont "Mareep?"

	para "Su nombre viene de"
	line "la unidad de"
	cont "corriente"
	cont "eléctrica, el"
	cont "“amperio.”"

	para "¡Reordena las"
	line "letras y lo"
	cont "verás!"
	done

CeladonUniversityClassroom3BlackboardText:
	text "'Filogenética'"
	line "está en la"
	cont "pizarra."

	para "“…Los #mon se"
	line "dividen en 14"
	cont "“grupos Huevo”,"
	cont "más Ditto."

	para "Los #mon bebé"
	line "no pueden"
	cont "reproducirse."

	para "Los #mon"
	line "Legendarios no"
	cont "han sido"
	cont "estudiados.”"
	done

CeladonUniversityClassroom3Bookshelf1Text:
	text "Es un libro de"
	line "diseños"
	cont "prototipo"

	para "de dispositivos"
	line "tecnológicos."

	para "¡Oye! ¡Hay un"
	line "diagrama antiguo"
	cont "de #gear aquí!"
	done

CeladonUniversityClassroom3Bookshelf2Text:
	text "Es un artículo"
	line "escrito por el"
	cont "Prof. Silktree."

	para "“Informe de"
	line "Investigación de"
	cont "las Ruinas Alfa”…"
	done
