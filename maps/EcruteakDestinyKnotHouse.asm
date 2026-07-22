EcruteakDestinyKnotHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 17
	warp_event  4,  7, ECRUTEAK_CITY, 17

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  5,  4, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakDestinyKnotHouseCooltrainerFScript, -1
	object_event  2,  3, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, trade, NPC_TRADE_HARI, -1

EcruteakDestinyKnotHouseCooltrainerFScript:
	checkevent EVENT_GOT_DESTINY_KNOT_FROM_ECRUTEAK
	iftrue_jumptextfaceplayer .Text4
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	special SpecialBeastsCheck
	iffalse_jumpopenedtext .Text2
	special SpecialBirdsCheck
	iffalse_jumpopenedtext .Text2
	special SpecialDuoCheck
	iffalse_jumpopenedtext .Text2
	writetext .Text3
	verbosegiveitem DESTINY_KNOT
	iffalse_endtext
	setevent EVENT_GOT_DESTINY_KNOT_FROM_ECRUTEAK
	jumpthisopenedtext

.Text4:
	text "El hilo rojo"
	line "del destino te"
	cont "une"

	para "a los #mon"
	line "legendarios…"

	para "¿Serás una"
	line "especie de"
	cont "Elegido?"
	done

.Text1:
	text "Dos poderosas"
	line "aves #mon de"
	cont "Johto,"

	para "cada una"
	line "guardando un"
	cont "trío de #mon"
	cont "legendarios."

	para "Leyendas dentro"
	line "de leyendas…"
	done

.Text2:
	text "¿Y si un"
	line "entrenador los"
	cont "atrapara a"
	cont "todos?"

	para "¡Menudo destino"
	line "tan improbable!"
	done

.Text3:
	text "¿Qué? ¿Los has"
	line "visto? ¿Y encima"
	cont "los atrapaste?!"

	para "Déjame ver tu"
	line "#dex… ¡Vaya!"

	para "Debió de ser"
	line "tu destino."

	para "Toma, esto es"
	line "para ti."
	done
