GoldenrodUndergroundEntrances_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 19, GOLDENROD_UNDERGROUND, 2
	warp_event  4, 23, GOLDENROD_CITY, 14
	warp_event  5, 23, GOLDENROD_CITY, 14
	warp_event  4,  5, GOLDENROD_UNDERGROUND, 1
	warp_event  4,  9, GOLDENROD_CITY, 13
	warp_event  5,  9, GOLDENROD_CITY, 13
	warp_event  4, 33, GOLDENROD_UNDERGROUND, 7
	warp_event  4, 37, GOLDENROD_CITY, 22
	warp_event  5, 37, GOLDENROD_CITY, 22

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3, 21, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodUndergroundEntrances_TeacherText, -1
	object_event  8, 20, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodUndergroundEntrances_SuperNerd1Text, -1
	object_event  3,  7, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodUndergroundEntrances_SuperNerd2Text, -1
	object_event  1, 35, SPRITE_VETERAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundEntrancesVeteranMScript, -1
	object_event  8, 34, SPRITE_BEAUTY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodUndergroundEntrances_BeautyText, -1

	object_const_def

GoldenrodUndergroundEntrancesVeteranMScript:
	checkevent EVENT_GOT_LOADED_DICE_FROM_GOLDENROD
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem LOADED_DICE
	iffalse_endtext
	setevent EVENT_GOT_LOADED_DICE_FROM_GOLDENROD
	jumpthisopenedtext

.Text2:
	text "A la larga, la"
	line "casa siempre"
	cont "gana…"
	done

.Text1:
	text "Intenté usar"
	line "este objeto en"
	cont "la Sala de"

	para "Juegos, pero me"
	line "pillaron."

	para "Mejor quédatelo"
	line "tú."
	done

GoldenrodUndergroundEntrances_TeacherText:
	text "Hay algunas"
	line "tiendas abajo…"

	para "Pero también hay"
	line "entrenadores."

	para "Me da miedo"
	line "bajar ahí."
	done

GoldenrodUndergroundEntrances_SuperNerd1Text:
	text "Este túnel se"
	line "hizo para"
	cont "repartos a los"

	para "Grandes"
	line "Almacenes."

	para "También es un"
	line "buen atajo por"
	cont "la ciudad."
	done

GoldenrodUndergroundEntrances_SuperNerd2Text:
	text "Me retaron a un"
	line "combate ahí"
	cont "abajo."

	para "Es duro ahí"
	line "abajo. Ten"
	cont "cuidado."
	done

GoldenrodUndergroundEntrances_BeautyText:
	text "Hice un tour"
	line "por la Torre"
	cont "Radio."

	para "Vi los tres"
	line "estudios y"

	para "hasta comí en"
	line "la cafetería."
	done
