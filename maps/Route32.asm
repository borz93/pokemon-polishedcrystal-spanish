Route32_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE32_COOLTRAINER_M_BLOCKS
	scene_const SCENE_ROUTE32_LYRA_GROTTOES
	scene_const SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	scene_const SCENE_ROUTE32_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route32FlyPoint
	callback MAPCALLBACK_OBJECTS, Route32Frieda

	def_warp_events
	warp_event 11, 73, ROUTE_32_POKECENTER_1F, 1
	warp_event  4,  2, ROUTE_32_RUINS_OF_ALPH_GATE, 3
	warp_event  4,  3, ROUTE_32_RUINS_OF_ALPH_GATE, 4
	warp_event  6, 79, UNION_CAVE_1F, 4
	warp_event  4, 24, HIDDEN_TREE_GROTTO, 1

	def_coord_events
	coord_event 18,  8, SCENE_ROUTE32_COOLTRAINER_M_BLOCKS, Route32CooltrainerMStopsYou
	coord_event 10, 24, SCENE_ROUTE32_LYRA_GROTTOES, Route32LyraIntroducesHiddenGrottoes1
	coord_event 11, 24, SCENE_ROUTE32_LYRA_GROTTOES, Route32LyraIntroducesHiddenGrottoes2
	coord_event 12, 24, SCENE_ROUTE32_LYRA_GROTTOES, Route32LyraIntroducesHiddenGrottoes3
	coord_event 13, 24, SCENE_ROUTE32_LYRA_GROTTOES, Route32LyraIntroducesHiddenGrottoes4
	coord_event  7, 71, SCENE_ROUTE32_OFFER_SLOWPOKETAIL, Route32WannaBuyASlowpokeTailScript

	def_bg_events
	bg_event 13,  5, BGEVENT_JUMPTEXT, Route32SignText
	bg_event  7,  1, BGEVENT_JUMPTEXT, Route32RuinsSignText
	bg_event 10, 84, BGEVENT_JUMPTEXT, Route32UnionCaveSignText
	bg_event 14,  1, BGEVENT_JUMPTEXT, Route32AdvancedTips1Text
	bg_event  1, 59, BGEVENT_JUMPTEXT, Route32AdvancedTips2Text
	bg_event 12, 67, BGEVENT_ITEM + GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL_1
	bg_event 11, 40, BGEVENT_ITEM + SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION_1
	bg_event  8, 10, BGEVENT_ITEM + SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION_2
	bg_event 18, 49, BGEVENT_ITEM + GOLD_LEAF, EVENT_ROUTE_32_HIDDEN_GOLD_LEAF
	bg_event  8, 80, BGEVENT_ITEM + GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL_2
	bg_event  4, 23, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_32
	bg_event  5, 23, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_32

	def_object_events
	object_event 19,  8, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32CooltrainermPetrieScript, -1
	object_event  7, 70, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 12, 67, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
	object_event 13, 29, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_ROUTE_32
	object_event  8, 49, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherJustin, -1
	object_event 12, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerFisherRalph1, -1
	object_event 12, 33, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	object_event  6, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherHenry, -1
	object_event 16, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterAlbert, -1
	object_event  4, 63, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterGordon, -1
	object_event  3, 45, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperRoland, -1
	object_event 11, 82, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperPeter, -1
	itemball_event  6, 53, GREAT_BALL, 1, EVENT_ROUTE_32_GREAT_BALL
	object_event 15, 13, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route32RoarTMGuyScript, -1
	itemball_event  6, 32, REPEL, 1, EVENT_ROUTE_32_REPEL
	cuttree_event 10, 19, EVENT_ROUTE_32_CUT_TREE
	cuttree_event -1, 29, EVENT_MAGNET_TUNNEL_EAST_CUT_TREE
	cuttree_event 19, 32, EVENT_CHERRYGROVE_BAY_CUT_TREE

	object_const_def
	const ROUTE32_COOLTRAINER_M
	const ROUTE32_FISHER4
	const ROUTE32_FRIEDA
	const ROUTE32_LYRA

Route32FlyPoint:
	setflag ENGINE_FLYPOINT_UNION_CAVE
	endcallback

Route32Frieda:
	readvar VAR_WEEKDAY
	ifequalfwd FRIDAY, .FriedaAppears
	disappear ROUTE32_FRIEDA
	endcallback

.FriedaAppears:
	appear ROUTE32_FRIEDA
	endcallback

Route32CooltrainermPetrieScript:
	faceplayer
Route32CooltrainerMTrigger:
	checkflag ENGINE_ZEPHYRBADGE
	iffalse_jumptext Route32CooltrainerMText_VioletGym
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse_jumptext Route32CooltrainerMText_AideIsWaiting
	checkevent EVENT_GOT_MIRACLE_SEED_FROM_ROUTE_32_LEADER
	iftrue_jumptext .AfterText2
	checkevent EVENT_BEAT_COOLTRAINERM_PETRIE
	iftruefwd .Beaten
	checkevent EVENT_BEAT_CAMPER_ROLAND
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_FISHER_JUSTIN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_FISHER_RALPH
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_FISHER_HENRY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PICNICKER_LIZ
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_YOUNGSTER_ALBERT
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_YOUNGSTER_GORDON
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BIRD_KEEPER_PETER
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE32_COOLTRAINER_M
	loadtrainer COOLTRAINERM, PETRIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_PETRIE
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem MIRACLE_SEED
	iffalse_endtext
	setevent EVENT_GOT_MIRACLE_SEED_FROM_ROUTE_32_LEADER
.GotMiracleSeed:
	jumpthisopenedtext

.AfterText2:
	text "Tu experiencia en"
	line "Ciudad Malva"

	para "debería serte"
	line "útil en tu viaje."
	done

.IntroText:
	text "Tienes buenos"
	line "#mon ahí."

	para "Debe ser por el"
	line "entrenamiento que"

	para "les diste cerca de"
	line "Ciudad Malva."

	para "No deberías tener"
	line "problemas para"

	para "vencer a todos los"
	line "entrenadores de"
	cont "esta ruta."

	para "Si lo consigues,"
	line "te enfrentaré yo"
	cont "mismo."
	done

.QuestionText:
	text "Parece que has"
	line "vencido a todos"
	cont "los demás de aquí."

	para "Tu entrenamiento"
	line "en el Gimnasio"

	para "debió de ser muy"
	line "útil."

	para "Yo también tengo"
	line "la Medalla Alba."

	para "¿Quieres"
	line "combatir conmigo?"
	done

.RefusedText:
	text "Así que prefieres"
	line "seguir tu viaje…"
	done

.SeenText:
	text "Mi entrenamiento"
	line "en la Torre"
	cont "Bellsprout superó"
	cont "hasta a Falkner."

	para "¡Veamos cómo te"
	line "comparas!"
	done

.BeatenText:
	text "¡Mi equipo quedó"
	line "arrasado!"
	done

.AfterText1:
	text "Tu entrenamiento"
	line "fue superior al"
	cont "mío."

	para "Como recuerdo de"
	line "nuestro combate,"
	cont "toma esto."

	para "Aumenta el poder"
	line "de los movimientos"
	cont "de tipo Planta."
	done

Route32CooltrainerMStopsYou:
	turnobject ROUTE32_COOLTRAINER_M, LEFT
	turnobject PLAYER, RIGHT
	showtext Route32CooltrainerMText_WhatsTheHurry
	follow PLAYER, ROUTE32_COOLTRAINER_M
	applymovement PLAYER, Movement_Route32CooltrainerMPushesYouBackToViolet
	stopfollow
	turnobject PLAYER, DOWN
	scall Route32CooltrainerMTrigger
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset
	turnobject ROUTE32_COOLTRAINER_M, LEFT
	end

Route32LyraIntroducesHiddenGrottoes1:
	scall Route32LyraIntroducesHiddenGrottoesIntroScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left3
	scall Route32LyraIntroducesHiddenGrottoesMainScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left5
	sjump Route32LyraIntroducesHiddenGrottoesOutroScript

Route32LyraIntroducesHiddenGrottoes2:
	scall Route32LyraIntroducesHiddenGrottoesIntroScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left2
	scall Route32LyraIntroducesHiddenGrottoesMainScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left6
	sjump Route32LyraIntroducesHiddenGrottoesOutroScript

Route32LyraIntroducesHiddenGrottoes3:
	scall Route32LyraIntroducesHiddenGrottoesIntroScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left1
	scall Route32LyraIntroducesHiddenGrottoesMainScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left7
	sjump Route32LyraIntroducesHiddenGrottoesOutroScript

Route32LyraIntroducesHiddenGrottoes4:
	scall Route32LyraIntroducesHiddenGrottoesIntroScript
	scall Route32LyraIntroducesHiddenGrottoesMainScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left8
	sjump Route32LyraIntroducesHiddenGrottoesOutroScript

Route32LyraIntroducesHiddenGrottoes_Left8:
	step_left
Route32LyraIntroducesHiddenGrottoes_Left7:
	step_left
Route32LyraIntroducesHiddenGrottoes_Left6:
	step_left
Route32LyraIntroducesHiddenGrottoes_Left5:
	step_left
	step_left
Route32LyraIntroducesHiddenGrottoes_Left3:
	step_left
Route32LyraIntroducesHiddenGrottoes_Left2:
	step_left
Route32LyraIntroducesHiddenGrottoes_Left1:
	step_left
	step_end

Route32LyraIntroducesHiddenGrottoesIntroScript:
	applymovement ROUTE32_LYRA, .StepUpMovement
	showemote EMOTE_SHOCK, ROUTE32_LYRA, 15
	special Special_FadeOutMusic
	pause 15
	applymovement ROUTE32_LYRA, .StepUpMovement
	end

.StepUpMovement:
	step_up
	step_up
	step_end

Route32LyraIntroducesHiddenGrottoesMainScript:
	turnobject ROUTE32_LYRA, UP
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	opentext
	writetext .GreetingText
	promptbutton
	checkegg
	iftruefwd .HaveEgg
	writetext .NoEggText
	sjumpfwd .Continue
.HaveEgg
	writetext .HaveEggText
.Continue
	waitbutton
	closetext
	playsound SFX_SANDSTORM
	waitsfx
	showemote EMOTE_SHOCK, ROUTE32_LYRA, 15
	applymovement ROUTE32_LYRA, .LookAroundMovement
	showtext .QuestionText
	follow ROUTE32_LYRA, PLAYER
	end

.GreetingText:
	text "<PLAYER>!"
	line "¡Hola!"
	done

.NoEggText:
	text "El Prof. Elm dijo"
	line "que su ayudante"
	cont "te traería un"
	cont "Huevo."

	para "Llévalo contigo."
	line "Tengo curiosidad"

	para "por saber qué"
	line "#mon será!"
	done

.HaveEggText:
	text "¡Qué bien! Llevas"
	line "ese Huevo"

	para "tal como pidió el"
	line "Prof. Elm."

	para "Tengo mucha"
	line "curiosidad por"
	cont "saber qué #mon"
	cont "será!"
	done

.QuestionText:
	text "<PLAYER>, ¿oíste"
	line "eso?"

	para "Vino de algún"
	line "lugar cercano…"
	done

.LookAroundMovement:
	turn_head_right
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_left
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_up
	step_end

Route32LyraIntroducesHiddenGrottoesOutroScript:
	stopfollow
	turnobject ROUTE32_LYRA, UP
	showemote EMOTE_SHOCK, ROUTE32_LYRA, 15
	pause 7
	follow ROUTE32_LYRA, PLAYER
	applyonemovement ROUTE32_LYRA, slow_step_up
	stopfollow
	turnobject PLAYER, UP
	pause 15
	turnobject ROUTE32_LYRA, DOWN
	showtext .GrottoText
	applymovement ROUTE32_LYRA, .LeaveMovement1
	turnobject PLAYER, DOWN
	applymovement ROUTE32_LYRA, .LeaveMovement2
	disappear ROUTE32_LYRA
	setscene SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	playmusic MUSIC_ROUTE_30
	end

.GrottoText:
	text "¡Aquí está!"
	line "¡Hay un hueco"
	cont "entre los"
	cont "árboles!"

	para "Ya había oído"
	line "hablar de estos"
	cont "sitios."

	para "¡Es una Gruta"
	line "Oculta!"

	para "Las Grutas Ocultas"
	line "se encuentran"
	cont "entre árboles y"
	cont "acantilados."

	para "Puede que haya"
	line "algún #mon"
	cont "increíble"
	cont "escondido ahí!"

	para "Ojalá tuviera"
	line "tiempo para mirar,"

	para "pero tengo cosas"
	line "que hacer."

	para "<PLAYER>, sigue"
	line "atento a más"
	cont "Grutas Ocultas!"
	done

.LeaveMovement1:
	step_left
	step_down
	step_end

.LeaveMovement2:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

Route32WannaBuyASlowpokeTailScript:
	turnobject ROUTE32_FISHER4, DOWN
	turnobject PLAYER, UP
	sjumpfwd _OfferToSellSlowpokeTail

SlowpokeTailSalesmanScript:
	faceplayer
_OfferToSellSlowpokeTail:
	setscene SCENE_ROUTE32_NOOP
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalsefwd .refused
	jumpthisopenedtext

	text "¡Tch! Pensaba que"
	line "los niños de hoy"
	cont "andaban forrados…"
	done

.refused
	jumpthisopenedtext

	text "¿No lo quieres?"
	line "¡Pues largo,"
	cont "fuera!"
	done

Route32RoarTMGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM05_ROAR
	iftruefwd .AlreadyHaveRoar
	writetext Text_RoarIntro
	promptbutton
	verbosegivetmhm TM_ROAR
	setevent EVENT_GOT_TM05_ROAR
.AlreadyHaveRoar:
	jumpopenedtext Text_RoarOutro

GenericTrainerCamperRoland:
	generictrainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, CamperRolandSeenText, CamperRolandBeatenText

	text "Si no quieres"
	line "combatir, evita"
	cont "el contacto"
	cont "visual."
	done

GenericTrainerFisherJustin:
	generictrainer FISHER, JUSTIN, EVENT_BEAT_FISHER_JUSTIN, FisherJustinSeenText, FisherJustinBeatenText

	text "Calma, serenidad…"
	line "La esencia de"

	para "pescar y de los"
	line "#mon es la"
	cont "misma."
	done

TrainerFisherRalph1:
	trainer FISHER, RALPH1, EVENT_BEAT_FISHER_RALPH, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_RALPH
	opentext
	checkflag ENGINE_RALPH_READY_FOR_REMATCH
	iftruefwd .Rematch
	checkflag ENGINE_FISH_SWARM
	iftruefwd .Swarm
	checkcellnum PHONE_FISHER_RALPH
	iftruefwd .NumberAccepted
	checkevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext FisherRalphAfterText
	promptbutton
	setevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	sjumpfwd .AskForNumber

.AskAgain:
	callstd asknumber2m
.AskForNumber:
	askforphonenumber PHONE_FISHER_RALPH
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername FISHER, RALPH1, STRING_BUFFER_3
	callstd registerednumberm
	jumpstd numberacceptedm

.Rematch:
	callstd rematchm
	winlosstext FisherRalph1BeatenText, 0
	readmem wRalphFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer FISHER, RALPH1
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 1
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, RALPH2
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 2
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, RALPH3
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 3
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer FISHER, RALPH4
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 4
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer FISHER, RALPH5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.Swarm:
	jumpthisopenedtext

	text "One, two, three…"
	line "Muahahaha, what a"

	para "great haul!"
	line "I'm done! Go ahead"

	para "and catch as many"
	line "as you can, kid!"
	done

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

GenericTrainerFisherHenry:
	generictrainer FISHER, HENRY, EVENT_BEAT_FISHER_HENRY, FisherHenrySeenText, FisherHenryBeatenText

	text "Los #mon recién"
	line "pescados no son"

	para "rival para los"
	line "bien criados."
	done

TrainerPicnickerLiz1:
	trainer PICNICKER, LIZ1, EVENT_BEAT_PICNICKER_LIZ, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_LIZ
	opentext
	checkflag ENGINE_LIZ_READY_FOR_REMATCH
	iftruefwd .Rematch
	checkcellnum PHONE_PICNICKER_LIZ
	iftruefwd .NumberAccepted
	checkevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext PicnickerLiz1AfterText
	promptbutton
	setevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1f
	sjumpfwd .AskForNumber

.AskAgain:
	callstd asknumber2f
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_LIZ
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername PICNICKER, LIZ1, STRING_BUFFER_3
	callstd registerednumberf
	jumpstd numberacceptedf

.Rematch:
	callstd rematchf
	winlosstext PicnickerLiz1BeatenText, 0
	readmem wLizFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, LIZ1
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 1
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, LIZ2
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 2
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, LIZ3
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 3
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, LIZ4
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 4
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer PICNICKER, LIZ5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.NumberAccepted:
	jumpstd numberacceptedf

.NumberDeclined:
	jumpstd numberdeclinedf

.PhoneFull:
	jumpstd phonefullf

GenericTrainerYoungsterAlbert:
	generictrainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText

	text "Voy a intentar ser"
	line "el mejor con mis"
	cont "favoritos."

	para "No uso los mismos"
	line "#mon fuertes"
	cont "que todos los"
	cont "demás."
	done

GenericTrainerYoungsterGordon:
	generictrainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText

	text "La hierba está"
	line "llena de bichos"
	cont "pegajosos."
	done

GenericTrainerBird_keeperPeter:
	generictrainer BIRD_KEEPER, PETER, EVENT_BEAT_BIRD_KEEPER_PETER, Bird_keeperPeterSeenText, Bird_keeperPeterBeatenText

	text "Debería entrenar"
	line "de nuevo en el"
	cont "Gimnasio de"
	cont "Ciudad Malva."
	done

FriedaScript:
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue_jumptextfaceplayer FriedaFridayText
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	faceplayer
	opentext
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftruefwd .MetFrieda
	writetext MeetFriedaText
	promptbutton
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	promptbutton
	verbosegiveitem POISON_BARB
	iffalse_endtext
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	jumpthisopenedtext

	text "Vera: Dáselo a un"
	line "#mon con"
	cont "movimientos de"
	cont "tipo Veneno."

	para "¡Oh!"

	para "¡Es genial!"

	para "Te sorprenderá lo"
	line "bien que mejora"
	cont "los movimientos"
	cont "de Veneno!"
	done

.NotFriday:
	jumpthistextfaceplayer

	text "Vera: ¿No es hoy"
	line "viernes?"

	para "¡Es tan aburrido"
	line "cuando no lo es!"
	done

Movement_Route32CooltrainerMPushesYouBackToViolet:
	step_up
	step_up
	step_end

Movement_Route32CooltrainerMReset:
	step_down
	step_right
	step_end

Route32CooltrainerMText_WhatsTheHurry:
	text "¡Espera!"
	line "¿A qué viene tanta"
	cont "prisa?"
	done

Route32CooltrainerMText_AideIsWaiting:
	text "<PLAYER>, ¿verdad?"
	line "Un tipo con gafas"

	para "te estaba"
	line "buscando."

	para "Compruébalo tú"
	line "mismo. Te está"

	para "esperando en el"
	line "Centro #mon."
	done

Route32CooltrainerMText_VioletGym:
	text "¿Has ido al"
	line "Gimnasio #mon?"

	para "Puedes poner a"
	line "prueba a tus"
	cont "#mon y a ti"
	cont "mismo."

	para "¡Es un rito de"
	line "iniciación para"
	cont "todo entrenador!"
	done

Text_MillionDollarSlowpokeTail:
	text "¿Te gustaría tener"
	line "esta sabrosa y"

	para "nutritiva"
	line "ColaSlowpoke?"

	para "Solo para ti,"
	line "¡por 10.000.000"
	cont "¥!"

	para "¡Te encantará!"
	done



FisherJustinSeenText:
	text "¡Ah!"

	para "¡Me hiciste"
	line "perder ese pez!"
	done

FisherJustinBeatenText:
	text "¡Chof!"
	done

FisherRalph1SeenText:
	text "Se me da muy bien"
	line "tanto pescar como"
	cont "los #mon."

	para "¡No voy a perder"
	line "contra un crío!"
	done

FisherRalph1BeatenText:
	text "Tch. Quise ir"
	line "demasiado rápido…"
	done

FisherRalphAfterText:
	text "Pescar es una"
	line "pasión de por"
	cont "vida."

	para "¡Los #mon son"
	line "amigos de por"
	cont "vida!"
	done


FisherHenrySeenText:
	text "¿Mi #mon?"
	line "¡Recién pescado!"
	done

FisherHenryBeatenText:
	text "¿Chof?"
	done

YoungsterAlbertSeenText:
	text "No te había visto"
	line "por aquí."

	para "¿Te crees muy"
	line "fuerte?"
	done

YoungsterAlbertBeatenText:
	text "¡Eres fuerte!"
	done

YoungsterGordonSeenText:
	text "Encontré buenos"
	line "#mon entre la"
	cont "hierba!"

	para "¡Creo que me"
	line "servirán!"
	done

YoungsterGordonBeatenText:
	text "Vaya. Pensé que"
	line "podía ganar."
	done

CamperRolandSeenText:
	text "Esa mirada…"
	line "Qué intrigante."
	done

CamperRolandBeatenText:
	text "Mmm. Qué"
	line "decepción."
	done

PicnickerLiz1SeenText:
	text "Ajá. Sí, y ya"
	line "sabes…"

	para "¿Cómo? ¿Combate?"
	line "Estoy al teléfono."

	para "Bueno, vale. Pero"
	line "rápido."
	done

PicnickerLiz1BeatenText:
	text "¡Necesito"
	line "desahogarme!"
	done

PicnickerLiz1AfterText:
	text "Y yo estaba en"
	line "una buena charla."
	done

Bird_keeperPeterSeenText:
	text "¡Esa Medalla! ¡Es"
	line "de Ciudad Malva!"

	para "¿Venciste a"
	line "Falkner?"
	done

Bird_keeperPeterBeatenText:
	text "Sé cuáles son mis"
	line "debilidades."
	done

Text_RoarIntro: ; text > text
	text "¡GRRRAAAOOO!"
	line "LA GENTE HUYE"
	cont "CUANDO RUJO,"

	para "¡PERO VINISTE A"
	line "BUSCARME!"

	para "¡ESO ME ENCANTA!"
	line "¡TOMA ESTO!"
	done

Text_RoarOutro: ; text > text
	text "¡GRRRAAOOO!"
	line "¡ES RUGIDO!"

	para "HASTA LOS"
	line "POKéMON HUYEN DE"
	cont "UN BUEN RUGIDO!"
	done

MeetFriedaText:
	text "Vera: ¡Yuju!"
	line "¡Es viernes!"

	para "¡Soy Vera del"
	line "Viernes!"

	para "¡Encantada!"
	done

FriedaGivesGiftText:
	text "¡Toma un Dardo"
	line "Veneno!"
	done


FriedaFridayText:
	text "Vera: ¡Hola! ¿Qué"
	line "día te gusta?"

	para "Me encanta el"
	line "viernes. ¡Sin"
	cont "duda!"

	para "¿A que a ti"
	line "también te"
	cont "encanta?"
	done


Route32SignText:
	text "Ruta 32"

	para "Ciudad Malva -"
	line "Pueblo Azalea"
	done

Route32RuinsSignText:
	text "Ruinas Alfa"
	line "Entrada Este"
	done

Route32UnionCaveSignText:
	text "Cueva Unión"
	line "más adelante"
	done

Route32AdvancedTips1Text:
	text "¡Consejos"
	line "Avanzados!"

	para "Puedes encontrar"
	line "objetos pescando"
	cont "o rompiendo rocas!"
	done

Route32AdvancedTips2Text:
	text "¡Consejos"
	line "Avanzados!"

	para "Si pierdes contra"
	line "otro entrenador,"
	cont "le pagas dinero"

	para "según cuántas"
	line "Medallas tengas!"
	done
