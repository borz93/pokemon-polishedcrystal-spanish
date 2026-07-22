UnionCave1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  3, UNION_CAVE_B1F_NORTH, 3
	warp_event  3, 45, UNION_CAVE_B1F_SOUTH, 1
	warp_event 17, 43, ROUTE_33, 1
	warp_event 17, 15, ROUTE_32, 4

	def_coord_events

	def_bg_events
	bg_event  7, 19, BGEVENT_ITEM + GREAT_BALL, EVENT_UNION_CAVE_1F_HIDDEN_GREAT_BALL
	bg_event  2, 33, BGEVENT_ITEM + BIG_PEARL, EVENT_UNION_CAVE_1F_HIDDEN_BIG_PEARL
	bg_event  8, 33, BGEVENT_ITEM + PARALYZEHEAL, EVENT_UNION_CAVE_1F_HIDDEN_PARALYZEHEAL

	def_object_events
	object_event  3, 18, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerDaniel, -1
	object_event  7, 37, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacLarry, -1
	object_event 11, 20, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerHikerRussell, -1
	object_event 15, 39, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerFirebreatherRay, -1
	object_event 11, 32, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerFirebreatherBill, -1
	object_event  5,  3, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerRuin_maniacJones, -1
	itemball_event 15, 33, GREAT_BALL, 1, EVENT_UNION_CAVE_1F_GREAT_BALL
	itemball_event  2,  8, X_ATTACK, 1, EVENT_UNION_CAVE_1F_X_ATTACK
	itemball_event  3, 28, POTION, 1, EVENT_UNION_CAVE_1F_POTION
	itemball_event 12, 45, AWAKENING, 1, EVENT_UNION_CAVE_1F_AWAKENING

GenericTrainerPokemaniacLarry:
	generictrainer POKEMANIAC, POKEMANIAC_LARRY, EVENT_BEAT_POKEMANIAC_LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText

	text "Cada viernes se"
	line "oyen rugidos de"

	para "#mon desde el"
	line "fondo de la cueva."
	done

GenericTrainerHikerRussell:
	generictrainer HIKER, RUSSELL, EVENT_BEAT_HIKER_RUSSELL, HikerRussellSeenText, HikerRussellBeatenText

	text "¡Muy bien,"
	line "entonces!"
	cont "Decidido."

	para "No me iré hasta"
	line "que mis #mon se"
	cont "vuelvan más"
	cont "fuertes!"
	done

GenericTrainerHikerDaniel:
	generictrainer HIKER, DANIEL, EVENT_BEAT_HIKER_DANIEL, HikerDanielSeenText, HikerDanielBeatenText

	text "Me estafaron"
	line "vendiéndome una"
	cont "ColaSlowpoke."

	para "Me da pena ese"
	line "pobre #mon."
	done

GenericTrainerFirebreatherBill:
	generictrainer FIREBREATHER, BILL, EVENT_BEAT_FIREBREATHER_BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText

	text "Los fines de"
	line "semana se oyen"

	para "rugidos extraños"
	line "en lo profundo de"
	cont "la cueva."
	done

GenericTrainerFirebreatherRay:
	generictrainer FIREBREATHER, RAY, EVENT_BEAT_FIREBREATHER_RAY, FirebreatherRaySeenText, FirebreatherRayBeatenText

	text "Es el fuego de mi"
	line "#mon el que"
	cont "ilumina esta"
	cont "cueva."
	done

GenericTrainerRuin_maniacJones:
	generictrainer RUIN_MANIAC, JONES, EVENT_BEAT_RUIN_MANIAC_JONES, Ruin_maniacJonesSeenText, Ruin_maniacJonesBeatenText

	text "Las Ruinas"
	line "esconden algo…"
	cont "¡Lo sé!"
	done

HikerRussellSeenText:
	text "¿Vas hacia"
	line "Azalea, verdad?"

	para "Que mis #mon"
	line "vean si eres"
	cont "bueno para"
	cont "combatir."
	done

HikerRussellBeatenText:
	text "¡Oh, oh, oh!"
	done

PokemaniacLarrySeenText:
	text "Viajo lejos"
	line "buscando #mon."

	para "¿Tú también"
	line "buscas #mon?"

	para "¡Entonces eres mi"
	line "rival de"
	cont "colección!"
	done

PokemaniacLarryBeatenText:
	text "Ugh. Mi pobre"
	line "#mon…"
	done

HikerDanielSeenText:
	text "¡Vaya! ¡Qué"
	line "sorpresa!"

	para "¡No esperaba ver"
	line "a nadie aquí!"
	done

HikerDanielBeatenText:
	text "¡Vaya! ¡Me"
	line "vencieron mucho!"
	done

FirebreatherBillSeenText:
	text "El Ultrasonido de"
	line "Zubat confunde a"
	cont "mi #mon."

	para "¡Estoy muy"
	line "molesto por eso!"
	done

FirebreatherBillBeatenText:
	text "¡Me apagué!"
	done

FirebreatherRaySeenText:
	text "Si hay luz, una"
	line "cueva no da miedo."

	para "Si eres fuerte,"
	line "los #mon no dan"
	cont "miedo."
	done

FirebreatherRayBeatenText:
	text "¡Destello!"
	done

Ruin_maniacJonesSeenText:
	text "¿Has explorado"
	line "las Ruinas Alfa?"
	done

Ruin_maniacJonesBeatenText:
	text "¡Gajajá!"
	done
