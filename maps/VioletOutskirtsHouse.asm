VioletOutskirtsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, VioletOutskirtsHouseCaretaker

	def_warp_events
	warp_event  3,  7, VIOLET_OUTSKIRTS, 2
	warp_event  4,  7, VIOLET_OUTSKIRTS, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, VioletOutskirtsGhostBattleScript
	bg_event  1,  1, BGEVENT_JUMPTEXT, VioletOutskirtsHouseDustText
	bg_event  2,  1, BGEVENT_JUMPTEXT, VioletOutskirtsHouseRadioText
	bg_event  6,  1, BGEVENT_JUMPTEXT, VioletOutskirtsHouseDustText
	bg_event  7,  1, BGEVENT_JUMPTEXT, VioletOutskirtsHouseDustText

	def_object_events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, VioletOutskirtsHouseCaretakerScript, EVENT_VIOLET_CEMETERY_CARETAKER

	object_const_def
	const VIOLETOUTSKIRTSHOUSE_CARETAKER

VioletOutskirtsHouseCaretaker:
	checkevent EVENT_CAUGHT_HISUIAN_TYPHLOSION
	iftruefwd .endcallback
	disappear VIOLETOUTSKIRTSHOUSE_CARETAKER
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftruefwd .endcallback
	special LoadMapPalettes
	special FadeInPalettes_EnableDynNoApply
	showtext VioletOutskirtsHouseNotAloneText
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
.endcallback
	endcallback

VioletOutskirtsGhostBattleScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue_jumptext VioletOutskirtsHouseStillAPresenceText
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue_jumptext VioletOutskirtsHouseNotSafeHereText
	opentext
	writetext VioletOutskirtsHouseOldShrineText
	checkevent EVENT_CAUGHT_HISUIAN_TYPHLOSION
	iftruefwd .Done
	promptbutton
	writetext VioletOutskirtsHouseAhText
	waitbutton
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_GHOST
	loadwildmon TYPHLOSION, HISUIAN_FORM, 60
	startbattle
	special CheckBattleCaughtResult
	iftruefwd .CaughtHisuianTyphlosion
	reloadmapafterbattle
	opentext
	checkkeyitem SILPHSCOPE2
	iffalsefwd .NoSilphScope2
; Defeated (or ran from) Typhlosion
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	writetext VioletOutskirtsHouseStillAPresenceText
	sjumpfwd .Done
; Didn't identify Typhlosion
.NoSilphScope2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	writetext VioletOutskirtsHouseNotSafeHereText
.Done
	waitbutton
	endtext

.CaughtHisuianTyphlosion
	appear VIOLETOUTSKIRTSHOUSE_CARETAKER
	setevent EVENT_CAUGHT_HISUIAN_TYPHLOSION
	reloadmapafterbattle
	end

VioletOutskirtsHouseCaretakerScript:
	checkevent EVENT_TALKED_TO_VIOLET_CEMETERY_CARETAKER
	iftrue_jumptextfaceplayer VioletOutskirtsHouseCaretakerThankYouText
	setevent EVENT_TALKED_TO_VIOLET_CEMETERY_CARETAKER
	jumpthistextfaceplayer

	text "…… ……"

	para "Encontraste a mi"
	line "amigo…"

	para "Guiaba a los"
	line "espíritus"
	cont "difuntos a la"
	cont "siguiente vida…"

	para "Mientras yo"
	line "cuidaba sus"
	cont "tumbas…"

	para "…… ……"

	para "Eso fue hace"
	line "tanto tiempo…"

	para "Ya nadie viene…"

	para "Las tumbas están"
	line "descuidadas…"

	para "Pero tú… aun así"
	line "viniste…"

	para "…… ……"

	para "Gracias…"

	para "Por favor, cuida"
	line "de mi… amigo…"
	done

VioletOutskirtsHouseOldShrineText:
	text "Es un santuario"
	line "muy antiguo."
	done

VioletOutskirtsHouseAhText:
	text "…… …… ……"

	para "…… …… ……"

	para "¡Ah!"
	done

VioletOutskirtsHouseCaretakerThankYouText:
	text "…… ……"

	para "Gracias…"
	line "cielo…"
	done

VioletOutskirtsHouseStillAPresenceText:
	text "El espíritu se"
	line "fue, pero aún hay"
	cont "una presencia…"
	done

VioletOutskirtsHouseNotSafeHereText:
	text "Aún hay una"
	line "presencia fuerte."

	para "¡No es seguro"
	line "aquí!"
	done

VioletOutskirtsHouseRadioText:
	text "No parece"
	line "funcionar."
	done

VioletOutskirtsHouseDustText:
	text "Está cubierto de"
	line "una gruesa capa"
	cont "de polvo."
	done

VioletOutskirtsHouseNotAloneText:
	text "Sientes que algo"
	line "te está"
	cont "observando…"
	done
