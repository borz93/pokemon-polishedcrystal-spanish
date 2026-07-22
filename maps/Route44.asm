Route44_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 56,  7, ICE_PATH_1F, 1
	warp_event 28,  8, HIDDEN_TREE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 53,  7, BGEVENT_JUMPTEXT, Route44Sign1Text
	bg_event  6, 10, BGEVENT_JUMPTEXT, Route44Sign2Text
	bg_event 33,  9, BGEVENT_ITEM + ELIXIR, EVENT_ROUTE_44_HIDDEN_ELIXIR
	bg_event 28,  7, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_44
	bg_event 29,  7, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_44

	def_object_events
	object_event 33,  8, SPRITE_VETERAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route44VeteranmScript, -1
	object_event 35,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerFisherWilton1, -1
	object_event 19, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherEdgar, -1
	object_event 10,  9, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicPhil, -1
	object_event 43,  2, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokemaniacZach, -1
	object_event 51,  5, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBird_keeperVance1, -1
	object_event 41, 15, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerCooltrainermAllen, -1
	object_event 31, 14, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerCooltrainerfCybil, -1
	fruittree_event  9,  5, FRUITTREE_ROUTE_44, ASPEAR_BERRY, PAL_NPC_BROWN
	itemball_event 30,  8, MAX_REVIVE, 1, EVENT_ROUTE_44_MAX_REVIVE
	itemball_event 45,  4, ULTRA_BALL, 1, EVENT_ROUTE_44_ULTRA_BALL
	itemball_event 14,  9, MAX_REPEL, 1, EVENT_ROUTE_44_MAX_REPEL

	object_const_def
	const ROUTE44_VETERAN_M

Route44VeteranmScript:
	checkevent EVENT_GOT_ROCKY_HELMET_FROM_ROUTE_44_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_VETERANM_BARKHORN
	iftruefwd .Beaten
	checkevent EVENT_BEAT_BIRD_KEEPER_VANCE
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PSYCHIC_PHIL
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_FISHER_WILTON
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_FISHER_EDGAR
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_COOLTRAINERF_CYBIL
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEMANIAC_ZACH
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_COOLTRAINERM_ALLEN
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE44_VETERAN_M
	loadtrainer VETERANM, BARKHORN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_VETERANM_BARKHORN
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem ROCKY_HELMET
	iffalse_endtext
	setevent EVENT_GOT_ROCKY_HELMET_FROM_ROUTE_44_LEADER
	jumpthisopenedtext

.AfterText2:
	text "Eres una persona"
	line "muy callada."

	para "¿Te lo habían"
	line "dicho antes?"
	done

.IntroText:
	text "Mis #mon"
	line "llevan Cascos"
	cont "Roca."

	para "¿Quieres"
	line "desafiarlos?"

	para "Vale, entonces"
	line "primero tienes que"

	para "vencer a todos los"
	line "entrenadores de"
	cont "esta ruta."
	done

.QuestionText:
	text "Vi tus combates."

	para "Tus #mon son"
	line "muy duros."

	para "¿Estás listo?"
	done

.RefusedText:
	text "¿Venciste al Team"
	line "Rocket y me tienes"
	cont "miedo a mí?"

	para "¿Doy tanto miedo?"
	done

.SeenText:
	text "¡Te mostraré el"
	line "poder de mis"
	cont "Cascos Roca!"
	done

.BeatenText:
	text "Bah. Estos Cascos"
	line "no bastaron."
	done

.AfterText1:
	text "Eres muy fuerte"
	line "para ser tan"
	cont "joven. ¡Sigue"
	cont "así!"

	para "Toma uno de estos"
	line "Cascos Roca."

	para "Puedes usarlo tan"
	line "bien como yo."
	done

TrainerBird_keeperVance1:
	trainer BIRD_KEEPER, VANCE1, EVENT_BEAT_BIRD_KEEPER_VANCE, Bird_keeperVance1SeenText, Bird_keeperVance1BeatenText, 0, Bird_keeperVance1Script

Bird_keeperVance1Script:
	loadvar VAR_CALLERID, PHONE_BIRDKEEPER_VANCE
	opentext
	checkflag ENGINE_VANCE_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkcellnum PHONE_BIRDKEEPER_VANCE
	iftruefwd Route44NumberAcceptedM
	checkevent EVENT_VANCE_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext BirdKeeperVanceLegendaryBirdsText
	promptbutton
	setevent EVENT_VANCE_ASKED_FOR_PHONE_NUMBER
	scall Route44AskNumber1M
	sjumpfwd .AskForNumber

.AskedAlready:
	scall Route44AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BIRDKEEPER_VANCE
	ifequalfwd $1, Route44PhoneFullM
	ifequalfwd $2, Route44NumberDeclinedM
	gettrainername BIRD_KEEPER, VANCE1, STRING_BUFFER_3
	scall Route44RegisteredNumberM
	sjumpfwd Route44NumberAcceptedM

.WantsBattle:
	scall Route44RematchM
	winlosstext Bird_keeperVance1BeatenText, 0
	readmem wVanceFightCount
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer BIRD_KEEPER, VANCE1
	startbattle
	reloadmapafterbattle
	loadmem wVanceFightCount, 1
	clearflag ENGINE_VANCE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BIRD_KEEPER, VANCE2
	startbattle
	reloadmapafterbattle
	loadmem wVanceFightCount, 2
	clearflag ENGINE_VANCE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BIRD_KEEPER, VANCE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_VANCE_READY_FOR_REMATCH
	checkevent EVENT_VANCE_CARBOS
	iftruefwd .Carbos
	checkevent EVENT_GOT_CARBOS_FROM_VANCE
	iftruefwd .ReceivedCarbosBefore
	scall Route44RematchGiftM
	verbosegiveitem CARBOS
	iffalsefwd VancePackFull
	setevent EVENT_GOT_CARBOS_FROM_VANCE
	sjumpfwd Route44NumberAcceptedM

.ReceivedCarbosBefore:
	end

.Carbos:
	opentext
	writetext BirdKeeperVance2BeatenText
	waitbutton
	verbosegiveitem CARBOS
	iffalsefwd VancePackFull
	clearevent EVENT_VANCE_CARBOS
	setevent EVENT_GOT_CARBOS_FROM_VANCE
	sjumpfwd Route44NumberAcceptedM

Route44AskNumber1M:
	jumpstd asknumber1m

Route44AskNumber2M:
	jumpstd asknumber2m

Route44RegisteredNumberM:
	jumpstd registerednumberm

Route44NumberAcceptedM:
	jumpstd numberacceptedm

Route44NumberDeclinedM:
	jumpstd numberdeclinedm

Route44PhoneFullM:
	jumpstd phonefullm

Route44RematchM:
	jumpstd rematchm

Route44GiftM:
	jumpstd giftm

Route44PackFullM:
	jumpstd packfullm

VancePackFull:
	setevent EVENT_VANCE_CARBOS
	jumpstd packfullm
	end

Route44RematchGiftM:
	jumpstd rematchgiftm

GenericTrainerPsychicPhil:
	generictrainer PSYCHIC_T, PHIL, EVENT_BEAT_PSYCHIC_PHIL, PsychicPhilSeenText, PsychicPhilBeatenText

	text "Es importante"
	line "tener convicción"
	cont "de tu lado."
	done

TrainerFisherWilton1:
	trainer FISHER, WILTON1, EVENT_BEAT_FISHER_WILTON, FisherWilton1SeenText, FisherWilton1BeatenText, 0, FisherWilton1Script

FisherWilton1Script:
	loadvar VAR_CALLERID, PHONE_FISHER_WILTON
	opentext
	checkflag ENGINE_WILTON_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkflag ENGINE_WILTON_HAS_ITEM
	iftruefwd .HasItem
	checkcellnum PHONE_FISHER_WILTON
	iftrue Route44NumberAcceptedM
	checkevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	checkunits
	iftruefwd .metric
	writetext FisherWiltonHugePoliwagText_Imperial
	sjumpfwd .ok
.metric
	writetext FisherWiltonHugePoliwagText_Metric
.ok
	promptbutton
	setevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
	scall Route44AskNumber1M
	sjumpfwd .AskForNumber

.AskedAlready:
	scall Route44AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_FISHER_WILTON
	ifequal $1, Route44PhoneFullM
	ifequal $2, Route44NumberDeclinedM
	gettrainername FISHER, WILTON1, STRING_BUFFER_3
	scall Route44RegisteredNumberM
	sjump Route44NumberAcceptedM

.WantsBattle:
	scall Route44RematchM
	winlosstext FisherWilton1BeatenText, 0
	readmem wWiltonFightCount
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer FISHER, WILTON1
	startbattle
	reloadmapafterbattle
	loadmem wWiltonFightCount, 1
	clearflag ENGINE_WILTON_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, WILTON2
	startbattle
	reloadmapafterbattle
	loadmem wWiltonFightCount, 2
	clearflag ENGINE_WILTON_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, WILTON3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WILTON_READY_FOR_REMATCH
	end

.HasItem:
	scall Route44GiftM
	checkevent EVENT_WILTON_HAS_ULTRA_BALL
	iftruefwd .UltraBall
	checkevent EVENT_WILTON_HAS_GREAT_BALL
	iftruefwd .GreatBall
	checkevent EVENT_WILTON_HAS_POKE_BALL
	iftruefwd .PokeBall
.UltraBall:
	verbosegiveitem ULTRA_BALL
	iffalsefwd .Route44PackFullM
	sjumpfwd .ItemReceived

.GreatBall:
	verbosegiveitem GREAT_BALL
	iffalsefwd .Route44PackFullM
	sjumpfwd .ItemReceived

.PokeBall:
	verbosegiveitem POKE_BALL
	iffalsefwd .Route44PackFullM
.ItemReceived:
	clearflag ENGINE_WILTON_HAS_ITEM
	sjump Route44NumberAcceptedM

.Route44PackFullM:
	sjump Route44PackFullM

GenericTrainerFisherEdgar:
	generictrainer FISHER, EDGAR, EVENT_BEAT_FISHER_EDGAR, FisherEdgarSeenText, FisherEdgarBeatenText

	text "Van 100 victorias"
	line "por 101 derrotas."

	para "No volveré a"
	line "combatir en un"
	cont "tiempo."
	done

GenericTrainerCooltrainerfCybil:
	generictrainer COOLTRAINERF, CYBIL, EVENT_BEAT_COOLTRAINERF_CYBIL, CooltrainerfCybilSeenText, CooltrainerfCybilBeatenText

	text "Todos mejoramos"
	line "viviendo muchos"
	cont "combates."

	para "Combatí mucho"
	line "para llegar a ser"
	cont "lo que soy hoy--"
	cont "una élite."
	done

GenericTrainerPokemaniacZach:
	generictrainer POKEMANIAC, ZACH, EVENT_BEAT_POKEMANIAC_ZACH, PokemaniacZachSeenText, PokemaniacZachBeatenText

	text "Si un #mon"
	line "tiene colores"
	cont "distintos"

	para "a lo normal, vale"
	line "más."

	para "¿Qué? ¿Que eso no"
	line "es verdad?"
	done

GenericTrainerCooltrainermAllen:
	generictrainer COOLTRAINERM, ALLEN, EVENT_BEAT_COOLTRAINERM_ALLEN, CooltrainermAllenSeenText, CooltrainermAllenBeatenText

	text "Vaya. Tienes"
	line "muchas Medallas."

	para "Con razón eres tan"
	line "duro."

	para "¿Seguirá"
	line "entrenando Morty,"

	para "del Gimnasio de"
	line "Ciudad Iris?"

	para "De verdad me"
	line "machacó."
	done

FisherWilton1SeenText:
	text "¡Ay! ¡Me hiciste"
	line "perder un"
	cont "Poliwag!"

	para "¿Qué vas a hacer"
	line "al respecto?"
	done

FisherWilton1BeatenText:
	text "Olvídalo, ya"
	line "está."
	done

FisherWiltonHugePoliwagText_Imperial:
	text "Ese Poliwag que se"
	line "escapó…"
	cont "Era enorme."

	para "¡Juro que medía"
	line "dieciséis pies de"
	cont "largo!"
	done

FisherWiltonHugePoliwagText_Metric:
	text "Ese Poliwag que se"
	line "escapó…"
	cont "Era enorme."

	para "¡Juro que medía"
	line "cinco metros de"
	cont "largo!"
	done

FisherEdgarSeenText:
	text "Pesco hasta que ya"
	line "no puedo más."

	para "También combato"
	line "hasta caer."

	para "Esa es mi relación"
	line "con mis #mon."
	done

FisherEdgarBeatenText:
	text "Hmmmm…"
	line "Esto no está bien."
	done

Bird_keeperVance1SeenText:
	text "¿Sabes algo de las"
	line "aves legendarias"
	cont "#mon?"
	done

Bird_keeperVance1BeatenText:
	text "¡Vaya! Eres muy"
	line "bueno."
	done

BirdKeeperVanceLegendaryBirdsText:
	text "Articuno, Zapdos"
	line "y Moltres son las"

	para "tres aves"
	line "legendarias"
	cont "#mon."

	para "Aunque oí que hay"
	line "otras aves"
	cont "legendarias."
	done

BirdKeeperVance2BeatenText:
	text "¿Por qué nunca"
	line "puedo vencerte?"

	para "Ah, sí, toma. Es"
	line "el regalo que no"

	para "pude darte la"
	line "última vez."
	done

PsychicPhilSeenText:
	text "¡Voy a ganar,"
	line "seguro!"
	done

PsychicPhilBeatenText:
	text "Argh… Qué"
	line "derrota tan"
	cont "impactante…"
	done

PokemaniacZachSeenText:
	text "¡Haría lo que"
	line "fuera por tener"
	cont "#mon raros!"
	done

PokemaniacZachBeatenText:
	text "Oooh, tus #mon"
	line "son tan"
	cont "atractivos."
	done

CooltrainermAllenSeenText:
	text "Puedo saber que"
	line "eres buen"
	cont "entrenador con"
	cont "solo mirarte."

	para "Se me dan bien los"
	line "#mon, y veo que"
	cont "a ti también."
	done

CooltrainermAllenBeatenText:
	text "¡Tch! Es una"
	line "derrota total"
	cont "para mí."
	done

CooltrainerfCybilSeenText:
	text "Te ves fuerte."

	para "Los buenos"
	line "entrenadores"
	cont "buscan rivales"
	cont "duros por"
	cont "instinto."
	done

CooltrainerfCybilBeatenText:
	text "¡No! Esto no puede"
	line "ser."
	done

Route44Sign1Text:
	text "Ruta 44"
	line "Ruta Helada"
	cont "adelante"
	done

Route44Sign2Text:
	text "Ruta 44"

	para "Pueblo Caoba -"
	line "Ciudad Endrino"
	done
