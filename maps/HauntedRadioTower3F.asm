HauntedRadioTower3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  0, HAUNTED_RADIO_TOWER_2F, 2
	warp_event 15,  0, HAUNTED_RADIO_TOWER_4F, 1

	def_coord_events

	def_bg_events
	bg_event  3,  4, BGEVENT_JUMPTEXT, HauntedRadioTower3FShapeText
	bg_event 10,  1, BGEVENT_READ, HauntedRadioTower3FDialScript

	def_object_events
	object_event 15,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, HAUNTER, -1, PAL_MON_PURPLE, OBJECTTYPE_SCRIPT, NO_FORM, HauntedRadioTower3FHaunterScript, EVENT_HAUNTED_RADIO_TOWER_HAUNTER

	object_const_def
	const HAUNTEDRADIOTOWER3F_HAUNTER

HauntedRadioTower3FHaunterScript:
	faceplayer
	opentext
	writetext HauntedRadioTower3FHaunterSeenText
	waitbutton
	closetext
	cry HAUNTER
	loadwildmon HAUNTER, 51
	startbattle
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .end
	setevent EVENT_HAUNTED_RADIO_TOWER_HAUNTER
	disappear HAUNTEDRADIOTOWER3F_HAUNTER
.end
	end

HauntedRadioTower3FDialScript:
	checkevent EVENT_HAUNTED_RADIO_TOWER_DIARY_2
	iftrue_jumptext HauntedRadioTower3FDialSolvedText
	opentext
	writetext HauntedRadioTower3FDialIntroText
	loadmenu HauntedRadioTower3FDialMenuData
	verticalmenu
	closewindow
	ifequalfwd 1, .First
	jumpopenedtext HauntedRadioTower3FDialFailText

.First
	writetext HauntedRadioTower3FDialSecondText
	loadmenu HauntedRadioTower3FDialMenuData
	verticalmenu
	closewindow
	ifequalfwd 3, .Second
	jumpopenedtext HauntedRadioTower3FDialFailText

.Second
	writetext HauntedRadioTower3FDialThirdText
	loadmenu HauntedRadioTower3FDialMenuData
	verticalmenu
	closewindow
	ifequalfwd 2, .Third
	jumpopenedtext HauntedRadioTower3FDialFailText

.Third
	playsound SFX_TALLY
	waitsfx
	writetext HauntedRadioTower3FDialSuccessText
	waitbutton
	closetext
	setevent EVENT_HAUNTED_RADIO_TOWER_DIARY_2
	opentext
	writetext HauntedRadioTower3FDiaryPageText
	waitbutton
	closetext
	end

HauntedRadioTower3FDialMenuData:
	db MENU_BACKUP_TILES
	menu_coords 10, 2, 19, 6
	dw .MenuData2
	db 1

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Grave@"
	db "Media@"
	db "Aguda@"

HauntedRadioTower3FShapeText:
	text "Juraste ver algo"
	line "observándote…"

	para "…pero ya no está"
	line "ahí."
	done

HauntedRadioTower3FHaunterSeenText:
	text "¡Una risa flota"
	line "en el aire!"
	done

HauntedRadioTower3FDialIntroText:
	text "Un viejo panel de"
	line "sintonía, con"
	cont "tres diales."

	para "Recuerdas la nota:"
	line "grave, aguda,"
	cont "media…"

	para "Gira el primer"
	line "dial."
	done

HauntedRadioTower3FDialSecondText:
	text "Gira el segundo"
	line "dial."
	done

HauntedRadioTower3FDialThirdText:
	text "Gira el tercer"
	line "dial."
	done

HauntedRadioTower3FDialFailText:
	text "Los diales"
	line "regresan a su"
	cont "posición con un"
	cont "chirrido."
	done

HauntedRadioTower3FDialSuccessText:
	text "¡Los tres diales"
	line "encajan con un"
	cont "clic!"

	para "Una compuerta se"
	line "abre en la pared,"
	cont "revelando una"
	cont "página de diario."
	done

HauntedRadioTower3FDialSolvedText:
	text "Los diales siguen"
	line "en su sitio"
	cont "correcto."
	done

HauntedRadioTower3FDiaryPageText:
	text "Dentro había una"
	line "página de diario,"
	cont "manchada."

	para "“Una de las tumbas"
	line "era de un Marowak."

	para "Dijeron que solo"
	line "era un animal"
	cont "cualquiera…”"

	para "“Y la revolvieron"
	line "sin más cuidado.”"

	para "Desde entonces,"
	line "los golpes en las"
	cont "paredes no cesan."
	done
