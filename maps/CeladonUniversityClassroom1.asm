CeladonUniversityClassroom1_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, CELADON_UNIVERSITY_1F, 6
	warp_event  3, 11, CELADON_UNIVERSITY_1F, 6

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom1BlackboardText
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom1BlackboardText
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom1BlackboardText
	bg_event  6,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom1Bookshelf1Text
	bg_event  7,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom1Bookshelf2Text

	def_object_events
	object_event  0,  6, SPRITE_IMAKUNI, SPRITEMOVEDATA_WANDER, 2, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityClassroom1ImakuniScript, -1
	object_event  1,  2, SPRITE_ANDY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom1AndyText, -1
	object_event  5,  2, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptext, CeladonUniversityClassroom1Dragon_tamerText, -1
	object_event  2,  5, SPRITE_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom1LadyText, -1
	object_event  5,  5, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom1Artist1Text, -1
	object_event  4,  7, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << MORN) | (1 << DAY), PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom1Artist2Text, -1
	object_event  3,  9, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE) | (1 << NITE), PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom1Artist3Text, -1

	object_const_def
	const CELADONUNIVERSITYCLASSROOM1_IMAKUNI

CeladonUniversityClassroom1ImakuniScript:
	readvar VAR_FACING
	ifequalfwd UP, .Up
	ifequalfwd DOWN, .Down
	ifequalfwd LEFT, .Left
	turnobject CELADONUNIVERSITYCLASSROOM1_IMAKUNI, RIGHT
	sjumpfwd .Continue

.Up:
	turnobject CELADONUNIVERSITYCLASSROOM1_IMAKUNI, UP
	sjumpfwd .Continue

.Down:
	turnobject CELADONUNIVERSITYCLASSROOM1_IMAKUNI, DOWN
	sjumpfwd .Continue

.Left:
	turnobject CELADONUNIVERSITYCLASSROOM1_IMAKUNI, LEFT
.Continue:
	checkevent EVENT_BEAT_IMAKUNI
	iftruefwd .Beaten
	opentext
	writetext .Text1
	yesorno
	iffalse_jumpopenedtext .Text2
	writetext .Text3
	waitbutton
	closetext
	winlosstext .Text4, 0
	setlasttalked CELADONUNIVERSITYCLASSROOM1_IMAKUNI
	loadtrainer IMAKUNI, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_IMAKUNI
.Beaten
	checkevent EVENT_GOT_PERSIM_BERRY_FROM_IMAKUNI
	iftrue_jumptext .Text6
	opentext
	writetext .Text5
	promptbutton
	verbosegiveitem PERSIM_BERRY
	iffalse_endtext
	setevent EVENT_GOT_PERSIM_BERRY_FROM_IMAKUNI
	jumpthisopenedtext

.Text6:
	text "Tanto en el"
	line "combate como en"
	cont "el baile, el alma"
	cont "y el ritmo son el"
	cont "secreto."

	para "¡Oye, eso suena"
	line "genial!"

	para "¡Quizá me haga"
	line "poeta!"
	done

.Text1:
	text "¿Eh? ¿Q…Quién"
	line "eres?"

	para "¿Quién? ¿Yo? ¿No"
	line "sabes quién soy?"

	para "¡Soy la súper"
	line "estrella musical,"
	cont "Imakuni!"

	para "¡Yo cantaré el"
	line "#Rap, tú"
	cont "bailas!"

	para "♪ La di da di da,"
	line "La di da di da… ♪"

	para "¡Oye! ¡Mueve esos"
	line "pies!"

	para "¿Qué? ¿#mon?"

	para "¿Quieres"
	line "combatir conmigo?"
	done

.Text2:
	text "¡Vamos, no seas"
	line "cruel!"

	para "¡Me vas a hacer"
	line "llorar!"
	done

.Text3:
	text "Vale, ¡pero si"
	line "gano, bailas!"
	done

.Text4:
	text "Aunque perdí, ¿Es"
	line "tan malo?"
	done

.Text5:
	text "¡Oye! ¡Eres"
	line "bastante bueno!"

	para "Te daré esta Baya,"
	line "así que no le"

	para "digas a nadie que"
	line "perdí, ¿Vale?"
	done

CeladonUniversityClassroom1AndyText:
	text "¡Hola!"
	line "Soy el Prof.Andy,"

	para "y enseño lo que"
	line "amo: ¡el arte!"

	para "Recuerda, dibuja"
	line "lo que ves,"

	para "no lo que crees"
	line "que ves."

	para "Supera tus ideas"
	line "preconcebidas"
	cont "sobre cómo se ven"
	cont "las cosas."
	done

CeladonUniversityClassroom1Dragon_tamerText:
	text "Llevo manteniendo"
	line "esta pose un"
	cont "buen rato."
	done

CeladonUniversityClassroom1LadyText:
	text "Conoces a gente"
	line "única en clase de"
	cont "arte, pero"

	para "¡ese tipo del"
	line "traje negro es"
	cont "muy sospechoso!"
	done

CeladonUniversityClassroom1Artist1Text:
	text "Es difícil lograr"
	line "los pliegues de"
	cont "esta capa bien."
	done

CeladonUniversityClassroom1Artist2Text:
	text "¡Achís!"

	para "Ugh. Acabamos de"
	line "tener un seminario"
	cont "de arreglo floral,"

	para "pero ahora no"
	line "puedo dejar de"
	cont "estornudar."

	para "Debo ser"
	line "alérgico…"
	done

CeladonUniversityClassroom1Artist3Text:
	text "Trabajo mucho de"
	line "día, así que tomo"

	para "clases por las"
	line "tardes."
	done

CeladonUniversityClassroom1BlackboardText:
	text "Hay una"
	line "descripción de la"

	para "perspectiva de dos"
	line "y tres puntos."
	done

CeladonUniversityClassroom1Bookshelf1Text:
	text "Es un libro sobre"
	line "Smeargle, un"
	cont "#mon artista."

	para "Está lleno de"
	line "dibujos"
	cont "hermosos."
	done

CeladonUniversityClassroom1Bookshelf2Text:
	text "Es un folleto que"
	line "muestra bellas"
	cont "artes de un lugar"

	para "llamado Museo"
	line "Malvalona."
	done
