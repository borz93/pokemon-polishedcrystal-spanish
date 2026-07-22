EcruteakShrineInside_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5, 11, ECRUTEAK_SHRINE_OUTSIDE, 1
	warp_event  6, 11, ECRUTEAK_SHRINE_OUTSIDE, 1

	def_coord_events

	def_bg_events
	bg_event  5,  6, BGEVENT_JUMPTEXT, EcruteakShrineInsideAltarText
	bg_event  6,  6, BGEVENT_JUMPTEXT, EcruteakShrineInsideAltarText

	def_object_events
	object_event  7,  6, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakShrineInsideReiScript, -1
	object_event  3,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakShrineInsideGrampsText, -1
	object_event 10,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakShrineInsideSageText, -1
	object_event  1,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakShrineInsideGrannyText, -1
	pokemon_event 10,  3, FURRET, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, ClearText, -1

	object_const_def
	const ECRUTEAKSHRINEINSIDE_REI

EcruteakShrineInsideReiScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_SHRINE_VISIT
	iftruefwd .ReiDone
	writetext EcruteakShrineInsideReiGreetingText
	loadmenu .ReiMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .ReiBless
	ifequalfwd $2, .ReiBattle
	sjumpfwd .ReiCancel

.ReiBless
	writetext EcruteakShrineInsideReiBlessText
	promptbutton
	special Special_ReiBlessing
	ifequalfwd $0, .ReiCancel
	ifequalfwd $1, .EggBlessing
	setflag ENGINE_DAILY_SHRINE_VISIT
	writetext EcruteakShrineInsideReiBlessingText
	special PlayCurMonCry
	waitbutton
	writetext EcruteakShrineInsideHappinessText
	waitbutton
	sjumpfwd .ReiDone

.ReiBattle
	writetext EcruteakShrineInsideReiBattleText
	waitbutton
	closetext
	setflag ENGINE_DAILY_SHRINE_VISIT
	winlosstext EcruteakShrineInsideReiBeatenText, 0
	setlasttalked ECRUTEAKSHRINEINSIDE_REI
	readvar VAR_BADGES
	ifequalfwd 16, .Battle3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .Battle2
	loadtrainer REI, 1
	startbattle
	reloadmapafterbattle
	sjumpfwd .AfterRematch

.Battle2:
	loadtrainer REI, 2
	startbattle
	reloadmapafterbattle
	sjumpfwd .AfterRematch

.Battle3:
	loadtrainer REI, 3
	startbattle
	reloadmapafterbattle
	; fallthrough

.AfterRematch:
	opentext
	; fallthrough

.ReiDone
	jumpthisopenedtext

	text "Rei: Vuelve"
	line "mañana, por"
	cont "favor."
	done

.ReiCancel
	jumpthisopenedtext

	text "Rei: Vuelve si"
	line "cambias de"
	cont "opinión."
	done

.EggBlessing
	jumpthisopenedtext

	text "Rei: No puedo"
	line "bendecir un Huevo."
	done

.ReiMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 11, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Bendición@"
	db "Combate@"
	db "Salir@"

EcruteakShrineInsideReiGreetingText:
	text "Rei: Oh, hola."
	line "Bienvenido a"
	cont "nuestro"
	cont "santuario."

	para "¿Viniste para que"
	line "bendiga a uno de"
	cont "tus #mon?"

	para "¿O quieres"
	line "combatir?"
	done

EcruteakShrineInsideReiBlessText:
	text "Rei: Vale, ¿a qué"
	line "#mon debería"
	cont "bendecir?"
	done

EcruteakShrineInsideReiBlessingText:
	text "Rei: Que"
	line "encuentres calma"
	cont "y paz."
	done

EcruteakShrineInsideHappinessText:
	text_ram wStringBuffer3
	text " parece"
	line "feliz."
	done


EcruteakShrineInsideReiBattleText:
	text "Rei: Muy bien."
	line "¡Espíritus"
	cont "malignos, fuera!"
	done

EcruteakShrineInsideReiBeatenText:
	text "¡Admito la"
	line "derrota!"
	done



EcruteakShrineInsideGrampsText:
	text "La doncella del"
	line "santuario es mi"
	cont "nieta."
	done

EcruteakShrineInsideSageText:
	text "La mayoría aquí en"
	line "el santuario"
	cont "entrenamos"

	para "Hoothoot y Sentret"
	line "para combatir"
	cont "fantasmas."

	para "Rei es única."
	line "Usa tipos Fuego y"
	cont "Psíquico."
	done

EcruteakShrineInsideGrannyText:
	text "Me alegra que no"
	line "aprobaran una"
	cont "parada en Ciudad"
	cont "Iris para el Tren"
	cont "Imán."

	para "Arruinaría nuestro"
	line "paisaje"
	cont "tradicional."
	done

EcruteakShrineInsideAltarText:
	text "Muestra honor y"
	line "respeto mientras"
	cont "visitas, por"
	cont "favor."
	done
