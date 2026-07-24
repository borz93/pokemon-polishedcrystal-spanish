SafariZoneNorth_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 41, 32, SAFARI_ZONE_EAST, 3
	warp_event 41, 33, SAFARI_ZONE_EAST, 4
	warp_event 10, 37, SAFARI_ZONE_WEST, 3
	warp_event 11, 37, SAFARI_ZONE_WEST, 4
	warp_event 22, 37, SAFARI_ZONE_HUB, 7
	warp_event 23, 37, SAFARI_ZONE_HUB, 8
	warp_event 37,  5, SAFARI_ZONE_NORTH_REST_HOUSE, 1
	warp_event  4, 37, SAFARI_ZONE_WEST, 1
	warp_event  5, 37, SAFARI_ZONE_WEST, 2

	def_coord_events

	def_bg_events
	bg_event 15, 33, BGEVENT_JUMPTEXT, SafariZoneNorthAreaSignText
	bg_event 38,  6, BGEVENT_JUMPTEXT, SafariZoneNorthRestHouseSignText
	bg_event 28, 30, BGEVENT_JUMPTEXT, SafariZoneNorthTrainerTips1SignText
	bg_event 20, 34, BGEVENT_JUMPTEXT, SafariZoneNorthTrainerTips2SignText
	bg_event  5, 27, BGEVENT_JUMPTEXT, SafariZoneNorthTrainerTips3SignText
	bg_event 31, 19, BGEVENT_ITEM + LUCKY_PUNCH, EVENT_SAFARI_ZONE_NORTH_HIDDEN_LUCKY_PUNCH

	def_object_events
	object_event 18, 23, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBattleGirlPadma, -1
	object_event  7,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterTyler, -1
	object_event 36,  9, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyRachael, -1
	object_event 15, 14, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneNorthCooltrainerFScript, -1
	itemball_event 24, 18, EVIOLITE, 1, EVENT_SAFARI_ZONE_NORTH_EVIOLITE
	itemball_event 21,  9, PROTEIN, 1, EVENT_SAFARI_ZONE_NORTH_PROTEIN

GenericTrainerBattleGirlPadma:
	generictrainer BATTLE_GIRL, PADMA, EVENT_BEAT_BATTLE_GIRL_PADMA, BattleGirlPadmaSeenText, BattleGirlPadmaBeatenText

	text "Si vuelcas tus"
	line "emociones en el"

	para "entrenamiento,"
	line "¡te harás fuerte!"
	done

GenericTrainerYoungsterTyler:
	generictrainer YOUNGSTER, TYLER, EVENT_BEAT_YOUNGSTER_TYLER, YoungsterTylerSeenText, YoungsterTylerBeatenText

	text "Los #mon saltan"
	line "cuando menos te"
	cont "lo esperas."
	done

GenericTrainerBeautyRachael:
	generictrainer BEAUTY, RACHAEL, EVENT_BEAT_BEAUTY_RACHAEL, BeautyRachaelSeenText, BeautyRachaelBeatenText

	text "Hace solo un año"
	line "era Cinturón N."

	para "El poder de la"
	line "ciencia médica es"

	para "increíble,"
	line "¿No crees?"
	done

SafariZoneNorthCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_DOUBLE_EDGE_INTRO
	iftruefwd SafariZoneNorthTutorDoubleEdgeScript
	writetext SafariZoneNorthCooltrainerFText
	waitbutton
	setevent EVENT_LISTENED_TO_DOUBLE_EDGE_INTRO
SafariZoneNorthTutorDoubleEdgeScript:
	writetext Text_SafariZoneNorthTutorDoubleEdge
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_SafariZoneNorthTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval DOUBLE_EDGE
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Bueno, vale."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "No tienes ninguna"
	line "Hoja Plata…"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Ya está!"
	line "Ahora tu #mon"

	para "sabe usar Doble"
	cont "Filo!"
	done

BattleGirlPadmaSeenText:
	text "¡Entreno con mis"
	line "#mon para"
	cont "mejorar como"
	cont "equipo!"
	done

BattleGirlPadmaBeatenText:
	text "¡Tendremos que"
	line "entrenar más!"
	done

YoungsterTylerSeenText:
	text "¡Puedes encontrar"
	line "#mon en"
	cont "cualquier sitio!"

	para "¡En hierba, en"
	line "agua, en cuevas,"
	cont "o en un árbol!"
	done

YoungsterTylerBeatenText:
	text "¡Debo seguir"
	line "buscando!"
	done

BeautyRachaelSeenText:
	text "¡Mi vestido de sol"
	line "es perfecto para"
	cont "un día en la Zona"
	cont "Safari!"
	done

BeautyRachaelBeatenText:
	text "No es genial"
	line "para combatir…"
	done

SafariZoneNorthCooltrainerFText:
	text "¡Atrapé un"
	line "Chansey!"

	para "¡Qué suerte!"
	line "Voy a enseñarle"

	para "a hacer un"
	line "placaje muy"
	cont "poderoso."

	para "¡Deja que"
	line "comparta mi"
	cont "suerte contigo!"
	done

Text_SafariZoneNorthTutorDoubleEdge:
	text "Enseñaré a tu"
	line "#mon a usar"

	para "Doble Filo a"
	line "cambio de una"
	cont "Hoja Plata."
	done


Text_SafariZoneNorthTutorQuestion:
	text "¿Debería enseñar"
	line "a tu #mon"
	cont "Doble Filo?"
	done



SafariZoneNorthAreaSignText:
	text "Zona Safari"
	line "Zona Norte"
	done

SafariZoneNorthRestHouseSignText:
	text "Casa de Descanso"
	done

SafariZoneNorthTrainerTips1SignText:
	text "Consejos"

	para "Los movimientos"
	line "del mismo tipo"
	cont "pueden ser"
	cont "físicos,"
	cont "especiales o de"
	cont "estado."
	done

SafariZoneNorthTrainerTips2SignText:
	text "Consejos"

	para "¡Los #mon se"
	line "esconden en la"
	cont "hierba alta!"

	para "Muévete en"
	line "zigzag por la"
	cont "hierba para"
	cont "sacarlos."
	done

SafariZoneNorthTrainerTips3SignText:
	text "Consejos"

	para "El resto del"
	line "cartel se ha"
	cont "roto…"
	done
