Route26_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  8,  5, POKEMON_LEAGUE_GATE, 3
	warp_event 15, 57, ROUTE_26_HEAL_SPEECH_HOUSE, 1
	warp_event  5, 71, ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 10,  6, BGEVENT_JUMPTEXT, Route26SignText

	def_object_events
	object_event  9, 38, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerDragonTamerKazu, -1
	object_event 14, 24, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermGaven1, -1
	object_event 10, 56, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainerfJoyce, -1
	object_event  5,  8, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfBeth1, -1
	object_event 13, 79, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPsychicRichard, -1
	object_event  2, 82, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBattleGirlRonda, -1
	object_event  6, 100, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherScott, -1
	object_event 10, 92, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerDragonTamerErick, -1
	fruittree_event 14, 54, FRUITTREE_ROUTE_26, SITRUS_BERRY, PAL_NPC_BROWN
	itemball_event  9, 15, MAX_ELIXIR, 1, EVENT_ROUTE_26_MAX_ELIXIR
	tmhmball_event 13, 34, TM_DRAGON_CLAW, EVENT_ROUTE_26_TM_DRAGON_CLAW

GenericTrainerDragonTamerKazu:
	generictrainer DRAGON_TAMER, KAZU, EVENT_BEAT_DRAGON_TAMER_KAZU, DragonTamerKazuSeenText, DragonTamerKazuBeatenText

	text "Va a ser duro"
	line "ganar en la Liga."

	para "Necesito"
	line "entrenar un poco"
	cont "más."

	para "He oído que el"
	line "Alto Mando de la"

	para "Liga es más duro"
	line "que los Líderes"
	cont "de Gimnasio."
	done

TrainerCooltrainermGaven1:
	trainer COOLTRAINERM, GAVEN1, EVENT_BEAT_COOLTRAINERM_GAVEN, CooltrainermGaven1SeenText, CooltrainermGaven1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERM_GAVEN
	opentext
	checkflag ENGINE_GAVEN_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkcellnum PHONE_COOLTRAINERM_GAVEN
	iftruefwd .NumberAccepted
	checkevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext CooltrainermGavenAfterText
	promptbutton
	setevent EVENT_GAVEN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERM_GAVEN
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername COOLTRAINERM, GAVEN1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainermGaven1BeatenText, 0
	readmem wGavenFightCount
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
	loadtrainer COOLTRAINERM, GAVEN1
	startbattle
	reloadmapafterbattle
	loadmem wGavenFightCount, 1
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer COOLTRAINERM, GAVEN2
	startbattle
	reloadmapafterbattle
	loadmem wGavenFightCount, 2
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer COOLTRAINERM, GAVEN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GAVEN_READY_FOR_REMATCH
	end

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

GenericTrainerCooltrainerfJoyce:
	generictrainer COOLTRAINERF, JOYCE, EVENT_BEAT_COOLTRAINERF_JOYCE, CooltrainerfJoyceSeenText, CooltrainerfJoyceBeatenText

	text "He derrotado a"
	line "ocho Líderes de"
	cont "Gimnasio,"

	para "así que me sentía"
	line "segura."

	para "Tendré que"
	line "esforzarme más la"
	cont "próxima vez."
	done

TrainerCooltrainerfBeth1:
	trainer COOLTRAINERF, BETH1, EVENT_BEAT_COOLTRAINERF_BETH, CooltrainerfBeth1SeenText, CooltrainerfBeth1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERF_BETH
	opentext
	checkflag ENGINE_BETH_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkcellnum PHONE_COOLTRAINERF_BETH
	iftruefwd .NumberAccepted
	checkevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext CooltrainerfBethAfterText
	promptbutton
	setevent EVENT_BETH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERF_BETH
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername COOLTRAINERF, BETH1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainerfBeth1BeatenText, 0
	readmem wBethFightCount
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
	loadtrainer COOLTRAINERF, BETH1
	startbattle
	reloadmapafterbattle
	loadmem wBethFightCount, 1
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer COOLTRAINERF, BETH2
	startbattle
	reloadmapafterbattle
	loadmem wBethFightCount, 2
	clearflag ENGINE_BETH_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer COOLTRAINERF, BETH3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BETH_READY_FOR_REMATCH
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

GenericTrainerPsychicRichard:
	generictrainer PSYCHIC_T, RICHARD, EVENT_BEAT_PSYCHIC_RICHARD, PsychicRichardSeenText, PsychicRichardBeatenText

	text "Las personas y los"
	line "#mon crecen con"
	cont "sus experiencias."

	para "No te vuelvas"
	line "perezoso ni"
	cont "confiado."
	done

GenericTrainerBattleGirlRonda:
	generictrainer BATTLE_GIRL, RONDA, EVENT_BEAT_BATTLE_GIRL_RONDA, BattleGirlRondaSeenText, BattleGirlRondaBeatenText

	text "Por aquí pasan"
	line "algunos de los"

	para "entrenadores más"
	line "fuertes del mundo."

	para "¡Y yo puedo"
	line "luchar contra"
	cont "todos ellos!"
	done

GenericTrainerFisherScott:
	generictrainer FISHER, SCOTT, EVENT_BEAT_FISHER_SCOTT, FisherScottSeenText, FisherScottBeatenText

	text "Igual que pescar,"
	line "todo se acaba en"

	para "los #mon si te"
	line "rindes."
	done

GenericTrainerDragonTamerErick:
	generictrainer DRAGON_TAMER, ERICK, EVENT_BEAT_DRAGON_TAMER_ERICK, DragonTamerErickSeenText, DragonTamerErickBeatenText

	text "La Ruta Victoria"
	line "es dura."

	para "Cada entrenador"
	line "debe abrirse su"
	cont "propio camino."
	done

DragonTamerKazuSeenText:
	text "Estoy haciendo mis"
	line "últimos"
	cont "preparativos para"
	cont "la Liga #mon."
	done

DragonTamerKazuBeatenText:
	text "¡La he fastidiado!"
	done

CooltrainermGaven1SeenText:
	text "Se gana poder"
	line "viviendo combates"
	cont "duros."
	done

CooltrainermGaven1BeatenText:
	text "¡Argh! ¡La vida es"
	line "aún más dura!"
	done

CooltrainermGavenAfterText:
	text "Para llegar a la"
	line "Liga #mon,"

	para "tienes que"
	line "atravesar la Ruta"
	cont "Victoria."

	para "Pero la Ruta"
	line "Victoria es dura."

	para "¡Casi nadie va"
	line "allí!"
	done

CooltrainerfJoyceSeenText:
	text "Ya que has llegado"
	line "tan lejos, debes"
	cont "ser buena."

	para "¡Voy a darlo todo"
	line "en este combate!"
	done

CooltrainerfJoyceBeatenText:
	text "¡No! ¡No puedo"
	line "creerlo!"
	done

CooltrainerfBeth1SeenText:
	text "Perdí contra un"
	line "entrenador llamado"
	cont "<RIVAL>."

	para "Era muy fuerte,"
	line "pero…"

	para "Era como si"
	line "tuviera que ganar"
	cont "sí o sí, a"
	cont "cualquier precio."

	para "Sentí lástima por"
	line "sus #mon."
	done

CooltrainerfBeth1BeatenText:
	text "Los #mon no son"
	line "herramientas de"
	cont "guerra."
	done

CooltrainerfBethAfterText:
	text "Los #mon son"
	line "compañeros de"
	cont "valor incalculable"
	cont "de por vida."
	done

PsychicRichardSeenText:
	text "Vaya, ¡mira todas"
	line "esas Medallas!"
	cont "Estoy"
	cont "impresionado."

	para "Pero no te"
	line "conformas solo con"

	para "coleccionarlas,"
	line "¿verdad?"
	done

PsychicRichardBeatenText:
	text "¡Buen combate!"
	done

BattleGirlRondaSeenText:
	text "¡Alto! ¡Te reto a"
	line "un duelo!"
	done

BattleGirlRondaBeatenText:
	text "¡La victoria es"
	line "tuya!"
	done

FisherScottSeenText:
	text "¡Hoy me siento"
	line "genial!"

	para "¡Siento que podría"
	line "vencer hasta al"
	cont "Campeón de la"
	cont "Liga!"
	done

FisherScottBeatenText:
	text "¡No! ¡En este"
	line "combate no!"
	done

DragonTamerErickSeenText:
	text "¡Aquí hay"
	line "dragones!"
	done

DragonTamerErickBeatenText:
	text "Mis dragones"
	line "fueron"
	cont "conquistados…"
	done

Route26SignText:
	text "Ruta 26"

	para "Puerta de"
	line "Recepción de la"
	cont "Liga #mon"
	done
