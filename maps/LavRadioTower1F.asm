LavRadioTower1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, LavRadioTower1FUpstairsScript

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 7
	warp_event  3,  7, LAVENDER_TOWN, 7
	warp_event 15,  0, LAV_RADIO_TOWER_2F, 255

	def_coord_events

	def_bg_events
	bg_event 11,  0, BGEVENT_JUMPTEXT, LavRadioTower1FDirectoryText
	bg_event  5,  0, BGEVENT_JUMPTEXT, LavRadioTower1FPokeFluteSignText
	bg_event  8,  0, BGEVENT_JUMPTEXT, LavRadioTower1FReferenceLibraryText

	def_object_events
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavRadioTower1FReceptionistText, -1
	object_event 15,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavRadioTower1FOfficerText, EVENT_RESTORED_POWER_TO_KANTO
	object_event  1,  3, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavRadioTower1FSuperNerd1Text, -1
	object_event  9,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, -1
	object_event 14,  6, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, -1

LavRadioTower1FUpstairsScript:
	checkevent EVENT_EXORCISED_LAV_RADIO_TOWER
	iftruefwd .Exorcised
	warpmod 1, HAUNTED_RADIO_TOWER_2F
	endcallback

.Exorcised:
	warpmod 1, LAV_RADIO_TOWER_2F
	endcallback

LavRadioTower1FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue_jumpopenedtext .GotExpnCardText
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumpopenedtext .OffTheAirText
	writetext .ReturnedMachinePartText
	promptbutton
	givespecialitem EXPN_CARD
	setflag ENGINE_EXPN_CARD
	jumpthisopenedtext

.GotExpnCardText:
	text "Con eso, puedes"
	line "sintonizar los"

	para "programas de radio"
	line "aquí en Kanto."

	para "¡Jajajaja!"
	done

.OffTheAirText:
	text "¡Oh, no, no, no!"

	para "Estamos fuera del"
	line "aire desde que la"

	para "Central Eléctrica"
	line "cerró."

	para "Todos mis"
	line "esfuerzos por"

	para "iniciar esta"
	line "emisora se"
	cont "desperdiciarán si"
	cont "no puedo emitir."

	para "¡Estaré arruinado!"
	done

.ReturnedMachinePartText:
	text "¡Ah! Así que eres"
	line "el <PLAYER> que"

	para "resolvió el"
	line "problema de la"
	cont "Central Eléctrica?"

	para "Gracias a ti, no"
	line "perdí mi trabajo."

	para "¡Te digo que eres"
	line "todo un salvador!"

	para "Toma esto como mi"
	line "agradecimiento."
	done

LavRadioTower1FSuperNerd2Script:
	checkflag ENGINE_EXPN_CARD
	iftrue_jumptextfaceplayer LavRadioTower1FSuperNerd2Text_GotExpnCard
	jumpthistextfaceplayer

	text "¡Hola!"

	para "¡Soy el Director"
	line "Musical supremo!"

	para "¿Eh? Tu #gear no"
	line "sintoniza mis"

	para "programas de"
	line "música."
	cont "¡Qué lástima!"

	para "Si consigues una"
	line "Tarj. Expn.,"
	cont "podrás sintonizar."

	para "¡Más te vale"
	line "conseguir una!"
	done

LavRadioTower1FReceptionistText:
	text "¡Bienvenido!"
	line "Siéntete libre de"

	para "mirar por todo"
	line "este piso."
	done

LavRadioTower1FOfficerText:
	text "Lo siento, pero"
	line "solo puedes"
	cont "visitar la planta"
	cont "baja."

	para "Desde que la Torre"
	line "Radio de Johto fue"

	para "tomada por una"
	line "banda criminal,"

	para "tuvimos que"
	line "reforzar nuestra"
	cont "seguridad."
	done

LavRadioTower1FSuperNerd1Text:
	text "Mucha gente"
	line "trabaja duro aquí"

	para "en la Torre"
	line "Radio."

	para "Deben esforzarse"
	line "al máximo para"
	cont "hacer buenos"
	cont "programas."
	done

LavRadioTower1FSuperNerd2Text_GotExpnCard:
	text "¡Hola!"

	para "¡Soy el Director"
	line "Musical supremo!"

	para "Soy responsable"
	line "de las hermosas"

	para "melodías que salen"
	line "al aire."

	para "No seas soso."
	line "¡Consigue tu"
	cont "música del aire!"
	done

LavRadioTower1FDirectoryText:
	text "1F Recepción"
	line "2F Ventas"

	para "3F Personal"
	line "4F Producción"

	para "5F Despacho del"
	line "   Director"
	done

LavRadioTower1FPokeFluteSignText:
	text "Anima #mon con"
	line "sonidos suaves"

	para "de la Flauta #"
	line "en el Canal 20"
	done

LavRadioTower1FReferenceLibraryText:
	text "¡Vaya! Un estante"
	line "lleno de CD y"
	cont "vídeos #mon."

	para "Debe ser la"
	line "biblioteca de"
	cont "referencia."
	done
