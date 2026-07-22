CeladonUniversityHyperTestRoom_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, CELADON_UNIVERSITY_2F, 4
	warp_event  3, 11, CELADON_UNIVERSITY_2F, 4

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, CeladonUniversityHyperTestRoomMagikarpSign
	bg_event  6,  1, BGEVENT_JUMPTEXT, CeladonUniversityHyperTestRoomBookshelf1Text
	bg_event  7,  1, BGEVENT_JUMPTEXT, CeladonUniversityHyperTestRoomBookshelf2Text
	bg_event  7,  4, BGEVENT_RIGHT, CeladonUniversityHyperTestRoomComputer
	bg_event  7,  6, BGEVENT_RIGHT, CeladonUniversityHyperTestRoomComputer

	def_object_events
	object_event  4,  2, SPRITE_WESTWOOD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityHyperTestRoomWestwoodScript, -1
	object_event  6,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityHyperTestRoomScientistText, -1
	object_event  1,  6, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityHyperTestRoomTwin1Text, -1
	object_event  1,  8, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityHyperTestRoomTwin2Text, -1

CeladonUniversityHyperTestRoomWestwoodScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_DRAGON_RAGE_MAGIKARP
	iftrue_jumpopenedtext .TestOverText
	checkevent EVENT_PASSED_CELADON_HYPER_TEST
	iftruefwd .GiveMagikarp
	writetext .GreetingText
	waitbutton
	checkevent EVENT_LISTENED_TO_WESTWOOD_INTRO
	iftruefwd .HeardIntro
	writetext .IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_WESTWOOD_INTRO
.HeardIntro
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	checkflag ENGINE_TOOK_HYPER_TEST
	iftrue_jumpopenedtext .AlreadyTookText
	setflag ENGINE_TOOK_HYPER_TEST
	writetext .BeginText
	waitbutton

	writetext .Question1IntroText
	waitbutton
	closetext
	reanchormap
	trainerpic SILHOUETTE
	waitbutton
	closepokepic
	opentext
	writetext .Question1QuestionText
	loadmenu .Question1MenuData
	verticalmenu
	closewindow
	ifnotequal $2, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	writetext .Question2IntroText
	waitbutton
	closetext
	cry SLOWKING
	waitsfx
	opentext
	writetext .Question2QuestionText
	loadmenu .Question2MenuData
	verticalmenu
	closewindow
	ifnotequal $3, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	writetext .Question3IntroText
	waitbutton
	writetext .Question3QuestionText
	loadmenu .Question3MenuData
	verticalmenu
	closewindow
	ifnotequal $4, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	writetext .Question4IntroText
	waitbutton
	writetext .Question4QuestionText
	loadmenu .Question4MenuData
	verticalmenu
	closewindow
	ifnotequal $1, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	writetext .Question5IntroText
	waitbutton
	writetext .Question5QuestionText
	loadmenu .Question5MenuData
	verticalmenu
	closewindow
	ifnotequal $3, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	writetext .Question6IntroText
	waitbutton
	writetext .Question6QuestionText
	loadmenu .Question6MenuData
	verticalmenu
	closewindow
	ifnotequal $4, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	setevent EVENT_PASSED_CELADON_HYPER_TEST
.GiveMagikarp:
	writetext .CongratulationsText
	waitbutton

	givepoke MAGIKARP, MAGIKARP_MASK1_FORM, 10, EVIOLITE, ULTRA_BALL, DRAGON_RAGE
	iffalse_jumpopenedtext .PartyAndBoxFullText
	setevent EVENT_GOT_DRAGON_RAGE_MAGIKARP
	jumpopenedtext .TestOverText

.WrongAnswer:
	waitsfx
	playsound SFX_WRONG
	jumpthisopenedtext

	text "Lo siento, ¡eso es"
	line "incorrecto!"

	para "Puedes volver a"
	line "hacer el Test"
	cont "Hiper mañana."
	done

.GreetingText:
	text "¿Prof.Westwood?"
	line "Ese sería yo."
	done

.IntroText:
	text "¡Un investigador"
	line "extraordinario!"

	para "Mis hallazgos no"
	line "tienen igual."

	para "Sin duda ganaré"
	line "una distinción"
	cont "pronto…"
	done

.QuestionText:
	text "Ejem. ¿Qué fue"
	line "eso?"

	para "¿Viniste a hacer"
	line "el Test Hiper de"
	cont "la Universidad"
	cont "Azulona?"
	done

.BeginText:
	text "¡Excelente!"

	para "El Test Hiper es"
	line "una serie de seis"
	cont "preguntas, que"
	cont "ponen a prueba"

	para "todos tus"
	line "sentidos bajo"
	cont "presión."

	para "Si apruebas,"
	line "recibirás un"

	para "premio digno de"
	line "nuestra"
	cont "universidad."
	done

.CorrectText:
	text "¡Correcto!"
	done

.Question1IntroText:
	text "Pregunta 1:"
	line "¡Mira de cerca!"
	done

.Question1QuestionText:
	text "¿De qué #mon es"
	line "esta silueta?"
	done

.Question2IntroText:
	text "Pregunta 2:"
	line "¡Escucha con"
	cont "atención!"
	done

.Question2QuestionText:
	text "¿De qué #mon es"
	line "este grito?"
	done

.Question3IntroText:
	text "Pregunta 3:"
	done

.Question3QuestionText:
	text "¿Qué medicina"
	line "sabe amarga?"
	done

.Question4IntroText:
	text "Pregunta 4:"
	done

.Question4QuestionText:
	text "¿Qué #mon tiene"
	line "Piel Seca?"
	done

.Question5IntroText:
	text "Pregunta 5:"
	done

.Question5QuestionText:
	text "¿Qué Baya huele a"
	line "azul?"
	done

.Question6IntroText:
	text "Pregunta 6:"
	line "¡Piensa con"
	cont "sabiduría!"
	done

.Question6QuestionText:
	text "¿Quién es el"
	line "profesor más"
	cont "consumado?"
	done

.CongratulationsText:
	text "¡Felicidades!"

	para "¡Aprobaste el Test"
	line "Hiper con nota"
	cont "excelente!"

	para "¡Aquí está tu"
	line "premio: un"

	para "Magikarp criado de"
	line "forma única que"
	cont "sabe Furia Dragón!"
	done

.TestOverText:
	text "Nuestros"
	line "estudiantes tienen"

	para "la tenacidad de un"
	line "Magikarp luchando"
	cont "por evolucionar."
	cont "¡Y tú también!"
	done

.PartyAndBoxFullText:
	text "¡Oh, no! Tu equipo"
	line "y tu Caja están"
	cont "llenos…"
	done

.RefusedText:
	text "Bueno, si estás"
	line "seguro."
	done

.AlreadyTookText:
	text "¡Pero ya"
	line "intentaste el test"
	cont "hoy!"

	para "Puedes repetirlo"
	line "mañana."
	done


.Question1MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 11, 11
	dw .Question1MenuData2
	db 1 ; default option

.Question1MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Umbreon@"
	db "Glaceon@"
	db "Persian@"
	db "Girafarig@"

.Question2MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 10, 11
	dw .Question2MenuData2
	db 1 ; default option

.Question2MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Blissey@"
	db "Qwilfish@"
	db "Slowking@"
	db "Venomoth@"

.Question3MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 13, 11
	dw .Question3MenuData2
	db 1 ; default option

.Question3MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Elixir@"
	db "Calcio@"
	db "Antídoto@"
	db "Polvo Cura@"

.Question4MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 12, 11
	dw .Question4MenuData2
	db 1 ; default option

.Question4MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Parasect@"
	db "Magmar@"
	db "Sandslash@"
	db "Victreebel@"

.Question5MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 13, 11
	dw .Question5MenuData2
	db 1 ; default option

.Question5MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Baya Zreza@"
	db "Baya Ziuela@"
	db "Baya Aranja@"
	db "Baya Meloc@"

.Question6MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 15, 11
	dw .Question6MenuData2
	db 1 ; default option

.Question6MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Prof.Oak@"
	db "Prof.Elm@"
	db "Prof.Willow@"
	db "Prof.Westwood@"

CeladonUniversityHyperTestRoomScientistText:
	text "El Test Hiper es"
	line "un rito de paso"

	para "para todos los"
	line "graduados de la"
	cont "Universidad"
	cont "Azulona."

	para "¡Pone a prueba"
	line "todas sus"
	cont "facultades al"
	cont "máximo!"
	done

CeladonUniversityHyperTestRoomTwin1Text:
	text "¡Pasaré el Test"
	line "Hiper antes que"
	cont "tú!"
	done

CeladonUniversityHyperTestRoomTwin2Text:
	text "No, ¡pasaré el"
	line "Test Hiper antes"
	cont "que tú!"
	done

CeladonUniversityHyperTestRoomMagikarpSign:
	reanchormap
	pokepic MAGIKARP, MAGIKARP_MASK1_FORM
	cry MAGIKARP
	waitbutton
	closepokepic
	jumpthistext

	text "Un Magikarp nada"
	line "por ahí."
	done

CeladonUniversityHyperTestRoomBookshelf1Text:
	text "Este libro tiene"
	line "un marcapáginas."

	para "¡Alguien no ha"
	line "terminado con él!"
	done

CeladonUniversityHyperTestRoomBookshelf2Text:
	text "¡Es un ejemplar de"
	line "Nintendo Power!"

	para "Una imagen de"
	line "Pikachu llena la"
	cont "portada."
	done

CeladonUniversityHyperTestRoomComputer:
	jumpthistext

	text "Hay un archivo en"
	line "el escritorio"
	cont "llamado"
	cont "preguntas.txt."

	para "¡Mejor no hacer"
	line "trampa!"
	done
