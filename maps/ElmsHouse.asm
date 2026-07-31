ElmsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  4, NEW_BARK_TOWN, 5
	warp_event  7,  5, NEW_BARK_TOWN, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPTEXT, ElmsHouseFridgeText
	bg_event  6,  1, BGEVENT_JUMPTEXT, ElmsHousePCText
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  1,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ElmsWifeText, -1
	object_event  4,  5, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ElmsSonText, -1

ElmsWifeText:
	text "¡Hola, <PLAYER>!"
	line "Mi marido siempre"
	cont "está muy liado,"

	para "espero que esté"
	line "bien."

	para "Cuando se mete de"
	line "lleno en su"
	cont "investigación"
	cont "#mon,"

	para "hasta se olvida"
	line "de comer."
	done

ElmsSonText:
	text "Cuando sea mayor,"
	line "voy a ayudar"
	cont "a mi papá!"

	para "¡Voy a ser un"
	line "gran profesor"
	cont "#mon!"
	done

ElmsHouseFridgeText:
	text "Hay algo de"
	line "comida. Debe ser"
	cont "para #mon."
	done

ElmsHousePCText:
	text "#mon. ¿De dónde"
	line "vienen?"

	para "¿Adónde van?"

	para "¿Por qué nadie ha"
	line "presenciado nunca"
	cont "el nacimiento de"
	cont "un #mon?"

	para "¡Quiero saberlo!"
	line "Dedicaré mi vida"

	para "al estudio de"
	line "los #mon!"

	para "…"

	para "Es parte de los"
	line "papeles de"
	cont "investigación del"
	cont "Prof. Elm."
	done
