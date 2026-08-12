OlivineCity_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_OLIVINECITY_RIVAL_ENCOUNTER
	scene_script OlivineCityStepDownScene, SCENE_OLIVINECITY_STEP_DOWN
	scene_const SCENE_OLIVINECITY_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, OlivineCityFlyPoint
	callback MAPCALLBACK_TILES, OlivineCityLighthouseCallback

	def_warp_events
	warp_event 13, 17, OLIVINE_POKECENTER_1F, 1
	warp_event 10,  7, OLIVINE_GYM, 1
	warp_event 25,  7, OLIVINE_TIMS_HOUSE, 1
	warp_event 29,  7, OLIVINE_PUNISHMENT_SPEECH_HOUSE, 1
	warp_event 15, 11, OLIVINE_GOOD_ROD_HOUSE, 1
	warp_event  7, 17, OLIVINE_CAFE, 1
	warp_event 21, 17, OLIVINE_MART, 2
	warp_event 33, 21, OLIVINE_LIGHTHOUSE_1F, 1 ; hole
	warp_event 18, 28, OLIVINE_PORT, 1
	warp_event 19, 28, OLIVINE_PORT, 2

	def_coord_events
	coord_event 10,  8, SCENE_OLIVINECITY_RIVAL_ENCOUNTER, OlivineCityRivalGymScript
	coord_event 33, 22, SCENE_OLIVINECITY_RIVAL_ENCOUNTER, OlivineCityRivalLighthouseScript
	coord_event 33, 21, SCENE_OLIVINECITY_NOOP, OlivineCityPanUpScript

	def_bg_events
	bg_event 17,  7, BGEVENT_JUMPTEXT, OlivineCitySignText
	bg_event 20, 25, BGEVENT_JUMPTEXT, OlivineCityPortSignText
	bg_event 11,  7, BGEVENT_JUMPTEXT, OlivineGymSignText
	bg_event 35, 23, BGEVENT_JUMPTEXT, OlivineLighthouseSignText
	bg_event  1, 21, BGEVENT_JUMPTEXT, OlivineCityBattleTowerSignText
	bg_event 10, 17, BGEVENT_JUMPTEXT, OlivineCityCafeSignText
	bg_event 35, 18, BGEVENT_ITEM + RARE_CANDY, EVENT_OLIVINE_CITY_HIDDEN_RARE_CANDY

	def_object_events
	object_event 10,  7, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_OLIVINE_CITY
	object_event 20,  8, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineCityYoungster1Script, -1
	object_event 21, 23, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << MORN) | (1 << NITE), PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OlivineCityPokefanMScript, -1
	object_event 26, 20, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor1Text, -1
	object_event 15, 21, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, 1 << EVE, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor2Text, -1
	object_event 31, 19, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCityFisherText, -1
	object_event 31, 19, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor3Text, -1
	object_event 22, 23, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << DAY), PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCityPokefanFText, -1
	object_event 25, 16, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor4Text, -1
	object_event 25, 17, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor5Text, -1
	object_event 26, 11, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, (1 << MORN) | (1 << EVE), PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCityLass1Text, -1
	object_event 28, 11, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << DAY) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCityYoungster2Text, -1
	object_event  8, 21, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY) | (1 << EVE), PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCityLass2Text, -1
	smashrock_event 52, 23
	smashrock_event 55, 26

	object_const_def
	const OLIVINECITY_OLIVINE_RIVAL

OlivineCityFlyPoint:
	setflag ENGINE_FLYPOINT_OLIVINE
	endcallback

OlivineCityLighthouseCallback:
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalsefwd .done
	checktime 1 << NITE
	iffalsefwd .done
	changeblock 32, 14, $9a
	changeblock 34, 14, $9b
.done
	endcallback

OlivineCityStepDownScene:
	sdefer .Script
	end

.Script:
	readvar VAR_XCOORD
	ifnotequal 33, .Done
	readvar VAR_YCOORD
	ifnotequal 21, .Done
	applyonemovement PLAYER, step_down
.Done
	setscene SCENE_OLIVINECITY_NOOP
	end

OlivineCityPanUpScript:
	playsound SFX_EXIT_BUILDING
	applyonemovement PLAYER, hide_object
	waitsfx
	applymovement PLAYER, OlivineCityPanUpMovementData
	disappear PLAYER
	pause 10
	special Special_FadeOutMusic
	special FadeOutPalettes
	pause 15
	setscene SCENE_OLIVINECITY_STEP_DOWN
	warpfacing UP, OLIVINE_LIGHTHOUSE_1F, 10, 17
	end

OlivineCityRivalGymScript:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	playsound SFX_ENTER_DOOR
	appear OLIVINECITY_OLIVINE_RIVAL
	waitsfx
	playsound SFX_TACKLE
	applymovement PLAYER, OlivineCityMovementData_ShovePlayerDown
	applyonemovement OLIVINECITY_OLIVINE_RIVAL, step_down
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext OlivineCityRivalGymText
	turnobject PLAYER, RIGHT
	applymovement OLIVINECITY_OLIVINE_RIVAL, OlivineCityMovementData_RivalLeavesGym
	setscene SCENE_OLIVINECITY_NOOP
	disappear OLIVINECITY_OLIVINE_RIVAL
	special RestartMapMusic
	end

OlivineCityRivalLighthouseScript:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	moveobject OLIVINECITY_OLIVINE_RIVAL, 33, 21
	playsound SFX_ENTER_DOOR
	appear OLIVINECITY_OLIVINE_RIVAL
	waitsfx
	playsound SFX_TACKLE
	applymovement PLAYER, OlivineCityMovementData_ShovePlayerDown
	applyonemovement OLIVINECITY_OLIVINE_RIVAL, step_down
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext OlivineCityRivalLighthouseText
	turnobject PLAYER, LEFT
	applymovement OLIVINECITY_OLIVINE_RIVAL, OlivineCityMovementData_RivalLeavesLighthouse
	setscene SCENE_OLIVINECITY_NOOP
	disappear OLIVINECITY_OLIVINE_RIVAL
	special RestartMapMusic
	end

OlivineCityYoungster1Script:
	random 2
	iffalse_jumptextfaceplayer OlivineCityStandingYoungsterPokedexText
	jumpthistextfaceplayer

	text "Eso que llevas"
	line "es un #gear,"
	cont "¿Verdad? Vaya,"
	cont "qué guay."
	done

OlivineCityPokefanMScript:
	checkevent EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	iffalse_jumptextfaceplayer OlivineCityPokefanMText
	jumpthistextfaceplayer

	text "El Barco Rápido"
	line "S.S.Aqua zarpa a"

	para "Kanto los lunes y"
	line "viernes."
	done

OlivineCityPanUpMovementData:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

OlivineCityMovementData_ShovePlayerDown:
	turn_head_up
	fix_facing
	step_down
	remove_fixed_facing
	step_end

OlivineCityMovementData_RivalLeavesGym:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

OlivineCityMovementData_RivalLeavesLighthouse:
	step_left
	step_left
	step_left
	fix_facing
	step_down
	remove_fixed_facing
	step_left
	step_left
	step_end

OlivineCityRivalGymText:
	text "…"

	para "¿Otra vez tú?"

	para "No hace falta que"
	line "te asustes. No me"

	para "molesto con"
	line "debiluchos como"
	cont "tú."

	para "Hablando de"
	line "débiles, la Líder"

	para "de Gimnasio de la"
	line "ciudad no está"
	cont "aquí."

	para "Al parecer cuida"
	line "de un #mon"
	cont "enfermo en el"
	cont "Faro."

	para "¡Já! ¡Qué pena!"
	line "¡Que suelte a ese"
	cont "#mon enfermo!"

	para "¡Un #mon que no"
	line "puede combatir no"
	cont "vale nada!"

	para "¿Por qué no vas a"
	line "entrenar al Faro?"

	para "Quién sabe. ¡A lo"
	line "mejor te vuelves"
	cont "un poco menos"
	cont "débil!"
	done

OlivineCityRivalLighthouseText:
	text "…"

	para "¿Otra vez tú?"

	para "No hace falta que"
	line "te asustes. No me"

	para "molesto con"
	line "debiluchos como"
	cont "tú."

	para "Hablando de"
	line "débiles, la Líder"

	para "de Gimnasio de la"
	line "ciudad está"

	para "cuidando de un"
	line "#mon enfermo en"
	cont "el Faro."

	para "¡Já! ¡Qué pena!"
	line "¡Que suelte a ese"
	cont "#mon enfermo!"

	para "¡Un #mon que no"
	line "puede combatir no"
	cont "vale nada!"

	para "¿Por qué no"
	line "entrenas aquí"
	cont "dentro?"

	para "Quién sabe. ¡A lo"
	line "mejor te vuelves"
	cont "un poco menos"
	cont "débil!"
	done

OlivineCityStandingYoungsterPokedexText:
	text "Vaya, ¡tienes una"
	line "#dex!"

	para "Es una pasada."
	done

OlivineCitySailor1Text:
	text "Los caminos"
	line "oscuros son"
	cont "peligrosos de"
	cont "noche."

	para "¡Pero en la más"
	line "negra oscuridad,"

	para "el mar es aún más"
	line "traicionero!"

	para "Sin la luz del"
	line "Faro para"

	para "guiarlo, ningún"
	line "barco puede"
	cont "zarpar."
	done

OlivineCitySailor2Text:
	text "¡El mar es"
	line "hermoso!"

	para "¡Los atardeceres"
	line "en el mar son"
	cont "maravillosos!"

	para "¡Canta conmigo!"
	line "♪ ¡Yo-ho! ¡A"
	cont "izar velas!… ♪"
	done

OlivineCityFisherText:
	text "Me recuerdas a un"
	line "niño que solía"
	cont "vivir aquí."

	para "La familia se"
	line "mudó cuando su"

	para "padre se convirtió"
	line "en Líder de"
	cont "Gimnasio en otra"
	cont "región."
	done

OlivineCitySailor3Text:
	text "Ver al Faro"
	line "iluminar el mar"

	para "de noche… ¡Es"
	line "precioso!"
	done

OlivineCityPokefanFText:
	text "¿Has ido al Café"
	line "de Olivo?"

	para "La comida está"
	line "deliciosa."
	done

OlivineCityPokefanMText:
	text "La mayoría de los"
	line "entrenadores que"

	para "visitan Olivo van"
	line "directos a la"
	cont "Torre de Combate."

	para "Solo los mejores"
	line "pueden competir"
	cont "allí."
	done

OlivineCitySailor4Text:
	text "♪ Un hogar como"
	line "O-li-vo,"

	para "Qué fe-liz soy de"
	line "llamarte mío,"

	para "Junto al mar"
	line "profundo y"
	cont "azul,"

	para "Ciu-dad tan"
	line "di-vina,"

	para "¡Brilla fuerte mi"
	line "O-li-vo!… ♪"
	done

OlivineCitySailor5Text:
	text "A los marineros"
	line "nos encanta"
	cont "cantar. ¡Ven a"
	cont "cantar!"

	para "♪ Desde la"
	line "plancha caí,"

	para "y entonces"
	line "le di,"

	para "oh fiddle-dee"
	line "fiddle-dee dee… ♪"
	done

OlivineCityLass1Text:
	text "Los marineros de"
	line "aquí parecen un"

	para "buen lío, pero son"
	line "inofensivos."
	done

OlivineCityYoungster2Text:
	text "Marineros y"
	line "campistas tenemos"
	cont "algo en común:"

	para "¡A ambos nos"
	line "encanta cantar!"

	para "Pero las canciones"
	line "de los marineros"
	cont "son muy…"
	cont "distintas."
	done

OlivineCityLass2Text:
	text "Yasmina, nuestra"
	line "Líder de Gimnasio,"

	para "es tímida. ¡Pero"
	line "no es blanda,"
	cont "que conste!"
	done

OlivineCitySignText:
	text "Ciudad Olivo"

	para "El Puerto Más"
	line "Cercano a Tierras"
	cont "Extranjeras"
	done

OlivineCityPortSignText:
	text "Puerto Olivo"
	line "Muelle del Barco"
	cont "Rápido"
	done

OlivineGymSignText:
	text "Ciudad Olivo"
	line "Gimnasio #mon"
	cont "Líder: Yasmina"

	para "La Chica de la"
	line "Defensa de Acero"
	done

OlivineLighthouseSignText:
	text "Faro de Olivo"
	line "También conocido"
	cont "como el Faro"
	cont "Reluciente"
	done

OlivineCityBattleTowerSignText:
	text "Torre de Combate"
	line "adelante"
	cont "¡Ya abierta!"
	done

OlivineCityCafeSignText:
	text "Café de Olivo"
	done
