GoldenrodHoneyHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 21
	warp_event  3,  7, GOLDENROD_CITY, 21

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodHoneyHousePokefanFScript, -1
	pokemon_event  6,  3, BUTTERFREE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, GoldenrodHoneyHouseButterfreeText, -1

GoldenrodHoneyHousePokefanFScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue_jumptextfaceplayer .AfterText
	checkevent EVENT_GOT_HONEY_FROM_GOLDENROD
	iftruefwd .SellHoney
	faceplayer
	opentext
	writetext .IntroText
	promptbutton
	verbosegiveitem SWEET_HONEY
	iffalse_endtext
	setevent EVENT_GOT_HONEY_FROM_GOLDENROD
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	jumpthisopenedtext

.AfterText:
	text "Mi hermanito"
if DEF(FAITHFUL)
	line "coge Miel y la"

	para "esparce por la"
else
	line "coge Miel Dulce"

	para "y la esparce por"
endc
	line "hierba alta."

	para "A los #mon les"
	line "atrae."

	para "Suele atraer"
	line "#mon de tu"

	para "mismo nivel!"
	done

.IntroText:
	text "Mi #mon es"
	line "experta en"
if DEF(FAITHFUL)
	cont "recoger Miel."
else
	cont "recoger Miel"
	cont "Dulce."
endc

	para "Compartiré algo"
	line "contigo."
	done

.SellHoney:
	faceplayer
	opentext
	writetext .SellText
	special PlaceMoneyTopRight
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .Buy1
	ifequalfwd $2, .Buy10
	jumpthisopenedtext ; cancel

	text "Bueno, ¡vuelve"
	line "pronto, cielo!"
	done

.Buy1:
	checkmoney YOUR_MONEY, 1000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem SWEET_HONEY
	iffalse_jumpopenedtext .BagFullText
	takemoney YOUR_MONEY, 1000
	sjumpfwd .Done

.Buy10:
	checkmoney YOUR_MONEY, 10000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem SWEET_HONEY, 10
	iffalse_jumpopenedtext .BagFullText
	takemoney YOUR_MONEY, 10000

.Done:
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext .GoodbyeText
	promptbutton
	itemnotify
	endtext

.NotEnoughMoney:
	jumpthisopenedtext

	text "No tienes"
	line "suficiente"
	cont "dinero, cielo!"
	done

.SellText:
	text "¿Quieres comprar"
if DEF(FAITHFUL)
	line "Miel para atraer"

	para "#mon?"
else
	line "Miel Dulce para"

	para "atraer #mon?"
endc
	cont "¡Solo ¥1000 cada"
	cont "una!"
	done

.GoodbyeText:
	text "Aquí tienes,"
	line "cielo!"
	done

.BagFullText:
	text "¡Ups! No tienes"
	line "espacio para ello."
	done

.MenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 14 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "× 1   ¥1000@"
	db "×10  ¥10000@"
	db "Salir@"

GoldenrodHoneyHouseButterfreeText:
	text "Butterfree: Freeh!"
	done
