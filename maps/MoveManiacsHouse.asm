MoveManiacsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 7
	warp_event  3,  7, CIANWOOD_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, magazinebookshelf

	def_object_events
	object_event  2,  3, SPRITE_COSPLAYER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveReminderScript, -1

MoveReminderScript:
	faceplayer
	opentext
	writetext MoveReminderIntroText
	waitbutton
	checkitem GOLD_LEAF
	iffalsefwd .no_gold_leaf
	writetext MoveReminderPromptText
	yesorno
	iffalsefwd .refused
	setval NO_MOVE ; to toggle move relearner
	writetext MoveReminderWhichMonText
	waitbutton
	special Special_MoveTutor
	ifequalfwd $0, .teach_move
.refused
	jumpopenedtext MoveReminderCancelText

.no_gold_leaf
	jumpopenedtext MoveReminderNoGoldLeafText

.teach_move
	takeitem GOLD_LEAF
	jumpopenedtext MoveReminderCancelText

MoveReminderIntroText::
	text "¿Yo? Soy el"
	line "Maníaco Movs."

	para "Haré que #mon"
	line "recuerde un"

	para "movimiento si me"
	line "das una"
	cont "Hoja de Oro!"
	done

MoveReminderPromptText::
	text "¿Quieres que"
	line "enseñe un mov."
	cont "a tu #mon?"
	done

MoveReminderWhichMonText::
	text "¡Genial! ¿Qué"
	line "#mon necesita?"
	done

MoveReminderNoGoldLeafText::
	text "¿Eh? No tienes"
	line "ninguna Hoja"
	cont "de Oro."

	para "A veces las"
	line "encuentras en"
	cont "Bellsprout"
	cont "salvajes."
	done

MoveReminderNoMovesText::
	text "Lo siento… No hay"
	line "ningún movimiento"

	para "que ese #mon"
	line "pueda recordar."
	prompt

MoveReminderCancelText::
	text "Si tu #mon"
	line "necesita aprender"

	para "un mov., vuelve"
	line "con una Hoja"
	cont "de Oro!"
	done
