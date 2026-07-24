Route35_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13, 33, ROUTE_35_GOLDENROD_GATE, 1
	warp_event 14, 33, ROUTE_35_GOLDENROD_GATE, 2
	warp_event  7,  5, ROUTE_35_NATIONAL_PARK_GATE, 3
	warp_event 14, 16, HIDDEN_TREE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event  5,  7, BGEVENT_JUMPTEXT, Route35SignText
	bg_event 15, 31, BGEVENT_JUMPTEXT, Route35SignText
	bg_event 12, 23, BGEVENT_JUMPTEXT, Route35AdvancedTipsSignText
	bg_event  4, 11, BGEVENT_ITEM + NUGGET, EVENT_ROUTE_35_HIDDEN_NUGGET
	bg_event 14, 15, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_35
	bg_event 15, 15, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_35

	def_object_events
	object_event  8, 19, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCamperIvan, -1
	object_event 12, 20, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleGailandeli1, -1
	object_event 11, 20, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleGailandeli2, -1
	object_event 14, 26, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPicnickerKim, -1
	object_event 18, 29, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBreederTheresa, -1
	object_event  6, 10, SPRITE_FIREBREATHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerFirebreatherWalt, -1
	object_event 20,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBug_catcherArnie1, -1
	object_event  9, 10, SPRITE_JUGGLER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerJugglerIrwin, -1
	object_event  9,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerOfficerDirk, -1
	object_event 24, -5, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicMark, -1
	cuttree_event 21,  6, EVENT_ROUTE_35_CUT_TREE
	fruittree_event  6, 25, FRUITTREE_ROUTE_35, LEPPA_BERRY, PAL_NPC_RED
	tmhmball_event 17, 16, TM_HONE_CLAWS, EVENT_ROUTE_35_TM_HONE_CLAWS

GenericTrainerBreederTheresa:
	generictrainer BREEDER, THERESA, EVENT_BEAT_BREEDER_THERESA, BreederTheresaSeenText, BreederTheresaBeatenText

	text "Llevo a mis"
	line "#mon a cortarse"
	cont "el pelo en Ciudad"
	cont "Trigal,"

	para "y a bendecirse en"
	line "Ciudad Iris."

	para "¡Están tan"
	line "contentos!"
	done

TrainerJugglerIrwin:
	trainer JUGGLER, IRWIN1, EVENT_BEAT_JUGGLER_IRWIN, JugglerIrwin1SeenText, JugglerIrwin1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_JUGGLER_IRWIN
	opentext
	checkcellnum PHONE_JUGGLER_IRWIN
	iftruefwd Route35NumberAcceptedM
	checkevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext JugglerIrwinAfterBattleText
	promptbutton
	setevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	scall Route35AskNumber1M
	sjumpfwd .AskForNumber

.AskedAlready:
	scall Route35AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_JUGGLER_IRWIN
	ifequalfwd $1, Route35PhoneFullM
	ifequalfwd $2, Route35NumberDeclinedM
	gettrainername JUGGLER, IRWIN1, STRING_BUFFER_3
	scall Route35RegisteredNumberM
	sjumpfwd Route35NumberAcceptedM

Route35AskNumber1M:
	jumpstd asknumber1m

Route35AskNumber2M:
	jumpstd asknumber2m

Route35RegisteredNumberM:
	jumpstd registerednumberm

Route35NumberAcceptedM:
	jumpstd numberacceptedm

Route35NumberDeclinedM:
	jumpstd numberdeclinedm

Route35PhoneFullM:
	jumpstd phonefullm

Route35RematchM:
	jumpstd rematchm

GenericTrainerCamperIvan:
	generictrainer CAMPER, IVAN, EVENT_BEAT_CAMPER_IVAN, CamperIvanSeenText, CamperIvanBeatenText

	text "La música de la"
	line "radio cambia el"
	cont "ánimo de los"
	cont "#mon salvajes."
	done

GenericTrainerCoupleGailandeli1:
	generictrainer COUPLE, GAILANDELI1, EVENT_BEAT_COUPLE_GAIL_AND_ELI, CoupleGailandeli1SeenText, CoupleGailandeli1BeatenText

	text "Eli: Me humillaron"
	line "delante de mi"
	cont "novia…"
	done

GenericTrainerCoupleGailandeli2:
	generictrainer COUPLE, GAILANDELI2, EVENT_BEAT_COUPLE_GAIL_AND_ELI, CoupleGailandeli2SeenText, CoupleGailandeli2BeatenText

	text "Gail: Puedo"
	line "contar con mis"
	cont "#mon más que"
	cont "con mi novio."
	done

GenericTrainerPicnickerKim:
	generictrainer PICNICKER, KIM, EVENT_BEAT_PICNICKER_KIM, PicnickerKimSeenText, PicnickerKimBeatenText

	text "Las Medallas de"
	line "Gimnasio son"
	cont "bonitas. Las"
	cont "colecciono."
	done

TrainerBug_catcherArnie1:
	trainer BUG_CATCHER, ARNIE1, EVENT_BEAT_BUG_CATCHER_ARNIE, Bug_catcherArnie1SeenText, Bug_catcherArnie1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BUG_CATCHER_ARNIE
	endifjustbattled
	opentext
	checkflag ENGINE_ARNIE_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkflag ENGINE_YANMA_SWARM
	iftruefwd .YanmaSwarming
	checkcellnum PHONE_BUG_CATCHER_ARNIE
	iftrue Route35NumberAcceptedM
	checkevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext BugCatcherArnieAfterBattleText
	promptbutton
	setevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	scall Route35AskNumber1M
	sjumpfwd .AskForNumber

.AskedAlready:
	scall Route35AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BUG_CATCHER_ARNIE
	ifequal $1, Route35PhoneFullM
	ifequal $2, Route35NumberDeclinedM
	gettrainername BUG_CATCHER, ARNIE1, STRING_BUFFER_3
	scall Route35RegisteredNumberM
	sjump Route35NumberAcceptedM

.WantsBattle:
	scall Route35RematchM
	winlosstext Bug_catcherArnie1BeatenText, 0
	readmem wArnieFightCount
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
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer BUG_CATCHER, ARNIE1
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 1
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BUG_CATCHER, ARNIE2
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 2
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BUG_CATCHER, ARNIE3
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 3
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer BUG_CATCHER, ARNIE4
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 4
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer BUG_CATCHER, ARNIE5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ARNIE_READY_FOR_REMATCH
	end

.YanmaSwarming:
	jumpthisopenedtext

	text "Vaya… ¡Mira todos"
	line "esos Yanma!"

	para "Estoy tan"
	line "alucinado que no"
	cont "puedo moverme."
	done

GenericTrainerFirebreatherWalt:
	generictrainer FIREBREATHER, WALT, EVENT_BEAT_FIREBREATHER_WALT, FirebreatherWaltSeenText, FirebreatherWaltBeatenText

	text "La Marcha #mon"
	line "de la radio atrae"
	cont "a #mon"
	cont "salvajes."
	done

TrainerOfficerDirk:
	faceplayer
	opentext
	checktime 1 << NITE
	iffalsefwd .NotNight
	checkevent EVENT_BEAT_OFFICERM_DIRK
	iftruefwd .AfterBattle
	special SaveMusic
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerDirkSeenText
	waitbutton
	closetext
	winlosstext OfficerDirkBeatenText, 0
	loadtrainer OFFICERM, DIRK
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICERM_DIRK
	endtext

.AfterBattle:
	jumpthisopenedtext

	text "Sabes, la noche"
	line "es divertida a su"
	cont "manera."

	para "Pero no te pases,"
	line "¿Vale?"
	done

.NotNight:
	jumpthisopenedtext

	text "Tus #mon se ven"
	line "bastante fuertes."

	para "Podrías ir a"
	line "cualquier sitio"
	cont "con seguridad."
	done

CamperIvanSeenText:
	text "He estado"
	line "sacando datos de"

	para "#mon de mi"
	line "radio. Creo que"
	cont "voy bien."
	done

CamperIvanBeatenText:
	text "¡Me rindo!"
	done

CoupleGailandeli1SeenText:
	text "Eli: Le voy a"
	line "demostrar a mi"
	cont "novia que soy"
	cont "genial."
	done

CoupleGailandeli1BeatenText:
	text "Eli: Ojalá"
	line "hubieras perdido"
	cont "por mí…"
	done

CoupleGailandeli2SeenText:
	text "Gail: Mi novio es"
	line "débil, así que no"
	cont "puedo contar con"
	cont "él."
	done

CoupleGailandeli2BeatenText:
	text "Gail: ¡Vaya!"
	line "¡Eres muy fuerte!"
	done

PicnickerKimSeenText:
	text "¿Vas al Gimnasio?"
	line "¡Yo también!"
	done

PicnickerKimBeatenText:
	text "Oh. No pude"
	line "ganar…"
	done

BreederTheresaSeenText:
	text "¿Cómo cuidas a"
	line "tus #mon?"
	done

BreederTheresaBeatenText:
	text "¡Ah! ¡Los cuidas"
	line "muy bien!"
	done

JugglerIrwin1SeenText:
	text "¡Mira mi elegante"
	line "destreza con las"
	cont "Balls!"
	done

JugglerIrwin1BeatenText:
	text "¡Uf! ¡Vaya"
	line "sacudida!"
	done

JugglerIrwinAfterBattleText:
	text "Iba a"
	line "deslumbrarte con"
	cont "mi #mon"
	cont "premiado."

	para "¡Pero tu destreza"
	line "me electrizó!"
	done

Bug_catcherArnie1SeenText:
	text "Voy a donde sea si"
	line "aparecen #mon"
	cont "bicho."
	done

Bug_catcherArnie1BeatenText:
	text "¿Eh? No debí"
	line "haber perdido"
	cont "eso…"
	done

BugCatcherArnieAfterBattleText:
	text "Mi Venonat me hizo"
	line "ganar el Concurso"

	para "de Captura de"
	line "Bichos del Parque"
	cont "Nacional."
	done


FirebreatherWaltSeenText:
	text "Estoy practicando"
	line "a echar fuego."
	done

FirebreatherWaltBeatenText:
	text "¡Ay! ¡Me chamusqué"
	line "la punta de la"
	cont "nariz!"
	done

OfficerDirkSeenText:
	text "¡El peligro acecha"
	line "de noche!"
	done

OfficerDirkBeatenText:
	text "¡Vaya!"
	done



Route35SignText:
	text "Ruta 35"
	done

Route35AdvancedTipsSignText:
	text "¡Consejos"
	line "avanzados!"

	para "Puedes registrar"
	line "hasta cuatro"

	para "¡Objetos Clave"
	line "para uso rápido"
	cont "con el botón"
	cont "Select!"
	done
