GiovannisCave_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_GIOVANNISCAVE_NOOP
	scene_script GiovannisCavePastBattleScene, SCENE_GIOVANNISCAVE_PAST_GIOVANNI

	def_callbacks

	def_warp_events
	warp_event  5,  7, TOHJO_FALLS, 3

	def_coord_events

	def_bg_events
	bg_event  5,  2, BGEVENT_READ, GiovannisCaveRadioScript
	bg_event  2,  6, BGEVENT_ITEM + BERSERK_GENE, EVENT_GIOVANNIS_CAVE_HIDDEN_BERSERK_GENE

	def_object_events
	object_event  5,  6, SPRITE_CELEBI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GIOVANNIS_CAVE_CELEBI
	object_event  4,  5, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GIOVANNIS_CAVE_LYRA
	object_event  5,  3, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GIOVANNIS_CAVE_GIOVANNI
	smashrock_event  3,  6
	smashrock_event  6,  2

	object_const_def
	const GIOVANNISCAVE_CELEBI
	const GIOVANNISCAVE_LYRA
	const GIOVANNISCAVE_GIOVANNI

GiovannisCavePastBattleScene:
	sdefer .Script
	end

.Script:
	pause 30
	turnobject PLAYER, UP
	turnobject GIOVANNISCAVE_LYRA, UP
	showemote EMOTE_SHOCK, GIOVANNISCAVE_GIOVANNI, 15
	turnobject GIOVANNISCAVE_GIOVANNI, DOWN
	showtext GiovannisCaveGiovanniIntroText
	applyonemovement GIOVANNISCAVE_GIOVANNI, slow_step_down
	showtext GiovannisCaveGiovanniMemoriesText
	turnobject GIOVANNISCAVE_LYRA, RIGHT
	showtext GiovannisCaveLyraQuestionsText
	showemote EMOTE_SHOCK, GIOVANNISCAVE_LYRA, 15
	showtext GiovannisCaveLyraRecognizesGiovanniText
	playmusic MUSIC_ROCKET_OVERTURE
	turnobject GIOVANNISCAVE_LYRA, UP
	turnobject GIOVANNISCAVE_GIOVANNI, UP
	showtext GiovannisCaveBroadcastText
	turnobject GIOVANNISCAVE_GIOVANNI, DOWN
	showtext GiovannisCaveGiovanniIMustGoText
	setmapscene GIOVANNIS_CAVE, SCENE_GIOVANNISCAVE_NOOP
	clearevent EVENT_TIME_TRAVELING
	winlosstext GiovannisCaveGiovanniBeatenText, 0
	setlasttalked GIOVANNISCAVE_GIOVANNI
	loadtrainer GIOVANNI, GIOVANNI2
	startbattle
	reloadmapafterbattle
	setevent EVENT_TIME_TRAVELING
	applymovement GIOVANNISCAVE_GIOVANNI, GiovannisCave_GiovanniStepsBackMovementData
	showtext GiovannisCaveGiovanniAfterText
	applymovement GIOVANNISCAVE_GIOVANNI, GiovannisCave_GiovanniLeavesMovementData
	playsound SFX_ENTER_DOOR
	disappear GIOVANNISCAVE_GIOVANNI
	waitsfx
	turnobject PLAYER, DOWN
	turnobject GIOVANNISCAVE_LYRA, DOWN
	showtext GiovannisCaveBroadcastAfterText
	applyonemovement GIOVANNISCAVE_LYRA, slow_step_down
	showtext GiovannisCaveLyraFeelsSorryText
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	special LoadMapPalettes
	pause 30
	special FadeInPalettes_EnableDynNoApply
	waitsfx
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, GiovannisCave_PlayerStepsAsideMovementData
	applymovement GIOVANNISCAVE_LYRA, GiovannisCave_LyraLooksAroundMovementData
	showtext GiovannisCaveLyraWantsToLeaveText
	playsound SFX_PROTECT
	applymovement GIOVANNISCAVE_CELEBI, GiovannisCave_CelebiFloatsMovementData
	waitsfx
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	pause 30
	waitsfx
	disappear GIOVANNISCAVE_CELEBI
	disappear GIOVANNISCAVE_LYRA
	warp CINNABAR_LAB, 30, 16
	end

GiovannisCaveRadioScript:
	checkevent EVENT_TIME_TRAVEL_FINISHED
	iftrue_jumptext GiovannisCaveRadioAfterTimeTravelText
	jumpthistext

	text "Hay una radio que"
	line "ya no funciona…"
	done

GiovannisCaveRadioAfterTimeTravelText:
	text "No puedes"
	line "encender la"
	cont "radio."

	para "Giovanni debió"
	line "dejarla aquí…"
	done

GiovannisCave_GiovanniStepsBackMovementData:
	turn_head_down
	fix_facing
	slow_step_up
	remove_fixed_facing
	slow_step_right
	step_end

GiovannisCave_GiovanniLeavesMovementData:
	step_down
	step_down
	step_down
	step_down
	step_left
	turn_head_down
	step_end

GiovannisCave_PlayerStepsAsideMovementData:
	turn_head_left
	fix_facing
	slow_step_right
	remove_fixed_facing
	step_end

GiovannisCave_LyraLooksAroundMovementData:
	turn_head_left
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_right
	step_end

GiovannisCave_CelebiFloatsMovementData:
	turn_head_down
	fix_facing
	slow_step_up
	slow_step_up
	slow_step_up
	remove_fixed_facing
	step_end

GiovannisCaveGiovanniIntroText:
	text "…"

	para "No sé por qué"
	line "viniste aquí,"

	para "pero debo"
	line "advertirte que"
	cont "este no es lugar"
	cont "para niños como"
	cont "tú."

	para "Lyra: ¿Eh? ¡Ese"
	line "es el tipo que"

	para "acabamos de ver"
	line "discutiendo con"
	cont "ese chico!"
	done

GiovannisCaveGiovanniMemoriesText:
	text "Tienes cierta"
	line "mirada…"

	para "¡Te recuerdo!"

	para "Ese niño de hace"
	line "tres años seguía"
	cont "arruinando"
	cont "nuestros planes,"

	para "¡pero tú causaste"
	line "todos nuestros"
	cont "problemas desde"
	cont "el principio!"

	para "…"

	para "Voy de camino a"
	line "Ciudad Trigal para"

	para "responder a la"
	line "llamada y unirme a"
	cont "mi equipo."

	para "¿Vas a"
	line "interponerte en mi"
	cont "camino otra vez?"
	done

GiovannisCaveLyraQuestionsText:
	text "Lyra: ¿Hace tres"
	line "años…? ¿Ciudad"
	cont "Trigal…?"
	done

GiovannisCaveLyraRecognizesGiovanniText:
	text "¡Este es a quien"
	line "el Team Rocket"
	cont "intentaba"
	cont "contactar!"

	para "¡Su jefe,"
	line "Giovanni!"

	para "<PLAYER>, ¿cuándo"
	line "conociste a"
	cont "Giovanni antes…?"
	done

GiovannisCaveBroadcastText:
	text "“… …Ejem, ¡somos"
	line "el Team Rocket!"
	cont "¡Tras tres años de"
	cont "preparación, hemos"
	cont "resurgido de las"
	cont "cenizas!"
	cont "¡Giovanni! ¿Nos"
	cont "oyes? ¡Lo"
	cont "logramos! ¿Dónde"
	cont "está nuestro jefe?"
	cont "¿Está escuchando?”"

	para "Lyra: El Team"
	line "Rocket ha ocupado"

	para "la Torre Radio"
	line "ahora mismo…"

	para "Estás ahí, pero"
	line "también estás"
	cont "aquí…"
	done

GiovannisCaveGiovanniIMustGoText:
	text "Giovanni: Mis"
	line "antiguos"
	cont "asociados me"
	cont "necesitan…"

	para "¡No repetiremos el"
	line "fracaso de hace"
	cont "tres años!"

	para "¡El Team Rocket"
	line "renacerá!"

	para "Lyra: ¡Ja!"
	line "¡<PLAYER> ya te"
	cont "detuvo!"
	cont "…Te detendrá."

	para "¿Te habrá"
	line "detenido…?"

	para "…¡Viajar en el"
	line "tiempo es"
	cont "confuso!"

	para "Giovanni: ¡Basta"
	line "de charla! ¡Fuera"
	cont "de mi camino!"
	done

GiovannisCaveGiovanniBeatenText:
	text "¿Qué demonios eres"
	line "tú?"
	done

GiovannisCaveGiovanniAfterText:
	text "Giovanni: ¿Cómo es"
	line "esto posible…?"

	para "¿Los últimos tres"
	line "años han sido una"
	cont "pérdida…?"

	para "¿Cómo puede un"
	line "niño como tú"

	para "destruir mi sueño"
	line "una vez más?"
	done

GiovannisCaveBroadcastAfterText:
	text "“… …¡Oye! ¿A dónde"
	line "se fue Giovanni?"
	cont "Me pregunto si"
	cont "está escuchando"
	cont "nuestra emisión…"
	cont "…”"
	done

GiovannisCaveLyraFeelsSorryText:
	text "Lyra: Siguen"
	line "llamando a su"
	cont "jefe."

	para "Me da pena que no"
	line "sepan que no va a"
	cont "venir."

	para "Pero ahora mismo,"
	line "<PLAYER>, ¡debes"
	cont "estar"
	cont "derrotándolos!"
	done

GiovannisCaveLyraWantsToLeaveText:
	text "Lyra: ¡Otra vez"
	line "no…! ¡Ya he tenido"
	cont "suficiente!"

	para "¡Por favor,"
	line "volvamos a"
	cont "nuestra época!"
	done
