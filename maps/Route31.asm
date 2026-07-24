Route31_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route31CheckMomCall

	def_warp_events
	warp_event  4,  6, ROUTE_31_VIOLET_GATE, 3
	warp_event  4,  7, ROUTE_31_VIOLET_GATE, 4
	warp_event 34,  5, DARK_CAVE_VIOLET_ENTRANCE, 1

	def_coord_events

	def_bg_events
	bg_event  7,  5, BGEVENT_JUMPTEXT, Route31SignText
	bg_event 31,  5, BGEVENT_JUMPTEXT, DarkCaveSignText
	bg_event 13, 14, BGEVENT_JUMPTEXT, Route31AdvancedTipsSignText

	def_object_events
	object_event 28,  7, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermFinch, -1
	object_event 17,  7, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31MailRecipientScript, -1
	object_event  9,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route31YoungsterText, -1
	object_event 21, 13, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 5, TrainerBug_catcherWade1, -1
	cuttree_event 13,  5, EVENT_ROUTE_31_CUT_TREE_1
	cuttree_event 25, 10, EVENT_ROUTE_31_CUT_TREE_2
	fruittree_event 16,  7, FRUITTREE_ROUTE_31, PERSIM_BERRY, PAL_NPC_PINK
	itemball_event 29,  5, POTION, 1, EVENT_ROUTE_31_POTION
	itemball_event 19, 15, POKE_BALL, 1, EVENT_ROUTE_31_POKE_BALL

	object_const_def
	const ROUTE31_COOLTRAINER_M

Route31CheckMomCall:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iffalsefwd .DoMomCall
	endcallback

.DoMomCall:
	specialphonecall SPECIALCALL_WORRIED
	endcallback

TrainerCooltrainermFinch:
	trainer 0, 0, EVENT_INTRODUCED_ROUTE_LEADERS, .IntroText, 0, 0, .Script

.Script:
	endifjustbattled
	checkevent EVENT_GOT_AIR_BALLOON_FROM_ROUTE_31_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERM_FINCH
	iftruefwd .Beaten
	checkevent EVENT_BEAT_YOUNGSTER_JOEY
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_YOUNGSTER_MIKEY
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_BUG_CATCHER_DON
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_BUG_CATCHER_WADE
	iffalse_jumpopenedtext .IntroText
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE31_COOLTRAINER_M
	loadtrainer COOLTRAINERM, FINCH
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_FINCH
	opentext
.Beaten:
	writetext .AfterText1
	promptbutton
	verbosegiveitem AIR_BALLOON
	iffalse_endtext
	setevent EVENT_GOT_AIR_BALLOON_FROM_ROUTE_31_LEADER
	jumpthisopenedtext

.AfterText2:
	text "Viste el efecto"
	line "de un Globo Aéreo"
	cont "en nuestro"
	cont "combate."

	para "Puede que"
	line "encuentres a otros"
	cont "entrenadores como"
	cont "yo por Johto."

	para "Buscando"
	line "fuerza."

	para "¡Harías bien en"
	line "retarlos!"
	done

.IntroText:
	text "Soy un entrenador"
	line "que usa Globos"
	cont "Aéreos en"
	cont "combate."

	para "Quiero verme"
	line "superado por tu"
	cont "fuerza…"

	para "Si vences a todos"
	line "los entrenadores"
	cont "de las Rutas 30 y"
	cont "31, ven a verme."
	done

.QuestionText:
	text "Así que has"
	line "vencido a todos"
	cont "los entrenadores"
	cont "de aquí!"

	para "Entonces estás"
	line "listo para"
	cont "retarme!"

	para "¿Combatimos?"
	done

.RefusedText:
	text "¿No quieres medir"
	line "tu fuerza con la"
	cont "mía?"

	para "Te daré mi objeto"
	line "insignia si"
	cont "ganas…"
	done

.SeenText:
	text "¡Bien hallado!"
	line "Me presento ante"
	cont "ti"

	para "como usuario de"
	line "Globo Aéreo!"
	done

.BeatenText:
	text "Me has hecho caer"
	line "al suelo…"
	done

.AfterText1:
	text "¡Un gran combate!"
	line "Eres una estrella"

	para "en ascenso entre"
	line "entrenadores!"

	para "Aquí tienes"
	line "prueba de nuestro"
	cont "combate."
	cont "¡Un Globo Aéreo!"

	para "Tómalo, mi fuerte"
	line "amigo!"
	done

TrainerBug_catcherWade1:
	trainer BUG_CATCHER, WADE1, EVENT_BEAT_BUG_CATCHER_WADE, Bug_catcherWade1SeenText, Bug_catcherWade1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BUG_CATCHER_WADE
	opentext
	checkflag ENGINE_WADE_READY_FOR_REMATCH
	iftruefwd .WadeRematch
	checkflag ENGINE_WADE_HAS_ITEM
	iftruefwd .WadeItem
	checkcellnum PHONE_BUG_CATCHER_WADE
	iftruefwd .AcceptedNumberSTD
	checkevent EVENT_WADE_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext Bug_catcherWade1AfterText
	waitbutton
	setevent EVENT_WADE_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	sjumpfwd .Continue

.AskAgain:
	callstd asknumber2m
.Continue:
	askforphonenumber PHONE_BUG_CATCHER_WADE
	ifequalfwd $1, .PhoneFullSTD
	ifequalfwd $2, .DeclinedNumberSTD
	gettrainername BUG_CATCHER, WADE1, STRING_BUFFER_3
	callstd registerednumberm
	jumpstd numberacceptedm

.WadeRematch:
	callstd rematchm
	winlosstext Bug_catcherWade1BeatenText, 0
	readmem wWadeFightCount
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
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer BUG_CATCHER, WADE1
	startbattle
	reloadmapafterbattle
	loadmem wWadeFightCount, 1
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BUG_CATCHER, WADE2
	startbattle
	reloadmapafterbattle
	loadmem wWadeFightCount, 2
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BUG_CATCHER, WADE3
	startbattle
	reloadmapafterbattle
	loadmem wWadeFightCount, 3
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer BUG_CATCHER, WADE4
	startbattle
	reloadmapafterbattle
	loadmem wWadeFightCount, 4
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer BUG_CATCHER, WADE5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.WadeItem:
	callstd giftm
	checkevent EVENT_WADE_HAS_ORAN_BERRY
	iftruefwd .OranBerry
	checkevent EVENT_WADE_HAS_PECHA_BERRY
	iftruefwd .PechaBerry
	checkevent EVENT_WADE_HAS_CHERI_BERRY
	iftruefwd .CheriBerry
	checkevent EVENT_WADE_HAS_PERSIM_BERRY
	iftruefwd .PersimBerry
.OranBerry:
	verbosegiveitem ORAN_BERRY
	iffalsefwd .PackFull
	sjumpfwd .Done
.PechaBerry:
	verbosegiveitem PECHA_BERRY
	iffalsefwd .PackFull
	sjumpfwd .Done
.CheriBerry:
	verbosegiveitem CHERI_BERRY
	iffalsefwd .PackFull
	sjumpfwd .Done
.PersimBerry:
	verbosegiveitem PERSIM_BERRY
	iffalsefwd .PackFull
.Done:
	clearflag ENGINE_WADE_HAS_ITEM
	jumpstd numberacceptedm
.PackFull:
	jumpstd packfullm

.AcceptedNumberSTD:
	jumpstd numberacceptedm

.DeclinedNumberSTD:
	jumpstd numberdeclinedm

.PhoneFullSTD:
	jumpstd phonefullm

Route31MailRecipientScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_KENYA
	iftruefwd .TutorSleepTalk
	checkevent EVENT_GOT_KENYA
	iftruefwd .TryGiveKenya
	jumpthisopenedtext

	text "…Hnuurg… ¿Eh?"

	para "Hoy caminé"
	line "demasiado"
	cont "buscando #mon."

	para "Me duelen los pies"
	line "y tengo sueño…"

	para "Si fuera un"
	line "#mon salvaje,"
	cont "sería fácil de"
	cont "atrapar…"

	para "…Zzzz…"
	done

.TryGiveKenya:
	writetext Text_Route31SleepyManGotMail
	promptbutton
	checkpokemail ReceivedSpearowMailText
	ifequalfwd $0, .WrongMail
	ifequalfwd $2, .Refused
	ifequalfwd $3, .NoMail
	ifequalfwd $4, .LastMon
	writetext Text_Route31HandOverMailMon
	promptbutton
	writetext Text_Route31ReadingMail
	promptbutton
	setevent EVENT_GAVE_KENYA
.TutorSleepTalk
	writetext Text_Route31TutorSleepTalk
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Route31TutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval SLEEP_TALK
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Bueno, vale…"
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "No tienes una"
	line "Hoja Plata,"
	cont "aunque…"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Listo! Ahora tu"
	line "#mon sabe"
	cont "Sonámbulo!"
	done

.WrongMail:
	jumpthisopenedtext

	text "Esta Carta no es"
	line "para mí."
	done

.NoMail:
	jumpthisopenedtext

	text "¿Por qué es tan"
	line "especial este"
	cont "#mon?"

	para "No tiene ninguna"
	line "Carta."
	done

.Refused:
	jumpthisopenedtext

	text "¿Qué? ¿No quieres"
	line "nada?"
	done

.LastMon:
	jumpthisopenedtext

	text "Si te quito ese"
	line "#mon,"

	para "¿Qué usarás en"
	line "combate?"
	done

ReceivedSpearowMailText:
	setcharmap no_ngrams
	db   "La Cueva Oscura"
	next "lleva a otra vía@"
	setcharmap default

Bug_catcherWade1SeenText:
	text "Atrapé un montón"
	line "de #mon."
	cont "¡Déjame combatir"
	cont "contigo!"
	done

Bug_catcherWade1BeatenText:
	text "Uuuuh…"
	done

Bug_catcherWade1AfterText:
	text "Puedes atrapar"
	line "#mon aunque"

	para "tengas seis"
	line "contigo."

	para "Si atrapas uno,"
	line "irá directo a tu"
	cont "Caja."
	done


Text_Route31SleepyManGotMail:
	text "…Zzzz… ¿Eh?"

	para "¿Qué es eso? ¿Una"
	line "Carta para mí?"
	done

Text_Route31HandOverMailMon:
	text "<PLAYER> entregó"
	line "el #mon que"
	cont "llevaba la Carta."
	done

Text_Route31ReadingMail:
	text "A ver…"

	para "…La Cueva Oscura"
	line "lleva a otra vía…"

	para "Qué bien saberlo."

	para "Gracias por"
	line "traérmelo."

	para "Mi amigo es buena"
	line "gente, ¡Y tú"
	cont "también!"

	para "Me gustaría hacer"
	line "algo bueno a"
	cont "cambio!"
	done

Text_Route31TutorSleepTalk:
	text "Por solo una"
	line "Hoja Plata,"

	para "puedo enseñar a tu"
	line "#mon a hablar"
	cont "dormido!"
	done


Text_Route31TutorQuestion:
	text "¿Le enseño"
	line "Sonámbulo a tu"
	cont "#mon?"
	done







Route31YoungsterText:
	text "Encontré un buen"
	line "#mon en la"
	cont "Cueva Oscura."

	para "Voy a criarlo para"
	line "enfrentarme a"
	cont "Pegaso."

	para "Es el líder del"
	line "Gimnasio de"
	cont "Ciudad Malva."
	done

Route31SignText:
	text "Ruta 31"

	para "Ciudad Malva -"
	line "Ciudad Cerezo"
	done

DarkCaveSignText:
	text "Cueva Oscura"
	done

Route31AdvancedTipsSignText:
	text "¡Consejos"
	line "Avanzados!"

	para "Pulsa Start en el"
	line "Bolso para"
	cont "ordenar un"
	cont "bolsillo!"
	done
