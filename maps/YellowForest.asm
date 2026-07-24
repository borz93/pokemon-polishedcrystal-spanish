YellowForest_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_YELLOWFOREST_BRIDGE_UNDERFOOT
	scene_const SCENE_YELLOWFOREST_BRIDGE_OVERHEAD

	def_callbacks
	callback MAPCALLBACK_NEWMAP, YellowForestFlyPoint
	callback MAPCALLBACK_TILES, YellowForestTileScript

	def_warp_events
	warp_event 28, 47, YELLOW_FOREST_GATE, 1
	warp_event 29, 47, YELLOW_FOREST_GATE, 2
	warp_event 19, 12, HIDDEN_TREE_GROTTO, 1

	def_coord_events
	coord_event 32, 16, SCENE_YELLOWFOREST_BRIDGE_OVERHEAD, YellowForestBridgeOverheadTrigger
	coord_event 32, 17, SCENE_YELLOWFOREST_BRIDGE_OVERHEAD, YellowForestBridgeOverheadTrigger
	coord_event 39, 16, SCENE_YELLOWFOREST_BRIDGE_OVERHEAD, YellowForestBridgeOverheadTrigger
	coord_event 39, 17, SCENE_YELLOWFOREST_BRIDGE_OVERHEAD, YellowForestBridgeOverheadTrigger
	coord_event 33, 16, SCENE_YELLOWFOREST_BRIDGE_UNDERFOOT, YellowForestBridgeUnderfootTrigger
	coord_event 33, 17, SCENE_YELLOWFOREST_BRIDGE_UNDERFOOT, YellowForestBridgeUnderfootTrigger
	coord_event 38, 16, SCENE_YELLOWFOREST_BRIDGE_UNDERFOOT, YellowForestBridgeUnderfootTrigger
	coord_event 38, 17, SCENE_YELLOWFOREST_BRIDGE_UNDERFOOT, YellowForestBridgeUnderfootTrigger

	def_bg_events
	bg_event 39, 14, BGEVENT_ITEM + BIG_MUSHROOM, EVENT_YELLOW_FOREST_HIDDEN_BIG_MUSHROOM
	bg_event 43, 36, BGEVENT_ITEM + BALMMUSHROOM, EVENT_YELLOW_FOREST_HIDDEN_BALM_MUSHROOM
	bg_event 32, 11, BGEVENT_ITEM + GOLD_LEAF, EVENT_YELLOW_FOREST_HIDDEN_GOLD_LEAF_1
	bg_event  9, 40, BGEVENT_ITEM + GOLD_LEAF, EVENT_YELLOW_FOREST_HIDDEN_GOLD_LEAF_2
	bg_event 19, 11, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_YELLOW_FOREST
	bg_event 20, 11, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_YELLOW_FOREST

	def_object_events
	object_event  7, 24, SPRITE_WALKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 1, YellowForestWalkerScript, EVENT_YELLOW_FOREST_WALKER
	pokemon_event  8, 24, SKARMORY, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_GRAY, ClearText, EVENT_YELLOW_FOREST_SKARMORY
	object_event 47,  6, SPRITE_YELLOW, SPRITEMOVEDATA_WANDER, 1, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, YellowForestYellowScript, -1
	object_event 49, 26, SPRITE_BALL_CUT_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_ENV_BLUE, OBJECTTYPE_SCRIPT, 0, YellowForestSurfPikachuDoll, EVENT_DECO_SURFING_PIKACHU_DOLL
	object_event 31,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, YellowForestSuperNerdText, -1
	object_event 19, 41, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSchoolgirlSarah, -1
	object_event 13, 34, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSchoolgirlIsabel, -1
	object_event  4, 38, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerTeacherKathryn, -1
	object_event 43, 42, SPRITE_BREEDER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBreederSophie, -1
	object_event 15, 18, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, YellowForestCooltrainerMScript, -1
	tmhmball_event 25, 18, TM_LEECH_LIFE, EVENT_YELLOW_FOREST_TM_LEECH_LIFE
	itemball_event 32, 26, MIRACLE_SEED, 1, EVENT_YELLOW_FOREST_MIRACLE_SEED
	itemball_event 11, 23, BIG_ROOT, 1, EVENT_YELLOW_FOREST_BIG_ROOT
	itemball_event 50, 13, LEMONADE, 1, EVENT_YELLOW_FOREST_LEMONADE

	object_const_def
	const YELLOWFOREST_WALKER
	const YELLOWFOREST_SKARMORY
	const YELLOWFOREST_YELLOW
	const YELLOWFOREST_POKE_BALL5

YellowForestFlyPoint:
	setflag ENGINE_FLYPOINT_YELLOW_FOREST
	endcallback

YellowForestTileScript:
	checkscene
	iftruefwd .underfoot
	callasm YellowForest_OverheadBridgeAsm
	endcallback

.underfoot:
	callasm YellowForest_UnderfootBridgeAsm
	endcallback

YellowForest_OverheadBridgeAsm:
	changebridgeblock 32, 16, $9d, YELLOW_FOREST
	changebridgeblock 34, 16, $9e, YELLOW_FOREST
	changebridgeblock 36, 16, $9e, YELLOW_FOREST
	changebridgeblock 38, 16, $9f, YELLOW_FOREST
	jmp BufferScreen

YellowForest_UnderfootBridgeAsm:
	changebridgeblock 32, 16, $86, YELLOW_FOREST
	changebridgeblock 34, 16, $97, YELLOW_FOREST
	changebridgeblock 36, 16, $97, YELLOW_FOREST
	changebridgeblock 38, 16, $87, YELLOW_FOREST
	jmp BufferScreen

YellowForestBridgeOverheadTrigger:
	callasm YellowForest_OverheadBridgeAsm
	callthisasm
	xor a
	jr YellowForest_FinishBridge

YellowForestBridgeUnderfootTrigger:
	callasm YellowForest_UnderfootBridgeAsm
	callthisasm
	ld a, $1
YellowForest_FinishBridge:
	ld [wWalkingOnBridge], a
	ld [wYellowForestSceneID], a ; setscene a
	jmp GenericFinishBridge

GenericTrainerSchoolgirlSarah:
	generictrainer SCHOOLGIRL, SARAH, EVENT_BEAT_SCHOOLGIRL_SARAH, SchoolgirlSarahSeenText, SchoolgirlSarahBeatenText

	text "¡Si estuviéramos"
	line "en mi colegio, te"
	cont "habría vencido!"
	done

GenericTrainerSchoolgirlIsabel:
	generictrainer SCHOOLGIRL, ISABEL, EVENT_BEAT_SCHOOLGIRL_ISABEL, SchoolgirlIsabelSeenText, SchoolgirlIsabelBeatenText

	text "Estamos"
	line "aprendiendo cómo"
	cont "prosperan los"

	para "#mon juntos en"
	line "estado salvaje."
	done

GenericTrainerTeacherKathryn:
	generictrainer TEACHER_F, KATHRYN, EVENT_BEAT_TEACHER_KATHRYN, TeacherKathrynSeenText, TeacherKathrynBeatenText

	text "Vigilar a todos"
	line "durante una"

	para "excursión es"
	line "trabajo duro."
	done

GenericTrainerBreederSophie:
	generictrainer BREEDER, SOPHIE, EVENT_BEAT_BREEDER_SOPHIE, BreederSophieSeenText, BreederSophieBeatenText

	text "A veces los"
	line "Pikachu usan sus"

	para "descargas para"
	line "reanimar a los"
	cont "debilitados."

	para "¡Eso es lo más"
	line "mono que hay!"
	done

YellowForestWalkerScript:
	showtextfaceplayer YellowForestWalkerSeenText
	winlosstext YellowForestWalkerBeatenText, 0
	setlasttalked YELLOWFOREST_WALKER
	loadtrainer WALKER, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WALKER
	opentext
	writetext YellowForestWalkerAfterText
	promptbutton
	verbosegivetmhm HM_FLY
	setevent EVENT_GOT_HM02_FLY
	writetext YellowForestWalkerFinalText
	waitbutton
	closetext
	appear YELLOWFOREST_SKARMORY
	playsound SFX_BALL_POOF
	turnobject YELLOWFOREST_WALKER, RIGHT
	waitsfx
	pause 15
	cry SKARMORY
	waitsfx
	turnobject YELLOWFOREST_WALKER, DOWN
	showtext YellowForestWalkerFlyText
	playsound SFX_FLY
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear YELLOWFOREST_WALKER
	disappear YELLOWFOREST_SKARMORY
	waitsfx
	pause 15
	special Special_FadeInQuickly
	end

YellowForestYellowScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_YELLOW
	iffalsefwd YellowForestYellowBattleScript
	checkevent EVENT_GOT_LIGHT_BALL_FROM_YELLOW
	iffalsefwd YellowBattleAfterBallScript
	jumpopenedtext YellowForestYellowGoodbyeText

YellowForestYellowBattleScript:
	writetext YellowForestYellowGreetingText
	waitbutton
	closetext
	winlosstext YellowForestYellowWinLossText, 0
	setlasttalked YELLOWFOREST_YELLOW
	loadtrainer YELLOW, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_YELLOW
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iffalsefwd .skip
	clearevent EVENT_INDIGO_PLATEAU_POKECENTER_YELLOW
.skip
	opentext
	writetext YellowForestYellowAfterText
	scall YellowTryGiveLightBallScript
	end

YellowBattleAfterBallScript:
	faceplayer
	opentext
	writetext YellowForestYellowAfterText
YellowTryGiveLightBallScript:
	promptbutton
	verbosegiveitem LIGHT_BALL
	iffalsefwd NoRoomForLightBallScript
	setevent EVENT_GOT_LIGHT_BALL_FROM_YELLOW
	writetext YellowForestYellowGoodbyeText
	waitbutton
NoRoomForLightBallScript:
	endtext

YellowForestCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SEED_BOMB_INTRO
	iftruefwd YellowForestTutorSeedBombScript
	writetext YellowForestCooltrainerMText
	waitbutton
	setevent EVENT_LISTENED_TO_SEED_BOMB_INTRO
YellowForestTutorSeedBombScript:
	writetext Text_YellowForestTutorSeedBomb
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_YellowForestTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval SEED_BOMB
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "¡Habla conmigo si"
	line "cambias de idea!"
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Vaya, no tienes"
	line "una Hoja"
	cont "Plateada."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Tu #mon ya"
	line "sabe usar"
	cont "Bomba Germen!"
	done

YellowForestSurfPikachuDoll:
	disappear YELLOWFOREST_POKE_BALL5
	setevent EVENT_DECO_SURFING_PIKACHU_DOLL
	opentext
	writetext YellowForestSurfPikachuDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	jumpthisopenedtext

	text "El Muñeco Pikachu"
	line "Surf se envió a"
	cont "casa."
	done

SchoolgirlSarahSeenText:
	text "¡Oh, un"
	line "entrenador!"
	cont "¡Quiero"
	cont "combatir!"
	done

SchoolgirlSarahBeatenText:
	text "Snif…"
	line "¡Me hiciste"
	cont "perder!"
	done

SchoolgirlIsabelSeenText:
	text "¿Tienes #mon"
	line "monos como los de"
	cont "aquí?"
	done

SchoolgirlIsabelBeatenText:
	text "¡Tienes #mon"
	line "muy fuertes!"
	done

TeacherKathrynSeenText:
	text "¡Tú! ¿Eres"
	line "entrenador?"

	para "¡Más te vale no"
	line "hacer llorar a mis"
	cont "estudiantes!"
	done

TeacherKathrynBeatenText:
	text "No dejaré que esto"
	line "me haga llorar…"
	done

BreederSophieSeenText:
	text "¿Sabías que"
	line "Pikachu es un"
	cont "#mon"
	cont "evolucionado?"
	done

BreederSophieBeatenText:
	text "¡Eso pensaba!"
	done

YellowForestWalkerSeenText:
	text "¡Hola! Me llamo"
	line "Walker."

	para "Fui Líder de"
	line "Gimnasio de"
	cont "Ciudad Malva,"

	para "pero se lo dejé a"
	line "mi hijo."

	para "Ahora vago por"
	line "Johto disfrutando"
	cont "del paisaje."

	para "Walker: ¿Estás"
	line "coleccionando"
	cont "Medallas, eh?"

	para "¡Pues mi hijo"
	line "perdió contra ti!"

	para "Ahora quiero"
	line "probar tu"
	cont "habilidad yo"
	cont "mismo."

	para "No tengo una"
	line "Medalla, ¡pero"

	para "conseguirás algo"
	line "bueno si ganas!"
	done

YellowForestWalkerBeatenText:
	text "Mis #mon"
	line "pájaro…"
	cont "¡Derrotados!"
	done

YellowForestWalkerAfterText:
	text "Walker: Bueno, ya"
	line "veo por qué"

	para "venciste a"
	line "Pegaso."

	para "¡Conoces a tus"
	line "#mon a la"
	cont "perfección!"

	para "Te has ganado"
	line "esta MO."
	done

YellowForestWalkerFinalText:
	text "Walker: Los"
	line "#mon pájaro"

	para "surcan el cielo"
	line "porque eso es lo"

	para "que quieren hacer"
	line "con todo su"
	cont "corazón."

	para "Si quieres algo"
	line "así de fuerte,"

	para "sé que puedes"
	line "conseguirlo."

	para "Lo que yo quiero"
	line "es seguir"
	cont "vagando."

	para "¡Adiós!"
	done

YellowForestWalkerFlyText:
	text "¡Skarmory,"
	line "a volar!"
	done

YellowForestYellowGreetingText:
	text "Yellow: ¡Hola!"
	line "¡Soy Yellow!"

	para "Este bosque lleno"
	line "de Pikachu…"

	para "Me recuerda a mi"
	line "hogar en Kanto."

	para "Donde atrapé mi"
	line "primer #mon."

	para "El entrenador que"
	line "me ayudó a"
	cont "atraparlo me dijo"
	cont "algo."

	para "Que si cuidas a"
	line "tus #mon con"

	para "todo el corazón,"
	line "¡siempre serán tus"
	cont "amigos!"

	para "Puedo sentir que"
	line "te importan tus"

	para "#mon. ¡Así que"
	line "déjame ver qué"

	para "pueden hacer tus"
	line "amigos!"
	done

YellowForestYellowWinLossText:
	text "¡Jaja! ¡Vaya"
	line "combate!"
	done

YellowForestYellowAfterText:
	text "Yellow: ¡Vaya! De"
	line "verdad eres un"

	para "buen entrenador."
	line "¡Toma algo que tus"

	para "amigos"
	line "apreciarán!"
	done

YellowForestYellowGoodbyeText:
	text "Yellow: Dale esa"
	line "Bola Luz a un"

	para "Pikachu para"
	line "aumentar su"
	cont "poder."
	done

YellowForestCooltrainerMText:
	text "Las semillas son"
	line "sorprendentemente"
	cont "poderosas."

	para "Con los años, una"
	line "semilla pequeña"

	para "puede crecer hasta"
	line "ser un árbol"
	cont "enorme."

	para "¡Y una semilla"
	line "grande puede caer"
	cont "y golpearte!"
	done

Text_YellowForestTutorSeedBomb:
	text "Puedo enseñarle a"
	line "tu #mon a usar"

	para "Bomba Germen por"
	line "una Hoja"
	cont "Plateada."
	done


Text_YellowForestTutorQuestion:
	text "¿Le enseño Bomba"
	line "Germen a tu"
	cont "#mon?"
	done



YellowForestSuperNerdText:
	text "Hay una proteína"
	line "en tu cuerpo"
	cont "llamada"
	cont "pikachurina."

	para "¿Qué inspiró ese"
	line "nombre?"

	para "¡Pikachu, claro"
	line "está!"
	done

YellowForestSurfPikachuDollText:
	text "<PLAYER> encontró"
	line "el Muñeco Pikachu"
	cont "Surf."
	done
