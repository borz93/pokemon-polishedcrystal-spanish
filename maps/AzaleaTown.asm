AzaleaTown_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_AZALEATOWN_NOOP
	scene_const SCENE_AZALEATOWN_RIVAL_BATTLE
	scene_const SCENE_AZALEATOWN_CELEBI_EVENT

	def_callbacks
	callback MAPCALLBACK_NEWMAP, AzaleaTownFlypointCallback
	callback MAPCALLBACK_TILES, AzaleaTownRainScript

	def_warp_events
	warp_event 15,  9, AZALEA_POKECENTER_1F, 1
	warp_event 21, 13, CHARCOAL_KILN, 1
	warp_event 21,  5, AZALEA_MART, 2
	warp_event  9,  5, KURTS_HOUSE, 1
	warp_event 10, 15, AZALEA_GYM, 1
	warp_event 31,  7, SLOWPOKE_WELL_ENTRANCE, 1
	warp_event  2, 10, ILEX_FOREST_AZALEA_GATE, 3
	warp_event  2, 11, ILEX_FOREST_AZALEA_GATE, 4

	def_coord_events
	coord_event  5, 10, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleTrigger1
	coord_event  5, 11, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleTrigger2
	coord_event  9,  6, SCENE_AZALEATOWN_CELEBI_EVENT, AzaleaTown_CelebiTrigger

	def_bg_events
	bg_event 19,  9, BGEVENT_JUMPTEXT, AzaleaTownSignText
	bg_event 10,  9, BGEVENT_JUMPTEXT, KurtsHouseSignText
	bg_event 11, 15, BGEVENT_JUMPTEXT, AzaleaGymSignText
	bg_event 29,  8, BGEVENT_JUMPTEXT, SlowpokeWellSignText
	bg_event 19, 13, BGEVENT_JUMPTEXT, CharcoalKilnSignText
	bg_event  3,  9, BGEVENT_JUMPTEXT, AzaleaTownIlexForestSignText
	bg_event 29, 14, BGEVENT_JUMPTEXT, AzaleaTownAdvancedTipsSignText
	bg_event 31,  6, BGEVENT_ITEM + FULL_HEAL, EVENT_AZALEA_TOWN_HIDDEN_FULL_HEAL

	def_object_events
	object_event 11, 10, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_AZALEA_TOWN
	object_event  6,  5, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownKurtScript, EVENT_AZALEA_TOWN_KURT
	object_event 21,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownGrampsScript, -1
	object_event 15, 13, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaTownTeacherScript, -1
	object_event  7,  9, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaTownYoungsterText, -1
	object_event 31,  9, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaTownRocket1Text, EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	object_event 10, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaTownRocket2Text, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  8, 17, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 18,  9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 30,  9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 14, 15, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	pokemon_event 14, 12, WOOPER, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, AzaleaTownWoosterText, EVENT_SLOWPOKE_WELL_SLOWPOKES
	pokemon_event 14, 12, QUAGSIRE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, AzaleaTownWoosterText, EVENT_AZALEA_TOWN_SLOWPOKES
	fruittree_event  8,  2, FRUITTREE_AZALEA_TOWN, WHT_APRICORN, PAL_NPC_ENV_WHITE

	object_const_def
	const AZALEATOWN_RIVAL
	const AZALEATOWN_KURT

AzaleaTownFlypointCallback:
	setflag ENGINE_FLYPOINT_AZALEA
	endcallback

AzaleaTownRainScript:
	special Special_GetOvercastIndex
	ifequalfwd AZALEA_OVERCAST, .rain
	changemapblocks AzaleaTown_BlockData
	endcallback

.rain
	changemapblocks AzaleaTownRaining_BlockData
	endcallback

AzaleaTownRivalBattleTrigger1:
	moveobject AZALEATOWN_RIVAL, 11, 11
AzaleaTownRivalBattleTrigger2:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	appear AZALEATOWN_RIVAL
	applymovement AZALEATOWN_RIVAL, .ApproachMovement
	faceobject AZALEATOWN_RIVAL, PLAYER
	faceobject PLAYER, AZALEATOWN_RIVAL
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext .SeenText
	setevent EVENT_RIVAL_AZALEA_TOWN
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	winlosstext .WinText, .LossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_6
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .AfterBattle

.Totodile:
	winlosstext .WinText, .LossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_4
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .AfterBattle

.Chikorita:
	winlosstext .WinText, .LossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_5
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	; fallthrough

.AfterBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	showtext .AfterText
	turnobject PLAYER, LEFT
	applymovement AZALEATOWN_RIVAL, .ExitMovement
	playsound SFX_EXIT_BUILDING
	disappear AZALEATOWN_RIVAL
	setmapscene ROUTE_34, SCENE_ROUTE34_LYRA_DAYCARE
	setscene SCENE_AZALEATOWN_NOOP
	waitsfx
	playmapmusic
	end

.SeenText:
	text "…Dime una cosa."

	para "¿Es verdad que"
	line "el Team Rocket"
	cont "ha vuelto?"

	para "¿Qué? ¿Los"
	line "venciste? ¡Ja! No"
	cont "mientas."

	para "¿No es broma?"
	line "Pues veamos qué"
	cont "tal se te da."
	done

.WinText:
	text "…¡Bah! ¡#mon"
	line "inútil!"

	para "Escucha. Solo"
	line "ganaste porque"

	para "mi #mon estaba"
	line "débil."
	done

.LossText:
	text "…¡Bah! Sabía que"
	line "mentías."
	done

.AfterText:
	text "Odio a los"
	line "débiles."

	para "#mon o"
	line "entrenadores,"
	cont "no importa"
	cont "quién o qué."

	para "Voy a ser fuerte"
	line "y acabar con"
	cont "los débiles."

	para "Eso incluye al"
	line "Team Rocket."

	para "Se hacen los"
	line "duros en grupo."

	para "Pero solos,"
	line "son débiles."

	para "Los odio a todos."

	para "No te metas en mi"
	line "camino. Un débil"

	para "como tú solo"
	line "distrae."
	done

.ApproachMovement:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

.ExitMovement:
	step_left
	step_left
	step_left
	step_end

AzaleaTown_CelebiTrigger:
	applymovement PLAYER, .WalkOutOfKurtsHouseMovement
	opentext
	writethistext
		text "¡El Encinar está"
		line "inquieto!"

		para "¿Qué está pasando?"
		done
	promptbutton
	turnobject AZALEATOWN_KURT, RIGHT
	writethistext
		text "<PLAYER>, aquí"
		line "tienes tu GS Ball!"
		done
	promptbutton
	writetext AzaleaTownKurtText
	waitbutton
	verbosegivekeyitem GS_BALL
	turnobject AZALEATOWN_KURT, LEFT
	setflag ENGINE_HAVE_EXAMINED_GS_BALL
	clearevent EVENT_ILEX_FOREST_LASS
	setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	setscene SCENE_AZALEATOWN_NOOP
	endtext

.WalkOutOfKurtsHouseMovement:
	step_left
	step_left
	step_up
	turn_head_left
	step_end

AzaleaTownSignText:
	text "Pueblo Azalea"
	line "Donde Personas y"

	para "#mon Viven en"
	line "Feliz Armonía"
	done

KurtsHouseSignText:
	text "Casa de Kurt"
	done

AzaleaGymSignText:
	text "Pueblo Azalea"
	line "Gimnasio #mon"
	cont "Líder: Antón"

	para "La Enciclopedia"
	line "Andante de"
	cont "#mon Bicho"
	done

SlowpokeWellSignText:
	text "Pozo Slowpoke"

	para "También llamado"
	line "Pozo de la Lluvia."

	para "Dicen que el"
	line "bostezo de un"
	cont "Slowpoke invoca"
	cont "la lluvia."

	para "Los registros"
	line "muestran que un"

	para "bostezo acabó con"
	line "una sequía hace"
	cont "400 años."
	done

CharcoalKilnSignText:
	text "Horno de Carbón"
	done

AzaleaTownIlexForestSignText:
	text "Encinar"

	para "Entra por la"
	line "puerta."
	done

AzaleaTownAdvancedTipsSignText:
	text "¡Consejos"
	line "avanzados!"

	para "El estilo Cambio"
	line "te deja saber"

	para "qué #mon va a"
	line "sacar el rival,"

	para "pero el estilo"
	line "Predicción no!"
	done

AzaleaTownGrampsScript:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "Los Slowpoke han"
	line "desaparecido del"
	cont "pueblo…"

	para "Oí que venden sus"
	line "Colas por ahí."
	done

.Text2:
	text "Los Slowpoke han"
	line "vuelto."

	para "Conociéndolos,"
	line "seguro que solo"

	para "estaban vagueando"
	line "por ahí."
	done

AzaleaTownTeacherScript:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iffalse_jumptextfaceplayer .Text1
	checkevent EVENT_GOT_CLEAR_AMULET_IN_AZALEA
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text3
	promptbutton
	verbosegiveitem CLEAR_AMULET
	iffalse_endtext
	setevent EVENT_GOT_CLEAR_AMULET_IN_AZALEA
	jumpthisopenedtext

.Text2:
	text "Ha cambiado,"
	line "pero para mí"

	para "siempre será mi"
	line "pequeño Wooster."
	done

.Text1:
	text "No ha llovido"
	line "desde que los"
	cont "Slowpoke se"
	cont "fueron."

	para "Mi pobre Wooster"
	line "no soporta este"
	cont "clima…"
	done

.Text3:
	text "Con el chaparrón"
	line "repentino, mi"
	cont "Wooster evolucionó"

	para "¿Trajiste de"
	line "vuelta a los"
	cont "Slowpoke?"

	para "¡Trajeron la"
	line "lluvia con ellos!"

	para "¡Muchísimas"
	line "gracias!"

	para "Toma esto, te lo"
	line "mereces!"
	done

AzaleaTownWoosterText:
	text "Wooster: Gugyoo…"
	done

AzaleaTownYoungsterText:
	text "Corta a través de"
	line "Azalea y llegarás"
	cont "al Encinar."

	para "Pero estos árboles"
	line "delgados hacen"

	para "imposible pasar"
	line "por ellos."

	para "El #mon del"
	line "Hombre del Carbón"
	cont "sabe usar Corte."
	done

AzaleaTownRocket1Text:
	text "Es peligroso ir"
	line "ahí, así que"
	cont "monto guardia."

	para "¿A que soy un buen"
	line "samaritano?"
	done

AzaleaTownRocket2Text:
	text "¿Sabes qué es la"
	line "Cola Slowpoke? Oí"
	cont "que está rica!"

	para "¿No te alegra que"
	line "te lo dijera?"
	done

AzaleaTownSlowpokeScript:
	opentext
	writethistext
		text "Slowpoke: …"

		para "…… …… ……"
		done
	pause 60
	writethistext
		text "…… ……¿Bostezo?"
		done
	cry SLOWPOKE
	waitendtext

AzaleaTownKurtScript:
	showtextfaceplayer AzaleaTownKurtText
	turnobject LAST_TALKED, LEFT
	end

AzaleaTownKurtText:
	text "¿Podrías ir a ver"
	line "por qué el Encinar"
	cont "está tan inquieto?"
	done
