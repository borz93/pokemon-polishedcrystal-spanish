CeladonDeptStore4F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12,  0, CELADON_DEPT_STORE_5F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_3F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore4FDirectoryText

	def_object_events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_CELADON_4F, -1
	object_event  7,  6, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore4FSuperNerdText, -1
	object_event  8,  2, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore4FYoungsterText, -1
	object_event 15,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PosterClerkScript, -1

PosterClerkScript:
	faceplayer
	opentext
	writetext PosterClerkText
	special PlaceMoneyTopRight
.Start:
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .MarillPoster
	ifequalfwd $2, .ClefairyPoster
	ifequalfwd $3, .PikachuPoster
	endtext

.MarillPoster:
	checkmoney YOUR_MONEY, 3200
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_POSTER_3
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 3200
	setevent EVENT_DECO_POSTER_3
	writetext BoughtMarillPosterText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext MarillPosterSentText
	waitbutton
	sjump .Start

.ClefairyPoster:
	checkmoney YOUR_MONEY, 4800
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_POSTER_2
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 4800
	setevent EVENT_DECO_POSTER_2
	writetext BoughtClefairyPosterText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext ClefairyPosterSentText
	waitbutton
	sjump .Start

.PikachuPoster:
	checkmoney YOUR_MONEY, 6400
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_POSTER_1
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 6400
	setevent EVENT_DECO_POSTER_1
	writetext BoughtPikachuPosterText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext PikachuPosterSentText
	waitbutton
	sjump .Start

.NotEnoughMoney:
	writetext PosterClerkNoMoneyText
	waitbutton
	sjump .Start

.AlreadyBought:
	writetext PosterClerkAlreadyBoughtText
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
	db "Marill      ¥3200@"
	db "Clefairy    ¥4800@"
	db "Pikachu     ¥6400@"
	db "Salir@"

PosterClerkText:
	text "¡Bienvenido!"
	line "¿Quieres un"
	cont "póster?"
	done

PosterClerkNoMoneyText:
	text "No tienes"
	line "suficiente dinero."
	done

PosterClerkAlreadyBoughtText:
	text "Ya compraste eso."
	done

BoughtMarillPosterText:
	text "<PLAYER> compró"
	line "el Póster Marill."
	done

MarillPosterSentText:
	text "El Póster Marill"
	line "se envió a casa."
	done

BoughtClefairyPosterText:
	text "<PLAYER> compró"
	line "el Póster"
	cont "Clefairy."
	done

ClefairyPosterSentText:
	text "El Póster"
	line "Clefairy se envió"
	cont "a casa."
	done

BoughtPikachuPosterText:
	text "<PLAYER> compró"
	line "el Póster Pikachu."
	done

PikachuPosterSentText:
	text "El Póster Pikachu"
	line "se envió a casa."
	done

CeladonDeptStore4FSuperNerdText:
	text "Vengo a comprar"
	line "Correo Bonito"
	cont "para mi novia."
	done

CeladonDeptStore4FYoungsterText:
	text "Este es el único"
	line "lugar donde"

	para "puedes comprar"
	line "pósters. ¡Los"
	cont "colecciono!"
	done

CeladonDeptStore4FDirectoryText:
	text "¡Exprésate con"
	line "regalos!"

	para "Piso 4: Regalos"
	line "Wiseman"
	done
