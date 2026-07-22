SilphCo1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .SilphCo1FMoveOfficerCallback

	def_warp_events
	warp_event  2,  9, SAFFRON_CITY, 7
	warp_event  3,  9, SAFFRON_CITY, 21
	warp_event 13,  0, SILPH_CO_2F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_JUMPTEXT, SilphCoElevatorText

	def_object_events
	object_event 13,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoOfficerScript, -1
	object_event  4,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCoReceptionistText, -1
	object_event 11,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo1FGentlemanText, -1
	object_event  8,  4, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo1FCooltrainerfText, -1

	object_const_def
	const SILPHCO1F_OFFICER

.SilphCo1FMoveOfficerCallback:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalsefwd .Nothing
	moveobject SILPHCO1F_OFFICER, 14, 1
.Nothing
	endcallback

SilphCoOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .OfficerScriptAfterPowerRestored
	jumpthisopenedtext

	text "Solo los"
	line "empleados pueden"
	cont "subir."

	para "La energía"
	line "principal no"

	para "funciona, y el"
	line "director quiere"

	para "máxima seguridad"
	line "por si hay una"

	para "emergencia."

	para "Aprendimos la"
	line "lección hace"
	cont "tres años."
	done

.OfficerScriptAfterPowerRestored
	jumpthisopenedtext

	text "¿Fuiste tú"
	line "quien restauró"
	cont "la energía?"

	para "¡Gracias! Ahora"
	line "I+D puede seguir."

	para "Puedes subir a"
	line "hacer un tour."
	done

SilphCoReceptionistText:
	text "Bienvenido. Este"
	line "es el Edificio"
	cont "Central de"
	cont "Silph Co."
	done


SilphCo1FGentlemanText:
	text "Tengo una cita"
	line "con el ingeniero"
	cont "jefe aquí en"
	cont "Silph Co."
	done

SilphCo1FCooltrainerfText:
	text "Intento reunir"
	line "el valor para"
	cont "invitar a salir"

	para "a la"
	line "recepcionista."

	para "En cuanto"
	line "termine de"
	cont "hablar por"
	cont "teléfono…"
	done

SilphCoElevatorText:
	text "Fuera de Servicio"
	done
