GoldenrodBikeShop_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 2
	warp_event  3,  7, GOLDENROD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  1,  2, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  0,  3, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  1,  3, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  0,  5, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  1,  5, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  0,  6, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  1,  6, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  6,  6, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  7,  6, BGEVENT_JUMPTEXT, GoldenrodBikeShopBicycleText
	bg_event  3,  0, BGEVENT_JUMPTEXT, GoldenrodBikeShopJustReleasedCompactBikeText

	def_object_events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopClerkScript, -1

GoldenrodBikeShopClerkScript:
	checkevent EVENT_GOT_BICYCLE
	iftrue_jumptextfaceplayer GoldenrodBikeShopClerkFirstRateBikesText
	faceplayer
	opentext
	writetext GoldenrodBikeShopClerkIntroText
	yesorno
	iffalse_jumpopenedtext GoldenrodBikeShopClerkRefusedText
	writetext GoldenrodBikeShopClerkAgreedText
	promptbutton
	waitsfx
	verbosegivekeyitem BICYCLE
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
	jumpthisopenedtext

GoldenrodBikeShopClerkFirstRateBikesText:
	text "¡Mis Bicis son"
	line "de primera!"

	para "Puedes montarlas"
	line "donde sea."
	done

GoldenrodBikeShopClerkIntroText:
	text "…Suspiro… Abrí"
	line "una sucursal"
	cont "aquí,"

	para "pero no vendo ni"
	line "una Bici."
	cont "¿Por qué será?"

	para "¿Podrías montar"
	line "una Bici y"
	cont "hacerme"
	cont "publicidad?"
	done

GoldenrodBikeShopClerkAgreedText:
	text "¿En serio?"
	line "¡Genial!"

	para "Dame tu nombre y"
	line "tu número de"
	cont "teléfono,"

	para "y te prestaré"
	line "una Bici."
	done

GoldenrodBikeShopClerkRefusedText:
	text "…Suspiro… Ay,"
	line "la amabilidad"
	cont "de la gente…"
	done

GoldenrodBikeShopBicycleText:
	text "¡Es una Bici"
	line "nueva y"
	cont "reluciente!"
	done

GoldenrodBikeShopJustReleasedCompactBikeText:
	text "¡Recién salida!"

	para "¡Bicis compactas"
	line "de primera!"
	done
