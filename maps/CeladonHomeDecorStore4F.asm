
CeladonHomeDecorStore4F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  9,  0, CELADON_HOME_DECOR_STORE_3F, 2

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_JUMPTEXT, CeladonHomeDecorStore4FDirectoryText
	bg_event  2,  5, BGEVENT_READ, BigOnixDollScript
	bg_event  3,  5, BGEVENT_READ, BigOnixDollScript
	bg_event  2,  6, BGEVENT_READ, BigOnixDollScript
	bg_event  3,  6, BGEVENT_READ, BigOnixDollScript

	def_object_events
	object_event  9,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, BigDollClerkText, -1
	object_event  1,  3, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BigSnorlaxDollScript, -1
	object_event  2,  3, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_STANDING_DOWN_FLIP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BigSnorlaxDollScript, -1
	object_event  1,  4, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BigSnorlaxDollScript, -1
	object_event  2,  4, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_STANDING_UP_FLIP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BigSnorlaxDollScript, -1
	object_event  4,  4, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BigLaprasDollScript, -1
	object_event  5,  4, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_STANDING_DOWN_FLIP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BigLaprasDollScript, -1
	object_event  4,  5, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BigLaprasDollScript, -1
	object_event  5,  5, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_STANDING_UP_FLIP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BigLaprasDollScript, -1

BigDollClerkNoMoneyScript:
	jumpthisopenedtext

	text "Empleado: ¡No"
	line "puedes pagarlo!"
	done

BigLaprasDollScript:
	checkevent EVENT_DECO_BIG_LAPRAS_DOLL
	iftrue_jumptext BigLaprasDollText
	opentext
	writetext BigDollClerkSellLaprasText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext BigDollClerkNoSaleText
	checkmoney YOUR_MONEY, 300000
	ifequal HAVE_LESS, BigDollClerkNoMoneyScript
	takemoney YOUR_MONEY, 300000
	setevent EVENT_DECO_BIG_LAPRAS_DOLL
	writetext BoughtBigLaprasDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	jumpthisopenedtext

	text "El Muñeco Lapras"
	line "Gigante se envió"
	cont "a casa."
	done

BigSnorlaxDollScript:
	checkevent EVENT_DECO_BIG_SNORLAX_DOLL
	iftrue_jumptext BigSnorlaxDollText
	opentext
	writetext BigDollClerkSellSnorlaxText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext BigDollClerkNoSaleText
	checkmoney YOUR_MONEY, 200000
	ifequal HAVE_LESS, BigDollClerkNoMoneyScript
	takemoney YOUR_MONEY, 200000
	setevent EVENT_DECO_BIG_SNORLAX_DOLL
	writetext BoughtBigSnorlaxDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	jumpthisopenedtext

	text "El Muñeco Snorlax"
	line "Gigante se envió"
	cont "a casa."
	done

BigOnixDollScript:
	checkevent EVENT_DECO_BIG_ONIX_DOLL
	iftrue_jumptext BigOnixDollText
	opentext
	writetext BigDollClerkSellOnixText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext BigDollClerkNoSaleText
	checkmoney YOUR_MONEY, 250000
	ifequal HAVE_LESS, BigDollClerkNoMoneyScript
	takemoney YOUR_MONEY, 250000
	setevent EVENT_DECO_BIG_ONIX_DOLL
	writetext BoughtBigOnixDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	jumpthisopenedtext

	text "El Muñeco Onix"
	line "Gigante se envió"
	cont "a casa."
	done

BigDollClerkText:
	text "¿No son"
	line "impresionantes"
	cont "nuestros muñecos"
	cont "gigantes?"

	para "Son tan grandes"
	line "que apenas caben"
	cont "en la sala."
	done

BigDollClerkNoSaleText:
	text "Empleado: Bueno,"
	line "si tú lo dices."
	done


BigDollClerkSellLaprasText:
	text "Empleado: ¿Te"
	line "gusta el muñeco"
	cont "Lapras?"

	para "Te costará"
	line "¥300,000."
	done

BigDollClerkSellSnorlaxText:
	text "Empleado: ¿Te"
	line "gusta el muñeco"
	cont "Snorlax?"

	para "Te costará"
	line "¥200,000."
	done

BigDollClerkSellOnixText:
	text "Empleado: ¿Te"
	line "gusta el muñeco"
	cont "Onix?"

	para "Te costará"
	line "¥250,000."
	done

BoughtBigLaprasDollText:
	text "<PLAYER> compró"
	line "el Muñeco Lapras"
	cont "Gigante."
	done


BoughtBigSnorlaxDollText:
	text "<PLAYER> compró"
	line "el Muñeco Snorlax"
	cont "Gigante."
	done


BoughtBigOnixDollText:
	text "<PLAYER> compró"
	line "el Muñeco Onix"
	cont "Gigante."
	done


BigLaprasDollText:
	text "¡Es un Muñeco"
	line "Lapras gigante!"
	done

BigSnorlaxDollText:
	text "¡Es un Muñeco"
	line "Snorlax gigante!"
	done

BigOnixDollText:
	text "¡Es un Muñeco"
	line "Onix gigante!"
	done

CeladonHomeDecorStore4FDirectoryText:
	text "¡Un compañero"
	line "de peluche!"

	para "4F: Muñecos"
	line "Gigantes"
	done
