CherrygroveMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 1
	warp_event  3,  7, CHERRYGROVE_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartClerkScript, -1
	object_event  7,  6, SPRITE_COOL_DUDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartCooltrainerMScript, -1
	object_event  2,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygroveMartYoungsterText, -1

CherrygroveMartClerkScript:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftruefwd .AfterDex
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE

.AfterDex:
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_DEX

CherrygroveMartCooltrainerMScript:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumptextfaceplayer CherrygroveMartCooltrainerMText_PokeBallsInStock
	jumpthistextfaceplayer

	text "Se han quedado"
	line "sin # Balls!"

	para "¿Cuándo tendrán"
	line "más?"
	done

CherrygroveMartCooltrainerMText_PokeBallsInStock:
	text "¡Ya tienen"
	line "# Balls! Ahora"
	cont "puedo atrapar"
	cont "#mon!"
	done

CherrygroveMartYoungsterText:
	text "Caminando por la"
	line "hierba, un #mon"
	cont "bicho envenenó"
	cont "al mío!"

	para "Seguí caminando,"
	line "y mi #mon"
	cont "apenas se"
	cont "recuperó."

	para "Deberías llevar"
	line "un Antídoto"
	cont "encima."
	done
