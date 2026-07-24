Route45_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  5, DARK_CAVE_BLACKTHORN_ENTRANCE, 1
	warp_event 16, 22, HIDDEN_CAVE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 17,  5, BGEVENT_JUMPTEXT, Route45SignText
	bg_event 17, 78, BGEVENT_ITEM + PP_UP, EVENT_ROUTE_45_HIDDEN_PP_UP
	bg_event 16, 21, BGEVENT_JUMPSTD, cavegrotto, HIDDENGROTTO_ROUTE_45

	def_object_events
	object_event 19, 75, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, Route45Dragon_tamerScript, -1
	object_event  5, 59, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBattleGirlNozomi, -1
	object_event 12, 18, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerHikerErik, -1
	object_event 19, 65, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerMichael, -1
	object_event  7, 28, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerHikerParry, -1
	object_event 13, 65, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerHikerTimothy, -1
	object_event 16, 50, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltKenji, -1
	object_event 21, 18, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainermRyan, -1
	object_event  6, 33, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainerfKelly, -1
	fruittree_event 20, 80, FRUITTREE_ROUTE_45, LEPPA_BERRY, PAL_NPC_RED
	itemball_event  8, 51, NUGGET, 1, EVENT_ROUTE_45_NUGGET
	itemball_event  5, 66, REVIVE, 1, EVENT_ROUTE_45_REVIVE
	itemball_event  7, 20, ELIXIR, 1, EVENT_ROUTE_45_ELIXIR
	itemball_event 15, 32, MAX_POTION, 1, EVENT_ROUTE_45_MAX_POTION
	object_event  4, 70, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCamperQuentin, -1

	object_const_def
	const ROUTE45_DRAGON_TAMER

Route45Dragon_tamerScript:
	checkevent EVENT_GOT_FOCUS_SASH_FROM_ROUTE_45_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_DRAGON_TAMER_AEGON
	iftruefwd .Beaten
	checkevent EVENT_BEAT_BATTLE_GIRL_NOZOMI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BLACKBELT_KENJI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_HIKER_ERIK
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_HIKER_MICHAEL
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_HIKER_PARRY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_HIKER_TIMOTHY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_COOLTRAINERM_RYAN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_COOLTRAINERF_KELLY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_CAMPER_QUENTIN
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE45_DRAGON_TAMER
	loadtrainer DRAGON_TAMER, AEGON
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_DRAGON_TAMER_AEGON
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem FOCUS_SASH
	iffalse_endtext
	setevent EVENT_GOT_FOCUS_SASH_FROM_ROUTE_45_LEADER
	jumpthisopenedtext

.AfterText2:
	text "El arte de"
	line "entrenar #mon"
	cont "tipo Dragón es"
	cont "asombroso."

	para "Deberías hacerte"
	line "Domador de"
	cont "Dragones también."
	done

.IntroText:
	text "Estoy entrenando a"
	line "mis dragones aquí."

	para "¿Eh? ¿Un combate?"
	line "Quiero uno bueno,"

	para "así que"
	line "demuéstrame que"
	cont "eres fuerte."

	para "Vence a todos los"
	line "entrenadores de"

	para "esta ruta y"
	line "combatiré contigo."
	done

.QuestionText:
	text "Oh, ya estás"
	line "listo. Es hora de"
	cont "un duelo: tus"
	cont "#mon contra mis"
	cont "dragones."

	para "¿Empezamos ya?"
	done

.RefusedText:
	text "No hay problema."
	line "Seguiré"
	cont "entrenando."
	done

.SeenText:
	text "Veamos si puedes"
	line "con la"

	para "concentración"
	line "inquebrantable de"
	cont "mis dragones."
	cont "¡Ve, Dragonite!"
	done

.BeatenText:
	text "¡Qué poder! Mis"
	line "#mon no"
	cont "tuvieron"
	cont "oportunidad ante"
	cont "ti."
	done

.AfterText1:
	text "¡Tu fuerza"
	line "rivaliza con la"
	cont "mía!"

	para "Toma esto. Te lo"
	line "mereces."
	done

GenericTrainerBattleGirlNozomi:
	generictrainer BATTLE_GIRL, NOZOMI, EVENT_BEAT_BATTLE_GIRL_NOZOMI, BattleGirlNozomiSeenText, BattleGirlNozomiBeatenText

	text "¡Gracias por el"
	line "ejercicio,"
	cont "<PLAYER>!"
	done

TrainerBlackbeltKenji:
	trainer BLACKBELT_T, KENJI1, EVENT_BEAT_BLACKBELT_KENJI, BlackbeltKenji1SeenText, BlackbeltKenji1BeatenText, 0, BlackbeltKenji1Script

BlackbeltKenji1Script:
	loadvar VAR_CALLERID, PHONE_BLACKBELT_KENJI
	opentext
	checkcellnum PHONE_BLACKBELT_KENJI
	iftruefwd .Registered
	checkevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	special Special_SampleKenjiBreakCountdown
	writetext BlackbeltKenjiAfterBattleText
	waitbutton
	setevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	scall Route45AskNumber1M
	sjumpfwd .AskForNumber

.AskedAlready:
	scall Route45AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BLACKBELT_KENJI
	ifequalfwd $1, Route45PhoneFullM
	ifequalfwd $2, Route45NumberDeclinedM
	gettrainername BLACKBELT_T, KENJI1, STRING_BUFFER_3
	scall Route45RegisteredNumberM
	sjumpfwd Route45NumberAcceptedM

.Registered:
	readvar VAR_KENJI_BREAK
	ifnotequal $1, Route45NumberAcceptedM
	checktime 1 << MORN
	iftruefwd .Morning
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .Night
	checkevent EVENT_KENJI_ON_BREAK
	iffalsefwd Route45NumberAcceptedM
	scall Route45GiftM
	verbosegiveitem PP_UP
	iffalsefwd .NoRoom
	clearevent EVENT_KENJI_ON_BREAK
	special Special_SampleKenjiBreakCountdown
	sjumpfwd Route45NumberAcceptedM

.Morning:
	jumpthisopenedtext

	text "Voy a entrenar un"
	line "poco más antes de"
	cont "parar a comer."
	done

.Night:
	jumpthisopenedtext

	text "Descansamos bien"
	line "en la comida, así"

	para "que ya estamos"
	line "listos otra vez."

	para "¡Vamos a entrenar"
	line "de nuevo!"
	done

.NoRoom:
	sjumpfwd Route45PackFullM

Route45AskNumber1M:
	jumpstd asknumber1m

Route45AskNumber2M:
	jumpstd asknumber2m

Route45RegisteredNumberM:
	jumpstd registerednumberm

Route45NumberAcceptedM:
	jumpstd numberacceptedm

Route45NumberDeclinedM:
	jumpstd numberdeclinedm

Route45PhoneFullM:
	jumpstd phonefullm

Route45RematchM:
	jumpstd rematchm

Route45GiftM:
	jumpstd giftm

Route45PackFullM:
	jumpstd packfullm

HikerParryHasIron:
	setevent EVENT_PARRY_IRON
	jumpstd packfullm
	end

Route45RematchGiftM:
	jumpstd rematchgiftm

GenericTrainerHikerErik:
	generictrainer HIKER, ERIK, EVENT_BEAT_HIKER_ERIK, HikerErikSeenText, HikerErikBeatenText

	text "Volveré a la Ruta"
	line "Helada de Ciudad"
	cont "Endrino a"
	cont "entrenar más."
	done

GenericTrainerHikerMichael:
	generictrainer HIKER, MICHAEL, EVENT_BEAT_HIKER_MICHAEL, HikerMichaelSeenText, HikerMichaelBeatenText

	text "¡Cómo me encanta"
	line "el PS Más! ¡Mmm,"
	cont "qué rico!"

	para "¡Sigo bebiendo el"
	line "de mi #mon!"

	para "¡No puedo"
	line "evitarlo!"
	done

TrainerHikerParry:
	trainer HIKER, PARRY1, EVENT_BEAT_HIKER_PARRY, HikerParry1SeenText, HikerParry1BeatenText, 0, HikerParry1Script

HikerParry1Script:
	loadvar VAR_CALLERID, PHONE_HIKER_PARRY
	opentext
	checkflag ENGINE_PARRY_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkcellnum PHONE_HIKER_PARRY
	iftrue Route45NumberAcceptedM
	checkevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext HikerParryAfterBattleText
	promptbutton
	setevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	scall Route45AskNumber1M
	sjumpfwd .AskForNumber

.AskedAlready:
	scall Route45AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_HIKER_PARRY
	ifequal $1, Route45PhoneFullM
	ifequal $2, Route45NumberDeclinedM
	gettrainername HIKER, PARRY1, STRING_BUFFER_3
	scall Route45RegisteredNumberM
	sjump Route45NumberAcceptedM

.WantsBattle:
	scall Route45RematchM
	winlosstext HikerParry1BeatenText, 0
	readmem wParryFightCount
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
	loadtrainer HIKER, PARRY1
	startbattle
	reloadmapafterbattle
	loadmem wParryFightCount, 1
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer HIKER, PARRY2
	startbattle
	reloadmapafterbattle
	loadmem wParryFightCount, 2
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer HIKER, PARRY3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	checkevent EVENT_PARRY_IRON
	iftruefwd .HasIron
	checkevent EVENT_GOT_IRON_FROM_PARRY
	iftruefwd .GotIron
	scall Route45RematchGiftM
	verbosegiveitem IRON
	iffalse HikerParryHasIron
	setevent EVENT_GOT_IRON_FROM_PARRY
	sjump Route45NumberAcceptedM

.GotIron:
	end

.HasIron:
	opentext
	writetext HikerParryGivesIronText
	waitbutton
	verbosegiveitem IRON
	iffalse HikerParryHasIron
	clearevent EVENT_PARRY_IRON
	setevent EVENT_GOT_IRON_FROM_PARRY
	sjump Route45NumberAcceptedM

GenericTrainerHikerTimothy:
	generictrainer HIKER, TIMOTHY, EVENT_BEAT_HIKER_TIMOTHY, HikerTimothySeenText, HikerTimothyBeatenText

	text "Lo mejor que me ha"
	line "pasado nunca"

	para "fue descubrir a"
	line "los #mon."
	done

GenericTrainerCooltrainermRyan:
	generictrainer COOLTRAINERM, RYAN, EVENT_BEAT_COOLTRAINERM_RYAN, CooltrainermRyanSeenText, CooltrainermRyanBeatenText

	text "Veo que crías a"
	line "tus #mon con"
	cont "cuidado."

	para "El vínculo que"
	line "creas te salvará"
	cont "en situaciones"
	cont "difíciles."
	done

GenericTrainerCooltrainerfKelly:
	generictrainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText

	text "No estoy a favor"
	line "de los"
	cont "movimientos"
	cont "demasiado"
	cont "poderosos."

	para "Quiero ganar, pero"
	line "tampoco quiero"
	cont "dañar a los"
	cont "#mon."
	done

GenericTrainerCamperQuentin:
	generictrainer CAMPER, QUENTIN, EVENT_BEAT_CAMPER_QUENTIN, CamperQuentinSeenText, CamperQuentinBeatenText

	text "¿Has ido a la"
	line "Torre de Combate?"

	para "Nunca, jamás"
	line "pierdo allí,"
	cont "pero…"
	done

BattleGirlNozomiSeenText:
	text "¡Este no es lugar"
	line "para #mon"
	cont "débiles!"
	done

BattleGirlNozomiBeatenText:
	text "¡Vaya combate!"
	done

HikerErikSeenText:
	text "¡Prepárate para"
	line "cualquier cosa!"

	para "¡Veamos si tus"
	line "#mon fueron"
	cont "criados bien!"
	done

HikerErikBeatenText:
	text "¡Vaya, perdí eso!"
	done

HikerMichaelSeenText:
	text "¡Ey! ¡Tienes"
	line "agallas! ¿Pero"
	cont "sabes qué?"

	para "En cuanto a"
	line "agallas de"
	cont "verdad, ¡yo soy"
	cont "el mejor!"
	done

HikerMichaelBeatenText:
	text "¡A mis #mon les"
	line "faltaron"
	cont "agallas!"
	done

HikerParry1SeenText:
	text "¡Mis #mon están"
	line "cargados de"
	cont "poder!"
	done

HikerParry1BeatenText:
	text "¡Wajajajá! ¡Soy el"
	line "gran perdedor!"
	done

HikerParryAfterBattleText:
	text "No se me da bien"
	line "pensar, ¿sabes?"

	para "Así que avanzo con"
	line "pura fuerza."
	done

HikerTimothySeenText:
	text "¿Por qué escalo"
	line "montañas?"

	para "Porque están"
	line "ahí."

	para "¿Por qué entreno"
	line "#mon?"

	para "¡Porque están"
	line "ahí!"
	done

HikerTimothyBeatenText:
	text "Las derrotas…"
	line "¡También están"
	cont "ahí!"
	done

HikerParryGivesIronText:
	text "¡No encuentro la"
	line "forma de ganar!"

	para "¡Sigue así!"

	para "Oh, y toma esto,"
	line "es el regalo"

	para "que no pudiste"
	line "llevarte la última"
	cont "vez que nos vimos."
	done

BlackbeltKenji1SeenText:
	text "Estaba"
	line "entrenando aquí"
	cont "solo."

	para "¡Contempla los"
	line "frutos de mi"
	cont "esfuerzo!"
	done

BlackbeltKenji1BeatenText:
	text "¡Waaaargh!"
	done

BlackbeltKenjiAfterBattleText:
	text "Esto exige"
	line "medidas extremas."

	para "Debo ir a las"
	line "colinas y"
	cont "entrenar en"
	cont "soledad."
	done



CooltrainermRyanSeenText:
	text "¿Qué opinas sobre"
	line "criar #mon?"
	done

CooltrainermRyanBeatenText:
	text "Te has ganado mi"
	line "respeto."
	done

CooltrainerfKellySeenText:
	text "¿Cuál es tu"
	line "estrategia de"
	cont "combate?"

	para "Es una tontería"
	line "usar movimientos"
	cont "fuertes sin"
	cont "cuidado."
	done

CooltrainerfKellyBeatenText:
	text "Bien. Perdí."
	done

CamperQuentinSeenText:
	text "¡Soy muy, muy"
	line "duro!"

	para "¿Hay algún sitio"
	line "donde pueda"
	cont "demostrarlo?"
	done

CamperQuentinBeatenText:
	text "Era duro en la"
	line "Torre de Combate…"
	done

Route45SignText:
	text "Ruta 45"
	line "Camino de Montaña"
	cont "adelante"
	done
