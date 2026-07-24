Route35GoldenrodGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, ROUTE_35, 1
	warp_event  5,  0, ROUTE_35, 2
	warp_event  4,  7, GOLDENROD_CITY, 12
	warp_event  5,  7, GOLDENROD_CITY, 12

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  6,  4, SPRITE_BREEDER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGatePokefanFScript, -1
	object_event  3,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route35GoldenrodGateFisherText, -1

RandyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_RANDY
	iftruefwd .gothpup
	checkevent EVENT_GAVE_KENYA
	iftruefwd .questcomplete
	checkevent EVENT_GOT_KENYA
	iftruefwd .alreadyhavekenya
	writetext Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText
	yesorno
	iffalsefwd .refused
	readvar VAR_PARTYCOUNT
	ifequalfwd PARTY_LENGTH, .partyfull
	writetext Route35GoldenrodGateRandyThanksText
	promptbutton
	waitsfx
	writetext Route35GoldenrodGatePlayerReceivedAMonWithMailText
	playsound SFX_KEY_ITEM
	waitsfx
	givepoke SPEAROW, FEMALE | PLAIN_FORM, 10, NO_ITEM, NET_BALL, NO_MOVE, GiftSpearowName, GiftSpearowOTName, 01001
	givepokemail GiftSpearowMail
	setevent EVENT_GOT_KENYA
.alreadyhavekenya
	jumpthisopenedtext

	text "Puedes leerlo,"
	line "pero ¡no lo"
	cont "pierdas! ¡Ruta 31!"

	para "Ah, sí. Había un"
	line "árbol raro"
	cont "bloqueando el"
	cont "camino."

	para "Me pregunto si ya"
	line "lo habrán"
	cont "despejado."
	done

.partyfull
	jumpthisopenedtext

	text "No puedes llevar"
	line "otro #mon…"
	done

.refused
	jumpthisopenedtext

	text "Oh… Da igual,"
	line "entonces…"
	done

.questcomplete
	writetext Route35GoldenrodGateRandySomethingForYourTroubleText
	promptbutton
	verbosegiveitem HP_UP
	iffalsefwd .bagfull
	setevent EVENT_GOT_HP_UP_FROM_RANDY
.gothpup
	writetext Route35GoldenrodGateRandyMyPalWasSnoozingRightText
	waitbutton
.bagfull
	endtext

GiftSpearowMail:
	db   FLOWER_MAIL
	setcharmap no_ngrams
	db   "Dark Cave leads"
	next "to another road@"
	setcharmap default

GiftSpearowName:
	rawchar "Kenya@"

GiftSpearowOTName:
	rawchar "Randy@"

Route35GoldenrodGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftruefwd .aftersudowoodo
	jumpthisopenedtext

	text "Un árbol extraño"
	line "bloquea el camino."

	para "Se retuerce si le"
	line "hablas."

	para "Oí que se volvió"
	line "salvaje cuando"

	para "alguien lo regó"
	line "con una"
	cont "Regadera."
	done

.aftersudowoodo
	jumpthisopenedtext

	text "Me gusta la"
	line "Nana #mon que"
	cont "ponen en la radio."
	done

Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText:
	text "¡Perdona, chaval!"
	line "¿Me haces un"
	cont "favor?"

	para "¿Puedes llevarle"
	line "este #mon con"
	cont "un Correo a mi"
	cont "amigo?"

	para "Está en la Ruta"
	line "31."
	done

Route35GoldenrodGateRandyThanksText:
	text "¿Sí? ¡Genial!"
	line "¡Gracias, chaval!"

	para "Mi amigo es un tío"
	line "rechoncho que"
	cont "siempre está"
	cont "dormitando."

	para "¡Lo reconocerás al"
	line "instante!"
	done

Route35GoldenrodGatePlayerReceivedAMonWithMailText:
	text "<PLAYER> recibió"
	line "un #mon con"
	cont "Correo."
	done




Route35GoldenrodGateRandySomethingForYourTroubleText:
	text "¡Gracias, chaval!"
	line "¡Hiciste la"
	cont "entrega por mí!"

	para "¡Toma algo por las"
	line "molestias!"
	done

Route35GoldenrodGateRandyMyPalWasSnoozingRightText:
	text "Mi amigo estaba"
	line "dormitando, ¿A que"
	cont "sí? Je, ¿Qué te"
	cont "dije?"
	done



Route35GoldenrodGateFisherText:
	text "Me pregunto"
	line "cuántos tipos de"
	cont "#mon hay en el"
	cont "mundo."

	para "Hace tres años, el"
	line "Prof.Oak dijo que"

	para "había 150 tipos"
	line "diferentes."
	done
