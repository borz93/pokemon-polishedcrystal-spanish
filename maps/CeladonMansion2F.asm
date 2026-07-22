CeladonMansion2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  0, CELADON_MANSION_1F, 4
	warp_event  1,  0, CELADON_MANSION_3F, 2
	warp_event  6,  0, CELADON_MANSION_3F, 3
	warp_event  7,  0, CELADON_MANSION_1F, 5

	def_coord_events

	def_bg_events
	bg_event  0,  3, BGEVENT_JUMPTEXT, CeladonMansion2FComputerText
	bg_event  5,  8, BGEVENT_UP, CeladonMansion2FSign
	bg_event  2,  3, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events

CeladonMansion2FSign:
	jumpthistext

	text "Sala de Reuniones"
	line "de Game Freak"
	done

CeladonMansion2FComputerText:
	text "<PLAYER> encendió"
	line "el PC."

	para "…"

	para "Alguien estaba"
	line "escribiendo un"
	cont "correo."

	para "…Espero que"
	line "vengas a Kanto."

	para "Creo que te"
	line "sorprenderá lo"

	para "mucho que ha"
	line "cambiado esto."

	para "También verás"
	line "muchos #mon que"

	para "no son nativos"
	line "de Johto."

	para "Al Productor"

	para "…"
	done
