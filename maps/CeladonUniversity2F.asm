CeladonUniversity2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 23,  8, CELADON_UNIVERSITY_1F, 3
	warp_event  7,  0, CELADON_UNIVERSITY_CAFETERIA, 1
	warp_event  3,  8, CELADON_UNIVERSITY_WILLOWS_OFFICE, 1
	warp_event 13,  0, CELADON_UNIVERSITY_HYPER_TEST_ROOM, 1
	warp_event 19,  8, CELADON_UNIVERSITY_WESTWOODS_OFFICE, 1
	warp_event 21,  0, CELADON_UNIVERSITY_POOL, 1
	warp_event  7,  8, CELADON_UNIVERSITY_NURSES_OFFICE, 1

	def_coord_events

	def_bg_events
	bg_event  6,  0, BGEVENT_JUMPTEXT, CeladonUniversity2FCafeteriaSignText
	bg_event 12,  0, BGEVENT_JUMPTEXT, CeladonUniversity2FHyperTestSignText
	bg_event 20,  0, BGEVENT_JUMPTEXT, CeladonUniversity2FPoolSignText
	bg_event  2,  8, BGEVENT_JUMPTEXT, CeladonUniversity2FWillowsOfficeSignText
	bg_event  6,  8, BGEVENT_JUMPTEXT, CeladonUniversity2FNursesOfficeSignText
	bg_event 18,  8, BGEVENT_JUMPTEXT, CeladonUniversity2FWestwoodsOfficeSignText
	bg_event 16,  1, BGEVENT_READ, CeladonUniversity2FMagikarpSign
	bg_event 24,  1, BGEVENT_READ, CeladonUniversity2FCuboneSign

	def_object_events
	object_event  2,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CeladonUniversity2FCooltrainerfScript, -1
	object_event  5,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity2FCooltrainermText, -1
	object_event 17,  2, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity2FYoungster1Text, -1
	object_event 11,  7, SPRITE_COWGIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity2FCowgirlText, -1
	object_event  4,  9, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity2FBug_catcherText, -1
	object_event 13, 13, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity2FLassText, -1
	object_event 21, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity2FYoungster2Text, -1

CeladonUniversity2FCooltrainerfScript:
	checkevent EVENT_GOT_ANTIDOTE_IN_UNIVERSITY
	iftrue_jumptextfaceplayer .Text5
	faceplayer
	opentext
	writetext .Text1
	waitbutton
	writetext .Text2
	yesorno
	iffalse_jumpopenedtext .Text6
	takeitem FRESH_WATER
	iffalse_jumpopenedtext .Text6
	writetext .Text3
	waitbutton
	writetext .Text4
	waitbutton
	verbosegiveitem ANTIDOTE
	iffalsefwd .NoRoomForAntidote
	setevent EVENT_GOT_ANTIDOTE_IN_UNIVERSITY
	jumpthisopenedtext

.Text5:
	text "Los Antídotos"
	line "curan el veneno"
	cont "en #mon, pero"

	para "una persona se"
	line "enfermaría al"
	cont "beber uno."
	done

.NoRoomForAntidote:
	giveitem FRESH_WATER
	jumpthisopenedtext

	text "Oh… Quédate tu"
	line "Agua Fresca"
	cont "entonces…"
	done

.Text1:
	text "¡Vaya, qué sed"
	line "tengo!"

	para "Pero no tengo"
	line "cambio para las"
	cont "máquinas"
	cont "expendedoras…"

	para "¿Tienes algo de"
	line "Agua Fresca?"
	done

.Text2:
	text "¿Regalar un Agua"
	line "Fresca?"
	done

.Text3:
	text "<PLAYER> regaló el"
	line "Agua Fresca."
	done

.Text4:
	text "¡Muchas gracias!"
	line "¡Toma esto!"
	done

.Text6:
	text "Oh… Pero tengo"
	line "tanta sed…"
	done

CeladonUniversity2FCooltrainermText:
	text "La cafetería se"
	line "llena mucho,"

	para "así que prefiero"
	line "comer en el"
	cont "pasillo."
	done

CeladonUniversity2FYoungster1Text:
	text "Fallé la Prueba"
	line "Hiper de nuevo…"

	para "¡Pero no me"
	line "rendiré!"
	done

CeladonUniversity2FCowgirlText:
	text "¡Mi clase va de"
	line "excursión a la"
	cont "Zona Safari!"
	done

CeladonUniversity2FBug_catcherText:
	text "El Prof.Willow"
	line "envía a sus"

	para "asistentes por"
	line "toda la ciudad"

	para "para estudiar los"
	line "#mon que viven"
	cont "aquí."
	done

CeladonUniversity2FLassText:
	text "Además de ser la"
	line "Líder del"
	cont "Gimnasio Azulona,"

	para "Erika fue la mejor"
	line "de su clase aquí"
	cont "en la"
	cont "universidad."

	para "Ojalá fuera tan"
	line "genial como ella."
	done

CeladonUniversity2FYoungster2Text:
	text "El Prof.Westwood"
	line "es algo"
	cont "excéntrico."

	para "A veces se"
	line "disculpa con los"

	para "retratos de sus"
	line "ancestros."
	done

CeladonUniversity2FCafeteriaSignText:
	text "Cafetería"
	done

CeladonUniversity2FHyperTestSignText:
	text "Sala de Prueba"
	line "Hiper"
	done

CeladonUniversity2FPoolSignText:
	text "Piscina"
	done

CeladonUniversity2FWillowsOfficeSignText:
	text "Despacho del"
	line "Prof.Willow"
	done

CeladonUniversity2FNursesOfficeSignText:
	text "Enfermería"
	done

CeladonUniversity2FWestwoodsOfficeSignText:
	text "Despacho del"
	line "Prof.Westwood"
	done

CeladonUniversity2FMagikarpSign:
	reanchormap
	pokepic MAGIKARP, MAGIKARP_ORCA_FORM
	cry MAGIKARP
	waitbutton
	closepokepic
	jumpthistext

	text "Un Magikarp está"
	line "nadando por ahí."
	done

CeladonUniversity2FCuboneSign:
	reanchormap
	trainerpic CUBONE_ARMOR
	waitbutton
	closepokepic
	jumpthistext

	text "Es el Hueso Grueso"
	line "y el casco de"
	cont "cráneo de un"
	cont "Cubone."
	done
