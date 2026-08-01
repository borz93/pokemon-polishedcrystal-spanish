SilphCo2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  0, SILPH_CO_1F, 3
	warp_event 11,  0, SILPH_CO_3F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_JUMPTEXT, SilphCoElevatorText
	bg_event  2,  3, BGEVENT_JUMPTEXT, SilphCo2FDeptSignText
	bg_event  9,  3, BGEVENT_JUMPTEXT, SilphCo2FDeptSignText
	bg_event  1,  1, BGEVENT_JUMPTEXT, SilphCo2FPrinterText
	bg_event 14,  5, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event 15,  5, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  6,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo2FScientist1Text, -1
	object_event 12,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo2FScientist2Text, -1
	object_event  3,  6, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo2FEmployee1Script, -1
	object_event 12,  9, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo2FSilphEmployee2Text, -1

SilphCo2FEmployee1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_UPGRADE
	iftruefwd .GaveUpgrade
	writetext .Text1
	promptbutton
	verbosegiveitem UPGRADE
	iffalsefwd .NoRoomForUpgrade
	setevent EVENT_GOT_UPGRADE
.GaveUpgrade:
	writetext .Text2
	waitbutton
.NoRoomForUpgrade:
	endtext

.Text1:
	text "¿Viniste desde"
	line "Johto?"

	para "Ya que has hecho"
	line "un viaje tan"
	cont "largo,"

	para "toma este bonito"
	line "recuerdo."
	done

.Text2:
	text "Es el último"
	line "producto de"
	cont "Silph S.A"

	para "Aún no se vende"
	line "en ningún sitio."
	done

SilphCo2FSilphEmployee2Text:
	text "Antes usábamos"
	line "teletransport."

	para "para movernos,"
	line "pero los"
	cont "desactivaron."

	para "¡Menos mal que"
	line "estoy en el"
	cont "segundo piso!"
	done

SilphCo2FScientist1Text:
	text "Siempre"
	line "trabajamos en"
	cont "nuevas MTs."

	para "Algunas se"
	line "dejaron de"
	cont "fabricar, pero"

	para "otras son tan"
	line "populares que no"
	cont "han cambiado en"
	cont "más de 30 años!"
	done

SilphCo2FScientist2Text:
	text "¡Estoy"
	line "programando! No"
	cont "rompas mi"
	cont "concentración!"
	done

SilphCo2FDeptSignText:
	text "Silph S.A 2F"
	line "Desarrollo Softw."
	done

SilphCo2FPrinterText:
	text "Es una impresora."
	done
