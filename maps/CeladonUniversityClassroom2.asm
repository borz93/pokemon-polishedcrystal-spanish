CeladonUniversityClassroom2_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, CELADON_UNIVERSITY_1F, 7
	warp_event  3, 11, CELADON_UNIVERSITY_1F, 7

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom2BlackboardText
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom2BlackboardText
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom2BlackboardText
	bg_event  6,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom2Bookshelf1Text
	bg_event  7,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom2Bookshelf2Text

	def_object_events
	object_event  2,  1, SPRITE_BLANCHE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom2BlancheText, -1
	object_event  2,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << EVE) | (1 << NITE), PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom2TeacherText, -1
	object_event  4,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom2YoungsterText, -1
	object_event  2,  7, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom2ChildText, -1
	object_event  5,  7, SPRITE_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom2LadyText, -1
	object_event  3,  9, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonUniversityClassroom2CooltrainermScript, -1

CeladonUniversityClassroom2BlancheText:
	text "Soy Blanche."
	line "Enseño Historia"
	cont "aquí."

	para "Debemos aprender"
	line "de la historia, o"

	para "estaremos"
	line "condenados a"
	cont "repetirla."
	done

CeladonUniversityClassroom2TeacherText:
	text "Me temo que"
	line "Blanche no está"
	cont "disponible."

	para "Solo enseña de"
	line "día."
	done

CeladonUniversityClassroom2YoungsterText:
	text "Pasando mis"
	line "apuntes a toda"
	cont "velocidad--¡AY!"
	cont "Corte de papel…"
	done

CeladonUniversityClassroom2ChildText:
	text "Tuvimos una"
	line "lección sobre las"

	para "contribuciones del"
	line "Prof. Westwood a"
	cont "la #dex."

	para "Oí que hacia el"
	line "final"

	para "se hizo vago y"
	line "se inventó parte!"
	done

CeladonUniversityClassroom2LadyText:
	text "¿Eres de Johto?"
	line "Esa región tiene"

	para "una historia"
	line "fascinante!"
	done

CeladonUniversityClassroom2CooltrainermScript:
	showtext .Text1
	showtextfaceplayer .Text2
	turnobject LAST_TALKED, UP
	end

.Text1: ; text > text
	text "…Zzz…"
	line "¡Aah!"
	done

.Text2:
	text "Ejem."

	para "Perdona--me"
	line "asustaste."

	para "Me quedé despierto"
	line "hasta tarde para"

	para "terminar una"
	line "tarea, así que"
	cont "estoy agotado."
	done

CeladonUniversityClassroom2BlackboardText:
	text "Hay una línea"
	line "temporal de"
	cont "historia reciente."

	para "Hace 400 años:"
	line "se inventó"
	cont "Tóxico."

	para "Hace 71 años: se"
	line "creó la # Ball"
	cont "moderna."

	para "Hace 27 años:"
	line "primer alunizaje."

	para "Hace tres años:"
	line "primer #mon"
	cont "virtual creado."

	para "“Hipótesis: la"
	line "tecnología crece"
	cont "exponencialmente.”"
	done

CeladonUniversityClassroom2Bookshelf1Text:
	text "Es un libro sobre"
if DEF(FAITHFUL)
	line "cómo la Torre"
	cont "Latón de Ciudad"

	para "Iris se quemó"
	line "hace 150 años."
else
	line "cómo la Torre Gong"
	cont "de Ciudad Iris"

	para "se quemó hace 150"
	line "años."
endc
	done

CeladonUniversityClassroom2Bookshelf2Text:
	text "Es un libro de"
	line "jerga de los"
	cont "80."
	cont "¡Genial!"
	done
