Route32CoastHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_32_COAST, 2
	warp_event  3,  7, ROUTE_32_COAST, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  2, SPRITE_BAKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GourmetManiacScript, -1

GourmetManiacScript:
	faceplayer
	opentext
	writetext .GreetingText
	promptbutton
	special Special_ChooseItem
	iffalse_jumpopenedtext .NoItemText
	special GetGourmetManiacPrice
	iffalse_jumpopenedtext .WrongItemText
	special ItemManiac_SelectQuantity
	iffalse_jumpopenedtext .NoItemText
	special MultiplyMoneyByQuantity
	writetext .OfferText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .NoItemText
	special TakeItemFromMemWithQuantity
	waitsfx
	playsound SFX_TRANSACTION
	special Give_hMoneyTemp
	special PlaceMoneyTopRight
	jumpthisopenedtext

	text "¡Merci! ¡Gracias!"

	para "Con esto podré"
	line "crear algo"
	cont "excelente."
	done

.GreetingText:
	text "¡Hola! Soy un"
	line "panadero gourmet!"

	para "Cocino platos"
	line "increíbles solo"
	cont "con los mejores"
	cont "ingredientes."

	para "¿Tienes"
	line "ingredientes"
	cont "que venderme?"
	done

.OfferText:
	text "¡Oh, huele"
	line "genial!"

	para "¿Aceptarías"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text " por ello?"
	done

.WrongItemText:
	text "Hmmm… No es"
	line "exactamente lo"
	cont "que busco."
	done

.NoItemText:
	text "Vaya… Bueno,"
	line "no pasa nada."
	done
