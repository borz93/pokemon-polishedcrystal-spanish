CeladonUniversityCafeteria_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  7, CELADON_UNIVERSITY_2F, 2
	warp_event 14,  7, CELADON_UNIVERSITY_2F, 2

	def_coord_events

	def_bg_events
	bg_event 10,  0, BGEVENT_JUMPTEXT, CeladonUniversityCafeteriaSignText

	def_object_events
	object_event 11,  2, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityCafeteriaCoreyScript, -1
	object_event  4,  2, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityCafeteriaCooltrainerfText, -1
	object_event  7,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityCafeteriaBeautyText, -1
	object_event  2,  6, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityCafeteriaYoungster1Text, -1
	object_event  8,  6, SPRITE_LADY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityCafeteriaLadyText, -1
	object_event 11,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonUniversityCafeteriaYoungster2Script, -1
	object_event  0,  3, SPRITE_BAKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityCafeteriaBakerScript, -1

	object_const_def
	const CELADONUNIVERSITYCAFETERIA_COREY

CeladonUniversityCafeteriaCoreyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERM_COREY
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
	setlasttalked CELADONUNIVERSITYCAFETERIA_COREY
	loadtrainer COOLTRAINERM, COOLTRAINERM_COREY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_COREY
	opentext
.Beaten
	setevent EVENT_INTRODUCED_CELADON_FOUR
	checkevent EVENT_BEAT_COOLTRAINERM_RAYMOND
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERM_FERGUS
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERF_NEESHA
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_GOT_CHOICE_BAND_FROM_CELADON_FOUR
	iftrue_jumpopenedtext .FinalText
	writetext .AfterText2
	promptbutton
	verbosegiveitem CHOICE_BAND
	iffalse_jumpopenedtext CeladonUni_NoRoomText
	setevent EVENT_GOT_CHOICE_BAND_FROM_CELADON_FOUR
	jumpthisopenedtext

.FinalText:
	text "Serías una"
	line "estudiante"
	cont "estrella si te"
	cont "matricularas aquí."

	para "Pero tienes otras"
	line "metas, ¿Verdad?"
	done

.IntroText1:
	text "¡Soy Corey! Soy"
	line "uno de los cuatro"
	cont "mejores"
	cont "entrenadores de la"
	cont "Universidad"
	cont "Azulona."

	para "¡Nos conocen como"
	line "el Cuatro de"
	cont "Azulona!"

	para "Deja que te"
	line "muestre cómo nos"

	para "ganamos ese título"
	line "con un combate"
	cont "rápido."
	done

.IntroText2:
	text "¡Soy Corey! ¡Soy"
	line "uno del Cuatro de"
	cont "Azulona!"

	para "¿Nos retas a los"
	line "cuatro?"

	para "Claro, ya he"
	line "terminado de comer"
	cont "aquí."

	para "¿Estás listo para"
	line "combatir?"
	done

.NoBattleText:
	text "Sí, podemos ser"
	line "intimidantes."
	done

.SeenText:
	text "¡Ganar esto será"
	line "pan comido!"
	done

.BeatenText:
	text "Te"
	line "subestimé…"
	done

.AfterText1:
	text "¡Eres un"
	line "entrenador fuerte!"

	para "Pero solo soy uno"
	line "del Cuatro de"
	cont "Azulona."

	para "Deberías buscar al"
	line "resto de nosotros"

	para "¡para poner a"
	line "prueba tu fuerza"
	cont "de verdad!"
	done

.AfterText2:
	text "¿Venciste a todo"
	line "el Cuatro de"
	cont "Azulona?"

	para "¡Felicidades!"

	para "¡Toma esto como"
	line "recuerdo!"
	done

CeladonUni_NoRoomText:
	text "No puedes"
	line "llevarlo."
	done

CeladonUniversityCafeteriaCooltrainerfText:
	text "¡Aquí hacen los"
	line "mejores filetes de"
	cont "hamburguesa estilo"

	para "Canela de todo"
	line "Kanto!"

	para "Es como estar en"
	line "casa."
	done

CeladonUniversityCafeteriaBeautyText:
	text "¡El cocinero por"
	line "fin hizo otro lote"
	cont "de Pastel Viejo!"

	para "Puede que repita."
	done

CeladonUniversityCafeteriaYoungster1Text:
	text "Le pedí a la"
	line "cafetería que"
	cont "tuviera"
	cont "Casteliaconos."

	para "Me recuerdan a mi"
	line "hogar, ¡Y además"
	cont "están ricos!"
	done

CeladonUniversityCafeteriaLadyText:
	text "Estoy a dieta."
	line "Hoy toca una"
	para "ensalada"
	line "nutritiva de"
	cont "Semilla Zurcida."
	done

CeladonUniversityCafeteriaYoungster2Script:
	checkevent EVENT_GOT_LEMONADE_IN_UNIVERSITY
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem LEMONADE
	iffalse_jumpopenedtext CeladonUni_NoRoomText
	setevent EVENT_GOT_LEMONADE_IN_UNIVERSITY
	jumpopenedtext .Text2

.Text1:
	text "¡La máquina"
	line "expendedora me dio"
	cont "una bebida extra!"

	para "Deja que la"
	line "comparta contigo."
	done

.Text2:
	text "Me encanta una"
	line "Limonada fría tras"
	cont "un combate duro."
	done

CeladonUniversityCafeteriaBakerScript:
	faceplayer
	opentext
	checkflag ENGINE_BOUGHT_LEFTOVERS
	iftrue_jumpopenedtext .Text3
	writetext .Text1
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .Text4
	checkmoney YOUR_MONEY, 4000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem LEFTOVERS
	iffalse_jumpopenedtext .Text6
	setflag ENGINE_BOUGHT_LEFTOVERS
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 4000
	special PlaceMoneyTopRight
	jumpthisopenedtext

.Text2:
	text "¡Aquí tienes,"
	line "cielo!"
	cont "¡Disfrútalo!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "No tienes"
	line "suficiente dinero…"
	done

.Text1:
	text "¿Qué querías,"
	line "cielo?"

	para "Lo siento, ya no"
	line "servimos cena."

	para "Quedan algunas"
	line "Sobras, pero"

	para "costarán ¥4000."
	line "¿Quieres?"
	done

.Text3:
	text "Hoy no quedan más"
	line "Sobras."
	done

.Text4:
	text "¡Que tengas un"
	line "buen día!"
	done

.Text6:
	text "No puedes"
	line "llevártelas,"
	cont "cielo."
	done

CeladonUniversityCafeteriaSignText:
	text "Por favor,"
	line "recoge cuando"
	cont "termines de comer."
	done
