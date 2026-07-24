ManiasHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 1
	warp_event  3,  7, CIANWOOD_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_JUMPSTD, radio2
	bg_event  7,  1, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1

ManiaScript:
	faceplayer
	opentext
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftruefwd .default_postevent
	checkevent EVENT_GOT_SHUCKIE
	iftruefwd .alreadyhaveshuckie
	writetext ManiaText_AskLookAfterShuckie
	yesorno
	iffalsefwd .refusetotakeshuckie
	givepoke SHUCKLE, MALE | PLAIN_FORM, 25, BERRY_JUICE, NET_BALL, POISON_JAB, ShuckieName, ShuckieOTName, KIRK_SHUCKIE_ID
	iffalse_jumpopenedtext ManiaText_PartyAndBoxFull
	writetext ManiaText_TakeCareOfShuckie
	promptbutton
	waitsfx
	writetext ManiaText_GotShuckie
	playsound SFX_KEY_ITEM
	waitsfx
	ifequalfwd 1, .shuckieinparty
	special Special_CurBoxFullCheck
	iffalsefwd .BoxNotFull
	farwritetext _CurBoxFullText
.BoxNotFull
	special GetCurBoxName
	writetext ManiaText_ShuckieSentToPC
	promptbutton
.shuckieinparty
	closetext
	setevent EVENT_GOT_SHUCKIE
	setflag ENGINE_GOT_SHUCKIE_TODAY
	end

.alreadyhaveshuckie
	checkflag ENGINE_GOT_SHUCKIE_TODAY
	iffalsefwd .returnshuckie
	jumpopenedtext ManiaText_TakeCareOfShuckie

.refusetotakeshuckie
	jumpthisopenedtext

	text "Oh, no… ¿Qué haré"
	line "si vuelve?"
	done

.returnshuckie
	writetext ManiaText_CanIHaveMyMonBack
	yesorno
	iffalsefwd .refused
	special ReturnShuckie
	ifequalfwd $0, .wrong
	ifequalfwd $1, .refused
	ifequalfwd $3, .superhappy
	ifequalfwd $4, .default_postevent
	writetext ManiaText_ThankYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.wrong
	jumpthisopenedtext

	text "Oye, no traes a"
	line "mi #mon"
	cont "contigo."
	done

.superhappy
	writetext ManiaText_ShuckieLikesYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.refused
	jumpthisopenedtext

	text "Oh, no, no… Eso"
	line "sería como un"
	cont "robo."
	done

.nothingleft
	jumpthisopenedtext

	text "Si recupero a mi"
	line "#mon, ¿Qué vas"

	para "a usar en"
	line "combate?"
	done

.default_postevent
	jumpthisopenedtext

	text "Para los #mon,"
	line "la felicidad es"

	para "estar con alguien"
	line "que los trata"
	cont "bien."
	done

ShuckieName:
	rawchar "Shuckie@"

ShuckieOTName:
	rawchar "Kirk@"

ManiaText_AskLookAfterShuckie:
	text "¡Estoy en shock!"

	para "Un tipo de tu edad"
	line "con mirada"
	cont "penetrante y pelo"
	cont "largo entró aquí."

	para "¡Me asustó tanto"
	line "que le di mi"
	cont "#mon más"
	cont "preciado!"

	para "Aún me queda uno,"
	line "pero ¿Y si"
	cont "vuelve?"

	para "Te ves fuerte."
	line "¿Podrías cuidar de"

	para "mi #mon un"
	line "tiempo?"
	done

ManiaText_TakeCareOfShuckie:
	text "¡Oh, gracias!"

	para "¡Cuídalo bien,"
	line "por favor!"
	done

ManiaText_GotShuckie:
	text "<PLAYER> recibió"
	line "un #mon."
	done

ManiaText_ShuckieSentToPC:
	text "El #mon se"
	line "envió a "
	text_ram wStringBuffer1
	text "."
	done

ManiaText_PartyAndBoxFull:
	text "Tu equipo #mon"
	line "y tu Caja están"
	cont "llenos."
	done


ManiaText_CanIHaveMyMonBack:
	text "¡Hola! ¿Cómo está"
	line "mi #mon?"

	para "Creo que ya estoy"
	line "a salvo, ¿Me lo"
	cont "devuelves?"
	done

ManiaText_ThankYou:
	text "¡Gracias!"
	done


ManiaText_ShuckieLikesYou:
	text "Mi #mon ha"
	line "llegado a"
	cont "quererte."

	para "Bien, deberías"
	line "quedártelo."

	para "¡Pero prométeme"
	line "que lo tratarás"
	cont "bien!"
	done
