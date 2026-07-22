IlexForestAzaleaGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  4, ILEX_FOREST, 2
	warp_event  0,  5, ILEX_FOREST, 3
	warp_event  9,  4, AZALEA_TOWN, 7
	warp_event  9,  5, AZALEA_TOWN, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, IlexForestAzaleaGateOfficerText, -1
	object_event  1,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, IlexForestAzaleaGateGrannyText, -1
	object_event  8,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ProfOaksAide1Script, -1

ProfOaksAide1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_EXP_SHARE_FROM_PROF_OAKS_AIDE
	iftruefwd .Explain
	writetext ProfOaksAide1HiText
	waitbutton
	setval16 15
	special CountCaught
	iftruefwd .HereYouGo
.UhOh
	jumpopenedtext ProfOaksAide1UhOhText

.HereYouGo
	writetext ProfOaksAide1HereYouGoText
	waitbutton
	verbosegiveitem EXP_SHARE
	iffalsefwd .NoRoom
	setevent EVENT_GOT_EXP_SHARE_FROM_PROF_OAKS_AIDE
.Explain
	jumpthisopenedtext

	text "El Compart. Exp"
	line "ayuda a un #mon"
	cont "a ganar"
	cont "experiencia sin"
	cont "combatir."

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

IlexForestAzaleaGateOfficerText:
	text "El Encinar es"
	line "grande. ¡Ten"
	cont "cuidado! No te"
	cont "pierdas."
	done

IlexForestAzaleaGateGrannyText:
	text "El bosque está"
	line "vigilado por su"
	cont "protector."

	para "¡No hagas"
	line "travesuras!"
	done

ProfOaksAide1HiText:
	text "¡Hola! Soy"
	line "ayudante del"
	cont "Prof. Oak."

	para "Si atrapaste 15"
	line "tipos de #mon,"

	para "se supone que debo"
	line "darte un objeto."

	para "Así que, <PLAYER>,"
	line "¿atrapaste al"

	para "menos 15 tipos de"
	line "#mon?"
	done

ProfOaksAide1UhOhText:
	text "A ver…"
	line "¡Ay! Solo has"
	cont "atrapado"

	para ""
	text_decimal wTempDexOwn, 2, 3
	text " tipos"
	line "de #mon."

	para "Vuelve a verme"
	line "cuando atrapes"
	cont "15 tipos."
	done

ProfOaksAide1HereYouGoText:
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
