CeladonUniversityLibrary2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  0, CELADON_UNIVERSITY_LIBRARY_1F, 3

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FSignpost1Text
	bg_event 10,  0, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FSignpost2Text
	bg_event  0,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf1Text
	bg_event  1,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf2Text
	bg_event  2,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf3Text
	bg_event  3,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf4Text
	bg_event  4,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf5Text
	bg_event  5,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf6Text
	bg_event  8,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf7Text
	bg_event  9,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf8Text
	bg_event 10,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf9Text
	bg_event 11,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf10Text
	bg_event 12,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf11Text
	bg_event 13,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf12Text
	bg_event  6,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf13Text
	bg_event  7,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf14Text
	bg_event  8,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf15Text
	bg_event  9,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf16Text
	bg_event 10,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf17Text
	bg_event 11,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf18Text
	bg_event 12,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf19Text
	bg_event 13,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary2FBookshelf20Text
	bg_event  1,  6, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer1
	bg_event  3,  6, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer2
	bg_event  1,  8, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer3
	bg_event  3,  8, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer1
	bg_event  1, 10, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer1
	bg_event  3, 10, BGEVENT_RIGHT, CeladonUniversityLibrary2FComputer4

	def_object_events
	object_event  3,  4, SPRITE_COSPLAYER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary2FCosplayerText, -1
	object_event 11,  5, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary2FLassText, -1
	object_event  0,  9, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityLibrary2FArtistScript, -1
	object_event  2, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary2FSuper_nerdText, -1
	object_event  8, 11, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary2FCooltrainerfText, -1
	object_event 11, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary2FYoungsterText, -1
	itemball_event  0,  1, TIMER_BALL, 1, EVENT_CELADON_UNIVERSITY_LIBRARY_2F_TIMER_BALL

CeladonUniversityLibrary2FCosplayerText:
	text "¡Es genial vivir"
	line "en la ciudad!"

	para "¡Puedo llevar mi"
	line "disfraz en público"

	para "y a nadie le"
	line "parece raro!"
	done

CeladonUniversityLibrary2FLassText:
	text "Nunca juzgues un"
	line "libro por su"
	cont "portada."

	para "A veces el"
	line "exterior más"

	para "soso esconde las"
	line "mejores"
	cont "historias."
	done

CeladonUniversityLibrary2FArtistScript:
	showtext .Text1
	showtextfaceplayer .Text2
	turnobject LAST_TALKED, RIGHT
	end

.Text1:
	text "“Jasmine miraba"
	line "los profundos ojos"
	cont "castaños de"
	cont "Erika…”"
	done

.Text2:
	text "¿Eh? ¡Fuera de"
	line "aquí!"

	para "¡Es de mala"
	line "educación leer por"
	cont "encima del hombro!"
	done

CeladonUniversityLibrary2FSuper_nerdText:
	text "El comando “net"
	line "send” muestra"

	para "¡un mensaje en"
	line "todos los"
	cont "ordenadores!"

	para "Mmm, ¿qué"
	line "envío…?"

	para "“¡Pizza gratis en"
	line "el despacho del"
	cont "Prof.Westwood!”"

	para "Jejeje."
	done

CeladonUniversityLibrary2FCooltrainerfText:
	text "Este es mi libro."
	line "¡Y me lo voy a"
	cont "LEER!"
	done

CeladonUniversityLibrary2FYoungsterText:
	text "Estoy leyendo"
	line "sobre un #mon"
	cont "legendario"

	para "con el poder de"
	line "distorsionar el"
	cont "espacio."

	para "Da mucho miedo…"
	done

CeladonUniversityLibrary2FBookshelf1Text:
	text "Es un libro con"
	line "#mon de un"
	cont "alfabeto"
	cont "antiguo."

	para "Con uno de cada"
	line "tipo, pueden"
	cont "conceder deseos."
	done

CeladonUniversityLibrary2FBookshelf2Text:
	text "Este libro se está"
	line "deshaciendo."

	para "El título ya no se"
	line "puede leer,"

	para "pero hay una"
	line "imagen de un"
	cont "#mon con"
	cont "armadura pesada."
	done

CeladonUniversityLibrary2FBookshelf3Text:
	text "Es un libro con un"
	line "candado gigante en"
	cont "la portada."

	para "Mejor no tocarlo."
	done

CeladonUniversityLibrary2FBookshelf4Text:
	text "¡Este libro está"
	line "escrito en un"
	cont "idioma extranjero!"

	para "Mejor lo dejo en"
	line "su sitio…"
	done

CeladonUniversityLibrary2FBookshelf5Text:
	text "Detrás de estos"
	line "libros…"

	para "Nada. No hay"
	line "nada aquí."
	done

CeladonUniversityLibrary2FBookshelf6Text:
	text "Es un libro sobre"
	line "#mon con"
	cont "diferencias"
	cont "regionales."

	para "Hay una foto de un"
	line "Raichu con un"
	cont "aspecto un poco"
	cont "raro…"
	done

CeladonUniversityLibrary2FBookshelf7Text:
	text "Es un libro sobre"
	line "los Concursos"
	cont "#mon."

	para "En la portada"
	line "aparece un"

	para "edificio muy"
	line "impresionante."
	done

CeladonUniversityLibrary2FBookshelf8Text:
	text "En la portada de"
	line "este libro sale un"
	cont "niño montado en"
	cont "un #mon."

	para "Pone en negrita"
	line "“Cómo Entrenar a"
	cont "tu Dragonite”."
	done

CeladonUniversityLibrary2FBookshelf9Text:
	text "Es un libro que"
	line "muestra un mundo"

	para "¡habitado solo"
	line "por #mon!"

	para "En la portada"
	line "pone “Las"
	cont "Aventuras de"
	cont "Pikachu en el"
	cont "#Park”."
	done

CeladonUniversityLibrary2FBookshelf10Text:
	text "Es un libro sobre"
	line "una isla de"
	cont "robots #mon"
	cont "gigantes."

	para "“Robótica #mon”"
	line "por Anne Droid…"
	done

CeladonUniversityLibrary2FBookshelf11Text:
	text "“Perdonar y"
	line "Olvidar” por Saul"
	cont "Goode."

	para "Hay una foto de un"
	line "hombre con una"
	cont "gran sonrisa."
	done

CeladonUniversityLibrary2FBookshelf12Text:
	text "“Ingravidez” por"
	line "Andy Gravity."
	cont "¡Suena volátil!"
	done

CeladonUniversityLibrary2FBookshelf13Text:
	text "Es un libro que"
	line "explica la"

	para "biología de los"
	line "#mon."

	para "¡Es enorme!"
	done

CeladonUniversityLibrary2FBookshelf14Text:
	text "Este libro está"
	line "cubierto de"
	cont "telarañas."

	para "Parece que no lo"
	line "leen desde hace"
	cont "tiempo."
	done

CeladonUniversityLibrary2FBookshelf15Text:
	text "Es un libro que"
	line "muestra un #mon"
	cont "temible."

	para "Pone en letras"
	line "grandes"

	para "“Absofusión y el"
	line "Trío Tao”."
	done

CeladonUniversityLibrary2FBookshelf16Text:
	text "“La Antigua"
	line "#mópolis: Una"
	cont "Historia de"

	para "#mon"
	line "Extintos”"

	para "¡Suena"
	line "interesante!"
	done

CeladonUniversityLibrary2FBookshelf17Text:
	text "Es un libro"
	line "titulado"
	cont "“Clasificación de"

	para "Tipos: El Misterio"
	line "de Sudowoodo”."
	done

CeladonUniversityLibrary2FBookshelf18Text:
	text "Es un libro sobre"
	line "un árbol antiguo"

	para "custodiado por"
	line "tres titanes."

	para "Parece casi"
	line "mágico."
	done

CeladonUniversityLibrary2FBookshelf19Text:
	text "¡Es una copia de"
	line "la ruta original"
	cont "del Tren Imán!"

	para "Muestra una"
	line "estación de"
	cont "parada prevista en"
	cont "Ciudad Iris."
	done

CeladonUniversityLibrary2FBookshelf20Text:
	text "Libros rojos,"
	line "libros azules,"
	cont "libros amarillos,"
	cont "libros verdes…"

	para "¡Libros de todos"
	line "los colores!"
	done

CeladonUniversityLibrary2FComputer1:
	jumpthistext

	text "Hay una pantalla"
	line "de inicio de"
	cont "sesión con una"

	para "imagen de fondo de"
	line "un Magikarp."
	done

CeladonUniversityLibrary2FComputer2:
	jumpthistext

	text "¡Alguien olvidó"
	line "cerrar sesión!"
	done

CeladonUniversityLibrary2FComputer3:
	jumpthistext

	text "Hay una historia"
	line "llena de errores"
	cont "de gramática y"
	cont "ortografía."
	done

CeladonUniversityLibrary2FComputer4:
	jumpthistext

	text "Hay una página web"
	line "sobre cómo ser un"
	cont "“l33t h4x0r”."
	done
