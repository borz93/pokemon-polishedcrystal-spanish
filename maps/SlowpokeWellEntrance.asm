SlowpokeWellEntrance_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11,  7, AZALEA_TOWN, 6
	warp_event  7,  5, SLOWPOKE_WELL_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  6, 13, BGEVENT_ITEM + SUPER_POTION, EVENT_SLOWPOKE_WELL_ENTRANCE_HIDDEN_SUPER_POTION

	def_object_events
	object_event  8,  9, SPRITE_KURT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SlowpokeWellEntranceKurtText, EVENT_SLOWPOKE_WELL_KURT

SlowpokeWellEntranceKurtText:
	text "Kurt: ¡Hola,"
	line "<PLAYER>!"

	para "El guardia de"
	line "arriba huyó"
	cont "cuando le grité."

	para "Pero entonces caí"
	line "rodando por el"
	cont "pozo."

	para "Me di un buen"
	line "golpe en la"
	cont "espalda, y no"
	cont "puedo moverme."

	para "¡Rayos! Si"
	line "estuviera en"
	cont "forma, mi #mon"

	para "los habría"
	line "castigado…"

	para "Ah, no hay nada"
	line "que hacer."

	para "<PLAYER>, ¡demués-"
	line "trales tu valor"
	cont "en mi lugar!"
	done
