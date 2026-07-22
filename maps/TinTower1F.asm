TinTower1F_MapScriptHeader:
	def_scene_scripts
	scene_script TinTower1FSuicuneBattleScene, SCENE_TINTOWER1F_SUICUNE_BATTLE
	scene_const SCENE_TINTOWER1F_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, TinTower1FNPCsCallback
	callback MAPCALLBACK_TILES, TinTower1FStairsCallback

	def_warp_events
	warp_event  7, 15, BELLCHIME_TRAIL, 3
	warp_event  8, 15, BELLCHIME_TRAIL, 3
	warp_event  8,  2, TIN_TOWER_2F, 2

	def_coord_events

	def_bg_events

	def_object_events
	pokemon_event  7,  9, SUICUNE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, ClearText, EVENT_TIN_TOWER_1F_SUICUNE
	pokemon_event  5,  9, RAIKOU, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, ClearText, EVENT_TIN_TOWER_1F_RAIKOU
	pokemon_event 10,  9, ENTEI, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_RED, ClearText, EVENT_TIN_TOWER_1F_ENTEI
	object_event  6,  3, SPRITE_EUSINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FEusineAfterHoOhScript, EVENT_TIN_TOWER_1F_EUSINE
	object_event  3,  9, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, TinTower1FSage1Text, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  9, 11, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, TinTower1FSage2Text, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 12,  6, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, TinTower1FSage3Text, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  2,  2, SPRITE_ELDER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TinTower1FSage4Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event  7,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TinTower1FSage5Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event 12,  2, SPRITE_ELDER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TinTower1FSage6Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2

	object_const_def
	const TINTOWER1F_SUICUNE
	const TINTOWER1F_RAIKOU
	const TINTOWER1F_ENTEI
	const TINTOWER1F_EUSINE
	const TINTOWER1F_SAGE1
	const TINTOWER1F_SAGE2
	const TINTOWER1F_SAGE3

TinTower1FSuicuneBattleScene:
	sdefer TinTower1FSuicuneBattleScript
	end

TinTower1FNPCsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftruefwd .GotRainbowWing
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalsefwd .FaceBeasts
	special SpecialBeastsCheck
	iffalsefwd .FaceBeasts
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
.GotRainbowWing:
	checkevent EVENT_FOUGHT_HO_OH
	iffalsefwd .Done
	appear TINTOWER1F_EUSINE
.Done:
	endcallback

.FaceBeasts:
	checkevent EVENT_FOUGHT_SUICUNE
	iftruefwd .FoughtSuicune
	appear TINTOWER1F_SUICUNE
	checkflag ENGINE_PLAYER_CAUGHT_RAIKOU
	iftruefwd .NoRaikou
	appear TINTOWER1F_RAIKOU
	sjumpfwd .CheckEntei

.NoRaikou:
	disappear TINTOWER1F_RAIKOU
.CheckEntei:
	checkflag ENGINE_PLAYER_CAUGHT_ENTEI
	iftruefwd .NoEntei
	appear TINTOWER1F_ENTEI
	sjumpfwd .BeastsDone

.NoEntei:
	disappear TINTOWER1F_ENTEI
.BeastsDone:
	endcallback

.FoughtSuicune:
	disappear TINTOWER1F_SUICUNE
	disappear TINTOWER1F_RAIKOU
	disappear TINTOWER1F_ENTEI
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	endcallback

TinTower1FStairsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftruefwd .DontHideStairs
	changeblock 8, 2, $9
.DontHideStairs:
	endcallback

TinTower1FSuicuneBattleScript:
	applymovement PLAYER, TinTowerPlayerMovement1
	pause 15
	checkflag ENGINE_PLAYER_CAUGHT_RAIKOU
	iftruefwd .Next1 ; if player caught Raikou, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_RAIKOU, TinTower1FRaikouApproachesMovement
	turnobject PLAYER, LEFT
	cry RAIKOU
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_RAIKOU, TinTower1FRaikouLeavesMovement
	disappear TINTOWER1F_RAIKOU
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next1:
	checkflag ENGINE_PLAYER_CAUGHT_ENTEI
	iftruefwd .Next2 ; if player caught Entei, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_ENTEI, TinTower1FEnteiApproachesMovement
	turnobject PLAYER, RIGHT
	cry ENTEI
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_ENTEI, TinTower1FEnteiLeavesMovement
	disappear TINTOWER1F_ENTEI
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next2:
	turnobject PLAYER, UP
	pause 10
	applymovement PLAYER, TinTower1FPlayerBacksUpMovement
	applymovement TINTOWER1F_SUICUNE, TinTower1FSuicuneApproachesMovement
	cry SUICUNE
	pause 20
	loadwildmon SUICUNE, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	dontrestartmapmusic
	disappear TINTOWER1F_SUICUNE
	setevent EVENT_FOUGHT_SUICUNE
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_NOOP
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setmapscene ROUTE_36, SCENE_ROUTE36_NOOP
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_NOOP
	setscene SCENE_TINTOWER1F_NOOP
	clearevent EVENT_EUSINES_HOUSE_EUSINE
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .nocatch
	setflag ENGINE_PLAYER_CAUGHT_SUICUNE
.nocatch
	turnobject PLAYER, DOWN
	pause 20
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_EUSINE, 8, 15
	appear TINTOWER1F_EUSINE
	applymovement TINTOWER1F_EUSINE, TinTower1FEusineEntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE1, 7, 15
	appear TINTOWER1F_SAGE1
	applymovement TINTOWER1F_SAGE1, TinTower1FSage1EntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE2, 7, 15
	appear TINTOWER1F_SAGE2
	applymovement TINTOWER1F_SAGE2, TinTower1FSage2EntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE3, 7, 15
	appear TINTOWER1F_SAGE3
	applymovement TINTOWER1F_SAGE3, TinTower1FSage3EntersMovement
	moveobject TINTOWER1F_SAGE1, 5, 13
	moveobject TINTOWER1F_SAGE2, 7, 13
	moveobject TINTOWER1F_SAGE3, 9, 13
	turnobject PLAYER, RIGHT
	showtext TinTowerEusineSuicuneText
	applymovement TINTOWER1F_EUSINE, TinTower1FEusineLeavesMovement
	playsound SFX_EXIT_BUILDING
	disappear TINTOWER1F_EUSINE
	waitsfx
	special Special_FadeOutMusic
	pause 20
	playmapmusic
	end

TinTower1FSage4Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftruefwd .FoughtHoOh
	jumpthistextfaceplayer

	text "¡Parece que Ho-Oh"
	line "ha descendido"

	para "sobre esta, la"
	line "Torre Campana!"
	done

.FoughtHoOh:
	jumpthistextfaceplayer

	text "Se dice que los"
	line "#mon"
	cont "legendarios"

	para "encarnan tres"
	line "poderes…"

	para "El rayo que"
	line "golpeó la torre."

	para "El fuego que"
	line "quemó la torre."

	para "Y la lluvia que"
	line "apagó el fuego…"
	done

TinTower1FSage5Script:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_HO_OH
	iftruefwd .FoughtHoOh
	checkevent EVENT_GOT_RAINBOW_WING
	iftruefwd .GotRainbowWing
	writetext TinTower1FSage5Text1
	promptbutton
	verbosegivekeyitem RAINBOW_WING
	closetext
	reanchormap
	earthquake 72
	waitsfx
	playsound SFX_STRENGTH
	changeblock 8, 2, $20
	refreshmap
	setevent EVENT_GOT_RAINBOW_WING
	closetext
	opentext
.GotRainbowWing:
	jumpthisopenedtext

	text "Ahora, ve."
	done

.FoughtHoOh:
	jumpthisopenedtext

	text "Cuando aparecieron"
	line "los #mon"
	cont "legendarios…"

	para "Sembraron el"
	line "terror en quienes"
	cont "vieron su"
	cont "ascenso."

	para "Y…"

	para "Algunos incluso"
	line "lanzaron ataques"
	cont "inútiles."

	para "Los #mon"
	line "legendarios,"

	para "conscientes de su"
	line "propio poder,"

	para "huyeron,"
	line "ignorando a la"
	cont "gente asustada."
	done

TinTower1FSage6Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftruefwd .FoughtHoOh
	jumpthistextfaceplayer

	text "Creo que estás"
	line "siendo puesto a"
	cont "prueba."

	para "Libera tu mente"
	line "de la duda, y"
	cont "avanza."
	done

.FoughtHoOh:
	jumpthistextfaceplayer

	text "De los #mon"
	line "legendarios, se"

	para "dice que Suicune"
	line "es el más cercano"
	cont "a Ho-Oh."

	para "Oí que también"
	line "podría haber un"

	para "vínculo con los"
	line "#mon conocidos"
	cont "como Unown."

	para "Los #mon Unown"
	line "deben compartir un"

	para "vínculo de"
	line "cooperación con"
	cont "Suicune."
	done

TinTower1FEusineAfterHoOhScript:
	faceplayer
	showtext TinTowerEusineHoOhText
	readvar VAR_FACING
	ifnotequal RIGHT, .PathClear
	applymovement PLAYER, .PlayerStepsAsideMovement
.PathClear:
	applymovement TINTOWER1F_EUSINE, .EusineLeavesAfterHoOhMovement
	disappear TINTOWER1F_EUSINE
	end

.PlayerStepsAsideMovement:
	step_up
	turn_head_left
	step_end

.EusineLeavesAfterHoOhMovement:
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_end

TinTowerPlayerMovement1:
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end

TinTower1FRaikouApproachesMovement:
	fix_facing
	fast_jump_step_down
	step_end

TinTower1FRaikouLeavesMovement:
	fix_facing
	fast_jump_step_down
	fast_jump_step_right
	fast_jump_step_down
	step_end

TinTower1FEnteiApproachesMovement:
	fix_facing
	fast_jump_step_down
	step_end

TinTower1FEnteiLeavesMovement:
	fix_facing
	fast_jump_step_down
	fast_jump_step_left
	fast_jump_step_down
	step_end

TinTower1FSuicuneApproachesMovement:
	fix_facing
	fast_jump_step_down
	step_end

TinTower1FPlayerBacksUpMovement:
	fix_facing
	run_step_down
	remove_fixed_facing
	step_end

TinTower1FEusineEntersMovement:
	step_up
	step_up
	step_up
	turn_head_left
	step_end

TinTower1FEusineLeavesMovement:
	step_down
	step_down
	step_down
	step_end

TinTower1FSage1EntersMovement:
	step_up
	step_up
	step_left
	step_left
	turn_head_up
	step_end

TinTower1FSage2EntersMovement:
	step_up
	step_up
	step_end

TinTower1FSage3EntersMovement:
	step_up
	step_right
	step_right
	step_up
	step_end

TinTowerEusineSuicuneText:
	text "Eusine:"
	line "¡Asombroso!"
	cont "¡Demasiado"
	cont "asombroso, diría!"

	para "Nunca había visto"
	line "un combate tan"
	cont "genial."

	para "Fue realmente"
	line "inspirador de"
	cont "ver."

	para "Suicune era duro,"
	line "pero tú fuiste aún"

	para "más increíble,"
	line "<PLAYER>."

	para "Oí que el poder"
	line "místico de"

	para "Suicune invoca a"
	line "un #mon de"
	cont "colores"
	cont "arcoíris."

	para "Quizás, solo"
	line "quizás, lo que"

	para "pasó hoy haga que"
	line "ese #mon"
	cont "aparezca."

	para "Voy a seguir"
	line "estudiando las"
	cont "leyendas."

	para "Gracias por"
	line "mostrarme ese"
	cont "combate"
	cont "fantástico."

	para "¡Hasta luego,"
	line "<PLAYER>!"
	done

TinTower1FSage1Text:
	text "Según la"
	line "leyenda…"

	para "Cuando las almas"
	line "de #mon y"
	cont "humanos se"
	cont "comunican, del"

	para "cielo desciende un"
	line "#mon de colores"
	cont "arcoíris…"

	para "¿Podría significar"
	line "que los #mon"

	para "legendarios nos"
	line "están poniendo a"
	cont "prueba?"
	done

TinTower1FSage2Text:
if DEF(FAITHFUL)
	text "Cuando la Torre"
	line "de Latón se"
else
	text "Cuando la Torre"
	line "Gong se"
endc
	cont "quemó,"

	para "se dice que tres"
	line "#mon sin nombre"
	cont "perecieron."

	para "Fue trágico."

	para "Sin embargo…"

	para "Un #mon de"
	line "colores"
	cont "arcoíris…"

	para "En otras"
	line "palabras…"

	para "Ho-Oh descendió"
	line "del cielo y dio"

	para "nueva vida a los"
	line "tres #mon."

	para "Son…"

	para "Suicune, Entei y"
	line "Raikou."

	para "Eso es lo que"
	line "dicen."
	done

TinTower1FSage3Text:
	text "Se dice que las"
	line "dos torres se"

	para "construyeron para"
	line "fomentar la"
	cont "amistad y la"
	cont "esperanza entre"
	cont "#mon y"
	cont "personas."

	para "Eso fue hace 700"
	line "años, pero el"

	para "ideal sigue siendo"
	line "importante hoy."
	done


TinTower1FSage5Text1:
	text "Esto te"
	line "protegerá. Toma."
	done



TinTowerEusineHoOhText:
	text "Lo sabía."

	para "Sabía que"
	line "llegarías a ver"
	cont "al #mon de"

	para "colores arcoíris,"
	line "<PLAYER>."

	para "Pasó justo como lo"
	line "imaginé."

	para "Diría que mi"
	line "investigación no"
	cont "está nada mal."

	para "Voy a seguir"
	line "estudiando"
	cont "#mon"

	para "para hacerme"
	line "famoso como"
	cont "#Maniac."

	para "Si alguna vez"
	line "estás en Ciudad"
	cont "Azulona,"

	para "¿le dirás hola a"
	line "mi abuelo?"

	para "Seguro que"
	line "agradecerá la"
	cont "compañía mientras"
	cont "estoy fuera."

	para "¡Hasta luego,"
	line "<PLAYER>!"
	done
