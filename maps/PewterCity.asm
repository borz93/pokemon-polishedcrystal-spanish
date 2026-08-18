PewterCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PewterCityFlyPoint
	callback MAPCALLBACK_CMDQUEUE, PewterCitySetUpPaletteSwap

	def_warp_events
	warp_event 29, 15, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 12, 19, PEWTER_GYM, 1
	warp_event 23, 21, PEWTER_MART, 2
	warp_event 13, 27, PEWTER_POKECENTER_1F, 1
	warp_event  7, 31, PEWTER_SNOOZE_SPEECH_HOUSE, 1
	warp_event 14,  9, PEWTER_MUSEUM_OF_SCIENCE_1F, 1
	warp_event 19,  7, PEWTER_MUSEUM_OF_SCIENCE_1F, 3
	warp_event 15,  9, PEWTER_MUSEUM_OF_SCIENCE_1F, 2

	def_coord_events

	def_bg_events
	bg_event 25, 25, BGEVENT_JUMPTEXT, PewterCitySignText
	bg_event 13, 19, BGEVENT_JUMPTEXT, PewterGymSignText
	bg_event 13, 10, BGEVENT_JUMPTEXT, PewterMuseumOfScienceSignText
	bg_event 33, 21, BGEVENT_JUMPTEXT, PewterCityMtMoonGiftShopSignText
	bg_event 19, 31, BGEVENT_JUMPTEXT, PewterCityTrainerTipsText

	def_object_events
	object_event 22, 13, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterCityCooltrainerFText, -1
	object_event 19, 12, SPRITE_COOL_DUDE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterCityCooltrainermText, -1
	object_event 14, 31, SPRITE_CHILD, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterCityBugCatcherText, -1
	object_event 29, 19, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterCityGrampsScript, -1
	object_event  6, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityYoungsterScript, -1
	object_event 25, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PewterCityPokefanMScript, -1
	fruittree_event 26,  5, FRUITTREE_PEWTER_CITY_1, PETAYA_BERRY, PAL_NPC_PINK
	fruittree_event 24,  5, FRUITTREE_PEWTER_CITY_2, APICOT_BERRY, PAL_NPC_BLUE

PewterCityFlyPoint:
	setflag ENGINE_FLYPOINT_PEWTER
	endcallback

PewterCitySetUpPaletteSwap:
	usepaletteswap .PaletteSwap
	endcallback

.PaletteSwap:
	paletteswap 0, 255, 0, 13, PAL_BG_WATER, OverworldWaterPalettes, PewterCityMuseumRoofPalettes
	db -1 ; end

PewterCityGrampsScript:
	checkevent EVENT_GOT_OLD_AMBER
	iftrue_jumptextfaceplayer PewterCityGrampsText_GotSilverWing
	faceplayer
	opentext
	writetext PewterCityGrampsText
	promptbutton
	verbosegiveitem OLD_AMBER
	iffalse_endtext
	setevent EVENT_GOT_OLD_AMBER
	endtext

PewterCityYoungsterScript:
	faceplayer
	opentext
	writetext PewterCityYoungsterText1
	waitbutton
	checkflag ENGINE_BOULDERBADGE
	iffalse_endtext
	jumpthisopenedtext

	text "¿Venciste al"
	line "Gimnasio? ¡Eres"
	cont "duro como roca"
	cont "también!"
	done

PewterCityPokefanMScript:
	faceplayer
	opentext
	writetext .Text1
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .Text3
	checkmoney YOUR_MONEY, 300
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem PEWTERCRUNCH
	iffalse_jumpopenedtext .Text4
	waitsfx
	takemoney YOUR_MONEY, 300
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext .Text2
	promptbutton
	itemnotify
	endtext

.Text1:
	text "¡La especialidad"
	line "de Ciudad"
	cont "Plateada:"
	cont "PewterCrunch!"

	para "¡Te vendo un"
	line "paquete por ¥300!"
	done

.Text2:
	text "¡Gracias!"
	line "Son muy duras,"
	cont "¡ten cuidado!"
	done

.Text3:
	text "¿Son demasiado"
	line "crujientes para"
	cont "ti?"
	done

.Text4:
	text "¡No tienes sitio"
	line "para ellas!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "¡No tienes dinero"
	line "para ellas!"
	done

PewterCityCooltrainerFText:
	text "Los #mon solo"
	line "pueden tener dos"
	cont "tipos a la vez,"
	cont "pero si fuera"

	para "posible que un"
	line "#mon fuera de"
	cont "todos los tipos,"
	cont "solo tendría una"
	cont "debilidad."

	para "¿Qué debilidad,"
	line "preguntas?"

	para "¡Ataques tipo"
	line "Roca, claro está!"
	done

PewterCityCooltrainermText:
	text "Esta chica cree"
	line "que los #mon"
	cont "tipo Roca son la"
	cont "monda,"

	para "pero empatan en"
	line "tener más"
	cont "debilidades que"
	cont "cualquier tipo."

	para "No tengo corazón"
	line "para decírselo,"
	cont "eso sí."
	done

PewterCityBugCatcherText:
	text "De noche, los"
	line "Clefairy salen a"
	cont "jugar en el Monte"
	cont "Moon."

	para "Pero no todas las"
	line "noches."
	done

PewterCityGrampsText:
	text "Ah, ¿Viniste hasta"
	line "aquí desde Johto?"

	para "Eso trae"
	line "recuerdos. Cuando"

	para "era joven, fui a"
	line "Johto a entrenar."

	para "Me recuerdas"
	line "mucho a cómo era"

	para "yo de joven."

	para "Toma. Quiero que"
	line "tengas este objeto"
	cont "que encontré en"
	cont "Johto."
	done

PewterCityGrampsText_GotSilverWing:
	text "Ir a lugares"
	line "nuevos y"
	cont "desconocidos, y"
	cont "conocer gente"
	cont "nueva…"

	para "Esas son las"
	line "alegrías de"
	cont "viajar."
	done

PewterCityYoungsterText1:
	text "El Gimnasio"
	line "Plateado es tan"
	cont "áspero y duro como"
	cont "la roca misma."

	para "Ten cuidado ahí"
	line "dentro."
	done


PewterCitySignText:
	text "Ciudad Plateada"
	line "Una Ciudad Gris"
	cont "Piedra"
	done

PewterGymSignText:
	text "Ciudad Plateada"
	line "Gimnasio #mon"
	cont "Líder: Brock"

	para "El Entrenador"
	line "#mon Sólido"
	cont "como Roca"
	done

PewterMuseumOfScienceSignText:
	text "Museo de Ciencias"
	line "de Plateada"
	done

PewterCityMtMoonGiftShopSignText:
	text "Hay un aviso"
	line "aquí…"

	para "¡Tienda de Regalos"
	line "del Monte Moon ya"
	cont "abierta!"
	done

PewterCityTrainerTipsText:
	text "Consejos"

	para "Un #mon con un"
	line "Tope Habil. tiene"
	cont "más"
	cont "posibilidades de"
	cont "tener una cría con"
	cont "una habilidad"
	cont "rara."
	done
