TeamRocketBaseB3F_MapScriptHeader:
	def_scene_scripts
	scene_script TeamRocketBaseB3FLanceGetsPasswordScene, SCENE_TEAMROCKETBASEB3F_LANCE_GETS_PASSWORD
	scene_const SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	scene_const SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	scene_const SCENE_TEAMROCKETBASEB3F_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, TeamRocketBaseB3FCheckGiovanniDoor

	def_warp_events
	warp_event  3,  2, TEAM_ROCKET_BASE_B2F, 2
	warp_event 27,  2, TEAM_ROCKET_BASE_B2F, 3
	warp_event  3,  6, TEAM_ROCKET_BASE_B2F, 4
	warp_event 27, 14, TEAM_ROCKET_BASE_B2F, 5

	def_coord_events
	coord_event 10,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossLeft
	coord_event 11,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossRight
	coord_event  8, 10, SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER, RocketBaseRival

	def_bg_events
	bg_event 10,  9, BGEVENT_IFNOTSET, BossDoor
	bg_event 11,  9, BGEVENT_IFNOTSET, BossDoor
	bg_event 10,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event 11,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event 12,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event 13,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  4, 13, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  5, 13, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  6, 13, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  7, 13, BGEVENT_JUMPSTD, teamrocketoath

	def_object_events
	object_event 25, 14, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LanceGetPasswordScript, EVENT_TEAM_ROCKET_BASE_B3F_LANCE_PASSWORDS
	object_event  8,  3, SPRITE_PETREL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B3F_PETREL
	object_event  7,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MURKROW, -1, PAL_MON_BLUE, OBJECTTYPE_SCRIPT, NO_FORM, RocketBaseMurkrow, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  5, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_TEAM_ROCKET_BASE
	object_event 21,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 0, SlowpokeTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  5, 14, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, RaticateTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 23, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerRocketScientistRoss, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 11, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRocketScientistMitch, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 24, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TeamRocketBaseB3FRocketText, EVENT_TEAM_ROCKET_BASE_POPULATION
	itemball_event  1, 12, PROTEIN, 1, EVENT_TEAM_ROCKET_BASE_B3F_PROTEIN
	itemball_event  3, 12, X_SP_DEF, 1, EVENT_TEAM_ROCKET_BASE_B3F_X_SP_DEF
	itemball_event 28,  9, FULL_HEAL, 1, EVENT_TEAM_ROCKET_BASE_B3F_FULL_HEAL
	itemball_event 17,  2, ICE_HEAL, 1, EVENT_TEAM_ROCKET_BASE_B3F_ICE_HEAL
	itemball_event 14, 10, ULTRA_BALL, 1, EVENT_TEAM_ROCKET_BASE_B3F_ULTRA_BALL

	object_const_def
	const TEAMROCKETBASEB3F_LANCE
	const TEAMROCKETBASEB3F_PETREL
	const TEAMROCKETBASEB3F_MURKROW
	const TEAMROCKETBASEB3F_RIVAL

TeamRocketBaseB3FLanceGetsPasswordScene:
	sdefer LanceGetPasswordScript
	end

TeamRocketBaseB3FCheckGiovanniDoor:
	checkevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	iftruefwd .OpenSesame
	endcallback

.OpenSesame:
	changeblock 10, 8, $0d
	endcallback

LanceGetPasswordScript:
	turnobject PLAYER, LEFT
	pause 5
	turnobject TEAMROCKETBASEB3F_MURKROW, RIGHT
	pause 20
	applyonemovement TEAMROCKETBASEB3F_LANCE, step_right
	showtext LanceGetPasswordText
	applymovement TEAMROCKETBASEB3F_LANCE, RocketBaseLanceLeavesMovement
	disappear TEAMROCKETBASEB3F_LANCE
	setscene SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	end

RocketBaseRival:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	appear TEAMROCKETBASEB3F_RIVAL
	applymovement TEAMROCKETBASEB3F_RIVAL, RocketBaseRivalEnterMovement
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext RocketBaseRivalText
	playsound SFX_TACKLE
	applymovement PLAYER, RocketBaseRivalShovesPlayerMovement
	applymovement TEAMROCKETBASEB3F_RIVAL, RocketBaseRivalLeaveMovement
	disappear TEAMROCKETBASEB3F_RIVAL
	setscene SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	special RestartMapMusic
	end

RocketBaseBossLeft:
	applymovement PLAYER, RocketBasePlayerApproachesBossLeftMovement
	sjumpfwd RocketBaseBoss

RocketBaseBossRight:
	applymovement PLAYER, RocketBasePlayerApproachesBossRightMovement
RocketBaseBoss:
	pause 30
	showemote EMOTE_SHOCK, TEAMROCKETBASEB3F_PETREL, 15
	special SaveMusic
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject TEAMROCKETBASEB3F_PETREL, DOWN
	showtext ExecutiveM4BeforeText
	applyonemovement TEAMROCKETBASEB3F_PETREL, step_down
	winlosstext ExecutiveM4BeatenText, 0
	setlasttalked TEAMROCKETBASEB3F_PETREL
	loadtrainer PETREL, PETREL2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PETREL_2
	showtext ExecutiveM4AfterText
	applymovement TEAMROCKETBASEB3F_PETREL, RocketBaseBossHitsTableMovement
	playsound SFX_TACKLE
	applymovement TEAMROCKETBASEB3F_PETREL, RocketBaseBossLeavesMovement
	disappear TEAMROCKETBASEB3F_PETREL
	setscene SCENE_TEAMROCKETBASEB3F_NOOP
	end

RocketBaseMurkrow:
	showtext RocketBaseMurkrowText
	setevent EVENT_LEARNED_HAIL_GIOVANNI
	end

SlowpokeTailGrunt:
	trainer GRUNTF, 5, EVENT_BEAT_ROCKET_GRUNTF_5, GruntF5SeenText, GruntF5BeatenText, 0, GruntF5Script

GruntF5Script:
	endifjustbattled
	showtext GruntF5AfterBattleText
	setevent EVENT_LEARNED_SLOWPOKETAIL
	end

RaticateTailGrunt:
	trainer GRUNTM, 28, EVENT_BEAT_ROCKET_GRUNTM_28, GruntM28SeenText, GruntM28BeatenText, 0, GruntM28Script

GruntM28Script:
	endifjustbattled
	showtext GruntM28AfterBattleText
	setevent EVENT_LEARNED_RATICATE_TAIL
	end

GenericTrainerRocketScientistRoss:
	generictrainer ROCKET_SCIENTIST, ROSS, EVENT_BEAT_ROCKET_SCIENTIST_ROSS, RocketScientistRossSeenText, RocketScientistRossBeatenText

	text "Una señal de radio"
	line "que enloquece a"
	cont "los #mon…"

	para "Mi experimento es"
	line "un éxito total."

	para "Mi ascenso está"
	line "asegurado. Esta"

	para "derrota no"
	line "significa nada en"
	cont "absoluto."
	done

GenericTrainerRocketScientistMitch:
	generictrainer ROCKET_SCIENTIST, MITCH, EVENT_BEAT_ROCKET_SCIENTIST_MITCH, RocketScientistMitchSeenText, RocketScientistMitchBeatenText

	text "Si aumentamos la"
	line "potencia de"
	cont "nuestra señal de"

	para "radio para emitir"
	line "a nivel"
	cont "nacional…"

	para "¡Solo pensarlo me"
	line "emociona!"
	done

BossDoor:
	dw EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	opentext
	checkevent EVENT_LEARNED_SLOWPOKETAIL
	iffalsefwd .NeedsPassword
	checkevent EVENT_LEARNED_RATICATE_TAIL
	iffalsefwd .NeedsPassword
	sjumpfwd .OpenSesame

.NeedsPassword:
	jumpthisopenedtext

	text "La puerta está"
	line "cerrada…"

	para "Necesita dos"
	line "contraseñas para"
	cont "abrirse."
	done

.OpenSesame:
	writetext TeamRocketBaseB3FLockedDoorOpenSesameText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 10, 8, $0d
	refreshmap
	closetext
	setevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	waitsfx
	end

RocketBaseLanceLeavesMovement:
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

RocketBasePlayerApproachesBossLeftMovement:
	step_up
	step_up
	step_up
	step_left
	step_left
	turn_head_up
	step_end

RocketBasePlayerApproachesBossRightMovement:
	step_up
	step_up
	step_left
	step_up
	step_left
	step_left
	turn_head_up
	step_end

RocketBaseBossHitsTableMovement:
	run_step_right
	run_step_right
	step_end

RocketBaseBossLeavesMovement:
	fix_facing
	fast_jump_step_left
	remove_fixed_facing
	step_sleep_8
	step_sleep_8
	slow_step_right
	run_step_down
	run_step_down
	run_step_down
	run_step_right
	run_step_down
	run_step_down
	run_step_down
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_left
	run_step_left
	step_end

RocketBaseRivalEnterMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_end

RocketBaseRivalLeaveMovement:
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

RocketBaseRivalShovesPlayerMovement:
	fix_facing
	run_step_right
	remove_fixed_facing
	step_end

LanceGetPasswordText:
	text "Lance: Hacen"
	line "falta dos"
	cont "contraseñas para"

	para "entrar en los"
	line "aposentos del"
	cont "jefe."

	para "Esas contraseñas"
	line "solo las conocen"
	cont "unos pocos del"
	cont "Team Rocket."

	para "Ese del Team"
	line "Rocket de ahí me"
	cont "lo dijo muy"
	cont "amablemente."

	para "<PLAYER>, vamos a"
	line "por las"
	cont "contraseñas."
	done

TeamRocketBaseB3FRocketText:
	text "Urrggh… El tipo"
	line "de la capa es"
	cont "increíblemente"
	cont "duro…"
	done

RocketBaseRivalText:
	text "…"

	para "¿No te dije que"
	line "iba a destruir al"
	cont "Team Rocket?"

	para "…Dime, ¿quién era"
	line "el tipo de la capa"

	para "que usaba"
	line "#mon dragón?"

	para "Mis #mon no"
	line "tuvieron ninguna"
	cont "oportunidad."

	para "No me importa"
	line "haber perdido."
	cont "Puedo vencerlo"

	para "consiguiendo"
	line "#mon más"
	cont "fuertes."

	para "Es lo que dijo lo"
	line "que me molesta…"

	para "Me dijo que no"
	line "quiero ni confío"

	para "en mis #mon lo"
	line "suficiente."

	para "Me da rabia haber"
	line "perdido contra un"
	cont "blando como él."

	para "…¡Já! ¡No tengo"
	line "tiempo para gente"
	cont "como tú!"
	done

ExecutiveM4BeforeText:
	text "¿Qué? ¿Quién"
	line "eres? Este es el"

	para "despacho de"
	line "nuestro líder,"
	cont "Giovanni."

	para "Desde que"
	line "disolvió el Team"

	para "Rocket hace tres"
	line "años, ha estado"
	cont "entrenando."

	para "Pero estamos"
	line "seguros de que"

	para "volverá algún día"
	line "a tomar el mando"
	cont "otra vez."

	para "Por eso estamos"
	line "de guardia."

	para "¡No dejaré que"
	line "nadie moleste este"
	cont "lugar!"
	done

ExecutiveM4BeatenText:
	text "Yo… No pude hacer"
	line "nada…"

	para "Giovanni, por"
	line "favor,"
	cont "perdóname…"
	done

ExecutiveM4AfterText:
	text "No, no puedo dejar"
	line "que esto me"
	cont "afecte."

	para "Debo avisar a los"
	line "demás…"
	done

RocketBaseMurkrowText:
	text "Murkrow: La"
	line "contraseña es…"

	para "Viva Giovanni."
	done

GruntF5SeenText:
	text "¿Que si sé la"
	line "contraseña?"

	para "Puede."

	para "¡Pero ningún"
	line "debilucho la va a"
	cont "conseguir!"
	done

GruntF5BeatenText:
	text "Vale. Para."
	line "Te lo diré."
	done

GruntF5AfterBattleText:
	text "La contraseña"
	line "para la sala del"
	cont "jefe es"

	para "ColaSlowpoke."

	para "Pero es inútil a"
	line "menos que tengas"
	cont "las dos"
	cont "contraseñas."
	done

GruntM28SeenText:
	text "¡Jiji-jiji-jiji!"

	para "¿Me estás retando"
	line "a un combate?"

	para "¡Já! Estás loco,"
	line "¡pero tienes"
	cont "agallas!"

	para "¡Eso me gusta!"

	para "Si puedes"
	line "vencerme, ¡te diré"

	para "una contraseña de"
	line "la sala del jefe!"
	done

GruntM28BeatenText:
	text "¡Jiji-jiji-jiji!"
	line "¡Eres bueno!"
	done

GruntM28AfterBattleText:
	text "¡Jiji-jiji-jiji!"

	para "La contraseña"
	line "para la sala del"
	cont "jefe…"

	para "Eh…, creo que es"
	line "ColaRaticate."
	done

RocketScientistRossSeenText:
	text "Antes trabajaba"
	line "para Silph, pero"

	para "ahora dirijo la"
	line "investigación del"
	cont "Team Rocket."

	para "Un niño"
	line "entrometido como"
	cont "tú debe ser"
	cont "castigado."
	done

RocketScientistRossBeatenText:
	text "Un simple error"
	line "táctico me costó"
	cont "caro…"
	done

RocketScientistMitchSeenText:
	text "No me importa que"
	line "los #mon salgan"
	cont "heridos por"
	cont "nuestro"
	cont "experimento."
	done

RocketScientistMitchBeatenText:
	text "Pensar es mi"
	line "fuerte, no"
	cont "combatir."
	done


TeamRocketBaseB3FLockedDoorOpenSesameText:
	text "La puerta está"
	line "cerrada…"

	para "<PLAYER> introdujo"
	line "las dos"
	cont "contraseñas."

	para "¡La puerta se"
	line "abrió!"
	done
