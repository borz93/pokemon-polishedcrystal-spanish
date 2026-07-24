DayCare_MapScriptHeader:
	def_scene_scripts
	scene_script DayCareMeetDayCareManScene, SCENE_DAYCARE_MEET_DAYCARE_MAN
	scene_const SCENE_DAYCARE_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, DayCareEggCheckCallback

	def_warp_events
	warp_event  0,  4, ROUTE_34, 3
	warp_event  0,  5, ROUTE_34, 4
	warp_event  2,  7, ROUTE_34, 5
	warp_event  3,  7, ROUTE_34, 5

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DayCareLadyScript, -1
	object_event  0,  5, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_DAYCARE
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAYCARE_MAN_IN_DAYCARE

	object_const_def
	const DAYCARE_GRANNY
	const DAYCARE_LYRA

DayCareMeetDayCareManScene:
	sdefer DayCare_MeetGrandma
	end

DayCareEggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftruefwd .PutDayCareManOutside
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	endcallback

.PutDayCareManOutside:
	setevent EVENT_DAYCARE_MAN_IN_DAYCARE
	clearevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	endcallback

DayCare_MeetGrandma:
	follow DAYCARE_LYRA, PLAYER
	applymovement DAYCARE_LYRA, DayCareMovementData_LyraApproachesGrandma
	stopfollow
	turnobject PLAYER, UP
	turnobject DAYCARE_GRANNY, DOWN
	callasm .GetPlayerPronouns
	showtext DayCareLyraHelloText
	showemote EMOTE_SHOCK, DAYCARE_LYRA, 15
	showtext DayCareLyraProtestText
	turnobject DAYCARE_LYRA, DOWN
	showtext DayCareLyraGoodbyeText
	applymovement DAYCARE_LYRA, DayCareMovementData_LyraStartsToLeave
	showemote EMOTE_SHOCK, DAYCARE_LYRA, 15
	turnobject DAYCARE_LYRA, LEFT
	turnobject PLAYER, RIGHT
	showtext DayCareLyraForgotText
	addcellnum PHONE_LYRA
	opentext
	writetext GotLyrasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	writetext DayCareLyraHasInfoText
	waitbutton
	closetext
	turnobject DAYCARE_LYRA, UP
	showtext DayCareLyraEmbarassedText
	applymovement DAYCARE_LYRA, DayCareMovementData_LyraLeaves
	disappear DAYCARE_LYRA
	setscene SCENE_DAYCARE_NOOP
	end

.GetPlayerPronouns:
	assert PLAYER_MALE & 1 == 0
	assert PLAYER_FEMALE & 1 == 1
	assert PLAYER_ENBY & 1 == 0
	assert PLAYER_BETA & 1 == 1
	ld a, [wPlayerGender]
	and 1
	jr nz, .female
	ld de, .boy
	ld hl, wStringBuffer3
	call CopyName2
	ld de, .he
	ld hl, wStringBuffer4
	jmp CopyName2

.female
	ld de, .girl
	ld hl, wStringBuffer3
	call CopyName2
	ld de, .she
	ld hl, wStringBuffer4
	jmp CopyName2

.boy:  db "boy@"
.girl: db "girl@"
.she:  db "s" ; fallthrough
.he:   db "he@"

DayCareManScript_Inside:
	faceplayer
	opentext
	checkevent EVENT_GOT_ODD_EGG
	iftruefwd .AlreadyHaveOddEgg
	writetext DayCareManText_GiveOddEgg
	promptbutton
	special GiveOddEgg
	iffalse_jumpopenedtext DayCareText_PartyAndBoxFull
	writetext DayCareText_GotOddEgg
	playsound SFX_GET_EGG_FROM_DAYCARE_LADY
	waitsfx
	ifequalfwd 1, .InParty
	special Special_CurBoxFullCheck
	iffalsefwd .BoxNotFull
	farwritetext _CurBoxFullText
.BoxNotFull
	special GetCurBoxName
	farwritetext _EggSentToPCText
	promptbutton
.InParty:
	writetext DayCareText_DescribeOddEgg
	setevent EVENT_GOT_ODD_EGG
	waitendtext

.AlreadyHaveOddEgg:
	special Special_DayCareMan
	waitendtext

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue_jumpopenedtext Text_GrampsLookingForYou
	checkevent EVENT_LYRA_GAVE_AWAY_EGG
	iffalsefwd .NoLyrasEgg
	checkevent EVENT_GOT_LYRAS_EGG
	iftruefwd .NoLyrasEgg
	writetext DayCareLadyText_GiveLyrasEgg
	promptbutton
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .GiveCyndaquilEgg
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .GiveTotodileEgg
	giveegg CHIKORITA
	sjumpfwd .GotLyrasEgg

.GiveCyndaquilEgg:
	giveegg CYNDAQUIL
	sjumpfwd .GotLyrasEgg

.GiveTotodileEgg:
	giveegg TOTODILE
.GotLyrasEgg
	iffalse_jumpopenedtext DayCareText_PartyAndBoxFull
	writetext DayCareLadyText_DescribeLyrasEgg
	setevent EVENT_GOT_LYRAS_EGG
	waitendtext

.NoLyrasEgg:
	special Special_DayCareLady
	waitendtext

DayCareMovementData_LyraApproachesGrandma:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end

DayCareMovementData_LyraStartsToLeave:
	step_right
	step_down
	step_end

DayCareMovementData_LyraLeaves:
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

DayCareLyraHelloText:
	text "Lyra: ¡Abuela!"

	para "Deja que te"
	line "presente a mi"
	cont "amigo."

	para "¡Este es <PLAYER>!"

	para "Abuela: Ah ja."

	para "Así que este es"
	line ""
	text_ram wStringBuffer3
	text "… tu amigo."

	para "Ya veo. Hmm."
	done

DayCareLyraProtestText:
	text "Lyra: ¿Qué?"
	line "¡Abuela…!"

	para "¿De qué estás"
	line "hablando?"

	para "<PLAYER> solo vive"
	line "cerca…"

	para "Abuela: Jajaja."
	line "Lo sé, lo sé."

	para "Debes de estar"
	line ""
	text_ram wStringBuffer4
	text " segura de que"
	next "es talentoso."

	para "¿Verdad, <PLAYER>?"
	line "¡Venid a vernos"
	cont "cuando queráis!"
	done

DayCareLyraGoodbyeText:
	text "Lyra: Bueno,"
	line "mejor me voy"
	cont "ya… ¡Nos vemos!"
	done

DayCareLyraForgotText:
	text "Lyra: ¡Oh!"
	line "¡Casi lo olvido!"

	para "¡Toma! ¡Este es mi"
	line "número!"
	done

GotLyrasNumberText:
	text "<PLAYER> consiguió"
	line "el número de"
	cont "Lyra."
	done

DayCareLyraHasInfoText:
	text "¡Llámame cuando"
	line "quieras!"

	para "La abuela y el"
	line "abuelo me"
	cont "enseñaron mucho"

	para "sobre criar"
	line "#mon, y me"

	para "gustaría"
	line "compartirlo"
	cont "contigo."
	done

DayCareLyraEmbarassedText:
	text "Lyra: ¡Abuela!"

	para "No digas nada"
	line "más."

	para "Ambos somos"
	line "entrenadores, y se"

	para "supone que"
	line "intercambiamos"
	cont "números. Eso es"
	cont "todo."
	done

Text_GrampsLookingForYou:
	text "El abuelo te"
	line "estaba buscando."
	done

DayCareManText_GiveOddEgg:
	text "Soy el Cuidador de"
	line "la Guardería."

	para "¿Sabes sobre los"
	line "Huevos?"

	para "Estaba criando"
	line "#mon con mi"
	cont "esposa, ¿Sabes?"

	para "¡Nos sorprendimos"
	line "al encontrar un"
	cont "Huevo!"

	para "¿No es"
	line "increíble?"

	para "Bueno, ¿No"
	line "querrías este"
	cont "Huevo?"

	para "Entonces vale,"
	line "¡es tuyo para"
	cont "quedártelo!"
	done

DayCareText_GotOddEgg:
	text "¡<PLAYER> recibió"
	line "Huevo"
	cont "Extraño!"
	done

DayCareText_DescribeOddEgg:
	text "Lo escubrí"
	line "cuando cuidaba"

	para "del #mon de"
	line "alguien antes."

	para "Pero el"
	line "entrenador no"

	para "quería el Huevo,"
	line "así que lo"
	cont "conservé."
	done

DayCareLadyText_GiveLyrasEgg:
	text "Hola, querido."

	para "Lyra me dijo que"
	line "este Huevo era un"
	cont "regalo para ti."
	cont "¡Toma!"
	done

DayCareLadyText_DescribeLyrasEgg:
	text "Ese Huevo vino de"
	line "su primer #mon."

	para "Debe confiar mucho"
	line "en ti como"
	cont "entrenador."
	done

DayCareText_PartyAndBoxFull:
	text "No tienes espacio"
	line "para esto, ni"
	cont "siquiera en tu"
	cont "Caja."
	done
