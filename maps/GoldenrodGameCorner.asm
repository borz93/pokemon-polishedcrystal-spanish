DEF GOLDENRODGAMECORNER_TM35_COINS EQU 4000
DEF GOLDENRODGAMECORNER_TM24_COINS EQU 4000
DEF GOLDENRODGAMECORNER_TM13_COINS EQU 4000
DEF GOLDENRODGAMECORNER_ABRA_COINS     EQU 200
DEF GOLDENRODGAMECORNER_CUBONE_COINS   EQU 800
DEF GOLDENRODGAMECORNER_CLEFAIRY_COINS EQU 1500

GoldenrodGameCorner_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 13, GOLDENROD_CITY, 10
	warp_event  3, 13, GOLDENROD_CITY, 23

	def_coord_events

	def_bg_events
	bg_event  6,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6,  7, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6, 11, BGEVENT_RIGHT, GoldenrodGameCornerSlotsMachineScript
	bg_event  7,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7,  7, BGEVENT_READ, GoldenrodGameCornerLuckySlotsMachineScript
	bg_event  7,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7, 11, BGEVENT_LEFT, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  7, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12, 11, BGEVENT_RIGHT, GoldenrodGameCornerSlotsMachineScript
	bg_event 13,  6, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  7, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  8, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  9, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13, 10, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13, 11, BGEVENT_LEFT, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  6, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  7, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  8, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  9, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18, 10, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, GoldenrodGameCornerCardFlipMachineScript
	bg_event 12,  1, BGEVENT_LEFT, GoldenrodGameCornerLeftTheirDrinkScript

	def_object_events
	object_event  3,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumpstd, gamecornercoinvendor, -1
	object_event 16,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerTMVendorScript, -1
	object_event 18,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPrizeMonVendorScript, -1
	object_event 10,  1, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerFisherScript, -1
	object_event 10,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WANDER, 1, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodGameCornerCooltrainerFText, -1
	object_event 17,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanFScript, -1
	object_event  8,  7, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << DAY) | (1 << NITE), 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	object_event 14,  8, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCooltrainerMScript, -1
	object_event  5, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerGentlemanScript, -1
	object_event 11, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM1Script, -1
	object_event 17, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM3Script, -1
	object_event  2,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodGameCornerPokefanM2Text, EVENT_BEAT_WHITNEY

GoldenrodGameCornerPokefanM3Script:
	showtextfaceplayer GoldenrodGameCornerPokefanM3Text
	turnobject LAST_TALKED, RIGHT
	end

GoldenrodGameCornerFisherScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_PAY_DAY_INTRO
	iftruefwd GoldenrodGameCornerTutorPayDayScript
	writetext GoldenrodGameCornerFisherText
	waitbutton
	setevent EVENT_LISTENED_TO_PAY_DAY_INTRO
GoldenrodGameCornerTutorPayDayScript:
	writetext Text_GoldenrodGameCornerTutorPayDayQuestion
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	yesorno
	iffalsefwd .TutorRefused
	setval PAY_DAY
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Entonces, nada."
	done

.NoSilverLeaf
	waitbutton
	jumpthisopenedtext

	text "¿No tienes una"
	line "Hoja Plata?"
	cont "Entonces, nada."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Día de Pago te da"
	line "más dinero tras"
	cont "una batalla."

	para "¡Sigue usándolo y"
	line "serás rico!"
	done

GoldenrodGameCornerTMVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkkeyitem COIN_CASE
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorNoCoinCaseText
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
GoldenrodGameCornerTMVendor_LoopScript: ; 056c36
	special Special_DisplayCoinCaseBalance
	loadmenu GoldenrodGameCornerTMVendorMenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .flamethrower
	ifequalfwd $2, .thunderbolt
	ifequalfwd $3, .ice_beam
	jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText

.flamethrower:
	checktmhm TM_FLAMETHROWER
	iftruefwd GoldenrodGameCornerPrizeVendor_AlreadyHaveTMScript
	checkcoins GOLDENRODGAMECORNER_TM35_COINS
	ifequalfwd HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	gettmhmname TM_FLAMETHROWER, STRING_BUFFER_3
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText
	givetmhm TM_FLAMETHROWER
	takecoins GOLDENRODGAMECORNER_TM35_COINS
	sjumpfwd GoldenrodGameCornerTMVendor_FinishScript

.thunderbolt:
	checktmhm TM_THUNDERBOLT
	iftruefwd GoldenrodGameCornerPrizeVendor_AlreadyHaveTMScript
	checkcoins GOLDENRODGAMECORNER_TM24_COINS
	ifequalfwd HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	gettmhmname TM_THUNDERBOLT, STRING_BUFFER_3
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText
	givetmhm TM_THUNDERBOLT
	takecoins GOLDENRODGAMECORNER_TM24_COINS
	sjumpfwd GoldenrodGameCornerTMVendor_FinishScript

.ice_beam:
	checktmhm TM_ICE_BEAM
	iftruefwd GoldenrodGameCornerPrizeVendor_AlreadyHaveTMScript
	checkcoins GOLDENRODGAMECORNER_TM13_COINS
	ifequalfwd HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	gettmhmname TM_ICE_BEAM, STRING_BUFFER_3
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText
	givetmhm TM_ICE_BEAM
	takecoins GOLDENRODGAMECORNER_TM13_COINS
	sjumpfwd GoldenrodGameCornerTMVendor_FinishScript

GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext GoldenrodGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

GoldenrodGameCornerTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	sjump GoldenrodGameCornerTMVendor_LoopScript

GoldenrodGameCornerPrizeVendor_AlreadyHaveTMScript:
	writetext GoldenrodGameCornerPrizeVendorAlreadyHaveTMText
	waitbutton
	sjump GoldenrodGameCornerTMVendor_LoopScript

GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript:
	jumpthisopenedtext

	text "¡Lo siento! Nece-"
	line "sitas más monedas."
	done

GoldenrodGameCornerTMVendorMenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "TM35    {d:GOLDENRODGAMECORNER_TM35_COINS}@"
	db "TM24    {d:GOLDENRODGAMECORNER_TM24_COINS}@"
	db "TM13    {d:GOLDENRODGAMECORNER_TM13_COINS}@"
	db "Cancel@"

GoldenrodGameCornerPrizeMonVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkkeyitem COIN_CASE
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorNoCoinCaseText
.loop
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
	special Special_DisplayCoinCaseBalance
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .abra
	ifequalfwd $2, .cubone
	ifequalfwd $3, .clefairy
	jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText

.abra
	checkcoins GOLDENRODGAMECORNER_ABRA_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getmonname ABRA, STRING_BUFFER_3
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	givepoke ABRA, 5
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorNoMoreRoomText
	setmonval ABRA
	special Special_GameCornerPrizeMonCheckDex
	takecoins GOLDENRODGAMECORNER_ABRA_COINS
	sjump .loop

.cubone
	checkcoins GOLDENRODGAMECORNER_CUBONE_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getmonname CUBONE, STRING_BUFFER_3
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	givepoke CUBONE, 10
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorNoMoreRoomText
	setmonval CUBONE
	special Special_GameCornerPrizeMonCheckDex
	takecoins GOLDENRODGAMECORNER_CUBONE_COINS
	sjump .loop

.clefairy
	checkcoins GOLDENRODGAMECORNER_CLEFAIRY_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getmonname CLEFAIRY, STRING_BUFFER_3
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorQuitText
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	givepoke CLEFAIRY, 15
	iffalse_jumpopenedtext GoldenrodGameCornerPrizeVendorNoMoreRoomText
	setmonval CLEFAIRY
	special Special_GameCornerPrizeMonCheckDex
	takecoins GOLDENRODGAMECORNER_CLEFAIRY_COINS
	sjump .loop

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 17, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Abra        {d:GOLDENRODGAMECORNER_ABRA_COINS}@"
	db "Cubone      {d:GOLDENRODGAMECORNER_CUBONE_COINS}@"
	db "Clefairy   {d:GOLDENRODGAMECORNER_CLEFAIRY_COINS}@"
	db "Cancel@"

GoldenrodGameCornerPharmacistScript:
	showtextfaceplayer GoldenrodGameCornerPharmacistText
	turnobject LAST_TALKED, LEFT
	end

GoldenrodGameCornerPokefanM1Script:
	showtextfaceplayer GoldenrodGameCornerPokefanM1Text
	turnobject LAST_TALKED, RIGHT
	end

GoldenrodGameCornerCooltrainerMScript:
	showtextfaceplayer GoldenrodGameCornerCooltrainerMText
	turnobject LAST_TALKED, LEFT
	end

GoldenrodGameCornerPokefanFScript:
	showtextfaceplayer GoldenrodGameCornerPokefanFText
	turnobject LAST_TALKED, RIGHT
	end

GoldenrodGameCornerGentlemanScript:
	showtextfaceplayer GoldenrodGameCornerGentlemanText
	turnobject LAST_TALKED, RIGHT
	end

GoldenrodGameCornerLeftTheirDrinkScript:
	jumpthistext

	text "Alguien dejó su"
	line "bebida."

	para "Huele dulce."
	done

GoldenrodGameCornerSlotsMachineScript:
	random 6
	ifequalfwd 0, GoldenrodGameCornerLuckySlotsMachineScript
	reanchormap
	setval FALSE
	special Special_SlotMachine
	endtext

GoldenrodGameCornerLuckySlotsMachineScript:
	reanchormap
	setval TRUE
	special Special_SlotMachine
	endtext

GoldenrodGameCornerCardFlipMachineScript:
	reanchormap
	special Special_CardFlip
	endtext

GoldenrodGameCornerPrizeVendorIntroText:
	text "¡Bienvenido!"

	para "¡Cambiamos tus"
	line "monedas de juego"
	cont "por premios"
	cont "geniales!"
	done

GoldenrodGameCornerPrizeVendorWhichPrizeText:
	text "¿Qué premio"
	line "quieres?"
	done

GoldenrodGameCornerPrizeVendorConfirmPrizeText:
	text_ram wStringBuffer3
	text "."
	line "¿Es correcto?"
	done

GoldenrodGameCornerPrizeVendorHereYouGoText:
	text "¡Aquí tienes!"
	done

GoldenrodGameCornerPrizeVendorAlreadyHaveTMText:
	text "Pero ya tienes"
	line "¡esa MT!"
	done


GoldenrodGameCornerPrizeVendorNoMoreRoomText:
	text "Oh, no. No puedes"
	line "llevar más y tu"
	cont "Caja está llena."

	para "Te devolveré"
	line "tus monedas."
	done

GoldenrodGameCornerPrizeVendorQuitText:
	text "Vale. Guarda tus"
	line "monedas y"
	cont "¡vuelve pronto!"
	done

GoldenrodGameCornerPrizeVendorNoCoinCaseText:
	text "¿Eh? No tienes"
	line "un Monedero."
	done

GoldenrodGameCornerFisherText:
	text "¡Hoy es mi día de"
	line "pago! ¡Toca"
	cont "celebrar con"
	cont "tragaperras!"

	para "…¿Sabías que los"
	line "#mon también"
	cont "usan Día de Pago?"
	done

Text_GoldenrodGameCornerTutorPayDayQuestion:
	text "Si me das una"
	line "Hoja Plata, le"

	para "enseñaré Día de"
	line "Pago a tu #mon."
	done




GoldenrodGameCornerPharmacistText:
	text "Siempre juego en"
	line "esta máquina."

	para "Creo que paga más"
	line "que las demás."
	done

GoldenrodGameCornerPokefanM1Text:
	text "Me encanta esta"
	line "máquina nueva."

	para "Es más difícil"
	line "que las de"
	cont "Ciudad Azulona."
	done

GoldenrodGameCornerCooltrainerMText:
	text "La vida es una"
	line "apuesta. ¡Voy a"
	cont "voltear cartas"
	cont "hasta caer!"
	done

GoldenrodGameCornerPokefanFText:
	text "Volteo de"
	line "cartas…"

	para "Lo prefiero a"
	line "las tragaperras"
	cont "porque"

	para "es más fácil"
	line "calcular las"
	cont "probabilidades."

	para "Pero paga mucho"
	line "menos."
	done

GoldenrodGameCornerCooltrainerFText:
	text "¡No pararé hasta"
	line "ganar!"
	done

GoldenrodGameCornerGentlemanText:
	text "Enseñé Rayo"
	line "Hielo a mi"
	cont "#mon."

	para "Fue difícil"
	line "reunir monedas"

	para "para eso, pero"
	line "valió la pena."
	done

GoldenrodGameCornerPokefanM2Text:
	text "No pude ganar en"
	line "las tragaperras,"
	cont "y lo perdí todo"
	cont "volteando cartas…"

	para "Me enfadé tanto"
	line "que tiré mi"

	para "Monedero en el"
	line "Subterráneo."
	done

GoldenrodGameCornerPokefanM3Text:
	text "¡Jajaja! ¡Las"
	line "monedas no paran"
	cont "de caer!"
	done
