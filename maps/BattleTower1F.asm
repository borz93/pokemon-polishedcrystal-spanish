BattleTower1F_MapScriptHeader:
	def_scene_scripts
	scene_script BattleTower1FContinueChallenge, SCENE_BATTLETOWER1F_CHECKSTATE
	scene_const SCENE_BATTLETOWER1F_NOOP

	def_callbacks

	def_warp_events
	warp_event 10, 15, BATTLE_TOWER_OUTSIDE, 3
	warp_event 11, 15, BATTLE_TOWER_OUTSIDE, 4
	warp_event 10,  0, BATTLE_TOWER_ELEVATOR, 1
	warp_event  0,  7, BATTLE_TOWER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, BattleTower1FRulesScript
	bg_event  9,  7, BGEVENT_JUMPTEXT, BattleTower1FStreakText
	bg_event 21,  8, BGEVENT_READ, PokemonJournalPalmerScript

	def_object_events
	object_event 10,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleTower1FReceptionistScript, -1
	pc_nurse_event  6,  8
	object_event 14,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_BP, MART_BATTLETOWER_1, -1
	object_event 16,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_BP, MART_BATTLETOWER_2, -1
	object_event 18,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_BP, MART_BATTLETOWER_3, -1
	object_event  6, 14, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerPharmacistScript, -1
	object_event 16, 13, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_BattleTowerCooltrainerF, -1
	object_event  2, 12, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_BattleTowerBugCatcher, -1
	object_event 20, 11, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_BattleTowerGranny, -1

	object_const_def
	const BATTLETOWER1F_RECEPTIONIST

BattleTower1FContinueChallenge:
; Triggers (usefully) if we're in an ongoing Battle Tower run.
	; Only trigger this once.
	setscene SCENE_BATTLETOWER1F_NOOP

	; Check current battle status to see if we need to resume or reset winstreak
	special Special_BattleTower_GetChallengeState
	ifequalfwd BATTLETOWER_CHALLENGE_IN_PROGRESS, .LeftWithoutSaving
	ifequalfwd BATTLETOWER_SAVED_AND_LEFT, .ResumeChallenge
	ifequalfwd BATTLETOWER_LOST_CHALLENGE, .LostChallenge
	ifequalfwd BATTLETOWER_WON_CHALLENGE, .WonChallenge
	end

.ResumeChallenge:
	; We saved in-between rounds. Resume Battle Tower challenge.
	opentext
	writethistext
		text "Te hemos estado"
		line "esperando."
		prompt

	sdefer Script_ReturnToBattleTowerChallenge
	end

.LeftWithoutSaving:
	; The player reset the game in the middle of a battle.
	; This counts as a battle loss, and will reset the winstreak.
	sdefer .LeftWithoutSaving2
	end

.LeftWithoutSaving2:
	opentext
	writethistext
		text "¡Disculpa!"
		line "No guardaste"

		para "antes de salir"
		line "de la Sala de"
		cont "Combate."

		para "Lo siento mucho,"
		line "pero tu desafío"

		para "será declarado"
		line "no válido."
		done
	waitbutton
	sjumpfwd Script_CommitBattleTowerResult

.LostChallenge:
	opentext
	sdefer Script_CommitBattleTowerResult
	end

.WonChallenge:
	sdefer .WonChallenge2
	end

.WonChallenge2:
	opentext
	writethistext
		text "¡Felicidades!"

		para "¡Has vencido a"
		line "todos los"
		cont "entrenadores!"

		para "Por eso, toma"
		line "este gran premio!"
		prompt
	verbosegiveitem ABILITYPATCH
	; fallthrough
Script_CommitBattleTowerResult:
	special Special_BattleTower_CommitChallengeResult
	iffalsefwd .WeHopeToServeYouAgain
	setevent EVENT_BEAT_PALMER
.WeHopeToServeYouAgain:
	writethistext
		text "Esperamos verte"
		line "de nuevo."
		done
	waitbutton
	endtext

BattleTower1FRulesScript:
	opentext
	writethistext
		text "Aquí se escriben"
		line "las reglas de la"
		cont "Torre Batalla"

		para "¿Leerlas?"
		done
	yesorno
	iffalse_endtext
	jumpthisopenedtext
		text "Tres #mon"
		line "pueden entrar"
		cont "en combate."

		para "Los tres deben ser"
		line "diferentes."

		para "Los objetos que"
		line "llevan también"
		cont "deben ser"
		cont "diferentes."

		para "Los Huevos o"
		line "ciertos #mon"
		cont "Legendarios no"
		cont "son aptos para"
		cont "combatir."
		done

BattleTower1FStreakText:
	text "Racha: "
	text_decimal wBattleTowerCurStreak, 2, 5
	text " vic."
	line "Récord: "
	text_decimal wBattleTowerTopStreak, 2, 5
	text " vic."
	done

BattleTower1FReceptionistScript:
	opentext
	writethistext
		text "¡Bienvenido a la"
		line "Torre Batalla!"

		para "Puedo llevarte a"
		line "una Sala de"
		cont "Combate."
		done
	promptbutton
	checkevent EVENT_BATTLE_TOWER_INTRO
	iftruefwd .BattleTowerMenu

	; only ask once, so set the flag regardless
	setevent EVENT_BATTLE_TOWER_INTRO
	writethistext
		text "¿Quieres saber"
		line "más sobre la"
		cont "Torre Batalla?"
		done
	yesorno
	iffalsefwd .BattleTowerMenu

.Explanation:
	writethistext
		text "La Torre Batalla"
		line "es un lugar donde"
		cont "combates con"
		cont "tus #mon."

		para "Incontables"
		line "entrenadores"
		cont "#mon se reúnen"

		para "de todas partes"
		line "para combatir en"
		cont "Salas de Combate"
		cont "especiales."

		para "Hay muchas Salas"
		line "de Combate en la"
		cont "Torre Batalla."

		para "Cada Sala tiene"
		line "siete rivales."

		para "Vence a todos y"
		line "gana PB."

		para "Para interrumpir"
		line "una sesión, debes"

		para "guardar. Si no,"
		line "no podrás"

		para "retomar tu"
		line "desafío de Sala."
		prompt
	; fallthrough
.BattleTowerMenu:
	; Setscene here in case the player aborted a quicksave prompted by challenge
	setscene SCENE_BATTLETOWER1F_NOOP
	writethistext
		text "¿Quieres ir a una"
		line "Sala de Combate?"
		done
	loadmenu MenuDataHeader_BattleInfoCancel
	verticalmenu
	closewindow
	ifequalfwd $1, .Challenge
	ifequal $2, .Explanation
	writethistext
		text "Esperamos verte"
		line "de nuevo."
		prompt
	endtext

.Challenge:
	writethistext
		text "Elige los #mon"
		line "que entrarán."
		prompt
	special Special_BattleTower_SelectParticipants
	iffalse .BattleTowerMenu
	writethistext
		text "Antes de entrar"
		line "en la Sala de"
		cont "Combate,"

		para "se guardará tu"
		line "progreso."
		done
	yesorno
	iffalse .BattleTowerMenu
	; Done here to ensure it's saved in case the player resets later.
	; The scene script running after the player saves but before the
	; challenge starts is harmless since there's no challenge prepared.
	setscene SCENE_BATTLETOWER1F_CHECKSTATE
	special Special_TryQuickSave
	iffalse .BattleTowerMenu

	; Initializes opponent trainers and stores player mon choices in SRAM
	special Special_BattleTower_BeginChallenge
	; fallthrough
Script_ReturnToBattleTowerChallenge:
	; From this point onwards, resetting the game should count as a streak loss
	setscene SCENE_BATTLETOWER1F_CHECKSTATE
	setval BATTLETOWER_CHALLENGE_IN_PROGRESS
	special Special_BattleTower_SetChallengeState

	; Everything ready to go for challenge start
	writethistext
		text "Por aquí, hacia"
		line "tu Sala de"
		cont "Combate."
		done
	waitbutton
	closetext

	musicfadeout MUSIC_NONE, 8
	follow BATTLETOWER1F_RECEPTIONIST, PLAYER
	applymovement BATTLETOWER1F_RECEPTIONIST, .WalkToElevator
	stopfollow
	special Special_BattleTower_MaxVolume
	warpsound
	disappear BATTLETOWER1F_RECEPTIONIST
	applyonemovement PLAYER, step_up
	warpcheck
	end

.WalkToElevator:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

MenuDataHeader_BattleInfoCancel:
	db MENU_BACKUP_TILES
	menu_coords 11, 4, 19, 11
	dw MenuData2_BattleInfoCancel
	db 1 ; default option

MenuData2_BattleInfoCancel:
	db $a0 ; flags
	db 3
	db "Luchar@"
	db "Info@"
	db "Salir@"

BattleTowerPharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_TRICK_INTRO
	iftruefwd BattleTowerTutorTrickScript
	writethistext
		text "Los entrenadores"
		line "de aquí usan"
		cont "objetos con"
		cont "estrategia."

		para "Pero tengo un"
		line "truco bajo la"
		cont "manga: ¡Cambiaré"
		cont "sus objetos"

		para "por los míos con"
		line "Truco!"
		done
	waitbutton
	setevent EVENT_LISTENED_TO_TRICK_INTRO
BattleTowerTutorTrickScript:
	writethistext
		text "Le enseñaré a tu"
		line "#mon a usar"

		para "Truco… por una"
		line "Hoja Plata."
		done
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writethistext
		text "¿Le enseño Truco"
		line "a tu #mon?"
		done
	yesorno
	iffalsefwd .TutorRefused
	setval TRICK
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext
		text "Habla conmigo si"
		line "cambias de idea."
		done

.NoSilverLeaf
	jumpthisopenedtext
		text "Tch. No tienes"
		line "una Hoja Plata…"
		done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext
		text "Ahora tu #mon"
		line "también sabe"
		cont "Truco!"
		cont "¿A que es"
		cont "astuto?"
		done

Text_BattleTowerCooltrainerF:
	text "Hay muchas Salas"
	line "de Combate, ¡pero"

	para "voy a ganarlas"
	line "todas!"
	done

Text_BattleTowerGranny:
	text "Es agotador no"
	line "poder usar"

	para "objetos en"
	line "combate."

	para "Hacer que tus"
	line "#mon lleven"
	cont "objetos"

	para "es la clave para"
	line "ganar combates."
	done

Text_BattleTowerBugCatcher:
	text "Intento ver hasta"
	line "dónde puedo"
	cont "llegar"

	para "usando solo"
	line "#mon bicho."

	para "Que no haya"
	line "#mon de fuego…"
	done

PokemonJournalPalmerScript:
	setflag ENGINE_READ_PALMER_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje"
	line "especial: ¡el"
	cont "Magnate de la"
	cont "Torre, Palmer!"

	para "Dicen que Palmer"
	line "tiene un hijo en"

	para "la región de"
	line "Sinnoh que quiere"
	cont "ser entrenador"
	cont "como él."
	done
