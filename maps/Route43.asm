Route43_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route43CheckIfRocketsScript
	callback MAPCALLBACK_TILES, Route43RainScript

	def_warp_events
	warp_event  9, 51, ROUTE_43_MAHOGANY_GATE, 1
	warp_event 10, 51, ROUTE_43_MAHOGANY_GATE, 2
	warp_event 17, 35, ROUTE_43_GATE, 3
	warp_event 17, 31, ROUTE_43_GATE, 1
	warp_event 18, 31, ROUTE_43_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 13,  3, BGEVENT_JUMPTEXT, Route43Sign1Text
	bg_event 11, 49, BGEVENT_JUMPTEXT, Route43Sign2Text
	bg_event 16, 38, BGEVENT_JUMPTEXT, Route43TrainerTipsText
	bg_event  7, 42, BGEVENT_JUMPTEXT, Route43AdvancedTipsText

	def_object_events
	object_event  1,  6, SPRITE_LADY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route43SightseerfScript, -1
	object_event 13,  5, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacBen, -1
	object_event 13, 20, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacBrent1, -1
	object_event 14,  7, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacRon, -1
	object_event  4, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerFisherMarvin, -1
	object_event  8, 10, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTiffany1, -1
	object_event 13, 40, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperSpencer, -1
	object_event  8, 32, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBreederJody, -1
	object_event 11, 24, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrIvyandamy1, -1
	object_event 11, 25, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrIvyandamy2, -1
	cuttree_event  2, 28, EVENT_ROUTE_43_CUT_TREE
	fruittree_event  1, 26, FRUITTREE_ROUTE_43, PERSIM_BERRY, PAL_NPC_PINK
	itemball_event 12, 32, MAX_ETHER, 1, EVENT_ROUTE_43_MAX_ETHER

	object_const_def
	const ROUTE43_SIGHTSEER_F

Route43CheckIfRocketsScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd Route43NoRocketsScript
	setmapscene ROUTE_43_GATE, SCENE_ROUTE43GATE_ROCKET_SHAKEDOWN
	endcallback

Route43RainScript:
	special Special_GetOvercastIndex
	ifequalfwd LAKE_OF_RAGE_OVERCAST, .flood
	changemapblocks Route43_BlockData
	endcallback

.flood
	changemapblocks Route43Raining_BlockData
	endcallback

Route43NoRocketsScript:
	setmapscene ROUTE_43_GATE, SCENE_ROUTE43GATE_NOOP
	endcallback

Route43SightseerfScript:
	checkevent EVENT_GOT_FLAME_ORB_FROM_ROUTE_43_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_SIGHTSEERF_LENIE
	iftruefwd .Beaten
	checkevent EVENT_BEAT_BREEDER_JODY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_SR_AND_JR_IVY_AND_AMY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_CAMPER_SPENCER
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEMANIAC_BEN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEMANIAC_BRENT
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEMANIAC_RON
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_FISHER_MARVIN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PICNICKER_TIFFANY
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE43_SIGHTSEER_F
	loadtrainer SIGHTSEERF, LENIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SIGHTSEERF_LENIE
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem FLAME_ORB
	iffalse_endtext
	setevent EVENT_GOT_FLAME_ORB_FROM_ROUTE_43_LEADER
	jumpthisopenedtext

.AfterText2:
	text "Me encanta"
	line "visitar lugares"
	cont "nuevos y"

	para "retar a cada"
	line "entrenador de"
	cont "allí."

	para "Seguiré buscando"
	line "entrenadores"
	cont "fuertes como tú."
	done

.IntroText:
	text "Busco"
	line "entrenadores"
	cont "fuertes en Johto,"
	cont "pero no he"
	cont "encontrado a"
	cont "ninguno."

	para "Mmm… Pareces"
	line "prometedor."

	para "Lo veo en tus"
	line "ojos."

	para "Luchemos, pero"
	line "antes quiero"

	para "que conquistes"
	line "esta ruta"

	para "venciendo a"
	line "todos los demás."
	done

.QuestionText:
	text "¡Genial! Hora de"
	line "probar mi nueva"
	cont "estrategia…"

	para "¿Lista para"
	line "luchar?"
	done

.RefusedText:
	text "Ay… ¡Estaba tan"
	line "ansiosa!"

	para "¡No me hagas"
	line "esperar!"
	done

.SeenText:
	text "Veamos qué tan"
	line "fuertes son los"
	cont "entrenadores de"
	cont "Johto."

	para "¡Enfrenta mi"
	line "estrategia de la"
	cont "Esfera Llama!"
	done

.BeatenText:
	text "¡Genial! ♥"
	done

.AfterText1:
	text "¡Vaya! ¡Al fin"
	line "encontré lo que"
	cont "buscaba!"

	para "Te daré una"
	line "Esfera Llama,"

	para "pero ten cuidado"
	line "si se la das a"
	cont "un #mon."
	done

GenericTrainerBreederJody:
	generictrainer BREEDER, JODY, EVENT_BEAT_BREEDER_JODY, BreederJodySeenText, BreederJodyBeatenText

	text "Un #mon bebé"
	line "a veces puede"

	para "heredar un"
	line "movimiento de su"
	cont "padre,"

	para "incluso uno que"
	line "normalmente no"
	cont "aprendería."
	done

GenericTrainerSrandjrIvyandamy1:
	generictrainer SR_AND_JR, IVYANDAMY1, EVENT_BEAT_SR_AND_JR_IVY_AND_AMY, SrandjrIvyandamy1SeenText, SrandjrIvyandamy1BeatenText

	text "Ivy: No quiero"
	line "que mi junior"
	cont "piense que no"
	cont "puedo ayudarla."
	done

GenericTrainerSrandjrIvyandamy2:
	generictrainer SR_AND_JR, IVYANDAMY2, EVENT_BEAT_SR_AND_JR_IVY_AND_AMY, SrandjrIvyandamy2SeenText, SrandjrIvyandamy2BeatenText

	text "Amy: Espero que"
	line "mi senior notara"
	cont "mi esfuerzo."
	done

GenericTrainerCamperSpencer:
	generictrainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText

	text "¿Qué pasa en el"
	line "Lago de la Furia?"

	para "Queríamos acampar"
	line "ahí."
	done

GenericTrainerPokemaniacBen:
	generictrainer POKEMANIAC, BEN, EVENT_BEAT_POKEMANIAC_BEN, PokemaniacBenSeenText, PokemaniacBenBeatenText

	text "¿Qué más me"
	line "gusta aparte"
	cont "de los #mon?"

	para "Mary de la radio."
	line "¡Seguro es linda!"
	done

TrainerPokemaniacBrent1:
	trainer POKEMANIAC, BRENT1, EVENT_BEAT_POKEMANIAC_BRENT, PokemaniacBrent1SeenText, PokemaniacBrent1BeatenText, 0, PokemaniacBrent1Script

PokemaniacBrent1Script:
	loadvar VAR_CALLERID, PHONE_POKEMANIAC_BRENT
	opentext
	checkflag ENGINE_BRENT_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkcellnum PHONE_POKEMANIAC_BRENT
	iftruefwd .NumberAccepted
	checkevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext PokemaniacBrentAfterBattleText
	promptbutton
	setevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEMANIAC_BRENT
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername POKEMANIAC, BRENT1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PokemaniacBrent1BeatenText, 0
	readmem wBrentFightCount
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	reloadmapafterbattle
	loadmem wBrentFightCount, 1
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	reloadmapafterbattle
	loadmem wBrentFightCount, 2
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	reloadmapafterbattle
	loadmem wBrentFightCount, 3
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer POKEMANIAC, BRENT4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
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

GenericTrainerPokemaniacRon:
	generictrainer POKEMANIAC, RON, EVENT_BEAT_POKEMANIAC_RON, PokemaniacRonSeenText, PokemaniacRonBeatenText

	text "Está bien que a"
	line "la gente le"
	cont "gusten distintos"
	cont "tipos de #mon."

	para "Lo importante no"
	line "es tener el"
	cont "#mon más"
	cont "poderoso."
	done

GenericTrainerFisherMarvin:
	generictrainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText

	text "La Cebo Ball de"
	line "Kurt es la mejor"

	para "para atrapar"
	line "#mon"
	cont "pescados."

	para "Es mucho más"
	line "efectiva que una"
	cont "Ultra Ball."
	done

TrainerPicnickerTiffany1:
	trainer PICNICKER, TIFFANY1, EVENT_BEAT_PICNICKER_TIFFANY, PicnickerTiffany1SeenText, PicnickerTiffany1BeatenText, 0, PicnickerTiffany1Script

PicnickerTiffany1Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_TIFFANY
	opentext
	checkflag ENGINE_TIFFANY_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkflag ENGINE_TIFFANY_HAS_FAIRYFEATHER
	iftruefwd .HasFairyFeather
	checkcellnum PHONE_PICNICKER_TIFFANY
	iftruefwd .NumberAccepted
	checkpoke CLEFAIRY
	iffalsefwd .NoClefairy
	checkevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext PicnickerTiffanyWantsPicnicText
	promptbutton
	setevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_TIFFANY
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername PICNICKER, TIFFANY1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PicnickerTiffany1BeatenText, 0
	readmem wTiffanyFightCount
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, TIFFANY1
	startbattle
	reloadmapafterbattle
	loadmem wTiffanyFightCount, 1
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, TIFFANY2
	startbattle
	reloadmapafterbattle
	loadmem wTiffanyFightCount, 2
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, TIFFANY3
	startbattle
	reloadmapafterbattle
	loadmem wTiffanyFightCount, 3
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, TIFFANY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.HasFairyFeather:
	scall .Gift
	verbosegiveitem FAIRYFEATHER
	iffalsefwd .NoRoom
	clearflag ENGINE_TIFFANY_HAS_FAIRYFEATHER
	setevent EVENT_TIFFANY_GAVE_FAIRYFEATHER
	sjumpfwd .NumberAccepted

.NoRoom:
	sjumpfwd .PackFull

.NoClefairy:
	jumpthisopenedtext

	text "¿No es mi"
	line "Clefairy lo más"
	cont "adorable?"
	done

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

.Gift:
	jumpstd giftf

.PackFull:
	jumpstd packfullf

PokemaniacBenSeenText:
	text "¡Amo a los #mon!"

	para "¡Por eso"
	line "empecé... y por"
	cont "eso seguiré"

	para "coleccionando"
	line "#mon!"
	done

PokemaniacBenBeatenText:
	text "¿Cómo pudiste"
	line "hacerme esto?"
	done

PokemaniacBrent1SeenText:
	text "¡Oye! ¿Tienes"
	line "algún #mon raro?"
	done

PokemaniacBrent1BeatenText:
	text "¡Ay, mis pobres"
	line "#mon! ¡Cariños!"
	done

PokemaniacBrentAfterBattleText:
	text "Sería feliz con"
	line "tener un solo"
	cont "#mon raro."
	done

PokemaniacRonSeenText:
	text "¿Puedes creerlo?"

	para "¡Un tal <RIVAL>"
	line "se burló de mis"
	cont "#mon!"

	para "¡Rayos! ¡Mis"
	line "#mon son"
	cont "geniales!"
	done

PokemaniacRonBeatenText:
	text "¡Mi Nidoking lo"
	line "hizo genial!"
	done

FisherMarvinSeenText:
	text "Estoy en racha"
	line "mala."

	para "Quizás es el"
	line "equipo que uso."

	para "¡Luchemos para"
	line "variar!"
	done

FisherMarvinBeatenText:
	text "Perdí, pero aun"
	line "así me siento"
	cont "mejor."
	done

CamperSpencerSeenText:
	text "Puedo hacer tanto"
	line "con mis #mon,"
	cont "¡es genial!"
	done

CamperSpencerBeatenText:
	text "Perder no es"
	line "nada divertido…"
	done

PicnickerTiffany1SeenText:
	text "¿También vas al"
	line "Lago de la Furia?"

	para "¡Juguemos un"
	line "rato!"
	done

PicnickerTiffany1BeatenText:
	text "¡Jugué demasiado!"
	done

PicnickerTiffanyWantsPicnicText:
	text "Estoy de pic-"
	line "nic con #mon."

	para "¿No te unes?"
	done


BreederJodySeenText:
	text "¡Crié a mis #mon"
	line "para que sepan"
	cont "movimientos"
	cont "especiales!"
	done

BreederJodyBeatenText:
	text "¡Perdí igual!"
	done

SrandjrIvyandamy1SeenText:
	text "¡Ivy: Le mostraré"
	line "a mi junior cómo"
	cont "se hace!"
	done

SrandjrIvyandamy1BeatenText:
	text "Ivy: Me"
	line "avergonzaste"
	cont "frente a mi"
	cont "junior…"
	done

SrandjrIvyandamy2SeenText:
	text "Amy: ¡Un"
	line "entrenador!"
	cont "Senior, ¡ayúdame"
	cont "a ganar!"
	done

SrandjrIvyandamy2BeatenText:
	text "Amy: No pudimos…"
	done

Route43Sign1Text:
	text "Ruta 43"

	para "Lago de la Furia -"
	line "Pueblo Mahogany"
	done

Route43Sign2Text:
	text "Ruta 43"

	para "Lago de la Furia -"
	line "Pueblo Mahogany"
	done

Route43TrainerTipsText:
	text "Consejos de"
	line "Entrenador"

	para "Todos los #mon"
	line "tienen pros y"
	cont "contras según"
	cont "su tipo."

	para "Si los tipos"
	line "difieren, un"
	cont "#mon de más"
	cont "nivel puede"
	cont "perder."

	para "Aprende qué tipos"
	line "son fuertes y"
	cont "débiles contra el"
	cont "tipo de tu #mon."
	done

Route43AdvancedTipsText:
	text "¡Consejos"
	line "avanzados!"

	para "¡Un #mon puede"
	line "heredar su"
	cont "naturaleza"

	para "si lleva una"
	line "Piedra Eterna!"

	para "¡Un Lazo Fatal"
	line "transmite todo"
	cont "su potencial!"

	para "¡Los seis"
	line "objetos Poder"

	para "transmiten"
	line "potencial en"
	cont "una stat!"

	para "¡Y un Tope de"
	line "Habilidad"

	para "aumenta las"
	line "posibilidades"
	cont "de una habilidad"
	cont "oculta!"
	done
