GoldenrodDeptStoreRoof_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, GoldenrodDeptStoreRoofCheckSaleChangeBlock
	callback MAPCALLBACK_OBJECTS, GoldenrodDeptStoreRoofCheckSaleChangeClerk

	def_warp_events
	warp_event 13,  1, GOLDENROD_DEPT_STORE_6F, 3

	def_coord_events

	def_bg_events
	bg_event 15,  3, BGEVENT_RIGHT, Binoculars1
	bg_event 15,  5, BGEVENT_RIGHT, Binoculars2
	bg_event 15,  6, BGEVENT_RIGHT, Binoculars3
	bg_event  3,  0, BGEVENT_UP, PokeDollVendingMachine

	def_object_events
	object_event  2,  1, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofFisherScript, -1
	object_event 10,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreRoofPokefanFText, -1
	object_event 14,  6, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofSuperNerdScript, EVENT_GOLDENROD_SALE_ON
	object_event  3,  4, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreRoofTwinText, EVENT_GOLDENROD_SALE_ON
	object_event  1,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_ROOFTOP, 0, EVENT_GOLDENROD_SALE_OFF
	object_event  7,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreRoofPokefanMText, EVENT_GOLDENROD_SALE_OFF
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreRoofTeacherText, EVENT_GOLDENROD_SALE_OFF
	object_event  1,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStoreRoofBugCatcherText, EVENT_GOLDENROD_SALE_OFF

GoldenrodDeptStoreRoofCheckSaleChangeBlock:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftruefwd .ChangeBlock
	endcallback

.ChangeBlock:
	changeblock 0, 2, $3f
	changeblock 0, 4, $f
	endcallback

GoldenrodDeptStoreRoofCheckSaleChangeClerk:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftruefwd .ChangeClerk
	setevent EVENT_GOLDENROD_SALE_OFF
	clearevent EVENT_GOLDENROD_SALE_ON
	endcallback

.ChangeClerk:
	clearevent EVENT_GOLDENROD_SALE_OFF
	setevent EVENT_GOLDENROD_SALE_ON
	endcallback

GoldenrodDeptStoreRoofFisherScript:
	faceplayer
	opentext
	checkevent EVENT_DECO_VOLTORB_DOLL
	iftruefwd .AlreadyGotVoltorbDoll
	writetext GoldenrodDeptStoreRoofFisherText
	waitbutton
	writetext GoldenrodDeptStoreRoofFisherDuplicateText
	waitbutton
	setevent EVENT_DECO_VOLTORB_DOLL
	writetext GotVoltorbDollText
	playsound SFX_ITEM
	pause 60
	promptbutton
	writetext VoltorbDollSentText
	waitbutton
.AlreadyGotVoltorbDoll
	writetext GoldenrodDeptStoreRoofFisherCatchEmAllText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

GoldenrodDeptStoreRoofSuperNerdScript:
	showtext GoldenrodDeptStoreRoofSuperNerdOhWowText
	faceplayer
	showtext GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText
	turnobject LAST_TALKED, RIGHT
	end

Binoculars1:
	jumpthistext

	text "Estos prismáticos"
	line "me dejan ver"

	para "lejos. Quizá pueda"
	line "ver mi propia"
	cont "casa."

	para "¿Es la del tejado"
	line "verde?"
	done

Binoculars2:
	jumpthistext

	text "¡Eh! ¡Unos"
	line "entrenadores están"
	cont "combatiendo en el"
	cont "camino!"

	para "¡Un #mon lanzó"
	line "una ráfaga de"
	cont "hojas!"

	para "¡Eso me da ganas"
	line "de combatir ahora"
	cont "mismo!"
	done

Binoculars3:
	jumpthistext

	text "Un pescador"
	line "atrapó muchos"
	cont "Magikarp…"

	para "¡Están usando"
	line "Salpicadura todos"
	cont "a la vez!"

	para "¡Mira cómo salpica"
	line "el agua por todas"
	cont "partes!"
	done

PokeDollVendingMachine:
	opentext
	writetext PokeDollVendingMachineText
	special PlaceMoneyTopRight
.Start:
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .JigglypuffDoll
	ifequalfwd $2, .DittoDoll
	ifequalfwd $3, .MeowthDoll
	endtext

.JigglypuffDoll:
	checkmoney YOUR_MONEY, 2400
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_JIGGLYPUFF_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 2400
	setevent EVENT_DECO_JIGGLYPUFF_DOLL
	writetext BoughtJigglypuffDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext JigglypuffDollSentText
	waitbutton
	sjump .Start

.DittoDoll:
	checkmoney YOUR_MONEY, 2400
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_DITTO_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 2400
	setevent EVENT_DECO_DITTO_DOLL
	writetext BoughtDittoDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext DittoDollSentText
	waitbutton
	sjump .Start

.MeowthDoll:
	checkmoney YOUR_MONEY, 2400
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_MEOWTH_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 2400
	setevent EVENT_DECO_MEOWTH_DOLL
	writetext BoughtMeowthDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext MeowthDollSentText
	waitbutton
	sjump .Start

.NotEnoughMoney:
	writetext PokeDollVendingMachineNoMoneyText
	waitbutton
	sjump .Start

.AlreadyBought:
	writetext PokeDollVendingMachineAlreadyBoughtText
	waitbutton
	sjump .Start

.MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 19, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Jigglypuff  ¥2400@"
	db "Ditto       ¥2400@"
	db "Meowth      ¥2400@"
	db "Salir@"

GoldenrodDeptStoreRoofPokefanFText:
	text "Fiu, qué cansada"
	line "estoy."

	para "A veces subo a la"
	line "azotea a"

	para "descansar de las"
	line "compras."
	done

GoldenrodDeptStoreRoofFisherText:
	text "¿Perdón? ¿Quién"
	line "dice que un adulto"
	cont "no puede meterse"
	cont "en esto?"

	para "Voy a volver cada"
	line "día para"

	para "¡coleccionar"
	line "todos los"
	cont "muñecos!"
	done

GoldenrodDeptStoreRoofFisherDuplicateText:
	text "Este está"
	line "repetido. Toma,"
	cont "puedes quedártelo."
	done

GotVoltorbDollText:
	text "<PLAYER> recibió"
	line "el Muñeco Voltorb."
	done

VoltorbDollSentText:
	text "El Muñeco Voltorb"
	line "fue enviado a"
	cont "casa."
	done

GoldenrodDeptStoreRoofFisherCatchEmAllText:
	text "Oí que hay 30"
	line "tipos de muñecos."
	done

GoldenrodDeptStoreRoofTwinText:
	text "Aquí tienen"
	line "rebajas de vez en"
	cont "cuando."
	done

GoldenrodDeptStoreRoofSuperNerdOhWowText:
	text "¡Oh, vaya!"
	done

GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText:
	text "¿Puedes dejar de"
	line "molestarme?"
	done

GoldenrodDeptStoreRoofPokefanMText:
	text "Hay algo que"
	line "quiero de"
	cont "verdad, pero"

	para "no tengo el"
	line "dinero"
	cont "necesario…"

	para "Quizá venda las"
	line "Bayas que he"
	cont "recolectado…"
	done

GoldenrodDeptStoreRoofTeacherText:
	text "Oh, ¡Todo es tan"
	line "barato!"

	para "¡Compré tanto que"
	line "mi Mochila está"
	cont "abarrotada!"
	done

GoldenrodDeptStoreRoofBugCatcherText:
	text "Mis #mon"
	line "siempre se"
	cont "paralizan o"

	para "envenenan cuando"
	line "más lo necesito…"

	para "Así que vine a"
	line "comprar Cura"
	cont "Total."

	para "Me pregunto si"
	line "quedará alguno."
	done




PokeDollVendingMachineText:
	text "¡Una máquina"
	line "expendedora de"
	cont "muñecos #mon!"
	done

PokeDollVendingMachineNoMoneyText:
	text "¡Cuesta demasiado!"
	done

PokeDollVendingMachineAlreadyBoughtText:
	text "¡Está repetido!"
	done

BoughtJigglypuffDollText:
	text "<PLAYER> compró"
	line "el Muñeco"
	cont "Jigglypuff."
	done

JigglypuffDollSentText:
	text "El Muñeco"
	line "Jigglypuff fue"
	cont "enviado a casa."
	done

BoughtDittoDollText:
	text "<PLAYER> compró"
	line "el Muñeco Ditto."
	done

DittoDollSentText:
	text "El Muñeco Ditto"
	line "fue enviado a"
	cont "casa."
	done

BoughtMeowthDollText:
	text "<PLAYER> compró"
	line "el Muñeco Meowth."
	done

MeowthDollSentText:
	text "El Muñeco Meowth"
	line "fue enviado a"
	cont "casa."
	done
