CopycatsHouse2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CopycatsHouse2FCallback

	def_warp_events
	warp_event  3,  0, COPYCATS_HOUSE_1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, CopycatScript, -1
	object_event  6,  4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DODRIO, -1, PAL_MON_BROWN, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsDodrioScript, -1
	object_event  6,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, CLEFAIRY, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsHouse2FDollScript, EVENT_COPYCATS_HOUSE_2F_DOLL
	object_event  2,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, GENGAR, -1, PAL_MON_PURPLE, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsHouse2FDollScript, -1
	object_event  7,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, MURKROW, -1, PAL_MON_BLUE, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsHouse2FDollScript, -1
	pokemon_event  0,  4, DITTO, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PURPLE, CopycatsHouse2FDittoText, -1

	object_const_def
	const COPYCATSHOUSE2F_COPYCAT

CopycatsHouse2FCallback:
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	endcallback

CopycatScript:
	readvar VAR_PLAYERGENDER
	ifequalfwd PLAYER_FEMALE, CopycatFemaleScript
	ifequalfwd PLAYER_ENBY, CopycatEnbyScript
	ifequalfwd PLAYER_BETA, CopycatBetaScript
	; fallthrough

CopycatMaleScript:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftruefwd .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue CopycatReturnedLostItemScript
	checkkeyitem LOST_ITEM
	iftrue CopycatFoundLostItemScript
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special RefreshSprites
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .ReturnedMachinePart
	showtext CopycatGreeting1Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatRetortScript

.ReturnedMachinePart:
	showtext CopycatLostDoll1Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatWorriedScript

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special RefreshSprites
	showtext CopycatThanks1Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatFinalScript

CopycatFemaleScript:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftruefwd .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue CopycatReturnedLostItemScript
	checkkeyitem LOST_ITEM
	iftrue CopycatFoundLostItemScript
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
	special RefreshSprites
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .ReturnedMachinePart
	showtext CopycatGreeting2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatRetortScript

.ReturnedMachinePart:
	showtext CopycatLostDoll2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatWorriedScript

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
	special RefreshSprites
	showtext CopycatThanks2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatFinalScript

CopycatEnbyScript:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftruefwd .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue CopycatReturnedLostItemScript
	checkkeyitem LOST_ITEM
	iftrue CopycatFoundLostItemScript
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CRYS
	special RefreshSprites
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .ReturnedMachinePart
	showtext CopycatGreeting2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatRetortScript

.ReturnedMachinePart:
	showtext CopycatLostDoll2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatWorriedScript

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CRYS
	special RefreshSprites
	showtext CopycatThanks2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatFinalScript

CopycatBetaScript:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftruefwd .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue CopycatReturnedLostItemScript
	checkkeyitem LOST_ITEM
	iftruefwd CopycatFoundLostItemScript
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_BETA
	special RefreshSprites
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .ReturnedMachinePart
	showtext CopycatGreeting2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatRetortScript

.ReturnedMachinePart:
	showtext CopycatLostDoll2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatWorriedScript

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_BETA
	special RefreshSprites
	showtext CopycatThanks2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatFinalScript

CopycatRetortScript:
	faceplayer
	loadmem wObject1Palette, 1
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special RefreshSprites
	jumpthistext

	text "Copycat: ¿Mmm?"
	line "¿Que deje de"
	cont "imitar?"

	para "¡Pero es mi"
	line "afición favorita!"
	done

CopycatWorriedScript:
	faceplayer
	loadmem wObject1Palette, 1
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special RefreshSprites
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	jumpthistext

	text "Copycat: ¿Cómo?"

	para "¿Que no debería"
	line "decidir qué debes"
	cont "hacer?"

	para "Pero estoy muy"
	line "preocupada… ¿Y si"
	cont "alguien lo"
	cont "encuentra?"
	done

CopycatFoundLostItemScript:
	opentext
	writetext .FoundDollText
	promptbutton
	takekeyitem LOST_ITEM
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent EVENT_COPYCATS_HOUSE_2F_DOLL
	sjumpfwd CopycatGivePassScript

.FoundDollText:
	text "Copycat: ¡Bien!"
	line "¡Es el # Muñeco"
	cont "de Clefairy!"

	para "¿Ves el remiendo"
	line "en la pata"

	para "derecha? ¡Esa es"
	line "la prueba!"
	done

CopycatReturnedLostItemScript:
	opentext
CopycatGivePassScript:
	writetext .GivePassText
	promptbutton
	verbosegivekeyitem PASS
	iffalse_endtext
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	jumpthisopenedtext

	text "Copycat: Ese es"
	line "el pase para el"
	cont "Tren Imán."

	para "Me lo dio el"
	line "hombre de la"
	cont "compañía"

	para "ferroviaria cuando"
	line "derribaron nuestra"
	cont "vieja casa para la"
	cont "estación."
	done

.GivePassText:
	text "Vale. ¡Aquí tienes"
	line "el Pase del Tren"
	cont "Imán, como"
	cont "prometí!"
	done

CopycatFinalScript:
	faceplayer
	loadmem wObject1Palette, 1
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special RefreshSprites
	jumpthistext

	text "Copycat: ¡Ya lo"
	line "creo! ¡Es"
	cont "divertidísimo!"
	done

CopycatGreeting1Text:
	text "<PLAYER>: ¡Hola!"
	line "¿Te gustan los"
	cont "#mon?"

	para "<PLAYER>: Anda,"
	line "no, si te lo he"
	cont "preguntado yo a"
	cont "ti."

	para "<PLAYER>: ¿Eh?"
	line "¡Qué rara eres!"
	done

CopycatLostDoll1Text:
	text "<PLAYER>: ¡Hola!"
	line "Oí que perdiste tu"

	para "# Muñeco"
	line "favorito."

	para "<PLAYER>: ¿Si lo"
	line "encuentro, me das"
	cont "un pase de tren?"

	para "<PLAYER>: Iré a"
	line "buscarlo por ti."

	para "¿Crees que lo"
	line "perdiste cuando"
	cont "fuiste a Ciudad"
	cont "Carmín?"
	done

CopycatThanks1Text:
	text "<PLAYER>: ¡Hola!"
	line "¡Muchas gracias"
	cont "por el pase de"
	cont "tren!"

	para "<PLAYER>: ¿Cómo?"

	para "<PLAYER>: ¿Es tan"
	line "divertido imitar"
	cont "todo lo que hago?"
	done

CopycatGreeting2Text:
	text "<PLAYER>: Hola. Te"
	line "deben gustar los"
	cont "#mon."

	para "<PLAYER>: No, a mí"
	line "no. Te lo he"
	cont "preguntado yo."

	para "<PLAYER>: ¿Cómo?"
	line "¡Qué rara eres!"
	done

CopycatLostDoll2Text:
	text "<PLAYER>: Hola."
	line "¿De verdad"
	cont "perdiste tu"
	cont "# Muñeco?"

	para "<PLAYER>: ¿De"
	line "verdad me darás"

	para "un pase de tren si"
	line "lo encuentro por"
	cont "ti?"

	para "<PLAYER>: ¡Claro,"
	line "lo buscaré!"

	para "¿Crees que lo"
	line "perdiste cuando"
	cont "estuviste en"
	cont "Ciudad Carmín?"
	done

CopycatThanks2Text:
	text "<PLAYER>: ¡Gracias"
	line "por el pase de"
	cont "tren!"

	para "<PLAYER>: …¿Cómo?"

	para "<PLAYER>: ¿Es tan"
	line "divertido copiar"

	para "lo que digo y"
	line "hago?"
	done

CopycatSpinMovement:
rept 2
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
endr
	turn_head_down
	step_end

CopycatsDodrioScript:
	opentext
	writetext .Text1
	cry DODRIO
	promptbutton
	jumpthisopenedtext

	text "Espejito,"
	line "espejito, ¿quién"
	cont "es la más hermosa"
	cont "de todas?"
	done

.Text1:
	text "Dodrio: ¡Gii giii!"
	done

CopycatsHouse2FDollScript:
	jumpthistext

	text "¡Es un #mon"
	line "raro! ¿Eh?"

	para "Es solo un"
	line "muñeco…"
	done

CopycatsHouse2FDittoText:
	text "Ditto: Dii…"
	done
