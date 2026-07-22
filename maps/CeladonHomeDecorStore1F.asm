CeladonHomeDecorStore1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, CELADON_CITY, 12
	warp_event  4,  7, CELADON_CITY, 12
	warp_event  9,  0, CELADON_HOME_DECOR_STORE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_JUMPTEXT, CeladonHomeDecorStore1FDirectoryText

	def_object_events
	object_event  4,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHomeDecorStore1FReceptionistText, -1
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore1FClerkScript, -1
	object_event  7,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, BULBASAUR, -1, PAL_MON_TEAL, OBJECTTYPE_SCRIPT, NO_FORM, CeladonHomeDecorStore1FBulbasaurDollScript, -1
	object_event  8,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, CHARMANDER, -1, PAL_MON_ORANGE, OBJECTTYPE_SCRIPT, NO_FORM, CeladonHomeDecorStore1FCharmanderDollScript, -1
	object_event  9,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, SQUIRTLE, -1, PAL_MON_BLUE, OBJECTTYPE_SCRIPT, NO_FORM, CeladonHomeDecorStore1FSquirtleDollScript, -1
	object_event  0,  4, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHomeDecorStore1FCooltrainerfText, -1

CeladonHomeDecorStore1FBulbasaurDollScript:
	jumpthistext

	text "¡Es un lindo"
	line "muñeco Bulbasaur!"
	done

CeladonHomeDecorStore1FCharmanderDollScript:
	jumpthistext

	text "¡Es un muñeco"
	line "Charmander rudo!"
	done

CeladonHomeDecorStore1FSquirtleDollScript:
	jumpthistext

	text "¡Es un muñeco"
	line "Squirtle genial!"
	done

CeladonHomeDecorStore1FClerkScript:
	faceplayer
	opentext
	writetext CeladonHomeDecorStore1FClerkText
	special PlaceMoneyTopRight
.Start:
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .BulbasaurDoll
	ifequalfwd $2, .CharmanderDoll
	ifequalfwd $3, .SquirtleDoll
	endtext

.BulbasaurDoll:
	checkmoney YOUR_MONEY, 16000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_BULBASAUR_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 16000
	setevent EVENT_DECO_BULBASAUR_DOLL
	writetext BoughtBulbasaurDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext BulbasaurDollSentText
	waitbutton
	sjump .Start

.CharmanderDoll:
	checkmoney YOUR_MONEY, 16000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_CHARMANDER_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 16000
	setevent EVENT_DECO_CHARMANDER_DOLL
	writetext BoughtCharmanderDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext CharmanderDollSentText
	waitbutton
	sjump .Start

.SquirtleDoll:
	checkmoney YOUR_MONEY, 16000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_SQUIRTLE_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 16000
	setevent EVENT_DECO_SQUIRTLE_DOLL
	writetext BoughtSquirtleDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext SquirtleDollSentText
	waitbutton
	sjump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecorStore1FNoMoneyText
	waitbutton
	sjump .Start

.AlreadyBought:
	writetext CeladonHomeDecorStore1FAlreadyBoughtText
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
	db "Bulbasaur  ¥16000@"
	db "Charmander ¥16000@"
	db "Squirtle   ¥16000@"
	db "Salir@"

CeladonHomeDecorStore1FReceptionistText:
	text "¡Hola! Bienvenido"
	line "a la sección de"
	cont "Decoración!"

	para "El directorio"
	line "está en la pared."
	done

CeladonHomeDecorStore1FClerkText:
	text "¡Bienvenido!"
	line "¿Quieres un"
	cont "muñeco como"
	cont "recuerdo de"
	cont "Azulona?"
	done

BoughtBulbasaurDollText:
	text "<PLAYER> compró"
	line "el Muñeco"
	cont "Bulbasaur."
	done

BulbasaurDollSentText:
	text "El Muñeco"
	line "Bulbasaur se envió"
	cont "a casa."
	done

BoughtCharmanderDollText:
	text "<PLAYER> compró"
	line "el Muñeco"
	cont "Charmander."
	done

CharmanderDollSentText:
	text "El Muñeco"
	line "Charmander se"
	cont "envió a casa."
	done

BoughtSquirtleDollText:
	text "<PLAYER> compró"
	line "el Muñeco"
	cont "Squirtle."
	done

SquirtleDollSentText:
	text "El Muñeco"
	line "Squirtle se envió"
	cont "a casa."
	done

CeladonHomeDecorStore1FNoMoneyText:
	text "¡No puedes"
	line "pagar eso!"
	done

CeladonHomeDecorStore1FAlreadyBoughtText:
	text "¡Ya tienes eso!"
	done

CeladonHomeDecorStore1FCooltrainerfText:
	text "Esta ala nueva se"
	line "siente más"
	cont "elegante que la"

	para "Tienda Dept."
	line "principal."
	done

CeladonHomeDecorStore1FDirectoryText:
	text "1F: Vestíbulo"

	para "2F: Camas"

	para "3F: Alfombras"

	para "4F: Muñecos"
	line "Gigantes"
	done
