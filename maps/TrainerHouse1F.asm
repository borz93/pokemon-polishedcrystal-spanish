TrainerHouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 11, VIRIDIAN_CITY, 3
	warp_event  5, 11, VIRIDIAN_CITY, 3
	warp_event  8,  2, TRAINER_HOUSE_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_JUMPTEXT, TrainerHouseSign1Text
	bg_event  9,  0, BGEVENT_JUMPTEXT, TrainerHouseSign2Text
	bg_event  4,  6, BGEVENT_JUMPTEXT, TrainerHouseIllegibleText

	def_object_events
	object_event  1, 10, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FReceptionistText, -1
	object_event  8, 10, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FCooltrainerMText, -1
	object_event  6,  2, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FCooltrainerFText, -1
	object_event  7,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FYoungsterText, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FGentlemanText, -1

TrainerHouse1FReceptionistText:
	text "Bienvenido a la"
	line "Casa Entrenador,"

	para "lo más nuevo y de"
	line "moda en Ciudad"
	cont "Verde."

	para "Solo abrimos a"
	line "entrenadores."

	para "Puedes combatir"
	line "contra los"

	para "mejores de los"
	line "mejores abajo."
	done

TrainerHouse1FCooltrainerMText:
	text "Ciudad Verde es"
	line "la más cercana a"
	cont "la Meseta Añil."

	para "¡Es conocida como"
	line "la entrada a la"
	cont "Meseta Añil!"

	para "Construyeron este"
	line "lugar porque"
	cont "muchos"
	cont "entrenadores pasan"
	cont "camino a la Liga"
	cont "#mon."
	done

TrainerHouse1FCooltrainerFText:
	text "Aquí abajo hacen"
	line "combates de"
	cont "práctica."

	para "Me encantaría ver"
	line "cómo combate un"
	cont "entrenador de"
	cont "Johto."
	done

TrainerHouse1FYoungsterText:
	text "Supongo que no"
	line "puedes ser Campeón"

	para "sin recorrer todo"
	line "el lugar y"

	para "combatir contra"
	line "todo tipo de"
	cont "gente."

	para "El Campeón de"
	line "Pueblo Paleta"
	cont "viajó por"

	para "todas las"
	line "ciudades de"
	cont "Kanto."
	done

TrainerHouse1FGentlemanText:
	text "Uf… Descanso un"
	line "poco de los"
	cont "combates #mon."
	done

TrainerHouseSign1Text:
	text "Los combates de"
	line "práctica se hacen"

	para "en la Sala de"
	line "Entrenamiento de"
	cont "abajo."

	para "Se invita a"
	line "entrenadores"
	cont "expertos a"
	cont "participar."
	done

TrainerHouseSign2Text:
	text "No hay reglas ni"
	line "normas para los"

	para "combates de"
	line "práctica. Como en"
	cont "el campo,"

	para "¡todo vale!"
	done

TrainerHouseIllegibleText:
	text "…¿Qué es esto?"
	line "¿Una nota de"
	cont "estrategia?"

	para "Esta letra parece"
	line "un rastro de"
	cont "Onix…"

	para "Es totalmente"
	line "ilegible…"
	done
