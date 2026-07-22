BurnedTower1F_MapScriptHeader:
	def_scene_scripts
	scene_script BurnedTower1FMeetEusineScene, SCENE_BURNEDTOWER1F_MEET_EUSINE
	scene_const SCENE_BURNEDTOWER1F_FIREBREATHER_DICK
	scene_const SCENE_BURNEDTOWER1F_RIVAL_BATTLE
	scene_const SCENE_BURNEDTOWER1F_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, BurnedTower1FHoleAndLadder

	def_warp_events
	warp_event  7, 15, ECRUTEAK_CITY, 13
	warp_event  8, 15, ECRUTEAK_CITY, 13
	warp_event  8,  9, BURNED_TOWER_B1F, 1
	warp_event  5, 15, BURNED_TOWER_B1F, 2

	def_coord_events
	coord_event  6,  1, SCENE_BURNEDTOWER1F_FIREBREATHER_DICK, BurnedTowerFirebreatherDickBattleScript
	coord_event  9,  9, SCENE_BURNEDTOWER1F_RIVAL_BATTLE, BurnedTowerRivalBattleScript

	def_bg_events
	bg_event  6,  7, BGEVENT_ITEM + ETHER, EVENT_BURNED_TOWER_1F_HIDDEN_ETHER
	bg_event 11, 11, BGEVENT_ITEM + ULTRA_BALL, EVENT_BURNED_TOWER_1F_HIDDEN_ULTRA_BALL

	def_object_events
	object_event 10, 12, SPRITE_EUSINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BurnedTower1FEusineText, EVENT_BURNED_TOWER_1F_EUSINE
	object_event  6,  9, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event 6, 2, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GRAY, OBJECTTYPE_COMMAND, jumptextfaceplayer, FirebreatherDickAfterText, EVENT_BURNED_TOWER_FIREBREATHER_DICK_ASHES
	object_event 6, 3, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, FirebreatherDickAfterText, EVENT_BURNED_TOWER_FIREBREATHER_DICK_NORMAL
	smashrock_event 13, 4
	object_event 12, 14, SPRITE_MORTY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BurnedTower1FMortyText, EVENT_BURNED_TOWER_MORTY
	itemball_event 13,  1, HP_UP, 1, EVENT_BURNED_TOWER_1F_HP_UP
	object_event  3,  6, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHexManiacTamara, -1
	object_event 11,  3, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerFirebreatherNed, -1

	object_const_def
	const BURNEDTOWER1F_EUSINE
	const BURNEDTOWER1F_RIVAL
	const BURNEDTOWER1F_FIREBREATHER_DICK_ASHES
	const BURNEDTOWER1F_FIREBREATHER_DICK

BurnedTower1FMeetEusineScene:
	sdefer BurnedTower1FEusineTriggerScript
	end

BurnedTower1FHoleAndLadder:
	checkevent EVENT_HOLE_IN_BURNED_TOWER
	iftruefwd .Next
	changeblock 8, 8, $32 ; hole
.Next:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftruefwd .Done
	changeblock 4, 14, $9 ; ladder
.Done:
	endcallback

BurnedTower1FEusineTriggerScript:
	turnobject BURNEDTOWER1F_EUSINE, DOWN
	showemote EMOTE_SHOCK, BURNEDTOWER1F_EUSINE, 15
	applymovement BURNEDTOWER1F_EUSINE, BurnedTower1FEusineMovement
	showtext BurnedTower1FEusineIntroText
	moveobject BURNEDTOWER1F_EUSINE, 7, 14
	setscene SCENE_BURNEDTOWER1F_FIREBREATHER_DICK
	end

BurnedTowerFirebreatherDickBattleScript:
	loadtrainer FIREBREATHER, DICK
	encountermusic
	showemote EMOTE_SHOCK, BURNEDTOWER1F_FIREBREATHER_DICK, 30
	applyonemovement BURNEDTOWER1F_FIREBREATHER_DICK, step_up
	turnobject PLAYER, DOWN

; Somewhat hacky script to show the right NPC at the right time.
; We can't just `appear BURNEDTOWER1F_FIREBREATHER_DICK_ASHES` after the battle
; because the sprite graphics appear before the battle UI has exited.
	setmapobjectpal BURNEDTOWER1F_FIREBREATHER_DICK_ASHES, PAL_NPC_RED
	appear BURNEDTOWER1F_FIREBREATHER_DICK_ASHES
	showtext FirebreatherDickBeforeText
	setmapobjectpal BURNEDTOWER1F_FIREBREATHER_DICK_ASHES, PAL_NPC_GRAY
	appear BURNEDTOWER1F_FIREBREATHER_DICK_ASHES
	moveobject BURNEDTOWER1F_FIREBREATHER_DICK, 6, 2
	appear BURNEDTOWER1F_FIREBREATHER_DICK
	turnobject BURNEDTOWER1F_FIREBREATHER_DICK, UP

	winlosstext FirebreatherDickBeatenText, 0
	setlasttalked BURNEDTOWER1F_FIREBREATHER_DICK
	startbattle
	iftruefwd .lost
	disappear BURNEDTOWER1F_FIREBREATHER_DICK
	setevent EVENT_BEAT_FIREBREATHER_DICK
	setscene SCENE_BURNEDTOWER1F_RIVAL_BATTLE
	reloadmapafterbattle
	end

.lost:
	disappear BURNEDTOWER1F_FIREBREATHER_DICK_ASHES
	reloadmapafterbattle
	end

BurnedTowerRivalBattleScript:
	showemote EMOTE_SHOCK, BURNEDTOWER1F_RIVAL, 15
	special Special_FadeOutMusic
	pause 15
	turnobject BURNEDTOWER1F_RIVAL, RIGHT
	pause 15
	applyonemovement PLAYER, step_left
	applyonemovement BURNEDTOWER1F_RIVAL, step_right
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext BurnedTowerRival_BeforeText
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .chikorita
	winlosstext BurnedTowerRival_WinText, BurnedTowerRival_LossText
	setlasttalked BURNEDTOWER1F_RIVAL
	loadtrainer RIVAL1, RIVAL1_9
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .returnfrombattle

.totodile
	winlosstext BurnedTowerRival_WinText, BurnedTowerRival_LossText
	setlasttalked BURNEDTOWER1F_RIVAL
	loadtrainer RIVAL1, RIVAL1_7
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .returnfrombattle

.chikorita
	winlosstext BurnedTowerRival_WinText, BurnedTowerRival_LossText
	setlasttalked BURNEDTOWER1F_RIVAL
	loadtrainer RIVAL1, RIVAL1_8
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	; fallthrough

.returnfrombattle
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	showtext BurnedTowerRival_AfterText1
	setscene SCENE_BURNEDTOWER1F_NOOP
	setevent EVENT_RIVAL_BURNED_TOWER
	special Special_FadeOutMusic
	pause 15
	earthquake 50
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	waitsfx
	changeblock 8, 8, $25
	refreshmap
	pause 15
	applyonemovement PLAYER, skyfall_top
	playsound SFX_KINESIS
	showemote EMOTE_SHOCK, BURNEDTOWER1F_RIVAL, 20
	showtext BurnedTowerRival_AfterText2
	setevent EVENT_HOLE_IN_BURNED_TOWER
	pause 15
	warpcheck
	end

GenericTrainerHexManiacTamara:
	generictrainer HEX_MANIAC, TAMARA, EVENT_BEAT_HEX_MANIAC_TAMARA, HexManiacTamaraSeenText, HexManiacTamaraBeatenText

	text "Hay poderes en"
	line "este mundo que"

	para "van más allá de"
	line "nuestra"
	cont "comprensión…"
	done

GenericTrainerFirebreatherNed:
	generictrainer FIREBREATHER, NED, EVENT_BEAT_FIREBREATHER_NED, FirebreatherNedSeenText, FirebreatherNedBeatenText

	text "¡Los Tragafuegos"
	line "conocemos el"

	para "verdadero poder"
	line "del fuego mejor"
	cont "que nadie!"
	done

BurnedTower1FEusineMovement:
	step_down
	step_left
	step_left
	step_left
	step_down
	step_end

BurnedTowerRival_BeforeText:
	text "…… …… ……"

	para "…Ah, eres tú."

	para "Vine buscando a"
	line "un #mon"
	cont "legendario que"

	para "dicen que anida"
	line "aquí."

	para "¡Pero no hay nada"
	line "aquí!"

	para "¿Tanto esfuerzo"
	line "para venir a este"

	para "basurero para"
	line "nada? ¡Ni hablar!"

	para "¡Es todo culpa"
	line "tuya!"
	done

BurnedTowerRival_WinText:
	text "…¡Já!"

	para "Por esto odio"
	line "luchar contra"
	cont "debiluchos."

	para "No hay ningún"
	line "reto en ello."
	done

BurnedTowerRival_AfterText1:
	text "…Bah, da igual."

	para "Nunca podrías"
	line "atrapar a un"

	para "#mon legendario"
	line "de todos modos."
	done

BurnedTowerRival_LossText:
	text "…¡Já!"

	para "Por esto odio"
	line "luchar contra"
	cont "debiluchos."

	para "Es solo una"
	line "pérdida de"
	cont "tiempo."
	done

BurnedTowerRival_AfterText2:
	text "¡Já!"

	para "¿Qué haces cayendo"
	line "en un agujero?"

	para "¡Vaya genio estás"
	line "hecho!"

	para "¡Te lo mereces!"
	done

BurnedTower1FEusineIntroText:
	text "Eusine: Me llamo"
	line "Eusine."

	para "Sigo el rastro de"
	line "un #mon llamado"
	cont "Suicune."

	para "¿Y tú eres…?"

	para "¿<PLAYER>? ¡Un"
	line "placer!"

	para "Oí rumores de que"
	line "Suicune está en"

	para "esta Torre"
	line "Quemada, así que"
	cont "vine a mirar."

	para "Pero, ¿dónde"
	line "podría estar"
	cont "exactamente?"
	done

BurnedTower1FEusineText:
	text "Eusine: Oí que"
	line "Suicune está en"

	para "esta Torre"
	line "Quemada, así que"
	cont "vine a mirar."

	para "Pero, ¿dónde"
	line "podría estar"
	cont "exactamente?"
	done

BurnedTower1FMortyText:
	text "Morty: El Líder de"
	line "Gimnasio de"
	cont "Ecruteak debe"

	para "estudiar a los que"
	line "dicen ser los"

	para "#mon"
	line "legendarios"
	cont "--Suicune, Entei"
	cont "y Raikou."

	para "Eusine está aquí,"
	line "así que decidí"

	para "investigar la"
	line "Torre con él."
	done

HexManiacTamaraSeenText:
	text "Aquí hay un poder"
	line "extraño…"
	done

HexManiacTamaraBeatenText:
	text "He perdido…"
	done

FirebreatherNedSeenText:
	text "Mi alma está en"
	line "llamas. ¡Te"

	para "mostraré cómo de"
	line "fuerte arden!"
	done

FirebreatherNedBeatenText:
	text "Aún no es"
	line "suficiente…"
	done

FirebreatherDickBeforeText:
	text "¡Oye, entreno aquí"
	line "en secreto!"

	para "¡No me des"
	line "bochorno mirando!"
	done

FirebreatherDickBeatenText:
	text "Me quemé hasta"
	line "quedar en"
	cont "cenizas blancas…"
	done

FirebreatherDickAfterText:
	text "Estaba tan"
	line "concentrado en mi"

	para "entrenamiento que"
	line "caí por este"
	cont "agujero."
	done
