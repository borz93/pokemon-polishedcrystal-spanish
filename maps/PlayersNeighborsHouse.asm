PlayersNeighborsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 3
	warp_event  3,  7, NEW_BARK_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_READ, InitialRadio

	def_object_events
	object_event  5,  3, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, PlayersNeighborText, EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	object_event  2,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, PlayersNeighborsDaughterText, -1
	object_event  5,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PlayersNeighborsHusbandText, -1

PlayersNeighborsDaughterText:
	text "Pikachu es un"
	line "Pokémon"
	cont "evolucionado."

	para "Me asombraron"
	line "los hallazgos"
	cont "del Prof. Elm."

	para "Es famoso por"
	line "su investigación"
	cont "Pokémon."

	para "…suspiro…"

	para "Ojalá pudiera"
	line "ser investiga-"
	cont "dora como él…"
	done

PlayersNeighborsHusbandText:
	text "Este pueblo es"
	line "el más al sureste"

	para "de Johto."
	done

PlayersNeighborText:
	text "Mi hija está"
	line "empeñada en"

	para "ser ayudante"
	line "del Prof. Elm."

	para "¡Le encantan"
	line "los Pokémon!"

	para "¡Pero a mí también!"
	done
