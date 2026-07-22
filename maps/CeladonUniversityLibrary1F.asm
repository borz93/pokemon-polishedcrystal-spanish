CeladonUniversityLibrary1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6, 11, CELADON_UNIVERSITY_1F, 4
	warp_event  7, 11, CELADON_UNIVERSITY_1F, 4
	warp_event  7,  0, CELADON_UNIVERSITY_LIBRARY_2F, 1

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FSignpost1Text
	bg_event 10,  0, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FSignpost2Text
	bg_event  0,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf1Text
	bg_event  1,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf2Text
	bg_event  2,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf3Text
	bg_event  3,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf4Text
	bg_event  4,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf5Text
	bg_event  5,  3, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf6Text
	bg_event  0,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf7Text
	bg_event  1,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf8Text
	bg_event  2,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf9Text
	bg_event  3,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf10Text
	bg_event  4,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf11Text
	bg_event  5,  7, BGEVENT_JUMPTEXT, CeladonUniversityLibrary1FBookshelf12Text

	def_object_events
	object_event  6,  3, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary1FLadyText, -1
	object_event 11,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary1FGentlemanText, -1
	object_event  0,  5, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary1FCooltrainerfText, -1
	object_event  9,  5, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonUniversityLibrary1FGameboyKidScript, -1
	object_event  3,  8, SPRITE_MATRON, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary1FPokefan_fText, -1
	object_event 11,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CeladonUniversityLibrary1FCooltrainermScript, -1
	object_event  2, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLibrary1FTeacherText, -1
	object_event 10,  7, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CeladonUniversityLibrary1FBookText, -1

CeladonUniversityLibrary1FLadyText:
	text "Esta biblioteca"
	line "está en el campus"
	cont "universitario,"

	para "pero está abierta"
	line "para que la use"
	cont "cualquiera."

	para "¿No es genial?"
	done

CeladonUniversityLibrary1FGentlemanText:
	text "¡Shh! ¿No ves que"
	line "estoy leyendo?"
	done

CeladonUniversityLibrary1FCooltrainerfText:
	text "El Prof.Oak solía"
	line "enseñar aquí, así"

	para "que la biblioteca"
	line "tiene copias de"
	cont "todos sus"
	cont "artículos."

	para "¡Los he leído"
	line "todos de principio"
	cont "a fin!"
	done

CeladonUniversityLibrary1FGameboyKidScript:
	showtextfaceplayer .Text
	turnobject LAST_TALKED, DOWN
	end

.Text:
	text "Mi #dex tiene"
	line "una mejora de"
	cont "juego."

	para "¡Estoy jugando al"
	line "Tetris!"
	done

CeladonUniversityLibrary1FPokefan_fText:
	text "Tenemos un"
	line "acuerdo mutuo de"

	para "préstamo con la"
	line "Biblioteca de"
	cont "Vetusta, en"
	cont "Sinnoh."
	done

CeladonUniversityLibrary1FCooltrainermScript:
	checkevent EVENT_GOT_FOCUS_BAND_IN_UNIVERSITY
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem FOCUS_BAND
	iffalse_endtext
	setevent EVENT_GOT_FOCUS_BAND_IN_UNIVERSITY
	jumpopenedtext .Text2

.Text1:
	text "Tengo un examen"
	line "importante, así"

	para "que pienso"
	line "quedarme un rato"
	cont "aquí."

	para "Solo tengo que"
	line "aguantar."

	para "Esto es lo que me"
	line "ayuda."
	done

.Text2:
	text "Si quieres que tu"
	line "#mon aguante,"
	cont "dale esa Cinta"
	cont "Focus."
	done

CeladonUniversityLibrary1FTeacherText:
	text "Soy la"
	line "bibliotecaria"
	cont "jefa."

	para "Si necesitas algo,"
	line "solo grita."

	para "Bajito, eso sí."
	line "Esto ES una"
	cont "biblioteca."
	done

CeladonUniversityLibrary1FBookText:
	text "Es un libro sobre"
	line "arreglos florales."

	para "Hay un Sunflora en"
	line "la portada."
	done

CeladonUniversityLibrary1FSignpost1Text:
	text "Por favor, no"
	line "molestes a los"

	para "estudiantes que"
	line "leen en la"
	cont "biblioteca."
	done

CeladonUniversityLibrary1FSignpost2Text:
	text "Por favor, no"
	line "traigas comida ni"

	para "bebidas a la"
	line "biblioteca."
	done

CeladonUniversityLibrary1FBookshelf1Text:
	text "¿Eh? Alguien dejó"
	line "una foto antigua"
	cont "en este libro."

	para "Erika y un hombre"
	line "con una sonrisa"

	para "amable posan"
	line "felices junto a"
	cont "un Oddish."
	done

CeladonUniversityLibrary1FBookshelf2Text:
	text "Es un álbum de"
	line "fotos con muchas"

	para "imágenes de"
	line "#mon."

	para "“Foto-álbum de"
	line "Todd Snap” está"
	cont "escrito en la"
	cont "portada."
	done

CeladonUniversityLibrary1FBookshelf3Text:
	text "Es un libro sobre"
	line "un hombre que le"

	para "enseñó a su"
	line "#mon a tocar un"
	cont "instrumento"
	cont "musical."

	para "Parecen los"
	line "mejores amigos."
	done

CeladonUniversityLibrary1FBookshelf4Text:
	text "Es un libro sobre"
	line "palíndromos"
	cont "#mon."

	para "Hay un Eevee y un"
	line "Girafarig en la"
	cont "portada."
	done

CeladonUniversityLibrary1FBookshelf5Text:
	text "Este libro trata"
	line "de #mon"

	para "juguete que cobran"
	line "vida al dárseles"
	cont "cuerda con una"
	cont "Llave Maravilla."

	para "Se ven bastante"
	line "monos."
	done

CeladonUniversityLibrary1FBookshelf6Text:
	text "Es un libro sobre"
	line "una marioneta"
	cont "#mon que no"
	cont "puede mentir."

	para "“Pinpokéo” está"
	line "escrito en la"
	cont "portada."
	done

CeladonUniversityLibrary1FBookshelf7Text:
	text "Es un li…"
	line "espera…"

	para "¡Es un videojuego!"

	para "Una máquina de"
	line "pinball #mon"

	para "aparece"
	line "orgullosamente en"
	cont "la carátula."
	done

CeladonUniversityLibrary1FBookshelf8Text:
	text "Es un libro"
	line "escrito por un"
	cont "gurú de la pesca"

	para "con consejos para"
	line "pescadores"
	cont "novatos."

	para "“Cañas y Suertes”"
	line "está escrito en"
	cont "la portada."
	done

CeladonUniversityLibrary1FBookshelf9Text:
	text "Es un manual que"
	line "explica el juego"

	para "de cartas"
	line "coleccionables"
	cont "#mon."
	done

CeladonUniversityLibrary1FBookshelf10Text:
	text "¡Es un libro de"
	line "cocina lleno de"
	cont "recetas #mon!"

	para "Gelatina de"
	line "Jigglypuff,"
	cont "Chutney de"
	cont "Charmander,"
	cont "Bocaditos de"
	cont "Munchlax…"
	done

CeladonUniversityLibrary1FBookshelf11Text:
	text "Es una guía para"
	line "mezclar Poffines."

	para "Un famoso"
	line "criador #mon"
	cont "aparece en la"
	cont "portada."
	done

CeladonUniversityLibrary1FBookshelf12Text:
	text "“La Vida Secreta"
	line "de la Risa” por"
	cont "Joe King."
	cont "¡Puntastico!"
	done
