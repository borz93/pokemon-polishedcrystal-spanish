CliffEdgeGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 17, 19, CIANWOOD_CITY, 8
	warp_event  3, 19, ROUTE_47, 1

	def_coord_events

	def_bg_events
	bg_event 17,  6, BGEVENT_ITEM + OVAL_STONE, EVENT_CLIFF_EDGE_GATE_HIDDEN_OVAL_STONE

	def_object_events
	object_event 11, 16, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CliffEdgeGateReceptionistText, EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	object_event  3,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ProfOaksAide3Script, EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	object_event 17, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM12, EVENT_CLEARED_YELLOW_FOREST

ProfOaksAide3Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_MACHO_BRACE_FROM_PROF_OAKS_AIDE
	iftruefwd .Explain
	writetext ProfOaksAide3HiText
	waitbutton
	setval16 45
	special CountCaught
	iftruefwd .HereYouGo
.UhOh
	jumpopenedtext ProfOaksAide3UhOhText

.HereYouGo
	writetext ProfOaksAide3HereYouGoText
	waitbutton
	verbosegiveitem MACHO_BRACE
	iffalsefwd .NoRoom
	setevent EVENT_GOT_MACHO_BRACE_FROM_PROF_OAKS_AIDE
.Explain
	jumpthisopenedtext

	text "El Brazal Firme"
	line "ayuda a un #mon"

	para "a crecer más al"
	line "combatir, pero lo"
	cont "ralentiza."
	done

.NoRoom
	jumpthisopenedtext

	text "¡Ah! Veo que no"
	line "tienes espacio"
	cont "para esto."
	done

GenericTrainerGruntM12:
	generictrainer GRUNTM, 12, EVENT_BEAT_ROCKET_GRUNTM_12, GruntM12SeenText, GruntM12BeatenText

	text "El Bosque"
	line "Amarillo está"
	cont "lleno de #mon"
	cont "raros."

	para "¡Nos los quedamos"
	line "todos!"
	done

CliffEdgeGateReceptionistText:
	text "¡El Bosque"
	line "Amarillo está por"
	cont "aquí!"

	para "¡Es un lugar"
	line "turístico muy"
	cont "popular!"
	done

ProfOaksAide3HiText:
	text "¡Hola! Soy"
	line "ayudante del"
	cont "Prof. Oak."

	para "Si atrapaste 45"
	line "tipos de #mon,"

	para "se supone que debo"
	line "darte un objeto."

	para "Así que, <PLAYER>,"
	line "¿Atrapaste al"

	para "menos 45 tipos de"
	line "#mon?"
	done

ProfOaksAide3UhOhText:
	text "A ver…"
	line "¡Ay! Solo has"
	cont "atrapado"

	para ""
	text_decimal wTempDexOwn, 2, 3
	text " tipos"
	line "de #mon."

	para "Vuelve a verme"
	line "cuando atrapes"
	cont "45 tipos."
	done

ProfOaksAide3HereYouGoText:
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



GruntM12SeenText:
	text "¿Sientes"
	line "curiosidad por"
	cont "nuestros planes?"

	para "¡Vénceme y te lo"
	line "diré!"
	done

GruntM12BeatenText:
	text "¡Se suponía que"
	line "perderías!"
	done
