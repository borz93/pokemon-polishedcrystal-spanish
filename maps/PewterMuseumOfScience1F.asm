PewterMuseumOfScience1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 10,  7, PEWTER_CITY, 6
	warp_event 11,  7, PEWTER_CITY, 8
	warp_event 16,  7, PEWTER_CITY, 7
	warp_event 17,  7, PEWTER_CITY, 7
	warp_event  7,  7, PEWTER_MUSEUM_OF_SCIENCE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, KabutopsFossilSignpostScript
	bg_event  6,  3, BGEVENT_READ, OmastarFossilSignpostScript
	bg_event  3,  6, BGEVENT_READ, AerodactylFossilSignpostScript
	bg_event 12,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 13,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 14,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 15,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 17,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 18,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText

	def_object_events
	object_event 18,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, Museum1FFossilScientistScript, -1
	object_event 12,  4, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Museum1FReceptionistScript, -1
	object_event 16,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GRAY, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum1FScientistText, -1
	object_event  1,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum1FGrampsText, -1
	object_event  4,  3, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum1FYoungsterText, -1

	object_const_def
	const PEWTERMUSEUMOFSCIENCE1F_SCIENTIST2

Museum1FFossilScientistScript:
	faceplayer
	opentext
	writetext Museum1FFossilScientistText
	waitbutton
	checkitem HELIX_FOSSIL
	iftruefwd .own_helix
	checkitem DOME_FOSSIL
	iftruefwd .own_dome
	checkitem OLD_AMBER
	iftruefwd .ask_old_amber
	jumpthisopenedtext

	text "¡Oye! No tienes"
	line "ningún fósil."
	done

.own_helix
	checkitem DOME_FOSSIL
	iftruefwd .own_helix_and_dome
	checkitem OLD_AMBER
	iftruefwd .ask_helix_amber
	writetext AskHelixFossilText
	yesorno
	iftrue ResurrectHelixFossil
	sjumpfwd .maybe_later

.own_dome
	checkitem OLD_AMBER
	iftruefwd .ask_dome_amber
	writetext AskDomeFossilText
	yesorno
	iftrue ResurrectDomeFossil
	sjumpfwd .maybe_later

.own_helix_and_dome
	checkitem OLD_AMBER
	iftruefwd .ask_helix_dome_amber
	loadmenu HelixDomeMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectHelixFossil
	ifequalfwd $2, ResurrectDomeFossil
	sjumpfwd .maybe_later

.ask_old_amber
	writetext AskOldAmberText
	yesorno
	iftruefwd ResurrectOldAmber
	sjumpfwd .maybe_later

.ask_helix_amber
	loadmenu HelixAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectHelixFossil
	ifequalfwd $2, ResurrectOldAmber
	sjumpfwd .maybe_later

.ask_dome_amber
	loadmenu DomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectDomeFossil
	ifequalfwd $2, ResurrectOldAmber
	sjumpfwd .maybe_later

.ask_helix_dome_amber
	loadmenu HelixDomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectHelixFossil
	ifequalfwd $2, ResurrectDomeFossil
	ifequalfwd $3, ResurrectOldAmber
.maybe_later:
	jumpthisopenedtext

	text "Solo habla conmigo"
	line "si cambias de"
	cont "opinión."
	done

HelixDomeMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Fósil Hélix@"
	db "Fósil Domo@"
	db "Salir@"

HelixAmberMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Fósil Hélix@"
	db "Ambar Antig.@"
	db "Salir@"

DomeAmberMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 14, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Fósil Domo@"
	db "Ambar Antig.@"
	db "Salir@"

HelixDomeAmberMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Fósil Hélix@"
	db "Fósil Domo@"
	db "Ambar Antig.@"
	db "Salir@"

ResurrectHelixFossil:
	takeitem HELIX_FOSSIL
	scall ResurrectAFossilScript
	givepoke OMANYTE, 20
	sjumpfwd FinishResurrect

ResurrectDomeFossil:
	takeitem DOME_FOSSIL
	scall ResurrectAFossilScript
	givepoke KABUTO, 20
	sjumpfwd FinishResurrect

ResurrectOldAmber:
	takeitem OLD_AMBER
	scall ResurrectAFossilScript
	givepoke AERODACTYL, 20
FinishResurrect:
	iffalse_jumpopenedtext NoRoomForFossilPokemonText
	jumpthisopenedtext

	text "¡Cuídalo bien!"
	done

ResurrectAFossilScript:
	writetext ResurrectingPokemonText
	waitbutton
	closetext
	turnobject PEWTERMUSEUMOFSCIENCE1F_SCIENTIST2, RIGHT
	pause 15
	playsound SFX_BOOT_PC
	waitsfx
	pause 30
	playsound SFX_4_NOTE_DITTY
	waitsfx
	pause 5
	waitsfx
	pause 30
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	pause 15
	faceplayer
	opentext
	end

Museum1FReceptionistScript:
	readvar VAR_FACING
	ifequalfwd DOWN, .Sneak
	ifequalfwd LEFT, .Sneak
	jumpthistextfaceplayer

	text "¡Bienvenido!"

	para "Gracias a una"
	line "generosa donación"
	cont "de Silph Co.,"

	para "¡la entrada es"
	line "gratuita!"

	para "Adelante, por"
	line "favor."
	done

.Sneak:
	jumpthistextfaceplayer

	text "¡No puedes colarte"
	line "por atrás!"
	done

KabutopsFossilSignpostScript:
	reanchormap
	trainerpic KABUTOPS_FOSSIL
	waitbutton
	closepokepic
	jumpthistext

	text "Fósil Kabutops"
	line "(Domo)"

	para "Un #mon"
	line "primitivo y raro."
	done

OmastarFossilSignpostScript:
	reanchormap
	trainerpic OMASTAR_FOSSIL
	waitbutton
	closepokepic
	jumpthistext

	text "Fósil Omastar"
	line "(Hélix)"

	para "Un #mon"
	line "primitivo y raro."
	done

AerodactylFossilSignpostScript:
	reanchormap
	trainerpic AERODACTYL_FOSSIL
	waitbutton
	closepokepic
	jumpthistext

	text "Fósil Aerodactyl"

	para "Un #mon"
	line "primitivo y raro."
	done

Museum1FScientistText:
	text "Estamos orgullosos"
	line "de tres fósiles de"

	para "#mon raros y"
	line "prehistóricos."

	para "¡Yo ayudé a"
	line "montarlos!"
	done

Museum1FFossilScientistText:
	text "¿Sabías que puedes"
	line "extraer #mon de"
	cont "los fósiles?"

	para "Si alguna vez lo"
	line "necesitas, ¡deja"
	cont "que me encargue!"
	done

Museum1FGrampsText:
	text "¡Ese es un fósil"
	line "magnífico!"
	done

Museum1FYoungsterText:
	text "¡Hay dos lugares"
	line "que me encantan!"

	para "Uno son las Ruinas"
	line "de Alfa en Johto."

	para "¡El otro es el"
	line "Museo de Ciencias"
	cont "de Plateada!"

	para "Ambos me dan una"
	line "sensación de"
	cont "historia."
	done

Museum1FBookshelfSignpostText:
	text "¡Libros gruesos y"
	line "bien leídos!"

	para "Manual de"
	line "Arqueología,"
	cont "#mon Perdidos,"

	para "Ancestros #mon,"
	line "Cuidados en la"
	cont "Capa de Marga de"
	cont "Kanto…"
	done

AskHelixFossilText:
	text "¿Quieres"
	line "resucitar el"
	cont "Fósil Hélix?"
	done

AskDomeFossilText:
	text "¿Quieres"
	line "resucitar el"
	cont "Fósil Domo?"
	done

AskOldAmberText:
	text "¿Quieres"
	line "resucitar el"
	cont "ámbar Antig.?"
	done



ResurrectingPokemonText:
	text "¡Vale! ¡Voy a"
	line "resucitar al"
	cont "#mon!"
	done

NoRoomForFossilPokemonText:
	text "¡Oye! No puedes"
	line "llevar otro"
	cont "#mon, ¡Y tu"
	cont "Caja también"
	cont "está"
	cont "llena!"
	done
