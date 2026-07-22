LancesRoom_MapScriptHeader:
	def_scene_scripts
	scene_script LancesRoomLockDoorScene, SCENE_LANCESROOM_LOCK_DOOR
	scene_const SCENE_LANCESROOM_APPROACH_LANCE

	def_callbacks
	callback MAPCALLBACK_TILES, LancesRoomDoorCallback

	def_warp_events
	warp_event  6, 23, KARENS_ROOM, 3
	warp_event  7, 23, KARENS_ROOM, 4
	warp_event  6,  1, HALL_OF_FAME, 1
	warp_event  7,  1, HALL_OF_FAME, 2

	def_coord_events
	coord_event  6,  5, SCENE_LANCESROOM_APPROACH_LANCE, ApproachLanceFromLeftTrigger
	coord_event  7,  5, SCENE_LANCESROOM_APPROACH_LANCE, ApproachLanceFromRightTrigger

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LanceScript, -1
	object_event  6,  7, SPRITE_MARY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
	object_event  6,  7, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY

	object_const_def
	const LANCESROOM_LANCE
	const LANCESROOM_MARY
	const LANCESROOM_OAK

LancesRoomLockDoorScene:
	sdefer .Script
	end

.Script:
	applymovement PLAYER, WalkIntoEliteFourRoomMovement
	reanchormap
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 22, $26
	refreshmap
	closetext
	setscene SCENE_LANCESROOM_APPROACH_LANCE
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end

WalkIntoEliteFourRoomMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

LancesRoomDoorCallback:
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalsefwd .LanceEntranceOpen
	changeblock 6, 22, $26
.LanceEntranceOpen:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalsefwd .LanceExitClosed
	changeblock 6, 0, $13
.LanceExitClosed:
	endcallback

ApproachLanceFromLeftTrigger:
	special Special_FadeOutMusic
	applymovement PLAYER, ApproachLanceFromLeftMovement
	sjumpfwd LanceScript

ApproachLanceFromRightTrigger:
	special Special_FadeOutMusic
	applymovement PLAYER, ApproachLanceFromRightMovement
LanceScript:
	turnobject LANCESROOM_LANCE, LEFT
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	showtext .SeenText
	winlosstext .BeatenText, 0
	setlasttalked LANCESROOM_LANCE
	loadtrainer CHAMPION, LANCE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	showtext .SeenRematchText
	winlosstext .BeatenText, 0
	setlasttalked LANCESROOM_LANCE
	loadtrainer CHAMPION, LANCE2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	setevent EVENT_BEAT_CHAMPION_LANCE
	playsound SFX_ENTER_DOOR
	changeblock 6, 0, $13
	refreshmap
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_BEAUTY_ENCOUNTER, $10
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_LANCE, 15
	turnobject LANCESROOM_LANCE, DOWN
	pause 10
	turnobject PLAYER, DOWN
	appear LANCESROOM_MARY
	applymovement LANCESROOM_MARY, .RushInMovement
	showtext .MaryText1
	appear LANCESROOM_OAK
	applymovement LANCESROOM_OAK, .WalkInMovement
	follow LANCESROOM_MARY, LANCESROOM_OAK
	applymovement LANCESROOM_MARY, .StepAsideMovement
	stopfollow
	turnobject LANCESROOM_OAK, UP
	turnobject LANCESROOM_LANCE, LEFT
	readvar VAR_BADGES
	ifnotequal 16, .DefaultOakSpeech
	checkevent EVENT_OPENED_MT_SILVER
	iffalsefwd .DefaultOakSpeech
	showtext .OakRematchSpeechText
	sjumpfwd .OakSpeechDone
.DefaultOakSpeech
	showtext .OakSpeechText
.OakSpeechDone
	applymovement LANCESROOM_MARY, .ApproachPlayerMovement
	turnobject PLAYER, LEFT
	showtext .MaryText2
	applymovement LANCESROOM_LANCE, .WalkTowardExitMovement
	turnobject PLAYER, UP
	showtext .LanceLeavingText
	follow LANCESROOM_LANCE, PLAYER
	turnobject LANCESROOM_MARY, UP
	turnobject LANCESROOM_OAK, UP
	applyonemovement LANCESROOM_LANCE, step_up
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applyonemovement PLAYER, step_up
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applymovement LANCESROOM_MARY, .TryToFollowMovement
	showemote EMOTE_SHOCK, LANCESROOM_MARY, 15
	opentext
	writetext .MaryText3
	pause 30
	closetext
	applymovement LANCESROOM_MARY, .RunBackAndForthMovement
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	end

.SeenText:
	text "Lance: Te he"
	line "estado esperando."

	para "¡<PLAYER>!"

	para "Sabía que tú, con"
	line "tu habilidad,"

	para "acabarías"
	line "llegando hasta"
	cont "aquí."

	para "No hacen falta"
	line "palabras ahora."

	para "Combatiremos para"
	line "determinar quién"

	para "es el más fuerte"
	line "de los dos."

	para "Como el entrenador"
	line "más poderoso y"

	para "como Campeón de la"
	line "Liga #mon…"

	para "¡Yo, Lance el"
	line "maestro Dragón,"
	cont "acepto tu"
	cont "desafío!"
	done

.BeatenText:
	text "…Se acabó."

	para "Pero es una"
	line "sensación extraña."

	para "No estoy enfadado"
	line "por haber perdido."
	cont "De hecho, me"
	cont "siento feliz."

	para "Feliz de haber"
	line "presenciado el"

	para "ascenso de un gran"
	line "nuevo Campeón."
	done

.AfterText:
	text "…Fiu."

	para "Te has vuelto"
	line "verdaderamente"
	cont "poderoso,"
	cont "<PLAYER>."

	para "Tus #mon han"
	line "respondido a tu"

	para "naturaleza fuerte"
	line "e íntegra."

	para "Como entrenador,"
	line "seguirás"

	para "creciendo fuerte"
	line "con tus #mon."
	done

.SeenRematchText:
	text "Lance: No hacen"
	line "falta palabras"
	cont "ahora."

	para "Combatiremos para"
	line "determinar quién"

	para "es el más fuerte"
	line "de los dos."

	para "¡Yo, Lance el"
	line "maestro Dragón,"
	cont "acepto tu"
	cont "desafío!"
	done

.AfterRematchText:
	text "Tal como"
	line "esperaba."

	para "Tú y tus #mon"
	line "hacéis un gran"
	cont "equipo."

	para "Como entrenador,"
	line "seguirás"

	para "creciendo fuerte"
	line "con tus #mon."
	done

.MaryText1:
	text "Mary: ¡Oh, no!"
	line "¡Se acabó!"

	para "Prof.Oak, si no"
	line "fuera tan"
	cont "lento…"
	done

.OakSpeechText:
	text "Prof.Oak: Ah,"
	line "¡<PLAYER>!"

	para "Ha pasado mucho"
	line "tiempo."

	para "Desde luego,"
	line "luces más"
	cont "impresionante."

	para "¡Tu conquista de"
	line "la Liga es"
	cont "fantástica!"

	para "Tu dedicación,"
	line "confianza y amor"

	para "por tus #mon"
	line "hicieron que"
	cont "sucediera."

	para "Tus #mon"
	line "también fueron"
	cont "sobresalientes."

	para "Porque creyeron en"
	line "ti como"

	para "entrenador,"
	line "perseveraron."

	para "¡Felicidades,"
	line "<PLAYER>!"
	done

.OakRematchSpeechText:
	text "Prof.Oak: Ah,"
	line "¡<PLAYER>!"

	para "¡Tu revancha con"
	line "la Liga fue"
	cont "fantástica!"

	para "Me queda claro que"
	line "comprendes,"

	para "confías y amas a"
	line "los #mon"
	cont "profundamente."

	para "Las habilidades"
	line "sobresalientes de"
	cont "tu equipo lo"
	cont "demuestran."

	para "Creo que podrías"
	line "estar preparado"

	para "para afrontar un"
	line "reto peligroso en"
	cont "particular."

	para "¡Ven a verme a mi"
	line "laboratorio"
	cont "después de esto!"
	done

.MaryText2:
	text "Mary: ¡Vamos a"
	line "entrevistar al"
	cont "nuevo Campeón!"
	done

.LanceLeavingText:
	text "Lance: Esto se"
	line "está volviendo un"
	cont "poco ruidoso…"

	para "<PLAYER>, ¿podrías"
	line "venir conmigo?"
	done

.MaryText3:
	text "Mary: ¡Oh, espera!"
	line "¡No hemos hecho la"
	cont "entrevista!"
	done

.RushInMovement:
	run_step_up
	run_step_up
	run_step_up
	turn_head_down
	step_end

.WalkInMovement:
	step_up
	step_up
	step_end

.StepAsideMovement:
	step_left
	turn_head_right
	step_end

.ApproachPlayerMovement:
	run_step_up
	turn_head_right
	step_end

.WalkTowardExitMovement:
	step_up
	step_left
	turn_head_down
	step_end

.TryToFollowMovement:
	step_up
	step_right
	turn_head_up
	step_end

.RunBackAndForthMovement:
	run_step_right
	run_step_right
	run_step_left
	run_step_left
	run_step_left
	run_step_right
	run_step_right
	run_step_right
	run_step_left
	run_step_left
	turn_head_up
	step_end

ApproachLanceFromLeftMovement:
	step_up
	step_up
	turn_head_right
	step_end

ApproachLanceFromRightMovement:
	step_up
	step_left
	step_up
	turn_head_right
	step_end
