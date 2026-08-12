CeruleanCity_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_CERULEANCITY_BRIDGE_UNDERFOOT
	scene_const SCENE_CERULEANCITY_BRIDGE_OVERHEAD

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeruleanCityFlyPoint

	def_warp_events
	warp_event  8, 11, CERULEAN_GYM_BADGE_SPEECH_HOUSE, 1
	warp_event 24, 11, CERULEAN_POLICE_STATION, 1
	warp_event 13, 15, CERULEAN_TRADE_SPEECH_HOUSE, 1
	warp_event 19, 17, CERULEAN_POKECENTER_1F, 1
	warp_event 26, 19, CERULEAN_GYM, 1
	warp_event 25, 25, CERULEAN_MART, 2
	warp_event  2,  9, CERULEAN_CAVE_1F, 1
	warp_event 14, 25, CERULEAN_BIKE_SHOP, 1
	warp_event 14, 11, CERULEAN_BERRY_POWDER_HOUSE, 1
	warp_event 19, 25, CERULEAN_COUPLE_HOUSE, 1
	warp_event 31, 11, CERULEAN_WATER_SHOW_SPEECH_HOUSE, 1

	def_coord_events
	coord_event 20,  4, SCENE_CERULEANCITY_BRIDGE_UNDERFOOT, Route24BridgeUnderfootTrigger
	coord_event 21,  4, SCENE_CERULEANCITY_BRIDGE_UNDERFOOT, Route24BridgeUnderfootTrigger
	coord_event 20,  5, SCENE_CERULEANCITY_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 21,  5, SCENE_CERULEANCITY_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger

	def_bg_events
	bg_event 17, 20, BGEVENT_JUMPTEXT, CeruleanCitySignText
	bg_event 27, 19, BGEVENT_JUMPTEXT, CeruleanGymSignText
	bg_event 11, 25, BGEVENT_JUMPTEXT, CeruleanBikeShopSignText
	bg_event 29, 11, BGEVENT_JUMPTEXT, CeruleanPoliceSignText
	bg_event 19,  5, BGEVENT_JUMPTEXT, CeruleanCapeSignText
	bg_event 13, 19, BGEVENT_JUMPTEXT, CeruleanBubblerText
	bg_event 21, 27, BGEVENT_JUMPTEXT, CeruleanTrainerTipsText
	bg_event  4,  9, BGEVENT_ITEM + BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	bg_event 31, 17, BGEVENT_ITEM + RARE_CANDY, EVENT_CERULEAN_CITY_HIDDEN_RARE_CANDY

	def_object_events
	object_event 21, 20, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerFScript, -1
	object_event  7,  8, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityYoungsterScript, -1
	object_event 30, 22, SPRITE_COOL_DUDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerMScript, -1
	object_event 28, 14, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanCitySuperNerdText, -1
	pokemon_event 20, 20, SLOWBRO, SPRITEMOVEDATA_STILL, -1, PAL_MON_PINK, CeruleanCitySlowbroText, -1
	object_event 11, 19, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityFisherScript, -1
	object_event  2, 10, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanCaveGuardText, EVENT_BEAT_BLUE
	cuttree_event 44, 16, EVENT_ROUTE_9_CUT_TREE

	object_const_def
	const CERULEANCITY_COOLTRAINER_F
	const CERULEANCITY_YOUNGSTER

CeruleanCityFlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN
	endcallback

CeruleanCityCooltrainerMScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer CeruleanCityCooltrainerMText2
	jumpthistextfaceplayer

	text "¿La Central"
	line "Eléctrica de"
	cont "Kanto?"

	para "Está cerca del"
	line "final de la Ruta"
	cont "9, el camino que"
	cont "va al este desde"
	cont "aquí."

	para "Creo que hubo"
	line "algún tipo de"
	cont "accidente allí."
	done

CeruleanCityCooltrainerFScript:
	faceplayer
	opentext
	writetext CeruleanCityCooltrainerFText1
	waitbutton
	turnobject CERULEANCITY_COOLTRAINER_F, LEFT
	writetext CeruleanCityCooltrainerFText2
	waitbutton
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	writetext CeruleanCityCooltrainerFText3
	waitendtext
	end

CeruleanCityFisherScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer CeruleanCityFisherText
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue_jumptextfaceplayer CeruleanCityFisherRocketTipText
	jumptextfaceplayer CeruleanCityFisherText

CeruleanCityYoungsterScript:
	checkevent EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	iftrue_jumptextfaceplayer CeruleanCityYoungsterText
	faceplayer
	showtext CeruleanCityYoungsterText1
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	showemote EMOTE_SHOCK, CERULEANCITY_YOUNGSTER, 15
	turnobject CERULEANCITY_YOUNGSTER, LEFT
	jumpthistext

	text "¿Ayuh?"

	para "Mi Buscaobjetos"
	line "está respondiendo…"
	done


CeruleanCityCooltrainerMText2:
	text "¿Estás"
	line "coleccionando"
	cont "cada especie de"
	cont "#mon?"

	para "Eso debe de ser"
	line "todo un desafío,"
	cont "pero suena"
	cont "divertido."
	done

CeruleanCitySuperNerdText:
	text "El Cabo del norte"
	line "es un buen lugar"

	para "para citas."
	line "¡A las chicas les"
	cont "encanta!"
	done

CeruleanCitySlowbroText:
	text "Slowbro: ¿Yarah?"
	done

CeruleanCityCooltrainerFText1:
	text "¡Mi Slowbro y yo"
	line "hacemos una"
	cont "combinación"
	cont "increíble!"
	done

CeruleanCityCooltrainerFText2:
	text "Slowbro,"
	line "¡muéstrame tu"
	cont "Confusión!"
	done

CeruleanCityCooltrainerFText3: ; text > text
	text "…"
	done

CeruleanCityFisherText:
	text "Soy un gran fan de"
	line "Misty, del"
	cont "Gimnasio de"
	cont "Celeste."
	done

CeruleanCityFisherRocketTipText:
	text "Vi a un tipo"
	line "sospechoso ir"
	cont "hacia el Cabo"
	cont "Celeste."
	done

CeruleanCityYoungsterText1:
	text "Hay una cueva aquí"
	line "con #mon"
	cont "aterradoramente"
	cont "poderosos."
	done


CeruleanCityYoungsterText:
	text "Mi Buscaobjetos"
	line "dejó de"
	cont "responder…"

	para "Alguien debió"
	line "ganarme."
	done

CeruleanCaveGuardText:
	text "Esto es…"

	para "¡La famosa Cueva"
	line "Celeste!"

	para "Aquí viven #mon"
	line "terriblemente"
	cont "poderosos."

	para "Solo quienes han"
	line "vencido a los"

	para "ocho Líderes de"
	line "Gimnasio de Kanto"
	cont "pueden entrar."
	done

CeruleanCitySignText:
	text "Ciudad Celeste"

	para "Un Aura Azul"
	line "Misteriosa la"
	cont "Rodea"
	done

CeruleanGymSignText:
	text "Gimnasio #mon"
	line "de Ciudad Celeste"
	cont "Líder: Misty"

	para "La Sirena"
	line "Marimacho"
	done

CeruleanBikeShopSignText:
	text "Precursora del"
	line "Boom de la"
	cont "Bicicleta"

	para "Ciclo Milagro"
	done

CeruleanPoliceSignText:
	text "Hay un aviso"
	line "aquí…"

	para "¡Acabemos con los"
	line "robos y hagamos"

	para "de la ciudad un"
	line "lugar más"
	cont "acogedor y"
	cont "alegre!"

	para "Policía de"
	line "Ciudad Celeste"
	done

CeruleanCapeSignText:
	text "Cabo Celeste"
	line "Adelante"
	done

CeruleanBubblerText:
	text "¡El agua sabe"
	line "bien!"
	done

CeruleanTrainerTipsText:
	text "Consejos de"
	line "entrenador"

	para "Incluso sin"
	line "Buscaobjetos,"

	para "puedes encontrar"
	line "objetos útiles en"

	para "árboles, bajo"
	line "rocas, o bajo el"
	cont "agua."
	done
