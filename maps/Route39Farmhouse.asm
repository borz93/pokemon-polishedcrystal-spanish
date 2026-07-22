DEF ROUTE39FARMHOUSE_MILK_PRICE EQU 500
DEF ROUTE39FARMHOUSE_DOZEN_MILK_PRICE EQU 6000

Route39Farmhouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_39, 2
	warp_event  3,  7, ROUTE_39, 2

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_JUMPSTD, picturebookshelf
	bg_event  7,  1, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  5,  4, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_AcrobaticsFarmer, -1

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftruefwd FarmerMScript_SellMilk
	writetext FarmerMText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

FarmerMScript_SellMilk:
	checkflag ENGINE_BOUGHT_MOOMOO_MILK
	iftruefwd .Milking
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .Buy1
	ifequalfwd $2, .Buy12
	sjumpfwd .Cancel

.Buy1:
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem MOOMOO_MILK
	iffalsefwd .BagFull
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	sjumpfwd .Done

.Buy12:
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_DOZEN_MILK_PRICE
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem MOOMOO_MILK, 12
	iffalsefwd .BagFull
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_DOZEN_MILK_PRICE

.Done:
	setflag ENGINE_BOUGHT_MOOMOO_MILK
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerMText_GotMilk
	promptbutton
	itemnotify
	endtext

.Cancel:
	jumpthisopenedtext

	text "¿No lo quieres?"
	line "Vuelve otro día,"
	cont "¿eh?"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "Lo siento."
	line "¡Sin pasta, no hay"
	cont "trato!"
	done

.BagFull:
	jumpthisopenedtext

	text "Me parece que tu"
	line "Bolso está lleno."
	done

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 14, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "× 1    ¥{d:ROUTE39FARMHOUSE_MILK_PRICE}@"
	db "×12   ¥{d:ROUTE39FARMHOUSE_DOZEN_MILK_PRICE}@"
	db "Salir@"

.Milking:
	jumpthisopenedtext

	text "Mejor voy a"
	line "ordeñar."
	done

PokefanF_AcrobaticsFarmer:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM62_ACROBATICS_FROM_MOOMOO_FARM
	iftruefwd .GotAcrobatics
	checkevent EVENT_HEALED_MOOMOO
	iftruefwd .GiveAcrobatics
	jumpthisopenedtext

	text "Nuestra leche"
	line "llega hasta"
	cont "Kanto."

	para "Así que si nuestra"
	line "Miltank no da"

	para "leche, estamos en"
	line "problemas."
	done

.GiveAcrobatics:
	writetext FarmerFText_HealedMiltank
	promptbutton
	verbosegivetmhm TM_ACROBATICS
	setevent EVENT_GOT_TM62_ACROBATICS_FROM_MOOMOO_FARM
.GotAcrobatics:
	jumpthisopenedtext

	text "Eso de ahí es"
	line "Acrobacia."

	para "Es un movimiento"
	line "que hace más daño"

	para "si tu #mon no"
	line "lleva ningún"
	cont "objeto."

	para "Piensa bien cómo"
	line "usarlo, cariño."
	done

FarmerMText_SickCow:
	text "Mi Miltank ya no"
	line "me da leche."

	para "Esta Granja tiene"
	line "leche famosa."

	para "Casi todos quieren"
	line "un trago."

	para "Me dará mucha"
	line "leche si le doy"

	para "muchas Bayas,"
	line "supongo."
	done

FarmerMText_BuyMilk:
	text "¿Qué te parece mi"
	line "Leche Moomoo?"

	para "Es mi orgullo y"
	line "alegría."

	para "¡Dásela a tus"
	line "#mon para curar"
	cont "PS!"

	para "Te la doy por solo"
	line "¥500."
	done

FarmerMText_GotMilk:
	text "¡Aquí tienes!"
	line "¡Bébela y"
	cont "disfrútala!"
	done






FarmerFText_HealedMiltank:
	text "Curaste a nuestra"
	line "Miltank, cariño."
	cont "Ahora vuelve a dar"
	cont "Leche Moomoo."

	para "Toma algo por las"
	line "molestias."
	done
