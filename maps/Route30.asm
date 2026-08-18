Route30_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_CMDQUEUE, Route30SetUpPaletteSwap

	def_warp_events
	warp_event  9, 39, ROUTE_30_BERRY_SPEECH_HOUSE, 1
	warp_event 19,  5, MR_POKEMONS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 11, 43, BGEVENT_JUMPTEXT, Route30SignText
	bg_event 15, 27, BGEVENT_JUMPTEXT, MrPokemonsHouseDirectionsSignText
	bg_event 17,  5, BGEVENT_JUMPTEXT, MrPokemonsHouseSignText
	bg_event  5, 21, BGEVENT_JUMPTEXT, Route30TrainerTipsText
	bg_event 13,  8, BGEVENT_JUMPTEXT, Route30AdvancedTipsText
	bg_event 16,  9, BGEVENT_ITEM + POTION, EVENT_ROUTE_30_HIDDEN_POTION
	bg_event  7, 39, BGEVENT_JUMPTEXT, BerryMastersHouseSignText

	def_object_events
	object_event  7, 26, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, YoungsterJoey_ImportantBattleScript, EVENT_ROUTE_30_BATTLE
	pokemon_event  7, 24, PIDGEY, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, ClearText, EVENT_ROUTE_30_BATTLE
	object_event  7, 25, SPRITE_RATTATA_BACK, SPRITEMOVEDATA_RATTATA_BACK, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_30_BATTLE
	object_event  4, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJoey, EVENT_ROUTE_30_YOUNGSTER_JOEY
	object_event  7, 23, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerYoungsterMikey, -1
	object_event  3,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBug_catcherDon, -1
	object_event 10, 31, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_ORANGE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route30YoungsterText, -1
	object_event  4, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route30CooltrainerFText, -1
	cuttree_event 10,  6, EVENT_ROUTE_30_CUT_TREE
	fruittree_event 12, 39, FRUITTREE_ROUTE_30_1, ORAN_BERRY, PAL_NPC_BLUE
	fruittree_event 13,  5, FRUITTREE_ROUTE_30_2, PECHA_BERRY, PAL_NPC_PINK
	itemball_event 10, 35, ANTIDOTE, 1, EVENT_ROUTE_30_ANTIDOTE

	object_const_def
	const ROUTE30_YOUNGSTER1
	const ROUTE30_PIDGEY
	const ROUTE30_RATTATA

Route30SetUpPaletteSwap:
	usepaletteswap .PaletteSwap
	endcallback

.PaletteSwap:
	paletteswap 11, 255, 0, 27, PAL_BG_WATER, OverworldWaterPalettes, MrPokemonsHouseRoofPalettes
	db -1 ; end

YoungsterJoey_ImportantBattleScript:
	waitsfx
	special SaveMusic
	playmusic MUSIC_JOHTO_TRAINER_BATTLE
	opentext
	writetext Text_UseTackle
	pause 30
	closetext
	playsound SFX_TACKLE
	applymovement ROUTE30_RATTATA, Route30_JoeysRattataAttacksMovement
	opentext
	faceplayer
	writetext Text_ThisIsABigBattle
	waitbutton
	turnobject ROUTE30_YOUNGSTER1, UP
	closetext
	playsound SFX_TACKLE
	applymovement ROUTE30_PIDGEY, Route30_MikeysPidgeyAttacksMovement
	special RestoreMusic
	end

TrainerYoungsterJoey:
	trainer YOUNGSTER, JOEY1, EVENT_BEAT_YOUNGSTER_JOEY, YoungsterJoey1SeenText, YoungsterJoey1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_YOUNGSTER_JOEY
	opentext
	checkflag ENGINE_JOEY_READY_FOR_REMATCH
	iftruefwd .Rematch
	checkcellnum PHONE_YOUNGSTER_JOEY
	iftruefwd .NumberAccepted
	checkevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext YoungsterJoey1AfterText
	promptbutton
	setevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	sjumpfwd .RequestNumber

.AskAgain:
	callstd asknumber2m
.RequestNumber:
	askforphonenumber PHONE_YOUNGSTER_JOEY
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername YOUNGSTER, JOEY1, STRING_BUFFER_3
	callstd registerednumberm
	jumpstd numberacceptedm

.Rematch:
	callstd rematchm
	winlosstext YoungsterJoey1BeatenText, 0
	readmem wJoeyFightCount
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
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer YOUNGSTER, JOEY1
	startbattle
	reloadmapafterbattle
	loadmem wJoeyFightCount, 1
	clearflag ENGINE_JOEY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer YOUNGSTER, JOEY2
	startbattle
	reloadmapafterbattle
	loadmem wJoeyFightCount, 2
	clearflag ENGINE_JOEY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer YOUNGSTER, JOEY3
	startbattle
	reloadmapafterbattle
	loadmem wJoeyFightCount, 3
	clearflag ENGINE_JOEY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer YOUNGSTER, JOEY4
	startbattle
	reloadmapafterbattle
	loadmem wJoeyFightCount, 4
	clearflag ENGINE_JOEY_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer YOUNGSTER, JOEY5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOEY_READY_FOR_REMATCH
	checkevent EVENT_JOEY_HP_UP
	iftruefwd .GiveHPUp
	checkevent EVENT_GOT_HP_UP_FROM_JOEY
	iftruefwd .done
	callstd rematchgiftm
	verbosegiveitem HP_UP
	iffalsefwd .PackFull
	setevent EVENT_GOT_HP_UP_FROM_JOEY
	jumpstd numberacceptedm

.done
	end

.GiveHPUp:
	opentext
	writetext YoungsterJoeyText_GiveHPUpAfterBattle
	waitbutton
	verbosegiveitem HP_UP
	iffalsefwd .PackFull
	clearevent EVENT_JOEY_HP_UP
	setevent EVENT_GOT_HP_UP_FROM_JOEY
	jumpstd numberacceptedm

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

.PackFull:
	setevent EVENT_JOEY_HP_UP
	jumpstd packfullm

GenericTrainerYoungsterMikey:
	generictrainer YOUNGSTER, MIKEY, EVENT_BEAT_YOUNGSTER_MIKEY, YoungsterMikeySeenText, YoungsterMikeyBeatenText

	text "Ser un buen"
	line "entrenador es muy"
	cont "difícil."

	para "Voy a combatir"
	line "contra otros para"
	cont "mejorar."
	done

GenericTrainerBug_catcherDon:
	generictrainer BUG_CATCHER, DON, EVENT_BEAT_BUG_CATCHER_DON, Bug_catcherDonSeenText, Bug_catcherDonBeatenText

	text "Me quedé sin #"
	line "Balls mientras"
	cont "atrapaba #mon."

	para "Debí comprar"
	line "más…"
	done

Route30_JoeysRattataAttacksMovement:
	run_step_up
	run_step_down
	step_end

Route30_MikeysPidgeyAttacksMovement:
	run_step_down
	run_step_up
	step_end

Text_UseTackle:
	text "¡Ve, Rattata!"

	para "¡Placaje!"
	done

Text_ThisIsABigBattle:
	text "¿Qué? ¡Esto es un"
	line "gran combate!"
	cont "¡Déjame en paz!"
	done

YoungsterJoey1SeenText:
	text "Acabo de perder,"
	line "así que busco"
	cont "más #mon."

	para "¡Espera! Te veo"
	line "débil. ¡Vamos,"
	cont "a combatir!"
	done

YoungsterJoey1BeatenText:
	text "¡Ay! ¡He perdido"
	line "otra vez!"
	done

YoungsterJoey1AfterText:
	text "¿Necesito más"
	line "#mon para"

	para "combatir mejor?"

	para "¡No! Me quedo con"
	line "este pase lo que"
	cont "pase!"
	done

YoungsterMikeySeenText:
	text "Eres entrenador"
	line "de #mon, ¿No?"

	para "¡Pues tienes que"
	line "combatir!"
	done

YoungsterMikeyBeatenText:
	text "Qué raro."
	line "Antes gané."
	done

Bug_catcherDonSeenText:
	text "En vez de #mon"
	line "Bicho, encontré"
	cont "a un entrenador!"
	done

Bug_catcherDonBeatenText:
	text "¡Argh! ¡Eres muy"
	line "fuerte!"
	done

Route30YoungsterText:
	text "Estas vías del"
	line "tren llevan hasta"
	cont "Ciudad Trigal!"

	para "Me divierto"
	line "haciendo equilib-"
	cont "rio sobre ellas."
	done

Route30CooltrainerFText:
	text "No soy entrenadora"

	para "Pero si miras a"
	line "uno a los ojos,"
	cont "prepárate a"
	cont "combatir."
	done

Route30SignText:
	text "Ruta 30"

	para "Ciudad Cerezo -"
	line "Ciudad Malva"
	done

MrPokemonsHouseDirectionsSignText:
	text "Casa Sr. #mon"
	line "¡Todo recto!"
	done

MrPokemonsHouseSignText:
	text "Casa Sr. #mon"
	done

BerryMastersHouseSignText:
	text "Casa del Maestro"
	line "de las Bayas"
	done

Route30TrainerTipsText:
	text "Consejos de"
	line "entrenador"

	para "¡No robes #mon"
	line "ajenos!"

	para "La # Ball solo"
	line "se lanza a"
	cont "#mon salvajes!"
	done

Route30AdvancedTipsText:
	text "¡Consejos"
	line "avanzados!"

	para "En combate, pulsa"
	line "Select para"
	cont "cambiar #mon!"

	para "Pulsa Start para"
	line "reusar un objeto!"

	para "O pulsa B para"
	line "huir o"
	cont "rendirte!"

	para "Al elegir un"
	line "movimiento a usar,"

	para "pulsa Select para"
	line "cambiarlo por"
	cont "otro, o"

	para "pulsa Start para"
	line "ver su"
	cont "descripción!"
	done

YoungsterJoeyText_GiveHPUpAfterBattle:
	text "Perdí otra vez…"
	line "¡Vaya, eres duro!"

	para "Ah, casi se me"
	line "olvida darte"
	cont "esto."

	para "Para ser aún más"
	line "fuerte, úsalo,"
	cont "¿Vale?"

	para "Yo también voy a"
	line "ser más fuerte."
	done
