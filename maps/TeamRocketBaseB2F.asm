TeamRocketBaseB2F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_TEAMROCKETBASEB2F_LANCE_HEALS
	scene_const SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	scene_const SCENE_TEAMROCKETBASEB2F_ELECTRODES
	scene_const SCENE_TEAMROCKETBASEB2F_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, TransmitterDoorCallback

	def_warp_events
	warp_event  3, 14, TEAM_ROCKET_BASE_B1F, 2
	warp_event  3,  2, TEAM_ROCKET_BASE_B3F, 1
	warp_event 27,  2, TEAM_ROCKET_BASE_B3F, 2
	warp_event  3,  6, TEAM_ROCKET_BASE_B3F, 3
	warp_event 27, 14, TEAM_ROCKET_BASE_B3F, 4

	def_coord_events
	coord_event  5, 14, SCENE_TEAMROCKETBASEB2F_LANCE_HEALS, LanceHealsScript
	coord_event  4, 13, SCENE_TEAMROCKETBASEB2F_LANCE_HEALS, LanceHealsScript
	coord_event 14, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFLeft
	coord_event 15, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFRight
	coord_event 14, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 15, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 12,  3, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 10, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 11, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript

	def_bg_events
	bg_event 14, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 15, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 16,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 16,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 26,  7, BGEVENT_ITEM + FULL_HEAL, EVENT_TEAM_ROCKET_BASE_B2F_HIDDEN_FULL_HEAL

	def_object_events
	object_event 20, 16, SPRITE_PETREL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_PETREL
	object_event 20, 16, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ARIANA
	object_event  5, 13, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	object_event  9, 13, SPRITE_DRAGONITE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_DRAGONITE
	object_event  7,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, ELECTRODE, -1, PAL_MON_RED, OBJECTTYPE_SCRIPT, NO_FORM, RocketElectrode1, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event  7,  7, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, ELECTRODE, -1, PAL_MON_RED, OBJECTTYPE_SCRIPT, NO_FORM, RocketElectrode2, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	object_event  7,  9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, ELECTRODE, -1, PAL_MON_RED, OBJECTTYPE_SCRIPT, NO_FORM, RocketElectrode3, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	pokemon_event 22,  5, ELECTRODE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_RED, ClearText, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	pokemon_event 22,  7, ELECTRODE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_RED, ClearText, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	pokemon_event 22,  9, ELECTRODE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_RED, ClearText, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	object_event 25, 13, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM17, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerGruntM18, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 21, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGruntM19, EVENT_TEAM_ROCKET_BASE_POPULATION
	itemball_event  3, 10, HYPER_POTION, 1, EVENT_TEAM_ROCKET_BASE_B2F_HYPER_POTION

	object_const_def
	const TEAMROCKETBASEB2F_PETREL
	const TEAMROCKETBASEB2F_ARIANA
	const TEAMROCKETBASEB2F_LANCE
	const TEAMROCKETBASEB2F_DRAGONITE
	const TEAMROCKETBASEB2F_ELECTRODE1
	const TEAMROCKETBASEB2F_ELECTRODE2
	const TEAMROCKETBASEB2F_ELECTRODE3
	const TEAMROCKETBASEB2F_ELECTRODE4
	const TEAMROCKETBASEB2F_ELECTRODE5
	const TEAMROCKETBASEB2F_ELECTRODE6
	const TEAMROCKETBASEB2F_ROCKET1
	const TEAMROCKETBASEB2F_ROCKET2
	const TEAMROCKETBASEB2F_ROCKET3

TransmitterDoorCallback:
	checkevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	iftruefwd .Change
	endcallback

.Change:
	changeblock 14, 12, $0d
	endcallback

RocketBaseBossFLeft:
	moveobject TEAMROCKETBASEB2F_LANCE, 9, 13
	sjumpfwd RocketBaseBossFScript

RocketBaseBossFRight:
	moveobject TEAMROCKETBASEB2F_ARIANA, 21, 16
	moveobject TEAMROCKETBASEB2F_PETREL, 21, 16
	moveobject TEAMROCKETBASEB2F_DRAGONITE, 10, 13
	moveobject TEAMROCKETBASEB2F_LANCE, 10, 13
RocketBaseBossFScript:
	appear TEAMROCKETBASEB2F_ARIANA
	appear TEAMROCKETBASEB2F_PETREL
	showtext RocketBaseExecutiveFHoldItText
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, RocketBasePlayerApproachesBossFMovement
	special SaveMusic
	playmusic MUSIC_ROCKET_ENCOUNTER
	applymovement TEAMROCKETBASEB2F_ARIANA, RocketBaseBossFApproachesPlayerMovement
	turnobject PLAYER, UP
	applymovement TEAMROCKETBASEB2F_PETREL, RocketBaseGruntApproachesPlayerMovement
	showtext RocketBaseBossFThrashText
	cry DRAGONITE
	turnobject TEAMROCKETBASEB2F_ARIANA, LEFT
	turnobject PLAYER, LEFT
	appear TEAMROCKETBASEB2F_DRAGONITE
	applymovement TEAMROCKETBASEB2F_DRAGONITE, RocketBaseDragoniteAttacksMovement
	applymovement TEAMROCKETBASEB2F_ARIANA, RocketBaseBossFHitMovement
	applymovement TEAMROCKETBASEB2F_PETREL, RocketBaseGruntProtectsBossFMovement
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceApproachesBossFMovement
	showtext RocketBaseLanceShareFunText
	turnobject PLAYER, RIGHT
	applymovement TEAMROCKETBASEB2F_ARIANA, RocketBaseBossFFacesPlayerMovement
	showtext RocketBaseBossDontMeddleText
	applyonemovement TEAMROCKETBASEB2F_PETREL, big_step_left
	applyonemovement TEAMROCKETBASEB2F_ARIANA, big_step_left
	winlosstext RocketBaseBossWinText, 0
	setlasttalked TEAMROCKETBASEB2F_ARIANA
	loadtrainer ARIANA, ARIANA2
	startbattle
	disappear TEAMROCKETBASEB2F_DRAGONITE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_ARIANA
	setevent EVENT_TEAM_ROCKET_BASE_B2F_PETREL
	setevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	reloadmapafterbattle
	setevent EVENT_BEAT_ARIANA_2
	showtext RocketBaseBossRetreatText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB2F_PETREL
	disappear TEAMROCKETBASEB2F_ARIANA
	disappear TEAMROCKETBASEB2F_ROCKET1
	disappear TEAMROCKETBASEB2F_ROCKET2
	disappear TEAMROCKETBASEB2F_ROCKET3
	pause 15
	special Special_FadeInQuickly
	setscene SCENE_TEAMROCKETBASEB2F_ELECTRODES
	clearevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	showtext RocketBaseLancePostBattleText
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceChecksPlayerMovement
	turnobject PLAYER, UP
	showtext RocketBaseLancePowerOffText
	follow TEAMROCKETBASEB2F_LANCE, PLAYER
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceApproachesMachineMovement
	stopfollow
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLancePacesMovement
	showtext RockerBaseLanceElectrodeFaintText
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceApproachesElectrodesMovement
	disappear TEAMROCKETBASEB2F_LANCE

RocketBaseCantLeaveScript:
	applymovement PLAYER, RocketBasePlayerCantLeaveElectrodesMovement
	end

RocketBaseLancesSideScript:
	showtext RocketBaseLancesSideText
	applyonemovement PLAYER, step_left
	end

LanceHealsScript:
	faceobject PLAYER, TEAMROCKETBASEB2F_LANCE
	faceobject TEAMROCKETBASEB2F_LANCE, PLAYER
	showtext LanceHealsText1
	special FadeOutPalettes
	special LoadMapPalettes
	playsound SFX_FULL_HEAL
	special HealParty
	special FadeInPalettes_EnableDynNoApply
	showtext LanceHealsText2
	setscene SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	setevent EVENT_LANCE_HEALED_YOU_IN_TEAM_ROCKET_BASE
	readvar VAR_FACING
	ifequalfwd RIGHT, .FacingRight
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesAfterHealMovement
	disappear TEAMROCKETBASEB2F_LANCE
	end

.FacingRight:
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesAfterHealRightMovement
	disappear TEAMROCKETBASEB2F_LANCE
	end

GenericTrainerGruntM17:
	generictrainer GRUNTM, 17, EVENT_BEAT_ROCKET_GRUNTM_17, GruntM17SeenText, GruntM17BeatenText

	text "Je, solo soy un"
	line "Recluta."

	para "No sé la"
	line "contraseña. Mala"
	cont "suerte para ti."
	done

GenericTrainerGruntM18:
	generictrainer GRUNTM, 18, EVENT_BEAT_ROCKET_GRUNTM_18, GruntM18SeenText, GruntM18BeatenText

	text "En la última"
	line "misión también me"
	cont "aplastó un niño."

	para "Cuando"
	line "secuestrábamos"
	cont "#mon,"

	para "este niño de"
	line "pelo rojo largo y"

	para "mirada malvada me"
	line "destrozó…"
	done

GenericTrainerGruntM19:
	generictrainer GRUNTM, 19, EVENT_BEAT_ROCKET_GRUNTM_19, GruntM19SeenText, GruntM19BeatenText

	text "Je, solo el jefe"
	line "sabe la"
	cont "contraseña de esa"
	cont "puerta."

	para "¿Dónde está el"
	line "jefe? Quién sabe."
	cont "Búscalo tú mismo."
	done

RocketElectrode1:
	cry ELECTRODE
	loadwildmon ELECTRODE, 33
	startbattle
	iftruefwd TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE1
	disappear TEAMROCKETBASEB2F_ELECTRODE4
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalsefwd TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalsefwd TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalsefwd TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, RocketBasePlayerLeavesElectrodesMovement1
	sjumpfwd RocketBaseElectrodeScript

RocketElectrode2:
	cry ELECTRODE
	loadwildmon ELECTRODE, 33
	startbattle
	iftruefwd TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE2
	disappear TEAMROCKETBASEB2F_ELECTRODE5
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalsefwd TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalsefwd TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalsefwd TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, RocketBasePlayerLeavesElectrodesMovement2
	sjumpfwd RocketBaseElectrodeScript

RocketElectrode3:
	cry ELECTRODE
	loadwildmon ELECTRODE, 33
	startbattle
	iftruefwd TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE3
	disappear TEAMROCKETBASEB2F_ELECTRODE6
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalsefwd TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalsefwd TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalsefwd TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, RocketBasePlayerLeavesElectrodesMovement3
	sjumpfwd RocketBaseElectrodeScript

TeamRocketBaseB2FReloadMap:
	reloadmapafterbattle
	end

RocketBaseElectrodeScript:
	moveobject TEAMROCKETBASEB2F_LANCE, 18, 6
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesElectrodesMovement
	turnobject PLAYER, RIGHT
	opentext
	writetext RocketBaseLanceElectrodeDoneText
	promptbutton
	verbosegivetmhm TM_THIEF
	setevent EVENT_GOT_TM46_THIEF_FROM_LANCE
	writetext RocketBaseLanceWhirlpoolText
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	showtext RocketBaseLanceMonMasterText
	turnobject PLAYER, DOWN
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesBaseMovement
	disappear TEAMROCKETBASEB2F_LANCE
	setevent EVENT_CLEARED_ROCKET_HIDEOUT
	clearflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setevent EVENT_ROUTE_43_GATE_ROCKETS
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	setscene SCENE_TEAMROCKETBASEB2F_NOOP
	clearevent EVENT_LAKE_OF_RAGE_CIVILIANS
	setevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	setevent EVENT_SECURITY_CAMERA_1
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_SECURITY_CAMERA_3
	setevent EVENT_SECURITY_CAMERA_4
	setevent EVENT_SECURITY_CAMERA_5
	end

TeamRocketBaseB2FLockedDoor:
	dw EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	opentext
	checkevent EVENT_LEARNED_HAIL_GIOVANNI
	iffalse_jumpopenedtext RocketBaseDoorNoPasswordText
	writetext RocketBaseDoorKnowPasswordText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 14, 12, $0d
	refreshmap
	closetext
	setevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	waitsfx
	end

TeamRocketBaseB2FTransmitterScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue_jumptext .DeactivateTransmitterText
	jumpthistext

	text "Es el transmisor"
	line "de radio que"
	cont "envía la señal"
	cont "siniestra."

	para "Funciona a plena"
	line "capacidad."
	done

.DeactivateTransmitterText:
	text "El transmisor de"
	line "radio por fin"

	para "detuvo su"
	line "transmisión"
	cont "maligna."
	done

RocketBaseLanceLeavesAfterHealMovement:
	step_right
RocketBaseLanceLeavesAfterHealRightMovement:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

RocketBasePlayerApproachesBossFMovement:
	step_down
	step_down
	step_down
	turn_head_right
	step_end

RocketBaseBossFApproachesPlayerMovement:
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	run_step_up
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	turn_head_down
	step_end

RocketBaseGruntApproachesPlayerMovement:
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	run_step_left
	run_step_left
	step_end

RocketBaseDragoniteAttacksMovement:
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	step_end

RocketBaseBossFHitMovement:
	fix_facing
	set_sliding
	jump_step_right
	remove_sliding
	remove_fixed_facing
	step_end

RocketBaseBossFFacesPlayerMovement:
	slow_step_down
	turn_head_left
	step_end

RocketBaseLanceApproachesBossFMovement:
	step_right
	step_right
	step_right
	step_end

RocketBaseGruntProtectsBossFMovement:
	run_step_left
	run_step_up
	turn_head_left
	step_end

RocketBaseLanceChecksPlayerMovement:
	step_right
	step_right
	turn_head_down
	step_end

RocketBaseLanceApproachesMachineMovement:
	step_up
	step_up
	step_up
	step_end

RocketBaseLancePacesMovement:
	step_sleep_8
	step_left
	step_left
	turn_head_up
	step_sleep_8
	step_right
	step_right
	step_right
	step_right
	turn_head_up
	step_sleep_8
	step_left
	step_left
	turn_head_down
	step_end

RocketBaseLanceApproachesElectrodesMovement:
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

RocketBasePlayerCantLeaveElectrodesMovement:
	step_up
	step_left
	step_left
	step_left
	step_left
	turn_head_up
	step_end

RocketBaseLanceLeavesElectrodesMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_end

RocketBaseLanceLeavesBaseMovement:
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

RocketBasePlayerLeavesElectrodesMovement1:
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end

RocketBasePlayerLeavesElectrodesMovement2:
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end

RocketBasePlayerLeavesElectrodesMovement3:
	step_right
	step_right
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end

RocketBaseExecutiveFHoldItText:
	text "¡Alto ahí!"
	done

RocketBaseBossFThrashText:
	text "No podemos"
	line "permitir que un"
	cont "mocoso como tú"
	cont "ande suelto."

	para "Es perjudicial"
	line "para el orgullo"
	cont "del Team Rocket."

	para "Por muy fuerte"
	line "que seas, no"

	para "puedes con"
	line "nosotros dos a"
	cont "la vez."

	para "Lo siento,"
	line "cielo. Ahora"
	cont "prepárate para"
	cont "recibir una"
	cont "paliza."
	done

RocketBaseLanceShareFunText:
	text "¡Oye! No seas tan"
	line "egoísta. Reparte"
	cont "la diversión."
	done

RocketBaseBossDontMeddleText:
	text "¿Qué? ¿Tenías un"
	line "cómplice?"

	para "¿Dónde está tu"
	line "sentido del"
	cont "honor?"

	para "¡Como jefa"
	line "interina en"
	cont "lugar de"

	para "Giovanni, te"
	line "mostraré lo mal"

	para "que está"
	line "entrometerse con"
	cont "el Team Rocket!"
	done

RocketBaseBossWinText:
	text "Tch, de verdad"
	line "eres fuerte."

	para "Qué lástima."

	para "Si te unieras al"
	line "Team Rocket,"

	para "podrías llegar a"
	line "ser Ejecutiva."
	done

RocketBaseBossRetreatText:
	text "…Este escondite"
	line "está acabado…"

	para "Pero está bien."
	line "El experimento"
	cont "de transmisión"
	cont "fue un éxito"
	cont "total."

	para "No importa lo que"
	line "le pase a este"
	cont "escondite ahora."

	para "Tenemos planes"
	line "mucho más"
	cont "grandes."

	para "Llegarás a"
	line "apreciar el"

	para "verdadero poder"
	line "del Team Rocket"
	cont "muy pronto."

	para "Disfruta mientras"
	line "puedas…"

	para "Fufufufu…"
	done

RocketBaseLancePostBattleText:
	text "Lance: Eso fue"
	line "todo. Derrotamos"

	para "a todos los"
	line "Rockets de aquí."

	para "Pero me preocupa"
	line "el joven con el"

	para "que luché en el"
	line "proceso…"
	done

RocketBaseLancePowerOffText:
	text "Perdón, <PLAYER>."
	line "Vi qué bien lo"

	para "estabas haciendo,"
	line "así que me quedé"
	cont "atrás."

	para "Ahora solo queda"
	line "apagar esa"

	para "extraña señal de"
	line "radio."
	done

RockerBaseLanceElectrodeFaintText:
	text "Es esta máquina"
	line "la que causa"
	cont "todos los"
	cont "problemas."

	para "No veo ningún"
	line "interruptor en"
	cont "ella…"

	para "No tenemos"
	line "opción. Debemos"

	para "hacer que todos"
	line "los Electrode se"
	cont "debiliten."

	para "Eso debería"
	line "detener a esta"

	para "máquina de"
	line "transmitir esa"
	cont "extraña señal."

	para "No es culpa de"
	line "los #mon, así"
	cont "que me siento"
	cont "culpable."

	para "<PLAYER>,"
	line "dividamos el"
	cont "trabajo."
	done

RocketBaseLancesSideText:
	text "Lance: Déjame"
	line "este lado a mí."
	done

RocketBaseLanceElectrodeDoneText:
	text "Lance: Esa"
	line "extraña señal"
	cont "por fin se"
	cont "detuvo."

	para "El lago debería"
	line "volver a la"
	cont "normalidad."

	para "¡Eres el héroe!"
	line "Déjame"
	cont "agradecerte"

	para "en nombre de"
	line "todos los #mon."

	para "Ah, sí. Deberías"
	line "quedarte con"
	cont "esto."

	para "Lo encontré aquí,"
	line "pero no me hace"
	cont "falta."
	done

RocketBaseLanceWhirlpoolText:
	text "Eso es Ladrón."
	line "Confío en que no"

	para "abusarás de él"
	line "como hace el Team"
	cont "Rocket."
	done

RocketBaseLanceMonMasterText:
	text "<PLAYER>…"

	para "El camino para"
	line "ser Maestro"
	cont "#mon es largo y"
	cont "difícil."

	para "Sabiendo eso,"
	line "¿seguirás"
	cont "adelante?"

	para "…"

	para "Ya veo. No,"
	line "tienes razón."

	para "Si fueras a"
	line "rendirte tan"
	cont "fácil,"

	para "nunca habrías"
	line "perseguido ese"

	para "sueño en primer"
	line "lugar."

	para "¡Espero volver a"
	line "verte pronto!"
	done

LanceHealsText1:
	text "Lance: ¿Estás"
	line "bien?"

	para "Tus #mon están"
	line "heridos y"
	cont "cansados."

	para "Toma, dales algo"
	line "de mi medicina."
	done

LanceHealsText2:
	text "Lance: <PLAYER>,"
	line "démoslo todo por"
	cont "los #mon."
	done

GruntM17SeenText:
	text "¿La puerta no"
	line "abre?"

	para "Pues claro."
	line "Necesita una"

	para "contraseña que"
	line "solo el Team"
	cont "Rocket conoce."
	done

GruntM17BeatenText:
	text "¿Qué? ¿Perdí?"
	done

GruntM18SeenText:
	text "¿Oh, un niño? No"
	line "me gusta mucho"
	cont "esto,"

	para "pero debo"
	line "eliminarte."
	done

GruntM18BeatenText:
	text "Sabía que"
	line "perdería…"
	done

GruntM19SeenText:
	text "¡Pequeña peste"
	line "asquerosa!"
	done

GruntM19BeatenText:
	text "Grrrr…"
	done

RocketBaseDoorNoPasswordText:
	text "La puerta está"
	line "cerrada…"

	para "Necesita una"
	line "contraseña para"
	cont "abrir."
	done

RocketBaseDoorKnowPasswordText:
	text "La puerta está"
	line "cerrada…"

	para "<PLAYER> introdujo"
	line "la contraseña."

	para "¡La puerta se"
	line "abrió!"
	done
