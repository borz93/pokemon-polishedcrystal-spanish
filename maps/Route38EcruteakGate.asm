Route38EcruteakGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  4, ROUTE_38, 1
	warp_event  0,  5, ROUTE_38, 2
	warp_event  9,  4, ECRUTEAK_CITY, 14
	warp_event  9,  5, ECRUTEAK_CITY, 15

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route38EcruteakGateOfficerText, -1
	object_event  8,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ProfOaksAide2Script, -1

ProfOaksAide2Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_LINKING_CORD_FROM_PROF_OAKS_AIDE
	iftruefwd .Explain
	writetext ProfOaksAide2HiText
	waitbutton
	setval16 30
	special CountCaught
	iftruefwd .HereYouGo
.UhOh
	jumpopenedtext ProfOaksAide2UhOhText

.HereYouGo
	writetext ProfOaksAide2HereYouGoText
	waitbutton
	verbosegiveitem LINKING_CORD
	iffalsefwd .NoRoom
	setevent EVENT_GOT_LINKING_CORD_FROM_PROF_OAKS_AIDE
.Explain
	jumpthisopenedtext

	text "El Cable Enlace"
	line "da a ciertos"

	para "#mon una"
	line "sensación de"
	cont "conexión que"
	cont "podría ayudarlos"
	cont "a evolucionar."

	para "Puedes usarlo"
	line "para completar"
	cont "la #dex!"
	done

.NoRoom
	jumpthisopenedtext

	text "¡Ah! Veo que no"
	line "tienes espacio"
	cont "para esto."
	done

Route38EcruteakGateOfficerText:
	text "¿De dónde dijiste"
	line "que eras?"

	para "¿Pueblo"
	line "Primavera?"

	para "El Prof. Elm vive"
	line "por allí, ¿no?"

	para "Has recorrido un"
	line "largo camino."
	done

ProfOaksAide2HiText:
	text "¡Hola! Soy"
	line "ayudante del"
	cont "Prof. Oak."

	para "Si atrapaste 30"
	line "tipos de #mon,"

	para "se supone que debo"
	line "darte un objeto."

	para "Así que, <PLAYER>,"
	line "¿atrapaste al"

	para "menos 30 tipos de"
	line "#mon?"
	done

ProfOaksAide2UhOhText:
	text "A ver…"
	line "¡Ay! Solo has"
	cont "atrapado"

	para ""
	text_decimal wTempDexOwn, 2, 3
	text " tipos"
	line "de #mon."

	para "Vuelve a verme"
	line "cuando atrapes"
	cont "30 tipos."
	done

ProfOaksAide2HereYouGoText:
	text "A ver… ¡Buen"
	line "trabajo! Has"
	cont "atrapado"

	para ""
	text_decimal wTempDexOwn, 2, 3
	text " tipos"
	line "de #mon."

	para "¡Felicidades!"
	line "¡Aquí tienes!"
	done
