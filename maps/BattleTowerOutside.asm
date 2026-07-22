BattleTowerOutside_MapScriptHeader:
	def_scene_scripts
	scene_script BattleTowerOutsideStepDownScene, SCENE_BATTLETOWEROUTSIDE_STEP_DOWN
	scene_const SCENE_BATTLETOWEROUTSIDE_NOOP

	def_callbacks

	def_warp_events
	warp_event  8, 21, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  9, 21, ROUTE_40_BATTLE_TOWER_GATE, 4
	warp_event  8,  9, BATTLE_TOWER_1F, 1 ; hole
	warp_event  9,  9, BATTLE_TOWER_1F, 2 ; hole

	def_coord_events
	coord_event  8,  9, SCENE_BATTLETOWEROUTSIDE_NOOP, BattleTowerOutsidePanUpTrigger1
	coord_event  9,  9, SCENE_BATTLETOWEROUTSIDE_NOOP, BattleTowerOutsidePanUpTrigger2

	def_bg_events
	bg_event 10, 10, BGEVENT_JUMPTEXT, BattleTowerOutsideSignText

	def_object_events
	object_event 15,  7, SPRITE_ANABEL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideAnabelScript, EVENT_BATTLE_TOWER_OUTSIDE_ANABEL
	object_event  6, 12, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 11, SPRITE_BEAUTY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBeautyScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTowerOutsideSailorText, EVENT_BATTLE_TOWER_CLOSED
	object_event 12, 24, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  9, SPRITE_BLANK_FRUIT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, BattleTowerOutsideDoorsClosedText, EVENT_BATTLE_TOWER_OPEN
	object_event  9,  9, SPRITE_BLANK_FRUIT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, BattleTowerOutsideDoorsClosedText, EVENT_BATTLE_TOWER_OPEN

	object_const_def
	const BATTLETOWEROUTSIDE_ANABEL

BattleTowerOutsideStepDownScene:
	sdefer .Script
	end

.Script:
	readvar VAR_YCOORD
	ifnotequal 9, .Done
	readvar VAR_XCOORD
	ifequalfwd 8, .Down
	ifnotequal 9, .Done
.Down
	applyonemovement PLAYER, step_down
.Done
	setscene SCENE_BATTLETOWEROUTSIDE_NOOP
	end

BattleTowerOutsidePanUpTrigger1:
	scall BattleTowerOutsidePanUpHelperScript
	warpfacing UP, BATTLE_TOWER_1F, 10, 15
	end

BattleTowerOutsidePanUpTrigger2:
	scall BattleTowerOutsidePanUpHelperScript
	warpfacing UP, BATTLE_TOWER_1F, 11, 15
	end

BattleTowerOutsidePanUpHelperScript:
	playsound SFX_EXIT_BUILDING
	applyonemovement PLAYER, hide_object
	waitsfx
	applymovement PLAYER, .PanUpMovement
	disappear PLAYER
	pause 10
	special Special_FadeOutMusic
	special FadeOutPalettes
	pause 15
	setscene SCENE_BATTLETOWEROUTSIDE_STEP_DOWN
	end

.PanUpMovement:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

BattleTowerOutsideSignText:
	text "Torre Batalla"

	para "¡Acepta el Desafío"
	line "del Entrenador"
	cont "Definitivo!"
	done

BattleTowerOutsideAnabelScript:
	faceplayer
	checkevent EVENT_BEAT_ANABEL
	iftruefwd .Beaten
	opentext
	writetext .ChallengeText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWEROUTSIDE_ANABEL
	loadtrainer ANABEL, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ANABEL
.Beaten
	opentext
	writetext .ItemText
	promptbutton
	verbosegiveitem POWER_BAND
	iffalse_endtext
	writetext .GoodbyeText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear BATTLETOWEROUTSIDE_ANABEL
	pause 15
	special Special_FadeInQuickly
	clearevent EVENT_BATTLE_TOWER_ANABEL
	end

.ChallengeText:
	text "Saludos… Me llamo"
	line "Anabel."

	para "…¿Eres <PLAYER>?"
	line "He oído varios"
	cont "rumores sobre"
	cont "ti…"

	para "Déjame ver todo tu"
	line "talento en su"
	cont "totalidad…"
	done

.YesText:
	text "Empecemos,"
	line "¿de acuerdo?"
	done

.NoText:
	text "Qué"
	line "decepcionante…"
	done

.BeatenText:
	text "Vale, lo entiendo…"
	done

.ItemText:
	text "Fufufu, bien"
	line "hecho…"

	para "Toma esto, por"
	line "favor…"
	done

.GoodbyeText:
	text "Te insto a seguir"
	line "combatiendo y"
	cont "ganando."

	para "Te estaré"
	line "esperando en esta"
	cont "Torre Batalla."

	para "Hasta la próxima"
	line "vez que nos"
	cont "veamos…"
	done

BattleTowerOutsideYoungsterScript:
	checkevent EVENT_BATTLE_TOWER_OPEN
	iftrue_jumptextfaceplayer .OpenText
	jumpthistextfaceplayer

	text "Vaya, ¡la Torre"
	line "Batalla es"
	cont "enorme! Me duele"

	para "el cuello de tanto"
	line "mirarla."
	done

.OpenText:
	text "Vaya, ¡la Torre"
	line "Batalla es"
	cont "enorme!"

	para "¡Debe haber muchos"
	line "tipos de #mon"
	cont "ahí dentro!"
	done

BattleTowerOutsideBeautyScript:
	checkevent EVENT_BATTLE_TOWER_OPEN
	iftrue_jumptextfaceplayer .OpenText
	jumpthistextfaceplayer

	text "¿Qué demonios"
	line "hacen aquí?"

	para "Si el nombre dice"
	line "algo, supongo que"

	para "debe ser para"
	line "combates #mon."
	done

.OpenText:
	text "Solo puedes usar"
	line "tres #mon."

	para "Es tan difícil"
	line "decidir cuáles"

	para "tres deben ir al"
	line "combate…"
	done

BattleTowerOutsideSailorText:
	text "Jeje, me escapé"
	line "del trabajo."

	para "¡No puedo huir"
	line "hasta que gane!"

	para "Tengo que ganarlo"
	line "todo. ¡Debo"
	cont "hacerlo!"
	done

BattleTowerOutsideDoorsClosedText:
	text "Las puertas de la"
	line "Torre Batalla"
	cont "están cerradas…"
	done
