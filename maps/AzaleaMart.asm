AzaleaMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, AZALEA_TOWN, 3
	warp_event  3,  7, AZALEA_TOWN, 3

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_AZALEA
	object_event  2,  5, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartCooltrainermText, -1
	object_event  7,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartBugCatcherText, -1
	object_event  8,  6, SPRITE_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << MORN) | (1 << DAY), PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartLadyText, -1
	object_event  8,  6, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, (1 << EVE) | (1 << NITE), PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartRockerText, -1

AzaleaMartCooltrainermText:
	text "Aquí no hay Super"
	line "Ball."

	para "Tendrán que servir"
	line "las # Balls."

	para "Ojalá Kurt me"
	line "hiciera algunas de"
	cont "sus Balls"
	cont "personalizadas."
	done

AzaleaMartBugCatcherText:
	text "Una Super Ball es"
	line "mejor para atrapar"
	cont "#mon que una"
	cont "# Ball."

	para "Pero las de Kurt"
	line "pueden ser mejores"
	cont "a veces."
	done

AzaleaMartLadyText:
	text "Puedo comprar"
	line "muchos objetos en"
	cont "Ciudad Trigal,"

	para "pero para subir"
	line "movs. de Fuego,"

	para "nada supera al"
	line "Carbón de Azalea!"
	done

AzaleaMartRockerText:
	text "Los primeros"
	line "prototipos de"

	para "las Balls de Kurt"
	line "tenían problemas."

	para "Las Amor Ball"
	line "solo atrapaban"
	cont "#mon del mismo"
	cont "sexo,"

	para "y las Veloz Ball"
	line "solo funcionaban"

	para "con tres especies"
	line "de #mon."

	para "¡Menos mal que"
	line "arreglaron esos"
	cont "problemas!"
	done
