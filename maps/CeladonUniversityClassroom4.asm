CeladonUniversityClassroom4_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, CELADON_UNIVERSITY_1F, 9
	warp_event  3, 11, CELADON_UNIVERSITY_1F, 9

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom4BlackboardText
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom4BlackboardText
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom4BlackboardText
	bg_event  6,  1, BGEVENT_READ, CeladonUniversityClassroom4Bookshelf1
	bg_event  7,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom4Bookshelf2Text

	def_object_events
	object_event  5,  2, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityClassroom4RaymondScript, -1
	object_event  2,  1, SPRITE_CANDELA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom4CandelaText, -1
	object_event  2,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << EVE) | (1 << NITE), PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom4TeacherText, -1
	object_event  2,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom4Bug_catcherText, -1
	object_event  3,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom4FisherText, -1
	object_event  5,  7, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom4LadyText, -1
	object_event  4,  9, SPRITE_RICH_BOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonUniversityClassroom4Rich_boyScript, -1

	object_const_def
	const CELADONUNIVERSITYCLASSROOM4_RAYMOND

CeladonUniversityClassroom4RaymondScript:
	faceplayer
	checkevent EVENT_BEAT_COOLTRAINERM_RAYMOND
	iftruefwd .Beaten
	opentext
	checkevent EVENT_INTRODUCED_CELADON_FOUR
	iftruefwd .IntroducedCeladonFour1
	writetext .IntroText1
	sjumpfwd .AfterIntro
.IntroducedCeladonFour1
	writetext .IntroText2
.AfterIntro
	yesorno
	iffalse_jumpopenedtext .NoBattleText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked CELADONUNIVERSITYCLASSROOM4_RAYMOND
	loadtrainer COOLTRAINERM, COOLTRAINERM_RAYMOND
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_RAYMOND
.Beaten
	opentext
	setevent EVENT_INTRODUCED_CELADON_FOUR
	checkevent EVENT_BEAT_COOLTRAINERM_COREY
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERM_RAYMOND
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERM_FERGUS
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_GOT_CHOICE_BAND_FROM_CELADON_FOUR
	iftrue_jumpopenedtext .FinalText
	writetext .AfterText2
	promptbutton
	verbosegiveitem CHOICE_BAND
	iffalse_endtext
	setevent EVENT_GOT_CHOICE_BAND_FROM_CELADON_FOUR
	jumpopenedtext .FinalText

.IntroText1:
	text "¡Eh! ¡Soy Raymond!"
	line "Llámame Ray."

	para "Soy uno de los"
	line "cuatro mejores"
	cont "de la Universidad"
	cont "Azulona."

	para "¡Nos conocen como"
	line "el Cuatro de"
	cont "Azulona!"

	para "¿Quieres ver"
	line "nuestra habilidad"
	cont "en persona?"

	para "¡Combatamos! A"
	line "menos que tengas"
	cont "miedo de perder."
	done

.IntroText2:
	text "¡Eh! ¡Soy Raymond!"
	line "Llámame Ray."

	para "¡Soy uno del"
	line "Cuatro de Azulona!"

	para "¿Buscas retarnos a"
	line "todos?"

	para "¡Combatamos! A"
	line "menos que tengas"
	cont "miedo de perder."
	done

.NoBattleText:
	text "Sabía que tenías"
	line "miedo."
	done

.SeenText:
	text "¡Hagámoslo!"
	done

.BeatenText:
	text "¡Ohhhh nooooo!"
	done

.AfterText1:
	text "¿Cómo puede ser?"
	line "¡Soy uno del"
	cont "Cuatro de Azulona!"

	para "Puede que haya"
	line "perdido, pero mis"
	cont "tres compañeros me"
	cont "vengarán."

	para "¡Ve a buscarlos tú"
	line "mismo!"
	done

.AfterText2:
	text "¿Venciste a todo"
	line "el Cuatro de"
	cont "Azulona?"

	para "¡No puede ser!"

	para "…Vale. Supongo que"
	line "te has ganado"
	cont "esto."
	done

.FinalText:
	text "Si has conquistado"
	line "al Cuatro de"
	cont "Azulona,"

	para "puedes soportar"
	line "cualquier carga."
	done

CeladonUniversityClassroom4CandelaText:
	text "¡Hola! Soy"
	line "Candela. ¡Enseño"
	cont "Combate #mon!"

	para "Investigo formas"
	line "de mejorar el"

	para "poder natural de"
	line "los #mon en"
	cont "busca de la"
	cont "fuerza."
	done

CeladonUniversityClassroom4TeacherText:
	text "¿Candela? Solo"
	line "enseña durante el"
	cont "día."
	done

CeladonUniversityClassroom4Bug_catcherText:
	text "Mi profesora dijo"
	line "que mi #mon"

	para "podía combatir de"
	line "verdad con los"
	cont "mejores."

	para "¡Su potencial era"
	line "el mejor que había"
	cont "visto jamás!"
	done

CeladonUniversityClassroom4FisherText:
	text "¡El profe dijo"
	line "que mi #mon era"
	cont "una maravilla!"

	para "Es un #mon"
	line "impresionante."
	done

CeladonUniversityClassroom4LadyText:
	text "La profesora dijo"
	line "que mi #mon"
	cont "simplemente la"
	cont "asombró."

	para "¡Supongo que de"
	line "verdad puede"
	cont "lograr cualquier"
	cont "cosa!"
	done

CeladonUniversityClassroom4Rich_boyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_ABILITY_CAP_IN_UNIVERSITY
	iftruefwd .GotItem
	writetext .Text1
	promptbutton
	verbosegiveitem ABILITY_CAP
	iffalse_endtext
	setevent EVENT_GOT_ABILITY_CAP_IN_UNIVERSITY
.GotItem:
	writetext .Text2
	waitendtext

.Text1:
	text "Estamos"
	line "aprendiendo sobre"
	cont "habilidades"
	cont "#mon."

	para "Algunas especies"
	line "pueden tener más"
	cont "de una habilidad."

	para "¡Usa esto para"
	line "cambiar entre"
	cont "ellas!"
	done

.Text2:
	text "Hay algunas raras"
	line "“habilidades"
	cont "ocultas” que un"

	para "Tope Habil. no"
	line "puede cambiar."

	para "¡Pero! Si un"
	line "#mon que lleva"
	cont "un Tope Habil."
	cont "tiene un Huevo,"

	para "¡su cría podría"
	line "tener una"
	cont "habilidad oculta!"
	done

CeladonUniversityClassroom4BlackboardText:
	text "Ten en cuenta"
	line "estos factores en"
	cont "combate:"
	cont "- Tabla de tipos"
	cont "- Efectos de"
	cont "movimientos"
	cont "- Categorías de"
	cont "movimientos"
	cont "- Condiciones"
	cont "- Objetos"
	cont "equipados"
	cont "- Estadíst. base"
	cont "- Valores esfuerzo"
	cont "- Naturalezas"
	cont "- Habilidades"
	cont "- Clima"
	cont "- ¿Otros?"
	done

CeladonUniversityClassroom4Bookshelf1:
	checkevent EVENT_GOT_X_SP_ATK_IN_UNIVERSITY
	iftrue_jumptext .Text2
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem X_SP_ATK
	iffalse_endtext
	setevent EVENT_GOT_X_SP_ATK_IN_UNIVERSITY
	endtext

.Text1:
	text "¡Esta estantería"
	line "es un desastre!"

	para "<PLAYER> ordenó"
	line "los libros."

	para "…¿Oh?"
	done

.Text2:
	text "Esta estantería"
	line "está ordenada y"
	cont "pulcra."
	done

CeladonUniversityClassroom4Bookshelf2Text:
	text "Es un libro para"
	line "colorear #mon."

	para "¿Qué hace esto"
	line "aquí?"
	done
