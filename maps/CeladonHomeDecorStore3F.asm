CeladonHomeDecorStore3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  0, CELADON_HOME_DECOR_STORE_2F, 2
	warp_event  9,  0, CELADON_HOME_DECOR_STORE_4F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_JUMPTEXT, CeladonHomeDecorStore3FDirectoryText

	def_object_events
	object_event  7,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore3FClerk1Script, -1
	object_event  8,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore3FClerk2Script, -1
	object_event  3,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHomeDecorStore3FYoungsterText, -1
	object_event  9,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHomeDecorStore3FBeautyText, -1

CeladonHomeDecorStore3FClerk1Script:
	faceplayer
	opentext
	writetext CeladonHomeDecorStore3FClerk1Text
	special PlaceMoneyTopRight
.Start:
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .RedCarpet
	ifequalfwd $2, .YellowCarpet
	ifequalfwd $3, .GreenCarpet
	endtext

.RedCarpet:
	checkmoney YOUR_MONEY, 45000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CARPET_1
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 45000
	setevent EVENT_DECO_CARPET_1
	writetext BoughtRedCarpetText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext RedCarpetSentText
	waitbutton
	sjump .Start

.YellowCarpet:
	checkmoney YOUR_MONEY, 45000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CARPET_3
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 45000
	setevent EVENT_DECO_CARPET_3
	writetext BoughtYellowCarpetText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext YellowCarpetSentText
	waitbutton
	sjump .Start

.GreenCarpet:
	checkmoney YOUR_MONEY, 45000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CARPET_4
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 45000
	setevent EVENT_DECO_CARPET_4
	writetext BoughtGreenCarpetText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GreenCarpetSentText
	waitbutton
	sjump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecorStore3FNoMoneyText
	waitbutton
	sjump .Start

.AlreadyBought:
	writetext CeladonHomeDecorStore3FAlreadyBoughtText
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
	db "Rojo      ¥45000@"
	db "Amarillo  ¥45000@"
	db "Verde     ¥45000@"
	db "Salir@"

CeladonHomeDecorStore3FClerk2Script:
	checkevent EVENT_DECO_CARPET_2
	iftrue_jumptextfaceplayer CeladonHomeDecorStore3FClerk2Text
	faceplayer
	opentext
	special PlaceMoneyTopRight
	writetext CeladonHomeDecorStore3FClerk2SaleText
	yesorno
	iffalse_jumpopenedtext CeladonHomeDecorStore3FClerk2NoText
	checkmoney YOUR_MONEY, 35000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 35000
	setevent EVENT_DECO_CARPET_2
	writetext BoughtBlueCarpetText
	special PlaceMoneyTopRight
	playsound SFX_TRANSACTION
	waitbutton
	writetext BlueCarpetSentText
	waitbutton
	jumpthisopenedtext

	text "¡Gracias!"
	line "¡Que tengas buen"
	cont "día!"
	done

.NotEnoughMoney:
	jumpopenedtext CeladonHomeDecorStore3FNoMoneyText

CeladonHomeDecorStore3FClerk1Text:
	text "¡Bienvenido!"
	line "¿Quieres una"
	cont "alfombra?"
	done

CeladonHomeDecorStore3FClerk2Text:
	text "¿No crees que una"
	line "alfombra da"
	cont "armonía a la"
	cont "sala?"
	done

CeladonHomeDecorStore3FClerk2SaleText:
	text "Nuestra Alfombra"
	line "Azul Real"

	para "importada está de"
	line "oferta por"
	cont "¥35,000."

	para "¿Quieres comprar"
	line "una?"
	done


CeladonHomeDecorStore3FClerk2NoText:
	text "¡Que tengas buen"
	line "día!"
	done

BoughtRedCarpetText:
	text "<PLAYER> compró"
	line "la Alfombra Roja."
	done

RedCarpetSentText:
	text "La Alfombra Roja"
	line "se envió a casa."
	done

BoughtBlueCarpetText:
	text "<PLAYER> compró"
	line "la Alfombra Azul."
	done

BlueCarpetSentText:
	text "La Alfombra Azul"
	line "se envió a casa."
	done

BoughtYellowCarpetText:
	text "<PLAYER> compró"
	line "la Alfombra"
	cont "Amarilla."
	done

YellowCarpetSentText:
	text "La Alfombra"
	line "Amarilla se envió"
	cont "a casa."
	done

BoughtGreenCarpetText:
	text "<PLAYER> compró"
	line "la Alfombra"
	cont "Verde."
	done

GreenCarpetSentText:
	text "La Alfombra Verde"
	line "se envió a casa."
	done

CeladonHomeDecorStore3FNoMoneyText:
	text "¡No puedes pagar"
	line "eso!"
	done

CeladonHomeDecorStore3FAlreadyBoughtText:
	text "¡Ya tienes eso!"
	done

CeladonHomeDecorStore3FYoungsterText:
	text "¡Esta alfombra se"
	line "siente tan"
	cont "mullida!"
	done

CeladonHomeDecorStore3FBeautyText:
	text "¡Algunas de estas"
	line "alfombras se"
	cont "importan de"
	cont "Kalos!"
	done

CeladonHomeDecorStore3FDirectoryText:
	text "Elegancia"
	line "Colorida"

	para "3F: Alfombras"
	done
