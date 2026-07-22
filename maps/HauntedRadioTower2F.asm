HauntedRadioTower2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  0, LAV_RADIO_TOWER_1F, 3
	warp_event  2,  0, HAUNTED_RADIO_TOWER_3F, 1

	def_coord_events

	def_bg_events
	bg_event  1,  0, BGEVENT_JUMPTEXT, HauntedRadioTower2FBrokenWindowText
	bg_event 15,  0, BGEVENT_JUMPTEXT, HauntedRadioTower2FFlickeringLightText
	bg_event 14,  3, BGEVENT_JUMPTEXT, HauntedRadioTower2FLedgerText
	bg_event  1,  6, BGEVENT_READ, HauntedRadioTower2FDiaryPageScript

	def_object_events
	object_event  2,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, GASTLY, -1, PAL_MON_PURPLE, OBJECTTYPE_SCRIPT, NO_FORM, HauntedRadioTower2FGastlyScript, EVENT_HAUNTED_RADIO_TOWER_GASTLY

	object_const_def
	const HAUNTEDRADIOTOWER2F_GASTLY

HauntedRadioTower2FGastlyScript:
	faceplayer
	opentext
	writetext HauntedRadioTower2FGastlySeenText
	waitbutton
	closetext
	cry GASTLY
	loadwildmon GASTLY, 48
	startbattle
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .end
	setevent EVENT_HAUNTED_RADIO_TOWER_GASTLY
	disappear HAUNTEDRADIOTOWER2F_GASTLY
.end
	end

HauntedRadioTower2FDiaryPageScript:
	checkevent EVENT_HAUNTED_RADIO_TOWER_DIARY_1
	iftrue_jumptext HauntedRadioTower2FDiaryPageAgainText
	setevent EVENT_HAUNTED_RADIO_TOWER_DIARY_1
	jumptext HauntedRadioTower2FDiaryPageText

HauntedRadioTower2FGastlySeenText:
	text "¡Algo se ríe"
	line "entre las"
	cont "sombras!"
	done

HauntedRadioTower2FBrokenWindowText:
	text "Una ventana rota."

	para "El cristal está"
	line "esparcido, pero"
	cont "nadie lo ha"
	cont "recogido."
	done

HauntedRadioTower2FFlickeringLightText:
	text "Esta luz no deja"
	line "de parpadear."

	para "Cuenta: uno, dos,"
	line "tres… se apaga."
	done

HauntedRadioTower2FLedgerText:
	text "Un registro de"
	line "visitas, abierto"
	cont "sobre el"
	cont "mostrador."

	para "El último nombre"
	line "está tachado con"
	cont "furia."
	done

HauntedRadioTower2FDiaryPageText:
	text "Encuentras una"
	line "página de diario"
	cont "arrugada."

	para "“…nos dijeron que"
	line "moverían las"

	para "tumbas antes de"
	line "construir, pero"

	para "solo tuvieron"
	line "tiempo para"
	cont "algunas…”"

	para "“Si oyes tres"
	line "notas -grave,"

	para "aguda, media-"
	line "puede que ella te"
	cont "escuche…”"
	done

HauntedRadioTower2FDiaryPageAgainText:
	text "Ya has leído esta"
	line "página."
	done
