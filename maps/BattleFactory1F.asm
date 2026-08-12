BattleFactory1F_MapScriptHeader:
	def_scene_scripts
	scene_script BattleFactory1FContinueChallenge, SCENE_BATTLEFACTORY1F_CHECKSTATE
	scene_const SCENE_BATTLEFACTORY1F_NOOP

	def_callbacks

	def_warp_events
	warp_event 12, 11, VERMILION_CITY, 15
	warp_event 13, 11, VERMILION_CITY, 15
	warp_event 12,  1, BATTLE_FACTORY_HALLWAY, 1

	def_coord_events

	def_bg_events
	bg_event 14,  5, BGEVENT_READ, BattleFactory1FRulesScript
	bg_event 10,  5, BGEVENT_JUMPTEXT, BattleFactory1FStreakText
	bg_event 25,  6, BGEVENT_READ, PokemonJournalThortonScript

	def_object_events
	object_event 12,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleFactory1FReceptionistScript, -1
	pc_nurse_event  6,  6
	object_event 18,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_BP, MART_BATTLEFACTORY_1, -1
	object_event 20,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_BP, MART_BATTLEFACTORY_2, -1
	object_event 22,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_BP, MART_BATTLEFACTORY_3, -1

	object_const_def
	const BATTLEFACTORY1F_RECEPTIONIST

BattleFactory1FContinueChallenge:
; Triggers (usefully) if we're in an ongoing Battle Factory run.
	; Only trigger this once.
	setscene SCENE_BATTLEFACTORY1F_NOOP

	; Check current battle status to see if we need to resume or reset winstreak
	special Special_BattleTower_GetChallengeState
	ifequalfwd BATTLETOWER_CHALLENGE_IN_PROGRESS, .LeftWithoutSaving
	ifequalfwd BATTLETOWER_SAVED_AND_LEFT, .ResumeChallenge
	ifequalfwd BATTLETOWER_LOST_CHALLENGE, .LostChallenge
	ifequalfwd BATTLETOWER_WON_CHALLENGE, .WonChallenge
	end

.ResumeChallenge:
	; We saved in-between rounds. Resume Battle Factory challenge.
	opentext
	writethistext
		text "Te hemos estado"
		line "esperando."
		prompt

	sdefer Script_ReturnToRentalChallenge
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
	sjumpfwd Script_CommitBattleFactoryResult

.LostChallenge:
	opentext
	sdefer Script_CommitBattleFactoryResult
	end

.WonChallenge:
	sdefer .WonChallenge2
	end
.WonChallenge2:
	opentext
	writethistext
		text "¡Felicidades!"

		para "¡Has vencido a"
		line "todos!"

		para "Por eso, toma"
		line "este gran premio!"
		prompt
	verbosegiveitem MINT_LEAF
	; fallthrough
Script_CommitBattleFactoryResult:
	special Special_BattleTower_CommitChallengeResult
	iffalsefwd .WeHopeToServeYouAgain
	setevent EVENT_BEAT_THORTON
.WeHopeToServeYouAgain:
	writethistext
		text "Esperamos verte"
		line "de nuevo."
		done
	waitbutton
	endtext

BattleFactory1FRulesScript:
	opentext
	writethistext
		text "Aquí se escriben"
		line "las reglas de la"
		cont "Fábrica de Combate"

		para "¿Leerlas?"
		done
	yesorno
	iffalse_endtext
	jumpthisopenedtext
		text "Te dan 6 #mon"
		line "de alquiler."

		para "3 #mon pueden"
		line "entrar en combate."

		para "Los tres deben ser"
		line "diferentes."

		para "Los objetos que"
		line "llevan también"
		cont "deben ser"
		cont "diferentes."

		para "Tras ganar un"
		line "combate, puedes"
		cont "cambiar un #mon"
		cont "con el rival."
		done

BattleFactory1FStreakText:
	text "Racha: "
	text_decimal wBattleFactoryCurStreak, 2, 5
	text " vic."
	line "Récord: "
	text_decimal wBattleFactoryTopStreak, 2, 5
	text " vic."
	cont "Cambios: "
	text_decimal wBattleFactorySwapCount, 1, 2
	done

BattleFactory1FReceptionistScript:
	opentext
	writethistext
		text "¡Bienvenido a la"
		line "Fábrica de"
		cont "Combate!"

		para "Puedo llevarte a"
		line "la Sala de Combate"
		done
	promptbutton
	checkevent EVENT_BATTLE_FACTORY_INTRO
	iftruefwd .BattleFactoryMenu

	; only ask once, so set the flag regardless
	setevent EVENT_BATTLE_FACTORY_INTRO
	writethistext
		text "¿Quieres saber"
		line "más sobre esta"
		cont "instalación?"
		done
	yesorno
	iffalsefwd .BattleFactoryMenu

.Explanation:
	writethistext
		text "La Fábrica de"
		line "Combate es un"
		cont "lugar donde"
		cont "combates con"
		cont "#mon"
		cont "de alquiler."

		para "Incontables"
		line "entrenadores"
		cont "#mon se reúnen"

		para "de todas partes"
		line "para combatir en"
		cont "la Sala de Combate"

		para "Cada desafío"
		line "tiene 7 rivales."

		para "Vence a todos y"
		line "gana PB."

		para "Para interrumpir"
		line "una sesión, debes"

		para "guardar. Si no,"
		line "no podrás"

		para "retomar tu"
		line "desafío."
		prompt
	; fallthrough
.BattleFactoryMenu:
	; Setscene here in case the player aborted a quicksave prompted by challenge
	setscene SCENE_BATTLEFACTORY1F_NOOP
	writethistext
		text "¿Quieres ir a la"
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
		text "Antes de entrar"
		line "en la Sala de"
		cont "Combate,"

		para "se guardará tu"
		line "progreso."
		done
	yesorno
	iffalse .BattleFactoryMenu
	; Done here to ensure it's saved in case the player resets later.
	; The scene script running after the player saves but before the
	; challenge starts is harmless since there's no challenge prepared.
	setscene SCENE_BATTLEFACTORY1F_CHECKSTATE
	special Special_TryQuickSave
	iffalse .BattleFactoryMenu

	; Set this early in case the player leaves before picking their team.
	; This prevents them from re-rolling without forfeiting a streak.
	setval BATTLETOWER_CHALLENGE_IN_PROGRESS
	special Special_BattleTower_SetChallengeState
	special Special_BattleTower_SetupRentalMode

	; Initializes opponent trainers
	special Special_BattleTower_BeginChallenge
	; fallthrough
Script_ReturnToRentalChallenge:
	; From this point onwards, resetting the game should count as a streak loss
	setscene SCENE_BATTLEFACTORY1F_CHECKSTATE
	setval BATTLETOWER_CHALLENGE_IN_PROGRESS
	special Special_BattleTower_SetChallengeState

	; Everything ready to go for challenge start
	writethistext
		text "Por aquí, hacia"
		line "la Sala de Combate"
		done
	waitbutton
	closetext

	follow BATTLEFACTORY1F_RECEPTIONIST, PLAYER
	applymovement BATTLEFACTORY1F_RECEPTIONIST, .WalkToHallway
	stopfollow
	special Special_BattleTower_MaxVolume
	warpsound
	disappear BATTLEFACTORY1F_RECEPTIONIST
	applyonemovement PLAYER, step_up
	warpcheck
	end

.WalkToHallway:
	step_up
	step_up
	step_up
	step_up
	step_end

PokemonJournalThortonScript:
	setflag ENGINE_READ_THORTON_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje"
	line "especial: ¡Líder"
	cont "Fábr. Thorton!"

	para "Dicen que Thorton"
	line "solo cree en lo"

	para "que puede probar"
	line "numéricamente con"
	cont "sus inventos."
	done
