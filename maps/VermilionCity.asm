VermilionCity_MapScriptHeader:
	def_scene_scripts
	scene_script LawrenceIntroScript, SCENE_VERMILIONCITY_LAWRENCE_INTRO
	scene_const SCENE_VERMILIONCITY_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, VermilionCitySetupLawrenceCallback
	callback MAPCALLBACK_TILES, VermilionCitySetupBattleFactoryCallback

	def_warp_events
	warp_event  5,  5, VERMILION_HOUSE_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  7, 17, POKEMON_FAN_CLUB, 1
	warp_event 13, 17, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 17, VERMILION_MART, 2
	warp_event 21, 21, VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event 10, 23, VERMILION_GYM, 1
	warp_event 18, 35, VERMILION_PORT, 1
	warp_event 19, 35, VERMILION_PORT, 3
	warp_event 36, 17, DIGLETTS_CAVE, 1
	warp_event 28, 35, SEAGALLOP_FERRY_VERMILION_GATE, 1
	warp_event 29, 35, SEAGALLOP_FERRY_VERMILION_GATE, 1
	warp_event 13,  5, VERMILION_POLLUTION_SPEECH_HOUSE, 1
	warp_event 19,  5, VERMILION_S_S_ANNE_SPEECH_HOUSE, 1
	warp_event 29,  9, BATTLE_FACTORY_1F, 1
	warp_event 30,  9, BATTLE_FACTORY_1F, 2

	def_coord_events

	def_bg_events
	bg_event 19,  9, BGEVENT_JUMPTEXT, VermilionCitySignText
	bg_event  5, 23, BGEVENT_JUMPTEXT, VermilionGymSignText
	bg_event  5, 17, BGEVENT_JUMPTEXT, PokemonFanClubSignText
	bg_event 33, 17, BGEVENT_JUMPTEXT, VermilionCityDiglettsCaveSignText
	bg_event 27, 19, BGEVENT_JUMPTEXT, VermilionCityPortSignText
	bg_event 23, 13, BGEVENT_JUMPTEXT, VermilionCityBattleFactorySignText
	bg_event 11, 27, BGEVENT_JUMPTEXT, VermilionCityAdvancedTipsSignText
	bg_event 12, 23, BGEVENT_ITEM + FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

	def_object_events
	object_event 35, 18, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 18, 31, SPRITE_LAWRENCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAWRENCE_VERMILION_CITY
	object_event 18, 13, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCityTeacherText, -1
	object_event 21,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachokeOwnerScript, -1
	pokemon_event 22,  9, MACHOKE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_GRAY, VermilionMachokeText, -1
	object_event 16, 20, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCitySuperNerdText, -1
	object_event 32, 12, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerd2Script, -1
	object_event 11,  8, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 3, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCitySailorText, -1
	object_event 19, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
	object_event 29, 10, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCityOfficerFText, EVENT_RESTORED_POWER_TO_KANTO
	object_event 30, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCityOfficerText, EVENT_RESTORED_POWER_TO_KANTO
	cuttree_event 13, 23, EVENT_VERMILION_CITY_CUT_TREE

	object_const_def
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_LAWRENCE

VermilionCitySetupLawrenceCallback:
	checkscene
	iftruefwd .done
	readvar VAR_XCOORD
	ifequalfwd 18, .done
	disappear VERMILIONCITY_LAWRENCE
	moveobject VERMILIONCITY_LAWRENCE, 19, 31
	appear VERMILIONCITY_LAWRENCE
.done
	endcallback

VermilionCitySetupBattleFactoryCallback:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .done
	changeblock 26,  6, $a8
	changeblock 28,  6, $a9
	changeblock 30,  6, $a9
	changeblock 32,  6, $aa
	changeblock 26,  8, $fa
	changeblock 28,  8, $8b
	changeblock 30,  8, $8f
	changeblock 32,  8, $fb
.done
	endcallback

LawrenceIntroScript:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	showtext LawrenceOverheardText
	applymovement VERMILIONCITY_LAWRENCE, LawrenceApproachMovementData
	playsound SFX_TACKLE
	applymovement VERMILIONCITY_LAWRENCE, LawrenceBumpMovementData
	showemote EMOTE_SHOCK, VERMILIONCITY_LAWRENCE, 15
	pause 15
	readvar VAR_XCOORD
	ifequalfwd 18, .left
	applymovement VERMILIONCITY_LAWRENCE, LawrenceWalkAroundRightMovementData
	turnobject PLAYER, LEFT
	sjumpfwd .continue

.left
	applymovement VERMILIONCITY_LAWRENCE, LawrenceWalkAroundLeftMovementData
	turnobject PLAYER, RIGHT
.continue
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	showtext LawrenceIntroText
	applymovement VERMILIONCITY_LAWRENCE, LawrenceWalkAwayMovementData
	disappear VERMILIONCITY_LAWRENCE
	setscene SCENE_VERMILIONCITY_NOOP
	setevent EVENT_TELEPORT_GUY
	setflag ENGINE_FLYPOINT_VERMILION
	special RestartMapMusic
	end

LawrenceWalkAwayMovementData:
	step_down
	step_down
LawrenceApproachMovementData:
	step_down
	step_down
	step_down
	step_end

LawrenceBumpMovementData:
	fix_facing
	run_step_up
	remove_fixed_facing
	step_sleep_8
	step_sleep_8
	step_end

LawrenceWalkAroundLeftMovementData:
	step_right
	step_down
	step_down
	turn_head_left
	step_end

LawrenceWalkAroundRightMovementData:
	step_left
	step_down
	step_down
	turn_head_right
	step_end

VermilionSnorlax:
	opentext
	special SpecialSnorlaxAwake
	iftruefwd .Awake
	jumpthisopenedtext

	text "Snorlax ronca"
	line "tranquilamente…"
	done

.Awake:
	writetext VermilionCityRadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 60
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	checkevent EVENT_GOT_BOTTLE_CAP_FROM_VERMILION_GUY
	iftrue_jumptextfaceplayer VermilionCityBadgeGuyBattleEdgeText
	readvar VAR_BADGES
	ifequalfwd 16, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	jumpthistextfaceplayer

	text "En Kanto se reúnen"
	line "entrenadores"
	cont "habilidosos."

	para "Los Líderes de"
	line "Gimnasio son muy"
	cont "fuertes."

	para "No será fácil"
	line "vencerlos."
	done

.SomeBadges:
	jumpthistextfaceplayer

	text "¿Has empezado a"
	line "coleccionar las"
	cont "Medallas de"
	cont "Kanto?"

	para "¿No crees que los"
	line "entrenadores de"
	cont "aquí son duros?"
	done

.MostBadges:
	jumpthistextfaceplayer

	text "Supongo que"
	line "pronto acabarás"

	para "tu conquista de"
	line "los Gimnasios de"
	cont "Kanto."

	para "Avísame si"
	line "consigues las"
	cont "ocho Medallas."
	done

.AllBadges:
	faceplayer
	opentext
	writetext VermilionCityBadgeGuyAllBadgesText
	promptbutton
	verbosegiveitem BOTTLE_CAP
	iffalse_endtext
	setevent EVENT_GOT_BOTTLE_CAP_FROM_VERMILION_GUY
	writetext VermilionCityBadgeGuyBattleEdgeText
	waitendtext

VermilionMachokeOwnerScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer VermilionMachokeOwnerText
	jumpthistextfaceplayer

	text "¡Mis #mon"
	line "prepararon el"
	cont "terreno para"
	cont "construir ese"
	cont "enorme edificio!"

	para "Es una pena que el"
	line "público aún no"
	cont "pueda entrar…"
	done

VermilionCitySuperNerd2Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer VermilionCitySuperNerd2Text
	jumpthistextfaceplayer

	text "¡La Fábrica de"
	line "Combate es"
	cont "nuevecita!"

	para "¡Pero consume una"
	line "cantidad enorme"
	cont "de energía…"

	para "Con la Central"
	line "Eléctrica"
	cont "apagada, es"
	cont "inútil!"
	done

VermilionCityBadgeGuyBattleEdgeText:
	text "Tener una gran"
	line "variedad de tipos"
	cont "de #mon"

	para "debería darte"
	line "ventaja en"
	cont "combate."

	para "Seguro que las"
	line "Medallas de Kanto"
	cont "te ayudarán."
	done

LawrenceOverheardText:
	text "…Así que el"
	line "#mon legendario"
	cont "no estaba en esa"
	cont "isla…"

	para "Debo continuar mi"
	line "búsqueda en otro"
	cont "lugar…"
	done

LawrenceIntroText:
	text "Lawrence:"
	line "Discúlpame por"
	cont "chocar contigo."

	para "Tengo prisa por"
	line "completar mi"
	cont "colección."

	para "Mi nombre es"
	line "Lawrence III."

	para "¿Y tú eres el"
	line "Campeón de la"
	cont "Liga?"

	para "…Bueno, las"
	line "apariencias"
	cont "engañan."

	para "Los #mon"
	line "legendarios"
	cont "siempre han sido"
	cont "mi pasión."

	para "Tomé el Ferry"
	line "Seagallop hasta"

	para "la Isla Shamouti,"
	line "pero no encontré"
	cont "el que buscaba."

	para "Oh, ¿Te has"
	line "encontrado con"
	cont "#mon fuera de"
	cont "las leyendas de"
	cont "Johto?"

	para "Entonces nuestros"
	line "caminos pueden"
	cont "cruzarse de nuevo"
	cont "como coleccio-"
	cont "nistas."

	para "Pero de verdad"
	line "debo seguir mi"
	cont "camino. ¡Adiós!"
	done

VermilionCityTeacherText:
	text "El Puerto Carmín"
	line "es la puerta"
	cont "marítima de"
	cont "Kanto."

	para "Aquí atracan"
	line "transatlánticos"
	cont "de todo el mundo."
	done

VermilionMachokeOwnerText:
	text "¡Mis #mon"
	line "prepararon el"
	cont "terreno para"
	cont "construir ese"
	cont "enorme edificio!"

	para "Era un Machop hace"
	line "tres años,"

	para "¡pero el esfuerzo"
	line "lo hizo"
	cont "evolucionar!"
	done

VermilionMachokeText:
	text "Machoke: ¡Guooh"
	line "gogogoh!"
	done

VermilionCitySuperNerdText:
	text "Hay ocho Gimnasios"
	line "en Kanto."

	para "Ese gran edificio"
	line "es el Gimnasio"
	cont "#mon de Carmín."
	done

VermilionCitySuperNerd2Text:
	text "La Fábrica de"
	line "Combate es"
	cont "nuevecita, pero"

	para "ya están llegando"
	line "entrenadores"

	para "de regiones"
	line "lejanas para"
	cont "¡aceptar su reto!"
	done

VermilionCityOfficerFText:
	text "El generador de la"
	line "Central Eléctrica"
	cont "está apagado, así"

	para "que no es seguro"
	line "abrir la Fábrica"
	cont "de Combate."
	done

VermilionCityOfficerText:
	text "Lo siento, la"
	line "Fábrica de Combate"
	cont "está cerrada"

	para "hasta que la"
	line "Central Eléctrica"
	cont "vuelva a"
	cont "funcionar."
	done

VermilionCitySailorText:
	text "¡Nada mejor que"
	line "el buen aire de"
	cont "mar!"
	done


VermilionCityRadioNearSnorlaxText:
	text "Se colocó el"
	line "#gear cerca del"
	cont "Snorlax dormido…"

	para "…"

	para "¡Snorlax se"
	line "despertó!"
	done




VermilionCityBadgeGuyAllBadgesText:
	text "¡Felicidades!"

	para "Conseguiste todas"
	line "las Medallas de"
	cont "Kanto."

	para "Tengo una"
	line "recompensa por tu"
	cont "esfuerzo."
	done

VermilionCitySignText:
	text "Ciudad Carmín"

	para "El Puerto de los"
	line "Atardeceres"
	cont "Exquisitos"
	done

VermilionGymSignText:
	text "Ciudad Carmín"
	line "Gimnasio #mon"
	cont "Líder: Lt.Surge"

	para "El Americano"
	line "Relámpago"
	done

PokemonFanClubSignText:
	text "Club de Fans"
	line "#mon"

	para "¡Todos los Fans"
	line "# son"
	cont "bienvenidos!"
	done

VermilionCityDiglettsCaveSignText:
	text "Cueva Diglett"
	done

VermilionCityPortSignText:
	text "Puerto Carmín"
	line "Entrada"
	done

VermilionCityAdvancedTipsSignText:
	text "¡Consejos"
	line "avanzados!"

	para "¡Tu Tarjeta de"
	line "Entrenador tiene"
	cont "espacio para"
	cont "dieciséis"
	cont "Medallas!"
	done

VermilionCityBattleFactorySignText:
	text "Fábrica de Combate"

	para "¡Gánalo Todo con"
	line "#mon de"
	cont "Alquiler!"
	done
