IcePathB3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, ICE_PATH_B2F_MAHOGANY_SIDE, 2
	warp_event 15,  5, ICE_PATH_B2F_BLACKTHORN_SIDE, 2

	def_coord_events

	def_bg_events
	bg_event 16,  3, BGEVENT_JUMPTEXT, Text_IcePathB3FIceRock

	def_object_events
	object_event 10,  3, SPRITE_LORELEI, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LoreleiScript, -1
	itemball_event  5,  7, NEVERMELTICE, 1, EVENT_ICE_PATH_B3F_NEVERMELTICE
	smashrock_event  6, 6

	object_const_def
	const ICEPATHB3F_LORELEI

LoreleiScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd LoreleiRematchScript
	checkevent EVENT_BEAT_LORELEI
	iftruefwd LoreleiAfterScript
	checkevent EVENT_INTRODUCED_LORELEI
	iftruefwd LoreleiAfterIntroScript
	writetext LoreleiIntroText
	waitbutton
	setevent EVENT_INTRODUCED_LORELEI
LoreleiAfterIntroScript:
	writetext LoreleiAfterIntroText
	yesorno
	iffalse_jumpopenedtext LoreleiNoBattleText
	writetext LoreleiSeenText
	waitbutton
	closetext
	winlosstext LoreleiBeatenText, 0
	setlasttalked ICEPATHB3F_LORELEI
	loadtrainer LORELEI, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LORELEI
	opentext
	writetext LoreleiRewardText
	promptbutton
	verbosegiveitem ICY_ROCK
	iffalsefwd LoreleiAfterScript
	setevent EVENT_GOT_ICY_ROCK_FROM_LORELEI
LoreleiAfterScript:
	readvar VAR_BADGES
	ifequalfwd NUM_JOHTO_BADGES, .AllEightBadges
	writetext LoreleiOneMoreBadgeText
	sjumpfwd .Finish

.AllEightBadges:
	writetext LoreleiAllBadgesText
.Finish
	promptbutton
	jumpthisopenedtext

	text "Si las venciste,"
	line "encuéntrame aquí"
	cont "para la revancha."
	done

LoreleiRematchScript:
	checkevent EVENT_BEAT_LORELEI_AGAIN
	iffalsefwd .DoRematch
	checkevent EVENT_GOT_ICY_ROCK_FROM_LORELEI
	iftrue_jumpopenedtext LoreleiRematchAfterText
	opentext
	sjumpfwd LoreleiGiveIcyRock
.DoRematch:
	checkevent EVENT_INTRODUCED_LORELEI
	iftruefwd LoreleiReintroductionScript
	writetext LoreleiIntroText
	waitbutton
	setevent EVENT_INTRODUCED_LORELEI
LoreleiAfterRematchIntroScript:
	writetext LoreleiRematchSeenText
	waitbutton
	closetext
	winlosstext LoreleiRematchBeatenText, 0
	setlasttalked ICEPATHB3F_LORELEI
	loadtrainer LORELEI, 3
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LORELEI_AGAIN
	opentext
	checkevent EVENT_GOT_ICY_ROCK_FROM_LORELEI
	iftrue_jumpopenedtext LoreleiRematchAfterText
LoreleiGiveIcyRock:
	writetext LoreleiRewardText
	promptbutton
	verbosegiveitem ICY_ROCK
	iffalse_jumpopenedtext LoreleiRematchAfterText
	setevent EVENT_GOT_ICY_ROCK_FROM_LORELEI
	jumpthisopenedtext

LoreleiRematchAfterText:
	text "Tu viaje no ha"
	line "terminado, ¿sabes?"

	para "Puedes ganar más"
	line "Medallas en Kanto,"

	para "atrapar nuevas"
	line "especies de"
	cont "#mon,"

	para "mejorar tú mismo y"
	line "tu equipo."

	para "Convertirte en"
	line "maestro #mon es"
	cont "obra de toda una"
	cont "vida."
	done

LoreleiReintroductionScript:
	writetext LoreleiRematchIntroAgainText
	waitbutton
	sjump LoreleiAfterRematchIntroScript

Text_IcePathB3FIceRock:
	text "La roca está"
	line "cubierta de hielo."

	para "Está helada al"
	line "tacto."
	done

LoreleiIntroText:
	text "Lorelei: Hola,"
	line "entrenador. Soy"
	cont "Lorelei."

	para "¿Ves esa roca"
	line "helada de ahí?"

	para "Emite una energía"
	line "que nunca había"
	cont "visto en Kanto."

	para "Como experta en"
	line "#mon tipo"
	cont "Hielo, tuve que"
	cont "investigarla."

	para "¿Y qué haces tú"
	line "aquí?"
	done

LoreleiAfterIntroText:
	text "Lorelei: Estás"
	line "aceptando el"

	para "desafío de la Liga"
	line "#mon. Ya veo."
	cont "Qué irónico."

	para "¿Por qué no pruebo"
	line "tu habilidad?"
	done

LoreleiNoBattleText:
	text "Si no puedes"
	line "enfrentarme a mí,"

	para "nunca podrás"
	line "vencer al Campeón."
	done

LoreleiSeenText:
	text "¡Jajaja!"
	line "¡Prepárate para"
	cont "quedar congelado!"
	done

LoreleiBeatenText:
	text "¡Eres mejor de lo"
	line "que pensaba!"
	done

LoreleiRewardText:
	text "Sabes cómo tratar"
	line "a los #mon tipo"
	cont "Hielo."

	para "Entonces puedes"
	line "usar este objeto."
	done

LoreleiRematchIntroAgainText:
	text "Lorelei: Hola de"
	line "nuevo, <PLAYER>."
	done

LoreleiRematchSeenText:
	text "¿Así que"
	line "combatiste contra"
	cont "el Alto Mando?"

	para "Espero que le"
	line "bajaras los humos"
	cont "a Karen."

	para "…………Eres el nuevo"
	line "Campeón. Estoy"
	cont "impresionada."

	para "¡Entonces no"
	line "tendré que"
	cont "contenerme!"
	done

LoreleiRematchBeatenText:
	text "¡Digno de un"
	line "Campeón!"
	done

LoreleiOneMoreBadgeText:
	text "Adelante. Puedes"
	line "retar a la Liga"

	para "#mon con una"
	line "Medalla más."
	done

LoreleiAllBadgesText:
	text "Adelante. Tienes"
	line "Medallas de sobra"

	para "para retar a la"
	line "Liga #mon."
	done
