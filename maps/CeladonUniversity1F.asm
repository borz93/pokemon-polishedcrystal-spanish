CeladonUniversity1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 14, 19, CELADON_CITY, 13
	warp_event 15, 19, CELADON_CITY, 19
	warp_event 25, 12, CELADON_UNIVERSITY_2F, 1
	warp_event 21, 12, CELADON_UNIVERSITY_LIBRARY_1F, 1
	warp_event 15,  0, CELADON_UNIVERSITY_PRINCIPALS_OFFICE, 1
	warp_event  3,  4, CELADON_UNIVERSITY_CLASSROOM_1, 1
	warp_event  9,  4, CELADON_UNIVERSITY_CLASSROOM_2, 1
	warp_event 21,  4, CELADON_UNIVERSITY_CLASSROOM_3, 1
	warp_event 27,  4, CELADON_UNIVERSITY_CLASSROOM_4, 1
	warp_event  3, 12, CELADON_UNIVERSITY_LOUNGE, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonUniversity1FPrincipalsOfficeSignText
	bg_event  2,  4, BGEVENT_JUMPTEXT, CeladonUniversity1FClassroom1SignText
	bg_event  8,  4, BGEVENT_JUMPTEXT, CeladonUniversity1FClassroom2SignText
	bg_event 20,  4, BGEVENT_JUMPTEXT, CeladonUniversity1FClassroom3SignText
	bg_event 26,  4, BGEVENT_JUMPTEXT, CeladonUniversity1FClassroom4SignText
	bg_event  2, 12, BGEVENT_JUMPTEXT, CeladonUniversity1FStudentLoungeSignText
	bg_event 20, 12, BGEVENT_JUMPTEXT, CeladonUniversity1FLibrarySignText
	bg_event 22,  5, BGEVENT_JUMPTEXT, CeladonUniversity1FTrophyCaseSignText
	bg_event 23,  5, BGEVENT_JUMPTEXT, CeladonUniversity1FTrophyCaseSignText
	bg_event  6, 13, BGEVENT_JUMPTEXT, CeladonUniversity1FTrophyCaseSignText
	bg_event  7, 13, BGEVENT_JUMPTEXT, CeladonUniversity1FTrophyCaseSignText
	bg_event 26, 13, BGEVENT_JUMPTEXT, CeladonUniversity1FBookshelfText
	bg_event 27, 13, BGEVENT_JUMPTEXT, CeladonUniversity1FBookshelfText

	def_object_events
	object_event  6,  5, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FSuperNerdText, -1
	object_event 16,  4, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FLassText, -1
	object_event 25,  5, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FCooltrainermText, -1
	object_event 13,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FYoungsterText, -1
	object_event  4, 15, SPRITE_CHILD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, (1 << MORN) | (1 << DAY), PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FChildText, -1
	object_event  6, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 3, (1 << EVE) | (1 << NITE), PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FPokefanmText, -1
	object_event 14, 14, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FReceptionistText, -1
	object_event 23, 13, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FCooltrainerfText, -1

CeladonUniversity1FSuperNerdText:
	text "Algunos académicos"
	line "creen que hay"

	para "otros universos"
	line "paralelos a este."

	para "¿Eso implica que"
	line "hay un universo"

	para "sin ningún"
	line "#mon?"

	para "¡Eso sería"
	line "trágico!"
	done

CeladonUniversity1FLassText:
	text "Este sitio ofrece"
	line "cursos de todo"

	para "tipo, desde"
	line "arreglo floral"

	para "hasta psicología"
	line "#mon!"
	done

CeladonUniversity1FCooltrainermText:
	text "Todos en esta"
	line "universidad son"
	cont "entrenadores"
	cont "#mon."

	para "Para entrar aquí,"
	line "tienes que"

	para "aprobar una serie"
	line "de pruebas de"
	cont "combate #mon."
	done

CeladonUniversity1FYoungsterText:
	text "Magikarp es el"
	line "#mon mascota de"
	cont "la universidad."

	para "¡Es un símbolo de"
	line "que cualquiera"
	cont "puede aspirar a la"
	cont "grandeza!"
	done

CeladonUniversity1FChildText:
	text "¡Uf! No encuentro"
	line "mi próxima clase…"

	para "¡Voy a llegar"
	line "tarde!"
	done

CeladonUniversity1FPokefanmText:
	text "¡Soy el conserje!"

	para "¡Cuidado, el suelo"
	line "está mojado!"
	done

CeladonUniversity1FReceptionistText:
	text "¡Bienvenido a la"
	line "Universidad de"
	cont "Azulona!"

	para "Las aulas y el"
	line "despacho del"
	cont "director están al"
	cont "fondo del"
	cont "pasillo."

	para "La biblioteca está"
	line "a tu derecha, la"

	para "sala de estudio a"
	line "tu izquierda."

	para "La cafetería, la"
	line "piscina y la"

	para "enfermería están"
	line "arriba."
	done

CeladonUniversity1FCooltrainerfText:
	text "Estudio para ser"
	line "enfermera #mon."

	para "Con tantas"
	line "especies ahí"
	cont "fuera,"

	para "¡es una curva de"
	line "aprendizaje muy"
	cont "empinada!"
	done

CeladonUniversity1FPrincipalsOfficeSignText:
	text "Despacho del"
	line "Director"
	done

CeladonUniversity1FClassroom1SignText:
	text "O2 Arte"
	done

CeladonUniversity1FClassroom2SignText:
	text "O1 Historia"
	done

CeladonUniversity1FClassroom3SignText:
	text "E1 Ciencias"
	done

CeladonUniversity1FClassroom4SignText:
	text "E2 Combate"
	done

CeladonUniversity1FStudentLoungeSignText:
	text "Sala de Estudio"
	done

CeladonUniversity1FLibrarySignText:
	text "Biblioteca"
	done

CeladonUniversity1FTrophyCaseSignText:
	text "La vitrina está"
	line "llena de trofeos y"
	cont "medallas."
	done

CeladonUniversity1FBookshelfText:
	text "Hay montones de"
	line "anuarios aquí."

	para "Los estudiantes"
	line "los han"
	cont "garabateado"
	cont "enteros."
	done
