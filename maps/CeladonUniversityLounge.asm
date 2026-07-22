CeladonUniversityLounge_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 11, CELADON_UNIVERSITY_1F, 10
	warp_event  5, 11, CELADON_UNIVERSITY_1F, 10

	def_coord_events

	def_bg_events
	bg_event  7,  5, BGEVENT_JUMPTEXT, CeladonUniversityLoungeBookshelf1Text
	bg_event  7,  8, BGEVENT_READ, CeladonUniversityLoungeBookshelf2
	bg_event  0,  7, BGEVENT_RIGHT, CeladonUniversityLoungeComputer

	def_object_events
	object_event  5,  8, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityLoungeNeeshaScript, -1
	object_event  3,  1, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLoungeLassText, -1
	object_event  5,  3, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLoungeRichBoyText, -1
	object_event  5,  4, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLoungeCooltrainerfText, -1
	object_event  2,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLoungeSuper_nerd1Text, -1
	object_event  1,  8, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityLoungeSuper_nerd2Text, -1

	object_const_def
	const CELADONUNIVERSITYLOUNGE_NEESHA

CeladonUniversityLoungeNeeshaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERF_NEESHA
	iftruefwd .Beaten
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
	setlasttalked CELADONUNIVERSITYLOUNGE_NEESHA
	loadtrainer COOLTRAINERF, NEESHA
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERF_NEESHA
	opentext
.Beaten
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
	text "¡Hola! ¡Soy"
	line "Neesha! Soy una de"

	para "las cuatro mejores"
	line "de la Universidad"
	cont "de Azulona."

	para "¡Somos conocidas"
	line "como el Cuatro de"
	cont "Azulona!"

	para "¿Quieres que te"
	line "muestre por qué"
	cont "somos famosas?"

	para "¡Entonces"
	line "combatamos!"
	done

.IntroText2:
	text "¡Hola! ¡Soy"
	line "Neesha! ¡Soy una"
	cont "del Cuatro de"
	cont "Azulona!"

	para "Parece que ya has"
	line "oído de nosotras."

	para "¡Entonces"
	line "combatamos!"
	done

.NoBattleText:
	text "¿No te interesa un"
	line "desafío?"
	done

.SeenText:
	text "¡Te vamos a"
	line "arrasar!"
	done

.BeatenText:
	text "Una derrota"
	line "dolorosa…"
	done

.AfterText1:
	text "¡Eres un rival"
	line "digno!"

	para "Pero no has visto"
	line "todo lo que puede"

	para "hacer el Cuatro de"
	line "Azulona."

	para "¿Por qué no buscas"
	line "al resto de"
	cont "nosotras y nos"
	cont "retas?"
	done

.AfterText2:
	text "Así que venciste a"
	line "todo el Cuatro de"
	cont "Azulona…"

	para "¡Qué genial!"

	para "¡Toma esto como"
	line "premio!"
	done

.FinalText:
	text "No es común que"
	line "alguien nos dé un"

	para "desafío real al"
	line "Cuatro de Azulona."

	para "¡No te olvidaré,"
	line "entrenador!"
	done

CeladonUniversityLoungeLassText:
	text "El próximo mes"
	line "iremos de viaje al"
	cont "Monte Moon."

	para "¡Quizá vea un"
	line "Clefairy!"
	done

CeladonUniversityLoungeRichBoyText:
	text "¿Alguna vez te"
	line "preguntaste por"

	para "qué las Ultra Ball"
	line "tienen una letra"
	cont "H amarilla"
	cont "arriba?"

	para "¡Es porque antes"
	line "se llamaban Hyper"
	cont "Ball!"
	done

CeladonUniversityLoungeCooltrainerfText:
	text "Los #mon con"
	line "fuerza física"

	para "reducida intentan"
	line "instintivamente"
	cont "entrar en una Ball"
	cont "#."
	done

CeladonUniversityLoungeSuper_nerd1Text:
	text "¿Qué obtienes si"
	line "cruzas un chiste"

	para "con una pregunta"
	line "retórica?"

	para "………………………………"
	done

CeladonUniversityLoungeSuper_nerd2Text:
	text "Escribo guiones"
	line "para un juego."

	para "¡No dijo usar"
	line "asm!"
	done

CeladonUniversityLoungeBookshelf1Text:
	text "¡Está repleto de"
	line "copias de manga"
	cont "#mon!"
	done

CeladonUniversityLoungeBookshelf2:
	opentext
	writetext .Text1
	waitbutton
	checkevent EVENT_GOT_PP_MAX_IN_UNIVERSITY
	iftruefwd .GotItem
	verbosegiveitem PP_MAX
	iffalsefwd .Done
	setevent EVENT_GOT_PP_MAX_IN_UNIVERSITY
.Done
	endtext

.GotItem
	jumpopenedtext .Text2

.Text1:
	text "¡Este libro tiene"
	line "un compartimento"
	cont "secreto donde"

	para "deberían estar las"
	line "páginas!"
	done

.Text2:
	text "Qué pena, está"
	line "vacío."
	done

CeladonUniversityLoungeComputer:
	jumpthistext

	text "Hay un personaje"
	line "jugable corriendo"

	para "por una Ciudad"
	line "Azulona en 2D."
	done
