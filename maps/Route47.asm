Route47_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE47_BRIDGE_UNDERFOOT
	scene_const SCENE_ROUTE47_BRIDGE_OVERHEAD

	def_callbacks
	callback MAPCALLBACK_TILES, Route47TileScript

	def_warp_events
	warp_event 67, 21, CLIFF_EDGE_GATE, 2
	warp_event 53, 21, CLIFF_CAVE, 1
	warp_event 52, 17, CLIFF_CAVE, 2
	warp_event 53, 29, CLIFF_CAVE, 3
	warp_event 11, 23, QUIET_CAVE_1F, 1
	warp_event  8, 23, EMBEDDED_TOWER, 1
	warp_event  8,  4, HIDDEN_CAVE_GROTTO, 1

	def_coord_events
	coord_event 42, 24, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge1OverheadTrigger
	coord_event 42, 25, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge1OverheadTrigger
	coord_event 51, 24, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge1OverheadTrigger
	coord_event 51, 25, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge1OverheadTrigger
	coord_event 43, 24, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge1UnderfootTrigger
	coord_event 43, 25, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge1UnderfootTrigger
	coord_event 50, 24, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge1UnderfootTrigger
	coord_event 50, 25, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge1UnderfootTrigger
	coord_event 42, 18, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge2OverheadTrigger
	coord_event 42, 19, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge2OverheadTrigger
	coord_event 51, 18, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge2OverheadTrigger
	coord_event 51, 19, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge2OverheadTrigger
	coord_event 43, 18, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge2UnderfootTrigger
	coord_event 43, 19, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge2UnderfootTrigger
	coord_event 50, 18, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge2UnderfootTrigger
	coord_event 50, 19, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge2UnderfootTrigger
	coord_event 18, 24, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge3OverheadTrigger
	coord_event 18, 25, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge3OverheadTrigger
	coord_event 27, 24, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge3OverheadTrigger
	coord_event 27, 25, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge3OverheadTrigger
	coord_event 19, 24, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge3UnderfootTrigger
	coord_event 19, 25, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge3UnderfootTrigger
	coord_event 26, 24, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge3UnderfootTrigger
	coord_event 26, 25, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge3UnderfootTrigger
	coord_event 18, 16, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge4OverheadTrigger
	coord_event 18, 17, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge4OverheadTrigger
	coord_event 27, 16, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge4OverheadTrigger
	coord_event 27, 17, SCENE_ROUTE47_BRIDGE_OVERHEAD, Route47Bridge4OverheadTrigger
	coord_event 19, 16, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge4UnderfootTrigger
	coord_event 19, 17, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge4UnderfootTrigger
	coord_event 26, 16, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge4UnderfootTrigger
	coord_event 26, 17, SCENE_ROUTE47_BRIDGE_UNDERFOOT, Route47Bridge4UnderfootTrigger

	def_bg_events
	bg_event  8, 23, BGEVENT_IFNOTSET, Route47SealedCaveSign
	bg_event 36, 32, BGEVENT_JUMPTEXT, Route47QuietCaveSignText
	bg_event 23,  4, BGEVENT_JUMPTEXT, Route47AdvancedTipsSignText
	bg_event 34, 33, BGEVENT_ITEM + PEARL, EVENT_ROUTE_47_HIDDEN_PEARL
	bg_event  5, 32, BGEVENT_ITEM + STARDUST, EVENT_ROUTE_47_HIDDEN_STARDUST
	bg_event  8,  3, BGEVENT_JUMPSTD, cavegrotto, HIDDENGROTTO_ROUTE_47

	def_object_events
	object_event 59, 26, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerDevin, EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	object_event 40, 24, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperGrant, EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	object_event 38, 18, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoThomandkae1, EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	object_event 39, 18, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoThomandkae2, EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	object_event 27,  7, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleDuffandeda1, EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	object_event 28,  7, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleDuffandeda2, EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	object_event 51,  8, SPRITE_COWGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCowgirlDaniela, EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	object_event 55, 27, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGruntF6, EVENT_CLEARED_YELLOW_FOREST
	object_event 36, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGruntM23, EVENT_CLEARED_YELLOW_FOREST
	object_event 25, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM26, EVENT_CLEARED_YELLOW_FOREST
	object_event 40, 25, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route47RocketGirlText, EVENT_CLEARED_YELLOW_FOREST
	itemball_event 39, 28, REVIVE, 1, EVENT_ROUTE_47_REVIVE
	itemball_event  7, 32, MYSTIC_WATER, 1, EVENT_ROUTE_47_MYSTIC_WATER
	itemball_event 31, 20, QUICK_CLAW, 1, EVENT_ROUTE_47_QUICK_CLAW
	itemball_event  7,  6, MAX_REPEL, 1, EVENT_ROUTE_47_MAX_REPEL

Route47TileScript:
	checkevent EVENT_DOOR_OPENED_IN_RUINS_OF_ALPH
	iffalsefwd .locked
	changeblock 8, 22, $99
.locked
	checkscene
	iftruefwd .underfoot
	callasm .overhead_asm
	endcallback

.underfoot:
	callasm .underfoot_asm
	endcallback

.overhead_asm:
	; bridge 1
	changebridgeblock 42, 24, $d8, ROUTE_47
	changebridgeblock 44, 24, $74, ROUTE_47
	changebridgeblock 46, 24, $74, ROUTE_47
	changebridgeblock 48, 24, $74, ROUTE_47
	changebridgeblock 50, 24, $d9, ROUTE_47
	; bridge 2
	changebridgeblock 44, 18, $75, ROUTE_47
	changebridgeblock 46, 18, $75, ROUTE_47
	changebridgeblock 48, 18, $75, ROUTE_47
	; bridge 3
	changebridgeblock 20, 24, $75, ROUTE_47
	changebridgeblock 22, 24, $75, ROUTE_47
	changebridgeblock 24, 24, $75, ROUTE_47
	; bridge 4
	changebridgeblock 18, 16, $d8, ROUTE_47
	changebridgeblock 20, 16, $74, ROUTE_47
	changebridgeblock 22, 16, $74, ROUTE_47
	changebridgeblock 24, 16, $74, ROUTE_47
	changebridgeblock 26, 16, $e5, ROUTE_47
	jmp BufferScreen

.underfoot_asm:
	; bridge 1
	changebridgeblock 42, 24, $aa, ROUTE_47
	changebridgeblock 44, 24, $e4, ROUTE_47
	changebridgeblock 46, 24, $e4, ROUTE_47
	changebridgeblock 48, 24, $e4, ROUTE_47
	changebridgeblock 50, 24, $ab, ROUTE_47
	; bridge 2
	changebridgeblock 44, 18, $e4, ROUTE_47
	changebridgeblock 46, 18, $e4, ROUTE_47
	changebridgeblock 48, 18, $e4, ROUTE_47
	; bridge 3
	changebridgeblock 20, 24, $e4, ROUTE_47
	changebridgeblock 22, 24, $e4, ROUTE_47
	changebridgeblock 24, 24, $e4, ROUTE_47
	; bridge 4
	changebridgeblock 18, 16, $aa, ROUTE_47
	changebridgeblock 20, 16, $e4, ROUTE_47
	changebridgeblock 22, 16, $e4, ROUTE_47
	changebridgeblock 24, 16, $e4, ROUTE_47
	changebridgeblock 26, 16, $b7, ROUTE_47
	jmp BufferScreen

Route47Bridge1OverheadTrigger:
	callthisasm
	changebridgeblock 42, 24, $d8, ROUTE_47
	changebridgeblock 44, 24, $74, ROUTE_47
	changebridgeblock 46, 24, $74, ROUTE_47
	changebridgeblock 48, 24, $74, ROUTE_47
	changebridgeblock 50, 24, $d9, ROUTE_47
	jr Route47_FinishOverheadBridge

Route47Bridge1UnderfootTrigger:
	callthisasm
	changebridgeblock 42, 24, $aa, ROUTE_47
	changebridgeblock 44, 24, $e4, ROUTE_47
	changebridgeblock 46, 24, $e4, ROUTE_47
	changebridgeblock 48, 24, $e4, ROUTE_47
	changebridgeblock 50, 24, $ab, ROUTE_47
	jr Route47_FinishUnderfootBridge

Route47Bridge2OverheadTrigger:
	callthisasm
	changebridgeblock 44, 18, $75, ROUTE_47
	changebridgeblock 46, 18, $75, ROUTE_47
	changebridgeblock 48, 18, $75, ROUTE_47
	; fallthrough

Route47_FinishOverheadBridge:
	xor a
	jr Route47_FinishBridge

Route47Bridge2UnderfootTrigger:
	callthisasm
	changebridgeblock 44, 18, $e4, ROUTE_47
	changebridgeblock 46, 18, $e4, ROUTE_47
	changebridgeblock 48, 18, $e4, ROUTE_47
	; fallthrough

Route47_FinishUnderfootBridge:
	ld a, $1
Route47_FinishBridge:
	ld [wWalkingOnBridge], a
	ld [wRoute47SceneID], a ; setscene a
	jmp GenericFinishBridge

Route47Bridge3OverheadTrigger:
	callthisasm
	changebridgeblock 20, 24, $75, ROUTE_47
	changebridgeblock 22, 24, $75, ROUTE_47
	changebridgeblock 24, 24, $75, ROUTE_47
	jr Route47_FinishOverheadBridge

Route47Bridge3UnderfootTrigger:
	callthisasm
	changebridgeblock 20, 24, $e4, ROUTE_47
	changebridgeblock 22, 24, $e4, ROUTE_47
	changebridgeblock 24, 24, $e4, ROUTE_47
	jr Route47_FinishUnderfootBridge

Route47Bridge4OverheadTrigger:
	callthisasm
	changebridgeblock 18, 16, $d8, ROUTE_47
	changebridgeblock 20, 16, $74, ROUTE_47
	changebridgeblock 22, 16, $74, ROUTE_47
	changebridgeblock 24, 16, $74, ROUTE_47
	changebridgeblock 26, 16, $e5, ROUTE_47
	jr Route47_FinishOverheadBridge

Route47Bridge4UnderfootTrigger:
	callthisasm
	changebridgeblock 18, 16, $aa, ROUTE_47
	changebridgeblock 20, 16, $e4, ROUTE_47
	changebridgeblock 22, 16, $e4, ROUTE_47
	changebridgeblock 24, 16, $e4, ROUTE_47
	changebridgeblock 26, 16, $b7, ROUTE_47
	jr Route47_FinishUnderfootBridge

GenericTrainerHikerDevin:
	generictrainer HIKER, DEVIN, EVENT_BEAT_HIKER_DEVIN, HikerDevinSeenText, HikerDevinBeatenText

	text "Tras una batalla,"
	line "¡debes despedirte"
	cont "con una risa!"
	done

TrainerCamperGrant:
	trainer CAMPER, GRANT, EVENT_BEAT_CAMPER_GRANT, CamperGrantSeenText, CamperGrantBeatenText, 0, .Script, TRAINERPAL_DARK_CAMPER

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "¡Nos vemos!"
	done

GenericTrainerAceDuoThomandkae1:
	generictrainer ACE_DUO, THOMANDKAE1, EVENT_BEAT_ACE_DUO_THOM_AND_KAE, AceDuoThomandkae1SeenText, AceDuoThomandkae1BeatenText

	text "Thom: ¡Tu poder es"
	line "imposible de"
	cont "predecir!"
	done

GenericTrainerAceDuoThomandkae2:
	generictrainer ACE_DUO, THOMANDKAE2, EVENT_BEAT_ACE_DUO_THOM_AND_KAE, AceDuoThomandkae2SeenText, AceDuoThomandkae2BeatenText

	text "Kae: Pensé que"
	line "eras un simple"

	para "entrenador"
	line "solitario."

	para "¡Vaya que me"
	line "equivoqué!"
	done

GenericTrainerCoupleDuffandeda1:
	generictrainer COUPLE, DUFFANDEDA1, EVENT_BEAT_COUPLE_DUFF_AND_EDA, CoupleDuffandeda1SeenText, CoupleDuffandeda1BeatenText

	text "¡Duff: Gracias"
	line "por la impre-"
	cont "sionante batalla!"
	done

GenericTrainerCoupleDuffandeda2:
	generictrainer COUPLE, DUFFANDEDA2, EVENT_BEAT_COUPLE_DUFF_AND_EDA, CoupleDuffandeda2SeenText, CoupleDuffandeda2BeatenText

	text "Eda: Tú también"
	line "deberías hallar"
	cont "una pareja"
	cont "maravillosa."
	done

GenericTrainerCowgirlDaniela:
	generictrainer COWGIRL, DANIELA, EVENT_BEAT_COWGIRL_DANIELA, CowgirlDanielaSeenText, CowgirlDanielaBeatenText

	text "¿Alguna vez"
	line "intentaste montar"
	cont "un Tauros?"
	done

GenericTrainerGruntF6:
	generictrainer GRUNTF, 6, EVENT_BEAT_ROCKET_GRUNTF_6, GruntF6SeenText, GruntF6BeatenText

	text "Si tratáramos"
	line "bien a cada"
	cont "#mon,"

	para "¿Cómo"
	line "ganaríamos"
	cont "dinero?"
	done

GenericTrainerGruntM23:
	generictrainer GRUNTM, 23, EVENT_BEAT_ROCKET_GRUNTM_23, GruntM23SeenText, GruntM23BeatenText

	text "No importa."
	line "¡No puedes"
	cont "vencernos a todos!"
	done

GenericTrainerGruntM26:
	generictrainer GRUNTM, 26, EVENT_BEAT_ROCKET_GRUNTM_26, GruntM26SeenText, GruntM26BeatenText

	text "¡Cómo tratamos a"
	line "los #mon no es"
	cont "asunto tuyo!"
	done

HikerDevinSeenText:
	text "Las batallas son"
	line "batallas, ¡así"
	cont "que vamos!"
	done

HikerDevinBeatenText:
	text "¡Ja ja ja!"
	done

CamperGrantSeenText:
	text "¡No se me dan"
	line "bien las"
	cont "multitudes,"
	cont "por eso acampo"
	cont "aquí con mi #mon!"
	done

CamperGrantBeatenText:
	text "Debería ir más"
	line "adentro en la"
	cont "montaña…"
	done

AceDuoThomandkae1SeenText:
	text "Thom: Uno más uno"
	line "son dos. Pero"

	para "¡Juntos, los dos"
	line "somos mucho más"
	cont "fuertes!"
	done

AceDuoThomandkae1BeatenText:
	text "Thom: Eso no era"
	line "lo que esperaba…"
	done

AceDuoThomandkae2SeenText:
	text "¡Kae: Los dos no"
	line "somos una pareja"
	cont "aburrida!"
	done

AceDuoThomandkae2BeatenText:
	text "Kae: ¡Tú también"
	line "eres especial!"
	done

CoupleDuffandeda1SeenText:
	text "¡Duff: Cuidar de"
	line "mi novia hace"
	cont "volar mi corazón!"
	done

CoupleDuffandeda1BeatenText:
	text "Duff: No fui rival"
	line "para ti…"
	done

CoupleDuffandeda2SeenText:
	text "Eda: Mis"
	line "sentimientos por"
	cont "mi novio"

	para "son tan vastos y"
	line "profundos como"
	cont "el océano."
	done

CoupleDuffandeda2BeatenText:
	text "Eda: Eres"
	line "increíble…"
	done

CowgirlDanielaSeenText:
	text "¡Hola, guapo!"
	done

CowgirlDanielaBeatenText:
	text "¿Así que eres"
	line "todo un fiera?"
	done

GruntF6SeenText:
	text "¿Por qué criar"
	line "#mon como"
	cont "entrenadores"
	cont "comunes?"

	para "¡Somos el Team"
	line "Rocket!"
	done

GruntF6BeatenText:
	text "¡¿Quién eres?!"
	done

GruntM23SeenText:
	text "Ay, ¿Vienes a"
	line "salvar a los"
	cont "lindos #mon?"
	done

GruntM23BeatenText:
	text "¡Argh!"
	line "¡Eres fuerte!"
	done

GruntM26SeenText:
	text "¡Deja de meterte"
	line "en nuestros"
	cont "planes!"
	done

GruntM26BeatenText:
	text "Déjanos en paz…"
	done

Route47RocketGirlText:
	text "¿A qué vienes"
	line "por aquí,"
	cont "mocoso?"
	done

Route47SealedCaveSign:
	dw EVENT_DOOR_OPENED_IN_RUINS_OF_ALPH
	jumpthistext

	text "Hay una hendidura"
	line "con forma de"
	cont "puerta en la roca."
	done

Route47QuietCaveSignText:
	text "Ruta 47"

	para "Al oeste,"
	line "Cueva Calma"
	done

Route47AdvancedTipsSignText:
	text "¡Consejos"
	line "avanzados!"

	para "Algunos #mon"
	line "de ciertas zonas"

	para "¡Pueden saber un"
	line "movimiento único"
	cont "de esa zona!"

	para "¡Esos movimientos"
	line "no se pueden"
	cont "reaprender"

	para "ni heredar por"
	line "cría!"
	done
