RuinsOfAlphOutside_MapScriptHeader:
	def_scene_scripts
	scene_script RuinsOfAlphOutsideOpenSinjohChamberScene, SCENE_RUINSOFALPHOUTSIDE_OPEN_SINJOH_CHAMBER
	scene_const SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsofAlphOutsideTileScript
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphOutsideScientistCallback

	def_warp_events
	warp_event  7, 17, RUINS_OF_ALPH_HO_OH_CHAMBER, 1
	warp_event 15,  5, RUINS_OF_ALPH_KABUTO_CHAMBER, 1
	warp_event  7, 29, RUINS_OF_ALPH_OMANYTE_CHAMBER, 1
	warp_event 15, 31, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 1
	warp_event 11, 18, RUINS_OF_ALPH_ENTRANCE_CHAMBER, 1
	warp_event 12, 18, RUINS_OF_ALPH_ENTRANCE_CHAMBER, 2
	warp_event 19, 17, RUINS_OF_ALPH_RESEARCH_CENTER, 1
	warp_event  2, 17, UNION_CAVE_B1F_NORTH, 1
	warp_event  2, 29, UNION_CAVE_B1F_NORTH, 2
	warp_event 11,  1, ROUTE_36_RUINS_OF_ALPH_GATE, 3
	warp_event 23, 22, ROUTE_32_RUINS_OF_ALPH_GATE, 1
	warp_event 23, 23, ROUTE_32_RUINS_OF_ALPH_GATE, 2
	warp_event  7, 11, RUINS_OF_ALPH_SINJOH_CHAMBER, 1
	warp_event 23, 36, HIDDEN_CAVE_GROTTO, 1

	def_coord_events
	coord_event 11, 20, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene

	def_bg_events
	bg_event 16, 12, BGEVENT_JUMPTEXT, RuinsOfAlphOutsideMysteryChamberSignText
	bg_event 10, 19, BGEVENT_JUMPTEXT, RuinsOfAlphOutsideMysteriousHallSignText
	bg_event  9,  5, BGEVENT_JUMPTEXT, RuinsOfAlphSignText
	bg_event 21, 21, BGEVENT_JUMPTEXT, RuinsOfAlphSignText
	bg_event 18, 18, BGEVENT_JUMPTEXT, RuinsOfAlphResearchCenterSignText
	bg_event 21, 11, BGEVENT_JUMPTEXT, RuinsOfAlphAdvancedTipsSignText
	bg_event  7, 11, BGEVENT_IFNOTSET, MapRuinsofAlphOutsideSealedCaveSign
	bg_event  4,  3, BGEVENT_ITEM + RARE_CANDY, EVENT_RUINS_OF_ALPH_OUTSIDE_HIDDEN_RARE_CANDY
	bg_event  5, 34, BGEVENT_ITEM + NUGGET, EVENT_RUINS_OF_ALPH_OUTSIDE_HIDDEN_NUGGET
	bg_event 15, 23, BGEVENT_ITEM + BIG_MUSHROOM, EVENT_RUINS_OF_ALPH_OUTSIDE_HIDDEN_BIG_MUSHROOM
	bg_event 23, 35, BGEVENT_JUMPSTD, cavegrotto, HIDDENGROTTO_RUINS_OF_ALPH

	def_object_events
	object_event 12, 20, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideScientistScript, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	object_event 19, 19, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST_CLIMAX
	object_event  5, 18, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPsychicNathan, -1
	object_event  5, 33, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSuperNerdStan, -1
	object_event 10, 23, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideFisherScript, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	object_event 13, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster2Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	object_event 15, 21, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster1Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	itemball_event  2,  9, HYPER_POTION, 1, EVENT_RUINS_OF_ALPH_OUTSIDE_HYPER_POTION
	smashrock_event  0,  4
	smashrock_event  0,  9
	smashrock_event  1,  8
	smashrock_event  5,  3
	smashrock_event  6,  2
	smashrock_event  8,  3

	object_const_def
	const RUINSOFALPHOUTSIDE_SCIENTIST1
	const RUINSOFALPHOUTSIDE_SCIENTIST2

RuinsOfAlphOutsideOpenSinjohChamberScene:
	checkevent EVENT_DO_RUINS_OF_ALPH_CLIMAX
	iffalsefwd .End
	sdefer RuinsOfAlphOutsideOpenSinjohChamberScript
.End
	end

RuinsOfAlphOutsideOpenSinjohChamberScript:
	showtext RuinsofAlphScientistClimax1Text
	follow RUINSOFALPHOUTSIDE_SCIENTIST2, PLAYER
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST2, RuinsofAlphScientistClimaxApproachMovementData
	stopfollow
	showemote EMOTE_SHOCK, RUINSOFALPHOUTSIDE_SCIENTIST2, 15
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST2, RIGHT
	showtext RuinsofAlphScientistClimax2Text
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST2, RuinsofAlphScientistClimaxLeaveMovementData
	disappear RUINSOFALPHOUTSIDE_SCIENTIST2
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	clearevent EVENT_DO_RUINS_OF_ALPH_CLIMAX
	setevent EVENT_RUINS_OF_ALPH_CLIMAX_DONE
	end

RuinsofAlphOutsideTileScript:
	checkevent EVENT_DOOR_OPENED_IN_RUINS_OF_ALPH
	iffalsefwd .locked
	changeblock  6, 10, $2b
.locked
	endcallback

RuinsOfAlphOutsideScientistCallback:
	checkflag ENGINE_UNOWN_DEX
	iftruefwd .NoScientist
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftruefwd .MaybeScientist
	sjumpfwd .NoScientist

.MaybeScientist:
	readvar VAR_UNOWNCOUNT
	ifgreater $0, .YesScientist
	sjumpfwd .NoScientist

.YesScientist:
	appear RUINSOFALPHOUTSIDE_SCIENTIST1
	setscene SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX
	endcallback

.NoScientist:
	disappear RUINSOFALPHOUTSIDE_SCIENTIST1
	setscene SCENE_RUINSOFALPHOUTSIDE_OPEN_SINJOH_CHAMBER
	endcallback

RuinsOfAlphOutsideScientistScene:
RuinsOfAlphOutsideScientistScript:
	faceobject RUINSOFALPHOUTSIDE_SCIENTIST1, PLAYER
	faceobject PLAYER, RUINSOFALPHOUTSIDE_SCIENTIST1
	showtext RuinsOfAlphOutsideScientistText
	playmusic MUSIC_SHOW_ME_AROUND
	follow RUINSOFALPHOUTSIDE_SCIENTIST1, PLAYER
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST1, RuinsOfAlphOutsideScientistWalkToLabMovement
	disappear RUINSOFALPHOUTSIDE_SCIENTIST1
	stopfollow
	applyonemovement PLAYER, step_up
	setmapscene RUINS_OF_ALPH_RESEARCH_CENTER, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX
	warpcheck
	end

RuinsOfAlphOutsideFisherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_RUINS_COWARD
	iftrue_jumpopenedtext RuinsOfAlphOutsideFisherText2
	setevent EVENT_TALKED_TO_RUINS_COWARD
	writetext RuinsOfAlphOutsideFisherText1
	promptbutton
	jumpthisopenedtext

RuinsOfAlphOutsideFisherText2:
	text "¡Las ruinas"
	line "esconden un gran"
	cont "secreto!"

	para "…Eso creo…"
	done

RuinsOfAlphOutsideYoungster1Script:
	jumpthistextfaceplayer

	text "Hay muchos tipos"
	line "de Unown, así que"

	para "los usamos para"
	line "nuestros códigos"
	cont "secretos."
	done

RuinsOfAlphOutsideYoungster2Script:
	showtextfaceplayer RuinsOfAlphOutsideYoungster2Text
	turnobject LAST_TALKED, RIGHT
	end

GenericTrainerPsychicNathan:
	generictrainer PSYCHIC_T, NATHAN, EVENT_BEAT_PSYCHIC_NATHAN, PsychicNathanSeenText, PsychicNathanBeatenText

	text "Me gusta pensar"
	line "aquí."
	done

GenericTrainerSuperNerdStan:
	generictrainer SUPER_NERD, STAN, EVENT_BEAT_SUPER_NERD_STAN, SuperNerdStanSeenText, SuperNerdStanBeatenText

	text "Las ruinas tienen"
	line "unos 1.500 años"
	cont "de vida."

	para "Nadie sabe quién"
	line "las construyó."

	para "Tampoco se sabe si"
	line "las estatuas de"
	cont "#mon tienen"
	cont "algún significado."

	para "Todo es un gran"
	line "misterio…"
	done

RuinsOfAlphOutsideScientistWalkToLabMovement:
rept 7
	step_right
endr
rept 3
	step_up
endr
	step_end

RuinsofAlphScientistClimaxApproachMovementData:
	step_down
rept 4
	step_left
endr
rept 7
	step_up
endr
rept 8
	step_left
endr
	turn_head_up
	step_end

RuinsofAlphScientistClimaxLeaveMovementData:
	step_up
rept 7
	step_right
endr
	step_end

RuinsOfAlphOutsideScientistText:
	text "¿Hm? Eso es una"
	line "#dex, ¿verdad?"
	cont "¿Puedo verla?"

	para "Hay tantos tipos"
	line "de #mon."

	para "¿Hm? ¿Qué es"
	line "esto?"

	para "¿Qué #mon es"
	line "este?"

	para "Se parece a la"
	line "extraña escritura"

	para "en los muros de"
	line "las ruinas."

	para "Si esos dibujos"
	line "son de verdad"
	cont "#mon, debería"
	cont "haber muchos más."

	para "¡Ya sé! Deja que"
	line "actualice tu"
	cont "#dex. Sígueme."
	done

SuperNerdStanSeenText:
	text "¿Qué quieres?"
	line "Estoy estudiando…"
	cont "¡no me molestes!"
	done

SuperNerdStanBeatenText:
	text "Lo siento…"
	line "Me frustra"

	para "nuestra falta de"
	line "comprensión real…"
	done

PsychicNathanSeenText:
	text "Hmmm… Este es un"
	line "lugar extraño."
	done

PsychicNathanBeatenText: ; text > text
	text "…"
	done

RuinsOfAlphOutsideMysteryChamberSignText:
	text "Cámara del Panel"
	line "de Piedra"
	cont "Misterioso"
	done

RuinsOfAlphOutsideMysteriousHallSignText:
	text "Pasillo Misterioso"

	para "Cuidado al andar,"
	line "por favor."
	done

RuinsOfAlphSignText:
	text "Ruinas Alfa"
	line "Se aceptan"
	cont "visitantes"
	done

RuinsOfAlphResearchCenterSignText:
	text "Ruinas Alfa"
	line "Centro de"
	cont "Investigación"

	para "La Autoridad en"
	line "las Ruinas Alfa"
	done

RuinsOfAlphAdvancedTipsSignText:
	text "¡Consejos"
	line "avanzados!"

	para "¡La #dex es una"
	line "herramienta"
	cont "poderosa!"

	para "Su mapa de área"
	line "muestra un icono"

	para "¡amarillo si hay"
	line "un #mon justo"
	cont "donde estás!"
	done

MapRuinsofAlphOutsideSealedCaveSign:
	dw EVENT_DOOR_OPENED_IN_RUINS_OF_ALPH
	jumpthistext

	text "Hay una hendidura"
	line "con forma de"
	cont "puerta en la roca."
	done

RuinsOfAlphOutsideFisherText1:
	text "Mientras"
	line "explorábamos las"
	cont "ruinas,"

	para "notamos de repente"
	line "una presencia"
	cont "extraña."

	para "Nos asustamos"
	line "todos y huimos."

	para "Tú también"
	line "deberías tener"
	cont "cuidado."
	done


RuinsOfAlphOutsideYoungster2Text:
	text "A… H… E… A… D…"
	line "Mmm…"

	para "¿Qué?"

	para "¡Estoy decodifi-"
	line "cando este"
	cont "mensaje!"
	done

RuinsofAlphScientistClimax1Text:
	text "Ese sonido venía"
	line "de por aquí…"
	done

RuinsofAlphScientistClimax2Text:
	text "¡Increíble!"

	para "¡Había otra cámara"
	line "escondida aquí"
	cont "todo este tiempo!"

	para "¡Podríamos pasar"
	line "años"
	cont "estudiándola!"

	para "…Aunque, ese fue"
	line "un terremoto muy"
	cont "fuerte."

	para "¿Podría haberse"
	line "abierto otra"

	para "cámara lejos de"
	line "aquí?"

	para "¡Debo ir a"
	line "contarle esto a"
	cont "mis colegas!"
	done
