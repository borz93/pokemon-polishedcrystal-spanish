CeladonUniversityPool_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  9, CELADON_UNIVERSITY_2F, 6
	warp_event  7,  9, CELADON_UNIVERSITY_2F, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonUniversityPoolFergusScript, -1
	object_event  9,  1, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityPoolLassText, -1
	object_event  4,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SWIM_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityPoolSwimmer_girlText, -1
	object_event  3,  8, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityPoolTeacherText, -1
	itemball_event 12,  8, WATER_STONE, 1, EVENT_CELADON_UNIVERSITY_POOL_WATER_STONE

	object_const_def
	const CELADONUNIVERSITYPOOL_FERGUS

CeladonUniversityPoolFergusScript:
	faceplayer
	checkevent EVENT_BEAT_COOLTRAINERM_FERGUS
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
	setlasttalked CELADONUNIVERSITYPOOL_FERGUS
	loadtrainer COOLTRAINERM, FERGUS
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_FERGUS
.Beaten
	opentext
	setevent EVENT_INTRODUCED_CELADON_FOUR
	checkevent EVENT_BEAT_COOLTRAINERM_COREY
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERM_RAYMOND
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERF_NEESHA
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
	text "¡Me llamo Fergus!"
	line "Soy uno de los"
	cont "cuatro mejores"

	para "entrenadores de la"
	line "Universidad de"
	cont "Azulona."

	para "¡Nos llaman los"
	line "Cuatro de Azulona!"

	para "¡Te demostraré que"
	line "gané mi fama con"
	cont "un combate!"
	done

.IntroText2:
	text "¡Me llamo Fergus!"
	line "Soy uno de los"
	cont "Cuatro de Azulona!"

	para "¿Vas a enfrentarte"
	line "a los cuatro?"

	para "Bueno, entonces,"
	line "¡combatamos!"
	done

.NoBattleText:
	text "Entonces no te"
	line "metas en mi"
	cont "camino."
	done

.SeenText:
	text "¡Te lo"
	line "mostraremos!"
	cont "¡Vamos!"
	done

.BeatenText:
	text "¡No puede ser!"
	done

.AfterText1:
	text "Pasé tanto tiempo"
	line "entrenando a mi"

	para "equipo, pero aun"
	line "así nos venciste."

	para "Con tu poder,"
	line "deberías enfrentar"

	para "al resto de los"
	line "Cuatro de"
	cont "Azulona!"
	done

.AfterText2:
	text "¿Los Cuatro de"
	line "Azulona perdieron"
	cont "contra ti?"

	para "¡De verdad eres"
	line "algo especial!"

	para "¡Te has ganado"
	line "esta recompensa!"
	done

.FinalText:
	text "Los Cuatro de"
	line "Azulona son"
	cont "importantes aquí,"

	para "pero tú causas"
	line "sensación en el"
	cont "mundo real."

	para "¡Sigue así!"
	done

CeladonUniversityPoolLassText:
	text "¡Ay!"

	para "Intento quitarme"
	line "un calambre de la"
	cont "pierna."
	done

CeladonUniversityPoolSwimmer_girlText:
	text "Me apunté a un"
	line "programa especial"

	para "para estudiar en"
	line "las Islas Espuma!"

	para "Necesito estar"
	line "lista para nadar"
	cont "intensamente."
	done

CeladonUniversityPoolTeacherText:
	text "¡Vale, cinco"
	line "vueltas más!"
	done
