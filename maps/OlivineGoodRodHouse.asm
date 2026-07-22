OlivineGoodRodHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 5
	warp_event  3,  7, OLIVINE_CITY, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue_jumpopenedtext HaveGoodRodText
	writetext OfferGoodRodText
	yesorno
	iffalse_jumpopenedtext DontWantGoodRodText
	writetext GiveGoodRodText
	promptbutton
	verbosegivekeyitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

OfferGoodRodText:
	text "¡Olivo está"
	line "junto al mar!"

	para "Y si hay mar,"
	line "seguro que hay"
	cont "peces!"

	para "Llevo pescando"
	line "aquí 30 años."

	para "¿Quieres salir"
	line "al mar y pescar?"
	done

GiveGoodRodText:
	text "¡Ah, jaja!"
	line "¡Tenemos un"
	cont "nuevo pescador!"
	done

GaveGoodRodText:
	text "Los peces no"
	line "solo están en"
	cont "el mar."

	para "Van a donde"
	line "haya agua."
	done

DontWantGoodRodText:
	text "¿Quéee? ¿No te"
	line "gusta pescar?!"
	cont "¡Increíble!"
	done

HaveGoodRodText:
	text "¿Qué tal todo?"
	line "¿Algo grande?"
	done
