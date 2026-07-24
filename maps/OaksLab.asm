OaksLab_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  0,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  1,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  2,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  3,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  6,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  4,  0, BGEVENT_JUMPTEXT, OaksLabPoster1Text
	bg_event  5,  0, BGEVENT_JUMPTEXT, OaksLabPoster2Text
	bg_event  0,  1, BGEVENT_JUMPTEXT, OaksLabPCText

	def_object_events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  7,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, EEVEE, -1, PAL_MON_BROWN, OBJECTTYPE_SCRIPT, NO_FORM, EeveeDollScript, EVENT_DECO_EEVEE_DOLL
	object_event  1,  8, SPRITE_AROMA_LADY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, OaksAssistant1Text, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OaksAssistant2Text, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OaksAssistant3Text, -1
	object_event  2,  1, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptext, OaksLabPokedexText, -1

	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_EEVEE_DOLL

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftruefwd .GiveStarter
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftruefwd .GiveStarter
	writetext OakWelcomeKantoText
	promptbutton
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.GiveStarter:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftruefwd .CheckBadges
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iffalsefwd .CheckBadges
	writetext OakLabGiveStarterText
	promptbutton
	waitsfx
	checkevent EVENT_GOT_BULBASAUR_FROM_IVY
	iftruefwd .Charmander
	checkevent EVENT_GOT_CHARMANDER_FROM_IVY
	iftruefwd .Squirtle
	givepoke BULBASAUR, PLAIN_FORM, 10, SITRUS_BERRY
	iffalsefwd .PartyAndBoxFull
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	sjumpfwd .CheckBadges

.Charmander:
	givepoke CHARMANDER, PLAIN_FORM, 10, SITRUS_BERRY
	iffalsefwd .PartyAndBoxFull
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	sjumpfwd .CheckBadges

.Squirtle:
	givepoke SQUIRTLE, PLAIN_FORM, 10, SITRUS_BERRY
	iffalsefwd .PartyAndBoxFull
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	sjumpfwd .CheckBadges

.PartyAndBoxFull:
	writetext OakLabPartyAndBoxFullText
	waitbutton
.CheckBadges:
	checkevent EVENT_OPENED_MT_SILVER
	iftruefwd .CheckPokedex
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .BattleOak
	readvar VAR_BADGES
	ifequalfwd 16, .Complain1
	ifequalfwd  8, .Complain2
	writetext OakYesKantoBadgesText
	promptbutton
.CheckPokedex:
	checkkeyitem CATCH_CHARM
	iftruefwd .GotCatchCharm
	writetext OakLabCatchMoreText
	promptbutton
	verbosegivekeyitem CATCH_CHARM
	writetext OakLabCatchCharmText
	waitbutton
.GotCatchCharm
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	checkkeyitem OVAL_CHARM
	iftruefwd .NoOvalCharm
	setval16 NUM_POKEMON
	special CountSeen
	iffalsefwd .NoOvalCharm
	writetext OakLabSeenAllText
	promptbutton
	verbosegivekeyitem OVAL_CHARM
	writetext OakLabOvalCharmText
	waitbutton
.NoOvalCharm
	checkkeyitem SHINY_CHARM
	iftruefwd .NoShinyCharm
	setval16 NUM_POKEMON
	special CountCaught
	iffalsefwd .NoShinyCharm
	writetext OakLabCaughtAllText
	promptbutton
	verbosegivekeyitem SHINY_CHARM
	writetext OakLabShinyCharmText
	waitbutton
.NoShinyCharm
	jumpthisopenedtext

	text "Si estás por la"
	line "zona, espero que"
	cont "vuelvas."
	done

.BattleOak:
	checkevent EVENT_LISTENED_TO_OAK_INTRO
	iftruefwd .HeardIntro
	writetext OakMightBeReadyText
	waitbutton
	setevent EVENT_LISTENED_TO_OAK_INTRO
.HeardIntro:
	writetext OakChallengeText
	yesorno
	iffalsefwd .NotReady
	writetext OakSeenText
	waitbutton
	closetext
	winlosstext OakWinText, 0
	setlasttalked OAKSLAB_OAK
	loadtrainer PROF_OAK, 1
	startbattle
	reloadmapafterbattle
	opentext
	writetext OakOpenMtSilverText
	promptbutton
	setevent EVENT_BEAT_PROF_OAK
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.NotReady:
	writetext OakRefusedText
	promptbutton
	sjump .CheckPokedex

.Complain1:
	writetext OakNoEliteFourRematchText
	promptbutton
	sjump .CheckPokedex

.Complain2:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedex

EeveeDollScript:
	turnobject OAKSLAB_OAK, RIGHT
	opentext
	writetext ProfOakEeveeDollTradeText
	waitbutton
	checkitem EVERSTONE
	iffalse_jumpopenedtext NoEverstoneText
	writetext WantToTradeText
	yesorno
	iffalse_jumpopenedtext NoTradeText
	takeitem EVERSTONE
	disappear OAKSLAB_EEVEE_DOLL
	setevent EVENT_DECO_EEVEE_DOLL
	writetext EeveeDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext EeveeDollSentText
	waitbutton
	jumpthisopenedtext

	text "Prof. Oak: Ponlo"
	line "donde puedas"
	cont "apreciarlo!"
	done

OakWelcomeKantoText:
	text "Oak: ¡Ah, <PLAYER>!"
	line "Qué bien que"

	para "vengas hasta"
	line "Kanto."

	para "¿Qué opinas de"
	line "los entrenadores"

	para "de aquí? Son"
	line "duros, ¿Eh?"
	done

OakLabGiveStarterText:
	text "Oak: Vaya, ¿La"
	line "Prof. Ivy te"
	cont "envía saludos?"

	para "Gracias por"
	line "transmitir su"
	cont "mensaje,"
	cont "<PLAYER>."

	para "Es una buena"
	line "amiga mía."

	para "Si ella te dio"
	line "un #mon, ¡deja"
	cont "que yo haga lo"
	cont "mismo!"

	para "No se ve este"
	line "#mon muy a"
	cont "menudo en Kanto"
	cont "o Johto."
	done

OakLabPartyAndBoxFullText:
	text "Vaya, no tienes"
	line "sitio, y tu"
	cont "Caja está llena."
	done

OakLabDexCheckText:
	text "¿Cómo va tu"
	line "#dex?"

	para "A ver…"
	done

OakLabCatchMoreText:
	text "Quiero darte las"
	line "gracias por"

	para "ayudarme tanto"
	line "rellenando la"
	cont "#dex."

	para "Toma esto como"
	line "recompensa por"
	cont "tu esfuerzo!"
	done

OakLabCatchCharmText:
	text "Llevar un"
	line "Amul.Captura"
	cont "mejora tus"

	para "opciones de"
	line "captura crítica."

	para "Eso pasa cuando"
	line "tu # Ball se"
	cont "lanza en el"
	cont "momento justo"

	para "y tiene más"
	line "posibilidades"
	cont "de acertar!"
	done

OakLabSeenAllText:
	text "Has estado"
	line "conociendo #mon"
	cont "nuevos a buen"

	para "ritmo, ¿Verdad?"

	para "Toma esto como"
	line "recompensa por"
	cont "tu esfuerzo!"
	done

OakLabOvalCharmText:
	text "Llevar un"
	line "Amuleto Oval"
	cont "mejora tus"

	para "opciones de"
	line "encontrar un"
	cont "Huevo en la"
	cont "Guardería."
	done

OakLabCaughtAllText:
	text "Tenía toda la"
	line "razón al darte"
	cont "esa #dex."

	para "Es un testimonio"
	line "de tu esfuerzo…"

	para "Y del apoyo de"
	line "los muchos que"
	cont "te ayudaron…"

	para "Y de los lazos"
	line "que has creado"
	cont "con tu #mon!"

	para "Toma esto como"
	line "recompensa por"
	cont "tu esfuerzo!"
	done

OakLabShinyCharmText:
	text "Llevar un"
	line "Amuleto Iris"
	cont "mejora tus"

	para "opciones de"
	line "encontrar"
	cont "un #mon"
	cont "shiny!"
	done


OakMightBeReadyText:
	text "Oak: ¡Increíble,"
	line "<PLAYER>!"

	para "Ganaste contra"
	line "el Alto Mando"
	cont "por segunda"
	cont "vez!"

	para "Quizá ya estés"
	line "listo para subir"
	cont "al Monte"
	cont "Plateado."
	done

OakChallengeText:
	text "Oak: El Monte"
	line "Plateado es una"
	cont "montaña alta"

	para "hogar de muchos"
	line "#mon salvajes."

	para "Es muy peligroso"
	line "para un"
	cont "entrenador"
	cont "normal, así"

	para "que está"
	line "prohibido."

	para "Necesito ver"
	line "tus habilidades"
	cont "yo mismo."

	para "¿Listo para"
	line "combatir?"
	done

OakRefusedText:
	text "Oak: Vuelve"
	line "cuando estés"
	cont "listo."
	done

OakSeenText:
	text "Oak: ¡Dalo todo"
	line "en este"
	cont "combate!"
	done

OakWinText:
	text "¡Tenía razón"
	line "sobre ti!"
	done

OakOpenMtSilverText:
	text "Oak:"
	line "¡Espectacular,"
	cont "<PLAYER>!"

	para "Haré arreglos"
	line "para que puedas"
	cont "ir al Monte"
	cont "Plateado."

	para "Es inusual, pero"
	line "podemos hacer"
	cont "una excepción en"
	cont "tu caso,"
	cont "<PLAYER>."

	para "Sube a la Meseta"
	line "Añil. Desde allí"

	para "llegarás al Monte"
	line "Plateado."

	para "…"

	para "Dejé que Red"
	line "entrenara en el"
	cont "Monte Plateado"

	para "tras su primera"
	line "derrota como"
	cont "Campeón."

	para "Pero no ha"
	line "vuelto…"
	done

OakNoKantoBadgesText:
	text "Oak: ¿Eh? ¿No"
	line "estás"
	cont "consiguiendo"
	cont "medallas de"
	cont "Kanto?"

	para "Los Líderes de"
	line "Gimnasio de Kanto"
	cont "son tan duros"

	para "como los que"
	line "combatiste en"
	cont "Johto."

	para "Te recomiendo"
	line "que los retes."
	done

OakNoEliteFourRematchText:
	text "Oak: ¡Vaya! Eso"
	line "es excelente!"

	para "Conseguiste las"
	line "medallas de los"
	cont "gimnasios de"
	cont "Kanto. ¡Bien"
	cont "hecho!"

	para "Ahora puedes"
	line "retar al Alto"
	cont "Mando con sus"
	cont "mejores #mon."

	para "¡Sigue"
	line "esforzándote,"
	cont "<PLAYER>!"
	done

OakYesKantoBadgesText:
	text "Oak: Ah, estás"
	line "consiguiendo"
	cont "medallas de"
	cont "Kanto."

	para "Imagino que es"
	line "duro, pero la"

	para "experiencia te"
	line "ayudará."

	para "Cuando tengas"
	line "las ocho, podrás"
	cont "retar al Alto"

	para "Mando en su"
	line "mejor forma."

	para "¡Sigue"
	line "esforzándote,"
	cont "<PLAYER>!"
	done

OaksAssistant1Text:
	text "El programa de"
	line "radio #mon Talk"
	cont "del Profesor"

	para "no se emite"
	line "aquí en Kanto."

	para "Es una pena, me"
	line "gustaría oírlo."
	done

OaksAssistant2Text:
	text "Gracias a tu"
	line "trabajo con la"
	cont "#dex, la"

	para "investigación"
	line "del Profesor va"
	cont "genial."
	done

OaksAssistant3Text:
	text "No se lo digas"
	line "a nadie, pero el"
	cont "#mon Talk del"

	para "Prof. Oak no lo"
	line "emite en directo."
	done

OaksLabPoster1Text:
	text "Pulsa Start para"
	line "abrir el Menú."
	done

OaksLabPoster2Text:
	text "La opción Guardar"
	line "está en el Menú."

	para "Guárdala a"
	line "menudo."
	done

OaksLabPCText:
	text "Hay un correo en"
	line "el ordenador."

	para "…"

	para "Prof. Oak, ¿Cómo"
	line "va su"
	cont "investigación?"

	para "Sigo dándole"
	line "duro."

	para "Oí rumores de"
	line "que <PLAYER> se"
	cont "está haciendo"

	para "una reputación."

	para "Me alegra oír"
	line "eso."

	para "Elm, desde"
	line "Pueblo"
	cont "Primavera 8-)"
	done

ProfOakEeveeDollTradeText:
	text "Oak: Vaya,"
	line "¿Admiras mi"
	cont "Muñeco Eevee?"

	para "Te lo cambio"
	line "por una"
	cont "Piedra Eterna"
	done

NoEverstoneText:
	text "Pero no tienes"
	line "ninguna…"
	done

WantToTradeText:
	text "¿Quieres"
	line "intercambiar?"
	done

NoTradeText:
	text "Seguirá aquí"
	line "por si cambias"
	cont "de idea."
	done

EeveeDollText:
	text "<PLAYER> recibió"
	line "un Muñeco Eevee."
	done

EeveeDollSentText:
	text "El Muñeco Eevee"
	line "fue enviado a"
	cont "casa."
	done


OaksLabPokedexText:
	text "Es la #dex del"
	line "Prof. Oak."
	done
