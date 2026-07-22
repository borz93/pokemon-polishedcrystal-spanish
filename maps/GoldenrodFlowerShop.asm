GoldenrodFlowerShop_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
	object_event  5,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FlowerShopFloriaScript, EVENT_FLORIA_AT_FLOWER_SHOP
	object_event  6,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, FlowerShopGentlemanText, EVENT_FLORIA_AT_SUDOWOODO

	object_const_def
	const GOLDENRODFLOWERSHOP_TEACHER

FlowerShopTeacherScript:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftruefwd .SellMulch
	checkevent EVENT_FLORIA_AT_SUDOWOODO
	iftruefwd .MetFloria
	checkflag ENGINE_PLAINBADGE
	iffalse_jumptextfaceplayer GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue_jumptextfaceplayer GoldenrodFlowerShopTeacherStopMySisterText
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherBetterThanWhitneyText
	promptbutton
	verbosegivekeyitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
	end

.MetFloria:
	checkflag ENGINE_PLAINBADGE
	iffalse_jumptextfaceplayer GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue_jumptextfaceplayer GoldenrodFlowerShopTeacherDontDoAnythingDangerousText
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherHeresTheSquirtbottleText
	promptbutton
	verbosegivekeyitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
	end

.SellMulch:
	faceplayer
	opentext
	writetext WoukdYouLikeMulchText
	special PlaceMoneyTopRight
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .Buy1
	ifequalfwd $2, .Buy10
	jumpthisopenedtext

	text "¡Vuelve pronto!"
	done

.Buy1:
	checkmoney YOUR_MONEY, 200
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem MULCH
	iffalse_jumpopenedtext NoRoomForMulchText
	takemoney YOUR_MONEY, 200
	sjumpfwd .Done

.Buy10:
	checkmoney YOUR_MONEY, 2000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem MULCH, 10
	iffalse_jumpopenedtext NoRoomForMulchText
	takemoney YOUR_MONEY, 2000

.Done:
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	itemnotify
	jumpthisopenedtext

	text "¡Gracias!"
	line "¡Vuelve pronto!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "Vaya… Disculpa,"
	line "pero te falta"
	cont "dinero."
	done

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 14, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "× 1    ¥200@"
	db "×10   ¥2000@"
	db "Cancel@"

FlowerShopFloriaScript:
	checkflag ENGINE_PLAINBADGE
	iffalse_jumptextfaceplayer GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText
	checkevent EVENT_FOUGHT_SUDOWOODO
	iffalse_jumptextfaceplayer GoldenrodFlowerShopFloriaYouBeatWhitneyText
	checkitem MULCH
	iftrue_jumptextfaceplayer DescribeMulchText
	jumpthistextfaceplayer

	text "¡Así que ese"
	line "árbol tembloroso"
	cont "era un #mon!"
	done

GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text:
	text "¿Has visto ese"
	line "árbol tembloroso"

	para "que crece en la"
	line "Ruta 36?"

	para "Mi hermana pequeña"
	line "se emocionó mucho"

	para "y fue a verlo…"

	para "Estoy"
	line "preocupada…"
	cont "¿No es peligroso?"
	done

GoldenrodFlowerShopTeacherStopMySisterText:
	text "Mi hermana pequeña"
	line "se emocionó mucho"

	para "y fue a ver el"
	line "árbol tembloroso…"

	para "Estoy"
	line "preocupada…"
	cont "¿Puedes evitar"
	cont "que le haga daño?"
	done

GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText:
	text "¿Quieres pedirme"
	line "prestado la"

	para "regadera? No"
	line "quiero que hagas"

	para "nada peligroso con"
	line "ella."
	done

GoldenrodFlowerShopTeacherBetterThanWhitneyText:
	text "Oh, eres mejor"
	line "que Blanca."

	para "¿Conoces ese árbol"
	line "tembloroso?"

	para "Si lo mojas con"
	line "la regadera,"
	cont "ataca."

	para "Pero como ya"
	line "tienes algunas"
	cont "Medallas, deberías"
	cont "estar bien."
	done

GoldenrodFlowerShopTeacherHeresTheSquirtbottleText:
	text "Oh, eres mejor"
	line "que Blanca…"

	para "Entonces estarás"
	line "bien. ¡Aquí tienes"
	cont "mi regadera!"
	done

GoldenrodFlowerShopTeacherDontDoAnythingDangerousText:
	text "¡No hagas nada"
	line "demasiado"
	cont "peligroso!"
	done

GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText:
	text "Cuando le hablé a"
	line "mi hermana del"

	para "árbol tembloroso,"
	line "me dijo que es"
	cont "peligroso."

	para "Si venzo a"
	line "Blanca, me"
	cont "pregunto si me"
	cont "prestará su"
	cont "regadera…"
	done

GoldenrodFlowerShopFloriaYouBeatWhitneyText:
	text "Vaya, ¿venciste a"
	line "Blanca? ¡Genial!"

	para "Quizá puedas"
	line "encargarte del"
	cont "árbol tembloroso."

	para "Solo necesitarás"
	line "una regadera"
	cont "como la de mi"
	cont "hermana."
	done

WoukdYouLikeMulchText:
	text "¿Quieres comprar"
	line "Abono?"

	para "¡Hace que las"
	line "Bayas crezcan más"
	cont "rápido!"
	done




NoRoomForMulchText:
	text "Oh no, ¡tu Mochila"
	line "está llena!"
	done

DescribeMulchText:
	text "Nuestro abono"
	line "es una mezcla de"

	para "tierra de calidad"
	line "y… bueno, ya"
	cont "sabes, de #mon…"

	para "¡Está lleno de"
	line "nutrientes!"
	done

FlowerShopGentlemanText:
	text "He estado"
	line "trabajando hasta"
	cont "tarde últimamente,"
	cont "así que compro"
	cont "flores para mi"
	cont "esposa."
	done
