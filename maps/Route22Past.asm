Route22Past_MapScriptHeader:
	def_scene_scripts
	scene_script Route22PastSilverGiovanniScene, SCENE_ROUTE22PAST_SILVER_GIOVANNI

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  8, SPRITE_CELEBI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5,  7, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5,  2, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  2,  2, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1

	object_const_def
	const ROUTE22PAST_CELEBI
	const ROUTE22PAST_LYRA
	const ROUTE22PAST_RIVAL
	const ROUTE22PAST_GIOVANNI

Route22PastSilverGiovanniScene:
	sdefer .Script
	end

.Script:
	pause 30
	applymovement PLAYER, Route22Past_PlayerLooksAroundMovementData
	showemote EMOTE_SHOCK, ROUTE22PAST_LYRA, 15
	showtext Route22PastLyraWhereAreWeText
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraLooksAroundMovementData
	showtext Route22PastLyraIlexForestDisappearedText
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraStepDownMovementData
	turnobject PLAYER, LEFT
	showtext Route22PastLyraPokeGearText
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraStepDownTurnHeadRigthMovementData
	turnobject PLAYER, DOWN
	showtext Route22PastLyraExplainsTimeTravelText
	showemote EMOTE_SHOCK, ROUTE22PAST_LYRA, 15
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraMoveUpToHearMovementData
	showtext Route22PastLyraHearsSomeoneText
	applymovement PLAYER, Route22Past_PlayerStepUpToLyraMovementData
	follow ROUTE22PAST_LYRA, PLAYER
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraApproachesRivalMovementData
	turnobject ROUTE22PAST_LYRA, UP
	turnobject PLAYER, UP
	stopfollow
	applyonemovement ROUTE22PAST_CELEBI, step_up
	special Special_FadeOutMusic
	applyonemovement ROUTE22PAST_RIVAL, slow_step_left
	showtext Route22PastRivalQuestionsGiovanniText
	turnobject ROUTE22PAST_GIOVANNI, RIGHT
	showtext Route22PastGiovanniRivalArgumentText
	applyonemovement ROUTE22PAST_RIVAL, slow_step_left
	showtext Route22PastRivalProtestsText
	turnobject ROUTE22PAST_GIOVANNI, LEFT
	showtext Route22PastGiovanniGoodbyeText
	applymovement ROUTE22PAST_GIOVANNI, Route22Past_GiovanniLeavesMovementData
	pause 15
	applyonemovement ROUTE22PAST_RIVAL, slow_step_left
	showtext Route22PastRivalRantText
	special Special_FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement ROUTE22PAST_RIVAL, ROUTE22PAST_RIVALRunsIntoPlayerMovementData
	showemote EMOTE_SHOCK, ROUTE22PAST_RIVAL, 15
	showtext Route22PastRivalInsultText
	playsound SFX_TACKLE
	applymovement PLAYER, ROUTE22PAST_RIVALShovesPlayerDownMovementData
	turnobject ROUTE22PAST_LYRA, DOWN
	applymovement ROUTE22PAST_RIVAL, ROUTE22PAST_RIVALLeavesMovementData
	special RestartMapMusic
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraMeetsPlayerMovementData
	showtext Route22PastLyraConclusionText
	cry CELEBI
	applymovement ROUTE22PAST_CELEBI, Route22Past_CelebiHopsMovementData
	waitsfx
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	special LoadMapPalettes
	pause 30
	special FadeInPalettes_EnableDynNoApply
	waitsfx
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraLooksAroundAgainMovementData
	turnobject ROUTE22PAST_LYRA, DOWN
	showtext Route22PastLyraOhNoText
	playsound SFX_PROTECT
	applymovement ROUTE22PAST_CELEBI, Route22Past_CelebiFloatsMovementData
	waitsfx
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	pause 30
	waitsfx
	clearevent EVENT_GIOVANNIS_CAVE_CELEBI
	clearevent EVENT_GIOVANNIS_CAVE_LYRA
	clearevent EVENT_GIOVANNIS_CAVE_GIOVANNI
	setmapscene GIOVANNIS_CAVE, SCENE_GIOVANNISCAVE_PAST_GIOVANNI
	warp GIOVANNIS_CAVE, 5, 5
	end

Route22Past_PlayerLooksAroundMovementData:
	turn_head_left
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_right
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_up
	step_sleep_8
	step_sleep_8
	step_sleep_8
	step_end

Route22Past_LyraLooksAroundMovementData:
	slow_step_up
	step_sleep_8
	step_sleep_8
	step_sleep_8
Route22Past_LyraLooksAroundAgainMovementData:
	turn_head_left
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_right
	step_sleep_8
	step_sleep_8
	step_sleep_8
	step_end

Route22Past_LyraStepDownMovementData:
	slow_step_down
	step_end

Route22Past_LyraStepDownTurnHeadRigthMovementData:
	slow_step_down
	turn_head_right
	step_end

Route22Past_LyraMoveUpToHearMovementData:
	slow_step_up
	slow_step_up
	step_end

Route22Past_PlayerStepUpToLyraMovementData:
	slow_step_up
	step_end

Route22Past_LyraApproachesRivalMovementData:
	slow_step_up
	slow_step_up
	slow_step_left
	step_end

Route22Past_GiovanniLeavesMovementData:
	slow_step_left
	slow_step_left
	step_end

ROUTE22PAST_RIVALRunsIntoPlayerMovementData:
	step_right
	step_right
	step_right
	step_down
	step_end

ROUTE22PAST_RIVALShovesPlayerDownMovementData:
	turn_head_up
	fix_facing
	jump_step_down
	step_sleep_6
	turn_head_left
	step_right
	remove_fixed_facing
	step_end

ROUTE22PAST_RIVALLeavesMovementData:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

Route22Past_LyraMeetsPlayerMovementData:
	step_right
	step_down
	step_down
	turn_head_right
	step_end

Route22Past_CelebiHopsMovementData:
	step_left
	turn_head_down
	step_end

Route22Past_CelebiFloatsMovementData:
	turn_head_down
	fix_facing
	slow_step_up
	slow_step_up
	slow_step_up
	remove_fixed_facing
	step_end

Route22PastLyraWhereAreWeText:
	text "Lyra: ¿Dónde"
	line "estamos…?"
	done

Route22PastLyraIlexForestDisappearedText:
	text "Lyra: ¡El Encinar"
	line "ha desaparecido!"

	para "…No es eso. ¿Nos"
	line "hemos"
	cont "teletransportado a"
	cont "otro lugar…?"
	done

Route22PastLyraPokeGearText:
	text "Lyra: <PLAYER>, mi"
	line "radio del #gear"

	para "¡dice que la"
	line "fecha es de hace"
	cont "tres años!"
	done

Route22PastLyraExplainsTimeTravelText:
	text "¿Eso… estoy"
	line "mirando a…"
	cont "Celebi?"

	para "¡Eso lo explica!"
	line "¡Celebi debió usar"
	cont "su poder para"

	para "viajar atrás"
	line "en el tiempo!"
	done

Route22PastLyraHearsSomeoneText:
	text "<PLAYER>, oigo a"
	line "alguien más."

	para "¡Vamos a ver"
	line "quién es!"
	done

Route22PastRivalQuestionsGiovanniText:
	text "<RIVAL>: Me"
	line "dijiste… ¡Que eras"

	para "el número uno del"
	line "mundo!"

	para "¿Vas a"
	line "rendirte?"

	para "¿Qué vas a hacer"
	line "ahora?"
	done

Route22PastGiovanniRivalArgumentText:
	text "…… …… ……"

	para "Uno debe"
	line "reconocer su"
	cont "derrota antes de"
	cont "poder seguir"
	cont "adelante…"

	para "Iré solo… por"
	line "ahora…"

	para "Para que algún día"
	line "forme una"

	para "organización más"
	line "fuerte."

	para "<RIVAL>: ¿En qué"
	line "aspecto eras"
	cont "número uno?"

	para "¡Reunir a tantos"
	line "solo para ser"

	para "derrotado por un"
	line "simple niño!"

	para "…… …… ……"

	para "Juntar el"
	line "potencial de"

	para "muchos es cómo se"
	line "produce un enorme"
	cont "poder…"

	para "¡Eso es lo que es"
	line "una organización!"

	para "Fallé… en"
	line "aprovechar al"

	para "máximo el"
	line "potencial de mis"
	cont "subordinados…"

	para "¡Pero algún día"
	line "presenciarás el"

	para "renacer de mí y de"
	line "mi Team Rocket!"
	done

Route22PastRivalProtestsText:
	text "<RIVAL>: ¡No te"
	line "entiendo!"

	para "¡No tienes ningún"
	line "sentido!"
	done

Route22PastGiovanniGoodbyeText:
	text "…… …… ……"

	para "Algún día,"
	line "entenderás."
	done

Route22PastRivalRantText:
	text "<RIVAL>: ¡No"
	line "quiero"
	cont "entenderte!"

	para "Nunca me"
	line "convertiré en"
	cont "alguien como tú."

	para "¡Un cobarde cuando"
	line "estás solo y"

	para "actúas como un"
	line "tirano cuando"

	para "estás frente a"
	line "otros cobardes!"

	para "¡Me volveré"
	line "fuerte!"

	para "¡Me convertiré en"
	line "un hombre más"
	cont "fuerte yo solo!"

	para "¡Yo solo!"
	done

Route22PastRivalInsultText:
	text "<RIVAL>: …¿Qué"
	line "miras?"
	done

Route22PastLyraConclusionText:
	text "Lyra: ¿Quién se"
	line "cree que es?"

	para "¡Eso fue"
	line "innecesario!"

	para "Pero hablaban del"
	line "renacer del Team"
	cont "Rocket…"

	para "El Team Rocket fue"
	line "expulsado de Kanto"

	para "por un niño hace"
	line "tres años."

	para "¡Así que esto de"
	line "verdad es el"
	cont "pasado!"
	done

Route22PastLyraOhNoText:
	text "Lyra: ¡Oh no!"
	line "¡Está pasando otra"
	cont "vez…!"

	para "¡Es el Viaje en el"
	line "Tiempo de Celebi!"
	done
