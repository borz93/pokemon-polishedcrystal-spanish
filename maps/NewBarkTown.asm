NewBarkTown_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU
	scene_const SCENE_NEWBARKTOWN_LYRA_FINAL
	scene_const SCENE_NEWBARKTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, NewBarkTownFlyPoint

	def_warp_events
	warp_event  6,  3, ELMS_LAB, 1
	warp_event 15,  5, PLAYERS_HOUSE_1F, 1
	warp_event  3, 11, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event 11, 13, LYRAS_HOUSE_1F, 1
	warp_event 10,  2, ELMS_HOUSE, 2

	def_coord_events
	coord_event  1,  8, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_TeacherStopsYouTrigger1
	coord_event  1,  9, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_TeacherStopsYouTrigger2
	coord_event  6,  4, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_LyraIntroTrigger
	coord_event 17,  6, SCENE_NEWBARKTOWN_LYRA_FINAL, NewBarkTown_LyraFinalTrigger1
	coord_event 17,  7, SCENE_NEWBARKTOWN_LYRA_FINAL, NewBarkTown_LyraFinalTrigger2
	coord_event 17,  8, SCENE_NEWBARKTOWN_LYRA_FINAL, NewBarkTown_LyraFinalTrigger3
	coord_event 17,  9, SCENE_NEWBARKTOWN_LYRA_FINAL, NewBarkTown_LyraFinalTrigger4

	def_bg_events
	bg_event  8,  8, BGEVENT_JUMPTEXT, NewBarkTownSignText
	bg_event 13,  5, BGEVENT_JUMPTEXT, PlayersHouseSignText
	bg_event  3,  3, BGEVENT_JUMPTEXT, ElmsLabSignText
	bg_event  9, 13, BGEVENT_JUMPTEXT, LyrasHouseSignText
	bg_event  3,  2, BGEVENT_ITEM + POTION, EVENT_NEW_BARK_TOWN_HIDDEN_POTION

	def_object_events
	object_event  3,  2, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownRivalScript, EVENT_RIVAL_NEW_BARK_TOWN
	object_event  1,  6, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_NEW_BARK_TOWN
	object_event  6,  8, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NewBarkTownTeacherScript, -1
	object_event 13,  8, SPRITE_FAT_GUY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_ElmDiscoveredNewMon, -1
	object_event  7, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_GearIsImpressive, -1

	object_const_def
	const NEWBARKTOWN_RIVAL
	const NEWBARKTOWN_LYRA
	const NEWBARKTOWN_TEACHER

NewBarkTownFlyPoint:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	endcallback

NewBarkTown_TeacherStopsYouTrigger1:
	playmusic MUSIC_MOM
	turnobject NEWBARKTOWN_TEACHER, LEFT
	showtext Text_WaitPlayer
	turnobject PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherRunsToYou1_NBT
	showtext Text_WhatDoYouThinkYoureDoing
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherBringsYouBack1_NBT
	stopfollow
	showtext Text_ItsDangerousToGoAlone
	special RestartMapMusic
	end

NewBarkTown_TeacherStopsYouTrigger2:
	playmusic MUSIC_MOM
	turnobject NEWBARKTOWN_TEACHER, LEFT
	showtext Text_WaitPlayer
	turnobject PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherRunsToYou2_NBT
	turnobject PLAYER, UP
	showtext Text_WhatDoYouThinkYoureDoing
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherBringsYouBack2_NBT
	stopfollow
	showtext Text_ItsDangerousToGoAlone
	special RestartMapMusic
	end

NewBarkTown_LyraIntroTrigger:
	appear NEWBARKTOWN_LYRA
	special Special_FadeOutMusic
	applymovement NEWBARKTOWN_LYRA, Movement_LyraEnters_NBT
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	showemote EMOTE_SHOCK, NEWBARKTOWN_LYRA, 15
	applymovement NEWBARKTOWN_LYRA, Movement_LyraApproaches_NBT
	turnobject PLAYER, LEFT
	showtext Text_LyraIntro
	follow PLAYER, NEWBARKTOWN_LYRA
	applyonemovement PLAYER, step_up
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applyonemovement NEWBARKTOWN_LYRA, step_up
	playsound SFX_EXIT_BUILDING
	disappear NEWBARKTOWN_LYRA
	setscene SCENE_NEWBARKTOWN_NOOP
	special FadeOutPalettes
	pause 15
	warpfacing UP, ELMS_LAB, 4, 11
	end

NewBarkTown_LyraFinalTrigger1:
	moveobject NEWBARKTOWN_LYRA, 14, 11
	sjumpfwd NewBarkTown_LyraFinalTrigger

NewBarkTown_LyraFinalTrigger2:
	moveobject NEWBARKTOWN_LYRA, 14, 12
	sjumpfwd NewBarkTown_LyraFinalTrigger

NewBarkTown_LyraFinalTrigger3:
	moveobject NEWBARKTOWN_LYRA, 14, 13
	sjumpfwd NewBarkTown_LyraFinalTrigger

NewBarkTown_LyraFinalTrigger4:
	moveobject NEWBARKTOWN_LYRA, 14, 14
NewBarkTown_LyraFinalTrigger:
	appear NEWBARKTOWN_LYRA
	applymovement NEWBARKTOWN_LYRA, Movement_LyraSaysGoodbye1_NBT
	showemote EMOTE_SHOCK, NEWBARKTOWN_LYRA, 15
	special Special_FadeOutMusic
	pause 15
	applymovement NEWBARKTOWN_LYRA, Movement_LyraSaysGoodbye2_NBT
	turnobject PLAYER, LEFT
	showtext Text_LyraGoodbye1
	setevent EVENT_LYRA_NEW_BARK_TOWN
	winlosstext Text_LyraGoodbyeWin, Text_LyraGoodbyeLoss
	setlasttalked NEWBARKTOWN_LYRA
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	loadtrainer LYRA1, LYRA1_10
	sjumpfwd .AfterBattle

.Totodile:
	loadtrainer LYRA1, LYRA1_11
	sjumpfwd .AfterBattle

.Chikorita:
	loadtrainer LYRA1, LYRA1_12
.AfterBattle
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	showtext Text_LyraGoodbye2
	applymovement NEWBARKTOWN_LYRA, Movement_LyraSaysGoodbye3_NBT
	disappear NEWBARKTOWN_LYRA
	setscene SCENE_NEWBARKTOWN_NOOP
	playmapmusic
	end

NewBarkTownTeacherScript:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue_jumptextfaceplayer Text_CallMomOnGear
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumptextfaceplayer Text_TellMomIfLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumptextfaceplayer Text_YourMonIsAdorable
	jumpthistextfaceplayer

	text "Aquí siempre"
	line "sopla una brisa"
	cont "refrescante."
	done

NewBarkTownRivalScript:
	showtext NewBarkTownRivalText1
	turnobject NEWBARKTOWN_RIVAL, LEFT
	showtext NewBarkTownRivalText2
	turnobject PLAYER, UP
	applyonemovement PLAYER, fix_facing
	follow PLAYER, NEWBARKTOWN_RIVAL
	applyonemovement PLAYER, step_down
	stopfollow
	pause 5
	turnobject NEWBARKTOWN_RIVAL, DOWN
	pause 5
	playsound SFX_TACKLE
	applyonemovement PLAYER, jump_step_down
	applyonemovement PLAYER, remove_fixed_facing
	applyonemovement NEWBARKTOWN_RIVAL, step_right
	end

Movement_TeacherRunsToYou1_NBT:
	step_left
	step_left
	step_left
	step_left
	step_end

Movement_TeacherRunsToYou2_NBT:
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_down
	step_end

Movement_TeacherBringsYouBack2_NBT:
	step_right
Movement_TeacherBringsYouBack1_NBT:
	step_right
	step_right
	step_right
	step_right
	turn_head_left
	step_end

Movement_LyraEnters_NBT:
	step_right
	step_right
	step_end

Movement_LyraApproaches_NBT:
	step_right
	step_up
	step_up
	step_right
	step_end

Movement_LyraSaysGoodbye1_NBT:
	step_up
	step_up
	step_end

Movement_LyraSaysGoodbye2_NBT:
	step_right
	step_up
	step_up
	step_up
	step_right
	step_end

Movement_LyraSaysGoodbye3_NBT:
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

Text_GearIsImpressive:
	text "Vaya, tu #gear"
	line "es impresionante!"

	para "¿Te lo dio tu"
	line "madre?"
	done


Text_WaitPlayer:
	text "¡Espera, <PLAYER>!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "¿Qué crees que"
	line "estás haciendo?"
	done

Text_ItsDangerousToGoAlone:
	text "¡Es peligroso salir"
	line "sin un #mon"
	cont "contigo!"

	para "Los #mon"
	line "salvajes saltan"

	para "de la hierba de"
	line "camino al"
	cont "siguiente pueblo."
	done

Text_YourMonIsAdorable:
	text "¡Oh! Tu #mon"
	line "es adorable!"
	cont "¡Cómo me gustaría!"
	done

Text_TellMomIfLeaving:
	text "¡Hola, <PLAYER>!"
	line "¿Te vas otra vez?"

	para "Deberías avisar"
	line "a tu madre si"
	cont "te vas."
	done

Text_CallMomOnGear:
	text "Llama a tu madre"
	line "con el #gear"

	para "para que sepa"
	line "cómo estás."
	done

Text_ElmDiscoveredNewMon:
	text "¡Eh, <PLAYER>!"

	para "Oí que el"
	line "Prof.Elm descubrió"
	cont "#mon nuevos."
	done

NewBarkTownRivalText1:
	text "……"

	para "Así que este es"
	line "el famoso"
	cont "Laboratorio Elm…"
	done

NewBarkTownRivalText2:
	text "…¿Qué miras"
	line "tanto?"
	done

Text_LyraIntro:
	text "Lyra: ¡Hola,"
	line "<PLAYER>!"

	para "Pasé por tu casa"
	line "antes,"

	para "pero seguías"
	line "dormido."

	para "¿Sabes que a veces"
	line "ayudo al"
	cont "Prof.Elm?"

	para "Está empezando"
	line "una investigación"
	cont "#mon nueva"

	para "y quiere que"
	line "le ayudemos."

	para "¡Vamos a ver"
	line "qué quiere!"
	done

Text_LyraGoodbye1:
	text "Lyra: ¡<PLAYER>!"

	para "Me dijeron que"
	line "tienes todas las"
	cont "Medallas de Johto."

	para "…Eres alguien"
	line "especial,"
	cont "<PLAYER>."

	para "Pensar que los"
	line "dos empezamos"

	para "nuestro viaje en"
	line "este pueblo…"

	para "Hago lo que puedo"
	line "para ayudar al"
	cont "Profesor, pero"
	cont "nunca podría"
	cont "vencer al Campeón"
	cont "de la Liga."

	para "…Antes de irte…"

	para "¿Qué tal una"
	line "batalla más?"

	para "¡Quiero ver en qué"
	line "clase de"
	cont "entrenador te has"
	cont "convertido!"
	done

Text_LyraGoodbyeWin:
	text "¡Eres tan bueno"
	line "como esperaba!"
	done

Text_LyraGoodbyeLoss:
	text "Espero que no me"
	line "dejaras ganar…"
	done

Text_LyraGoodbye2:
	text "…Gracias,"
	line "<PLAYER>."

	para "Sé cuánto"
	line "esfuerzo y cariño"

	para "le has puesto a"
	line "criar a tu"
	cont "#mon."

	para "…Bueno, esto es"
	line "un adiós."

	para "Sé que puedes"
	line "ganar la Liga"
	cont "¡#mon!"

	para "¡Vas a ser una"
	line "gran Campeona!"
	done

NewBarkTownSignText:
	text "Pueblo Primavera"

	para "El pueblo donde"
	line "soplan los"
	cont "vientos de un"
	cont "nuevo comienzo"
	done

PlayersHouseSignText:
	text "Casa de <PLAYER>"
	done

ElmsLabSignText:
	text "Lab. #mon Elm"
	done

LyrasHouseSignText:
	text "Casa de Lyra"
	done
