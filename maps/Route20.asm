Route20_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 70,  9, SEAFOAM_ISLANDS_1F, 1
	warp_event 62,  5, SEAFOAM_ISLANDS_1F, 4

	def_coord_events

	def_bg_events
	bg_event 69, 11, BGEVENT_JUMPTEXT, CinnabarGymSignText
	bg_event 65,  7, BGEVENT_JUMPTEXT, SeafoamIslandsSignText
	bg_event 23, 10, BGEVENT_ITEM + STARDUST, EVENT_ROUTE_20_HIDDEN_STARDUST

	def_object_events
	object_event 99, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfNicole, -1
	object_event 78, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfLori, -1
	object_event 32,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfMayu, -1
	object_event 62, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSwimmerfLeona, -1
	object_event  8,  6, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermCameron, -1
	object_event 77,  3, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermLuis, -1
	object_event 88,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermElmo, -1
	object_event 18, 12, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPicnickerCheyenne, -1
	object_event 26, 14, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerPicnickerAdrian, -1
	object_event 14, 14, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCamperPedro, -1
	object_event 46,  9, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperBert, -1
	object_event 69,  5, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperErnie, -1
	itemball_event 72,  3, BIG_PEARL, 1, EVENT_ROUTE_20_BIG_PEARL

GenericTrainerSwimmerfNicole:
	generictrainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText

	text "Nadar ejercita"
	line "todo el cuerpo."

	para "Es muy bueno para"
	line "ti."
	done

SwimmerfNicoleSeenText:
	text "Me siento mucho"
	line "más ligera en el"
	cont "agua."
	done

SwimmerfNicoleBeatenText:
	text "¡Oh, no!"
	done

GenericTrainerSwimmerfLori:
	generictrainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText

	text "Surf ya no es el"
	line "único movimiento"
	cont "MO que usas en el"
	cont "agua."
	done

SwimmerfLoriSeenText:
	text "Qué colección tan"
	line "impresionante de"

	para "Medallas. ¡Debemos"
	line "combatir!"
	done

SwimmerfLoriBeatenText: ; text > text
	text "¡No!"
	done

GenericTrainerSwimmerfMayu:
	generictrainer SWIMMERF, MAYU, EVENT_BEAT_SWIMMERF_MAYU, .SeenText, .BeatenText

	text "¡Intentaba ver"
	line "cuánto tiempo"

	para "podía aguantar la"
	line "respiración!"
	done

.SeenText:
	text "¿Mmph? ¿Mmmph"
	line "mmmmphh?"

	para "¡Mmmmph"
	line "mmmmmppphh!"
	done

.BeatenText:
	text "¡Pwah!"
	done

GenericTrainerSwimmerfLeona:
	generictrainer SWIMMERF, LEONA, EVENT_BEAT_SWIMMERF_LEONA, .SeenText, .BeatenText

	text "Tus #mon,"
	line "¿Sigues la última"
	cont "moda en equipos?"
	done

.SeenText:
	text "¡Mira! ¡Es mi"
	line "mejor traje de"
	cont "baño y mi mejor"
	cont "#mon!"
	done

.BeatenText:
	text "¡Ohhh!"
	done

GenericTrainerSwimmermCameron:
	generictrainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText

	text "Además del mar,"
	line "también puedo"
	cont "nadar en estanques"
	cont "y ríos."
	done

SwimmermCameronSeenText:
	text "Supongo que es"
	line "imposible nadar"

	para "hasta Johto."
	done

SwimmermCameronBeatenText:
	text "¡Aiyah!"
	done

GenericTrainerSwimmermLuis:
	generictrainer SWIMMERM, SWIMMERM_LUIS, EVENT_BEAT_SWIMMERM_LUIS, .SeenText, .BeatenText

	text "¡Muy bien! ¡La"
	line "próxima vez me"
	cont "pondré el bañador"
	cont "de fiesta!"
	done

.SeenText:
	text "¡Hoy llevo puesto"
	line "mi mejor bañador!"
	done

.BeatenText:
	text "Ni con mi mejor"
	line "bañador logré"
	cont "ganar."
	done

GenericTrainerSwimmermElmo:
	generictrainer SWIMMERM, ELMO, EVENT_BEAT_SWIMMERM_ELMO, .SeenText, .BeatenText

	text "Quizá debería"
	line "volver a pescar…"
	done

.SeenText:
	text "Antes era"
	line "pescador."

	para "Llegué a amar"
	line "tanto la"
	cont "natación,"

	para "¡que siempre llevo"
	line "el bañador!"
	done

.BeatenText: ; text > text
	text "Ulp…"
	done

GenericTrainerPicnickerCheyenne:
	generictrainer PICNICKER, CHEYENNE, EVENT_BEAT_PICNICKER_CHEYENNE, .SeenText, .BeatenText

	text "Si estoy con"
	line "#mon, ¡no me"
	cont "importa perder!"
	done

.SeenText:
	text "De pequeña, solo"
	line "jugaba dentro de"
	cont "casa."

	para "¡Ahora me encanta"
	line "jugar fuera con"
	cont "#mon!"
	done

.BeatenText:
	text "¡Argh!"
	done

GenericTrainerPicnickerAdrian:
	generictrainer PICNICKER, ADRIAN, EVENT_BEAT_PICNICKER_ADRIAN, .SeenText, .BeatenText

	text "¡Aunque perdí, me"
	line "divertí!"
	done

.SeenText:
	text "¿Tienes prisa?"

	para "¿Qué tal un"
	line "combate rápido?"
	done

.BeatenText:
	text "Aaahh… ya está."
	done

GenericTrainerCamperPedro:
	generictrainer CAMPER, PEDRO, EVENT_BEAT_CAMPER_PEDRO, .SeenText, .BeatenText

	text "Si olvidas tu"
	line "manta, ¡puedes"

	para "acurrucarte con un"
	line "#mon cálido!"
	done

.SeenText:
	text "¿Alguna vez has"
	line "ido de acampada"
	cont "con #mon?"
	done

.BeatenText:
	text "¡Eres fuerte!"
	done

GenericTrainerBird_keeperBert:
	generictrainer BIRD_KEEPER, BERT, EVENT_BEAT_BIRD_KEEPER_BERT, .SeenText, .BeatenText

	text "¡Fue un combate"
	line "increíble!"

	para "¡Tengo piel de"
	line "gallina!"
	done

.SeenText:
	text "¡Lo encontré! ¡Un"
	line "entrenador que"
	cont "disfruto luchando!"
	done

.BeatenText:
	text "¡Perdí con todas"
	line "mis fuerzas!"
	done

GenericTrainerBird_keeperErnie:
	generictrainer BIRD_KEEPER, ERNIE, EVENT_BEAT_BIRD_KEEPER_ERNIE, .SeenText, .BeatenText

	text "¡Eres algo"
	line "especial!"
	done

.SeenText:
	text "Eh, eh. ¿Quieres"
	line "combatir conmigo?"
	done

.BeatenText:
	text "Eso fue bastante"
	line "increíble."
	done

CinnabarGymSignText:
	text "Islas Espuma"

	para "…¿Qué dice este"
	line "aviso?"

	para "Líder del"
	line "Gimnasio de Isla"
	cont "Canela: Blaine"
	done

SeafoamIslandsSignText:
	text "Islas Espuma"
	done
