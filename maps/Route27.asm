Route27_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE27_FIRST_STEP_INTO_KANTO
	scene_const SCENE_ROUTE27_NOOP

	def_callbacks

	def_warp_events
	warp_event 33,  7, ROUTE_27_REST_HOUSE, 1
	warp_event 26,  5, TOHJO_FALLS, 1
	warp_event 36,  5, TOHJO_FALLS, 2

	def_coord_events
	coord_event 18, 10, SCENE_ROUTE27_FIRST_STEP_INTO_KANTO, FirstStepIntoKantoLeftScene
	coord_event 19, 10, SCENE_ROUTE27_FIRST_STEP_INTO_KANTO, FirstStepIntoKantoRightScene

	def_bg_events
	bg_event 25,  7, BGEVENT_JUMPTEXT, TohjoFallsSignText

	def_object_events
	object_event 48, 12, SPRITE_VETERAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route27VeteranfScript, -1
	object_event 21, 10, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route27FisherText, -1
	object_event 48,  7, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainermBlake, -1
	object_event 58,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoJakeandbri1, -1
	object_event 59,  6, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoJakeandbri2, -1
	object_event 72, 10, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfReena, -1
	object_event 37,  6, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCooltrainerfMegan, -1
	object_event 65,  7, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicGilbert, -1
	object_event 58, 13, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBird_keeperJose1, -1
	itemball_event 53, 12, RARE_CANDY, 1, EVENT_ROUTE_27_RARE_CANDY
	itemball_event 71,  4, DESTINY_KNOT, 1, EVENT_ROUTE_27_DESTINY_KNOT
	fruittree_event 60, 12, FRUITTREE_ROUTE_27, LUM_BERRY, PAL_NPC_GREEN

	object_const_def
	const ROUTE27_VETERAN_F
	const ROUTE27_FISHER

FirstStepIntoKantoLeftScene:
	turnobject ROUTE27_FISHER, LEFT
	showemote EMOTE_SHOCK, ROUTE27_FISHER, 15
	applymovement ROUTE27_FISHER, Route27FisherStepLeftTwiceMovement
	sjumpfwd FirstStepIntoKantoScene_Continue

FirstStepIntoKantoRightScene:
	turnobject ROUTE27_FISHER, LEFT
	showemote EMOTE_SHOCK, ROUTE27_FISHER, 15
	applyonemovement ROUTE27_FISHER, step_left
FirstStepIntoKantoScene_Continue:
	turnobject PLAYER, RIGHT
	opentext
	writetext Route27FisherHeyText
	promptbutton
	writetext Route27FisherText
	waitbutton
	closetext
	setscene SCENE_ROUTE27_NOOP
	end

Route27VeteranfScript:
	checkevent EVENT_GOT_CHOICE_SPECS_FROM_ROUTE_27_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_VETERANF_LITVYAK
	iftruefwd .Beaten
	checkevent EVENT_BEAT_PSYCHIC_GILBERT
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BIRD_KEEPER_JOSE
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_COOLTRAINERM_BLAKE
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_ACE_DUO_JAKE_AND_BRI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_COOLTRAINERF_REENA
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_COOLTRAINERF_MEGAN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_DRAGON_TAMER_KAZU
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_COOLTRAINERM_GAVEN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_COOLTRAINERF_JOYCE
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_COOLTRAINERF_BETH
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PSYCHIC_RICHARD
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BATTLE_GIRL_RONDA
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_FISHER_SCOTT
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_DRAGON_TAMER_ERICK
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE27_VETERAN_F
	loadtrainer VETERANF, LITVYAK
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_VETERANF_LITVYAK
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem CHOICE_SPECS
	iffalse_endtext
	setevent EVENT_GOT_CHOICE_SPECS_FROM_ROUTE_27_LEADER
	jumpthisopenedtext

.AfterText2:
	text "¡Buena suerte!"
	line "Saluda a Lance de"
	cont "mi parte."
	done

.IntroText:
	text "¡Hm! Si estás"
	line "aquí, debes ir"

	para "camino de la Liga"
	line "#mon."

	para "¿Quieres entrenar"
	line "conmigo?"

	para "Entonces vence a"
	line "todos los demás en"
	cont "las Rutas 26 y 27."

	para "Te esperaré aquí."
	done

.QuestionText:
	text "Hm. Venciste al"
	line "resto más rápido"
	cont "de lo esperado."

	para "Entrenemos."
	done

.RefusedText:
	text "Vale."
	line "Puedo esperar."
	done

.SeenText:
	text "Mis #mon"
	line "llevan todos"
	cont "Gafas Elecc."

	para "Parecen raras,"
	line "pero son"
	cont "poderosas."
	done

.BeatenText:
	text "¡Seguro que estás"
	line "listo para la Liga"
	cont "#mon!"
	done

.AfterText1:
	text "Las Gafas Elecc."
	line "aumentan el"
	cont "Ataque Especial de"
	cont "un #mon,"

	para "pero solo puede"
	line "usar un"
	cont "movimiento."

	para "Toma unas para"
	line "ti."
	done

GenericTrainerPsychicGilbert:
	generictrainer PSYCHIC_T, GILBERT, EVENT_BEAT_PSYCHIC_GILBERT, PsychicGilbertSeenText, PsychicGilbertBeatenText

	text "Con tu habilidad,"
	line "te irá bien en la"
	cont "Liga."

	para "Eso dice mi"
	line "premonición."
	done

TrainerBird_keeperJose1:
	trainer BIRD_KEEPER, JOSE1, EVENT_BEAT_BIRD_KEEPER_JOSE, Bird_keeperJose1SeenText, Bird_keeperJose1BeatenText, 0, Bird_keeperJose1Script

Bird_keeperJose1Script:
	loadvar VAR_CALLERID, PHONE_BIRDKEEPER_JOSE
	opentext
	checkflag ENGINE_JOSE_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftruefwd .HasStarPiece
	checkcellnum PHONE_BIRDKEEPER_JOSE
	iftruefwd .NumberAccepted
	checkevent EVENT_JOSE_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext BirdKeeperJose2AfterBattleText
	promptbutton
	setevent EVENT_JOSE_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_BIRDKEEPER_JOSE
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername BIRD_KEEPER, JOSE1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext Bird_keeperJose1BeatenText, 0
	readmem wJoseFightCount
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
	loadtrainer BIRD_KEEPER, JOSE1
	startbattle
	reloadmapafterbattle
	loadmem wJoseFightCount, 1
	clearflag ENGINE_JOSE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BIRD_KEEPER, JOSE2
	startbattle
	reloadmapafterbattle
	loadmem wJoseFightCount, 2
	clearflag ENGINE_JOSE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BIRD_KEEPER, JOSE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOSE_READY_FOR_REMATCH
	end

.HasStarPiece:
	scall .Gift
	verbosegiveitem STAR_PIECE
	iffalsefwd .NoRoom
	clearflag ENGINE_JOSE_HAS_STAR_PIECE
	sjumpfwd .NumberAccepted

.NoRoom:
	sjumpfwd .PackFull

.AskNumber1:
	jumpstd asknumber1m

.AskNumber2:
	jumpstd asknumber2m

.RegisteredNumber:
	jumpstd registerednumberm

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

.Rematch:
	jumpstd rematchm

.Gift:
	jumpstd giftm

.PackFull:
	jumpstd packfullm

GenericTrainerCooltrainermBlake:
	generictrainer COOLTRAINERM, BLAKE, EVENT_BEAT_COOLTRAINERM_BLAKE, CooltrainermBlakeSeenText, CooltrainermBlakeBeatenText

	text "Si superas esta"
	line "dura travesía,"

	para "¡se revelará la"
	line "verdad!"

	para "Je, perdón, solo"
	line "quería decir algo"
	cont "guay."
	done

GenericTrainerAceDuoJakeandbri1:
	generictrainer ACE_DUO, JAKEANDBRI1, EVENT_BEAT_ACE_DUO_JAKE_AND_BRI, AceDuoJakeandbri1SeenText, AceDuoJakeandbri1BeatenText

	text "Jake: Un buen"
	line "entrenador"

	para "reconoce a otros"
	line "buenos"
	cont "entrenadores."
	done

GenericTrainerAceDuoJakeandbri2:
	generictrainer ACE_DUO, JAKEANDBRI2, EVENT_BEAT_ACE_DUO_JAKE_AND_BRI, AceDuoJakeandbri2SeenText, AceDuoJakeandbri2BeatenText

	text "Bri: Los buenos"
	line "entrenadores"

	para "también saben"
	line "luchar juntos."
	done

TrainerCooltrainerfReena:
	trainer COOLTRAINERF, REENA1, EVENT_BEAT_COOLTRAINERF_REENA, CooltrainerfReena1SeenText, CooltrainerfReena1BeatenText, 0, CooltrainerfReena1Script

CooltrainerfReena1Script:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERF_REENA
	opentext
	checkflag ENGINE_REENA_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkcellnum PHONE_COOLTRAINERF_REENA
	iftruefwd .NumberAccepted
	checkevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext CooltrainerfReenaAfterBattleText
	promptbutton
	setevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERF_REENA
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername COOLTRAINERF, REENA1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainerfReena1BeatenText, 0
	readmem wReenaFightCount
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
	loadtrainer COOLTRAINERF, REENA1
	startbattle
	reloadmapafterbattle
	loadmem wReenaFightCount, 1
	clearflag ENGINE_REENA_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer COOLTRAINERF, REENA2
	startbattle
	reloadmapafterbattle
	loadmem wReenaFightCount, 2
	clearflag ENGINE_REENA_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer COOLTRAINERF, REENA3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_REENA_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd asknumber1f

.AskNumber2:
	jumpstd asknumber2f

.RegisteredNumber:
	jumpstd registerednumberf

.NumberAccepted:
	jumpstd numberacceptedf

.NumberDeclined:
	jumpstd numberdeclinedf

.PhoneFull:
	jumpstd phonefullf

.Rematch:
	jumpstd rematchf

GenericTrainerCooltrainerfMegan:
	generictrainer COOLTRAINERF, MEGAN, EVENT_BEAT_COOLTRAINERF_MEGAN, CooltrainerfMeganSeenText, CooltrainerfMeganBeatenText

	text "Estoy comparando"
	line "#mon antes y"
	cont "después de"
	cont "evolucionar."

	para "La evolución de"
	line "verdad hace más"
	cont "fuertes a los"
	cont "#mon."

	para "Pero las formas"
	line "evolucionadas"
	cont "también aprenden"
	cont "movimientos más"
	cont "tarde."
	done

Route27FisherStepLeftTwiceMovement:
	step_left
	step_left
	turn_head_left
	step_end

Route27FisherHeyText:
	text "¡Oye!"
	done

Route27FisherText:
	text "¿Sabes lo que"
	line "acabas de hacer?"

	para "Diste tu primer"
	line "paso en Kanto."

	para "Mira el mapa de tu"
	line "#gear."
	done

CooltrainermBlakeSeenText:
	text "Te ves bastante"
	line "fuerte."
	cont "¡Déjame combatir"
	cont "contigo!"
	done

CooltrainermBlakeBeatenText: ; text > text
	text "¡Ay!"
	done

AceDuoJakeandbri1SeenText:
	text "Jake: ¿Hm? Eres"
	line "bueno, ¿verdad?"
	done

AceDuoJakeandbri1BeatenText:
	text "Jake: ¡Justo lo"
	line "que pensaba!"
	done

AceDuoJakeandbri2SeenText:
	text "Bri: ¡Los dos"
	line "juntos somos"
	cont "imparables!"
	done

AceDuoJakeandbri2BeatenText:
	text "Bri: Nuestro"
	line "trabajo en equipo"
	cont "no bastó…"
	done

CooltrainerfReena1SeenText:
	text "No deberías"
	line "subestimar a los"

	para "#mon salvajes"
	line "de esta zona."
	done

CooltrainerfReena1BeatenText:
	text "¡Oh! ¡Eres"
	line "demasiado fuerte!"
	done

CooltrainerfReenaAfterBattleText:
	text "Solo eres un niño,"
	line "pero no hay que"

	para "subestimarte a"
	line "ti tampoco."
	done

CooltrainerfMeganSeenText:
	text "Es raro ver a"
	line "alguien venir por"
	cont "aquí."

	para "¿Estás entrenando"
	line "tú solo?"
	done

CooltrainerfMeganBeatenText:
	text "¡Oh! ¡Eres muy"
	line "fuerte!"
	done

PsychicGilbertSeenText:
	text "¡No digas nada!"

	para "Déjame adivinar lo"
	line "que piensas."

	para "Mmmmmmm…"

	para "¡Lo tengo! ¡Vas a"
	line "por el reto de la"
	cont "Liga #mon!"
	done

PsychicGilbertBeatenText:
	text "¡Eres increíble!"
	done

Bird_keeperJose1SeenText:
	text "¡Pío! ¡Pío!"
	line "¡Piopío!"
	done

Bird_keeperJose1BeatenText:
	text "¡Pío!"
	done

BirdKeeperJose2AfterBattleText:
	text "Los Cetreros como"
	line "yo imitamos"
	cont "silbidos de aves"
	cont "para dar órdenes a"
	cont "los #mon."
	done

TohjoFallsSignText:
	text "Cascada Tohjo"

	para "El Enlace Entre"
	line "Kanto y Johto"
	done
