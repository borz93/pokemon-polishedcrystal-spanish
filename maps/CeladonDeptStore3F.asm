CeladonDeptStore3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12,  0, CELADON_DEPT_STORE_2F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_4F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore3FDirectoryText
	bg_event  2,  3, BGEVENT_JUMPTEXT, CeladonDeptStore3FRPGText
	bg_event  5,  3, BGEVENT_JUMPTEXT, CeladonDeptStore3FSportsGameText
	bg_event  2,  5, BGEVENT_JUMPTEXT, CeladonDeptStore3FPuzzleGameText
	bg_event  5,  5, BGEVENT_JUMPTEXT, CeladonDeptStore3FFightingGameText

	def_object_events
	object_event  9,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_TM, MART_CELADON_3F_TM, -1
	object_event  8,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FClerk2Script, -1
	object_event  7,  5, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore3FYoungsterText, -1
	object_event 13,  4, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore3FSuperNerdText, -1
	object_event  0,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VideoGameClerkText, -1
	object_event  1,  3, SPRITE_SNES, SPRITEMOVEDATA_STILL, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FSnesScript, -1
	object_event  1,  5, SPRITE_N64, SPRITEMOVEDATA_STILL, 0, 0, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FN64Script, -1
	object_event  4,  3, SPRITE_GAMECUBE, SPRITEMOVEDATA_STILL, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameCubeScript, -1
	object_event  4,  5, SPRITE_WII, SPRITEMOVEDATA_STILL, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FWiiScript, -1

CeladonDeptStore3FClerk2Script:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_COUNTER_INTRO
	iftruefwd CeladonDeptStore3FTutorCounterScript
	writetext CeladonDeptStore3FClerk2Text
	waitbutton
	setevent EVENT_LISTENED_TO_COUNTER_INTRO
CeladonDeptStore3FTutorCounterScript:
	writetext Text_CeladonDeptStore3FTutorCounter
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_CeladonDeptStore3FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval COUNTER
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "No importa."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "No tienes una"
	line "Hoja Plateada…"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Ahora tu #mon"
	line "sabe Contraataque."
	done

VideoGameClerkNoMoneyScript:
	jumpthisopenedtext

	text "Dependiente: ¡No"
	line "puedes pagarlo!"
	done

CeladonDeptStore3FSnesScript:
	checkevent EVENT_DECO_SNES
	iftrue_jumptext CeladonDeptStore3FSnesText
	opentext
	writetext VideoGameClerkSellSnesText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext VideoGameClerkNoSaleText
	checkmoney YOUR_MONEY, 20000
	ifequal HAVE_LESS, VideoGameClerkNoMoneyScript
	takemoney YOUR_MONEY, 20000
	setevent EVENT_DECO_SNES
	writetext BoughtSnesText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	jumpthisopenedtext

	text "Super NES fue"
	line "enviada a casa."
	done

CeladonDeptStore3FN64Script:
	checkevent EVENT_DECO_N64
	iftrue_jumptext CeladonDeptStore3FN64Text
	opentext
	writetext VideoGameClerkSellN64Text
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext VideoGameClerkNoSaleText
	checkmoney YOUR_MONEY, 25000
	ifequal HAVE_LESS, VideoGameClerkNoMoneyScript
	takemoney YOUR_MONEY, 25000
	setevent EVENT_DECO_N64
	writetext BoughtN64Text
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	jumpthisopenedtext

	text "Nintendo 64 fue"
	line "enviada a casa."
	done

CeladonDeptStore3FGameCubeScript:
	checkevent EVENT_DECO_GAMECUBE
	iftrue_jumptext CeladonDeptStore3FGameCubeText
	opentext
	writetext VideoGameClerkSellGameCubeText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext VideoGameClerkNoSaleText
	checkmoney YOUR_MONEY, 30000
	ifequal HAVE_LESS, VideoGameClerkNoMoneyScript
	takemoney YOUR_MONEY, 30000
	setevent EVENT_DECO_GAMECUBE
	writetext BoughtGameCubeText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	jumpthisopenedtext

	text "GameCube fue"
	line "enviada a casa."
	done

CeladonDeptStore3FWiiScript:
	checkevent EVENT_DECO_WII
	iftrue_jumptext CeladonDeptStore3FWiiText
	opentext
	writetext VideoGameClerkSellWiiText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext VideoGameClerkNoSaleText
	checkmoney YOUR_MONEY, 40000
	ifequal HAVE_LESS, VideoGameClerkNoMoneyScript
	takemoney YOUR_MONEY, 40000
	setevent EVENT_DECO_WII
	writetext BoughtWiiText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	jumpthisopenedtext

	text "Wii fue enviada"
	line "a casa."
	done

CeladonDeptStore3FClerk2Text:
	text "Hay un movimiento"
	line "genial llamado"
	cont "Contraataque."

	para "¡No del tipo de"
	line "contraataque en el"
	cont "que me apoyo, ojo!"
	done

Text_CeladonDeptStore3FTutorCounter:
	text "Le enseñaré a tu"
	line "#mon a usar"

	para "Contraataque si me"
	line "pagas una Hoja"
	cont "Plateada."
	done


Text_CeladonDeptStore3FTutorQuestion:
	text "¿Debería"
	line "enseñarle"
	cont "Contraataque a tu"
	cont "#mon?"
	done



VideoGameClerkText:
	text "¡Vendemos"
	line "videoconsolas"
	cont "nuevas y"
	cont "vintage!"

	para "¡Pruébalas tú"
	line "mismo!"
	done

VideoGameClerkNoSaleText:
	text "Dependiente:"
	line "Bueno, si tú lo"
	cont "dices."
	done


VideoGameClerkSellSnesText:
	text "Dependiente: Esa"
	line "SNES puede ser"

	para "¡tuya por solo"
	line "¥20,000! ¿La"
	cont "quieres?"
	done

VideoGameClerkSellN64Text:
	text "Dependiente: Esa"
	line "N64 puede ser"

	para "¡tuya por solo"
	line "¥25,000! ¿La"
	cont "quieres?"
	done

VideoGameClerkSellGameCubeText:
	text "Dependiente: Esa"
	line "GameCube puede ser"

	para "¡tuya por solo"
	line "¥30,000! ¿La"
	cont "quieres?"
	done

VideoGameClerkSellWiiText:
	text "Dependiente: Esa"
	line "Wii puede ser tuya"

	para "¡por solo"
	line "¥40,000! ¿La"
	cont "quieres?"
	done

BoughtSnesText:
	text "<PLAYER> compró"
	line "una Super NES."
	done


BoughtN64Text:
	text "<PLAYER> compró"
	line "una Nintendo 64."
	done


BoughtGameCubeText:
	text "<PLAYER> compró"
	line "una GameCube."
	done


BoughtWiiText:
	text "<PLAYER> compró"
	line "una Wii."
	done


CeladonDeptStore3FYoungsterText:
	text "No puedo decidir"
	line "en qué #mon"

	para "usar esta MT…"

	para "Menos mal que no"
	line "se agota."
	done

CeladonDeptStore3FSuperNerdText:
	text "La Tienda de"
	line "Tecnología vende"
	cont "videoconsolas"
	cont "geniales."
	done

CeladonDeptStore3FDirectoryText:
	text "¡Haz Más Fuerte a"
	line "tu #mon!"

	para "3F: Tienda de"
	line "Tecnología"
	done

CeladonDeptStore3FSnesText:
	text "¡Es una Super"
	line "NES!"

	para "¡Yo tengo una en"
	line "casa!"
	done

CeladonDeptStore3FN64Text:
	text "¡Es una N64!"

	para "¡Yo tengo una en"
	line "casa!"
	done

CeladonDeptStore3FGameCubeText:
	text "¡Es una GameCube!"

	para "¡Yo tengo una en"
	line "casa!"
	done

CeladonDeptStore3FWiiText:
	text "¡Es una Wii!"

	para "¡Yo tengo una en"
	line "casa!"
	done

CeladonDeptStore3FRPGText:
	text "¡Un RPG! ¡No hay"
	line "tiempo para eso!"
	done

CeladonDeptStore3FSportsGameText:
	text "¡Un juego de"
	line "deportes! ¡A papá"
	cont "le va a gustar!"
	done

CeladonDeptStore3FPuzzleGameText:
	text "¡Un puzle! Parece"
	line "adictivo."
	done

CeladonDeptStore3FFightingGameText:
	text "¡Un juego de"
	line "lucha! Parece"
	cont "difícil."
	done
