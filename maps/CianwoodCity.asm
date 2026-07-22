CianwoodCity_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_CIANWOODCITY_NOOP
	scene_const SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CianwoodCityFlyPointAndSuicune

	def_warp_events
	warp_event 17, 41, MANIAS_HOUSE, 1
	warp_event  8, 43, CIANWOOD_GYM, 1
	warp_event 23, 43, CIANWOOD_POKECENTER_1F, 1
	warp_event 15, 47, CIANWOOD_PHARMACY, 1
	warp_event  9, 31, CIANWOOD_CITY_PHOTO_STUDIO, 1
	warp_event 15, 37, CIANWOOD_LUGIA_SPEECH_HOUSE, 1
	warp_event  5, 17, MOVE_MANIACS_HOUSE, 1
	warp_event  4, 25, CLIFF_EDGE_GATE, 1

	def_coord_events
	coord_event 11, 16, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE, CianwoodCitySuicuneAndEusine

	def_bg_events
	bg_event 20, 34, BGEVENT_JUMPTEXT, CianwoodCitySignText
	bg_event  6, 44, BGEVENT_JUMPTEXT, CianwoodGymSignText
	bg_event 19, 47, BGEVENT_JUMPTEXT, CianwoodPharmacySignText
	bg_event  8, 32, BGEVENT_JUMPTEXT, CianwoodPhotoStudioSignText
	bg_event  6, 26, BGEVENT_JUMPTEXT, CianwoodCliffEdgeGateSignText
	bg_event  8, 22, BGEVENT_JUMPTEXT, CianwoodMoveManiacSignText
	bg_event 16, 31, BGEVENT_JUMPTEXT, CianwoodAdvancedTipsSignText
	bg_event  4, 19, BGEVENT_ITEM + REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE
	bg_event  5, 29, BGEVENT_ITEM + MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER

	def_object_events
	object_event 11, 21, SPRITE_EUSINE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_EUSINE
	pokemon_event 10, 14, SUICUNE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, ClearText, EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	object_event 21, 37, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityYoungsterText, -1
	object_event 16, 33, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityPokefanMText, -1
	object_event 14, 42, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityLassText, -1
	smashrock_event  8, 16
	smashrock_event  9, 17
	smashrock_event  6, 24
	smashrock_event  4, 29
	smashrock_event 10, 27
	smashrock_event  4, 19
	object_event 10, 46, SPRITE_MATRON, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodCityChucksWife, -1
	object_event  4, 26, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityRocketText, EVENT_BEAT_CHUCK
	object_event  9, 25, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCitySailorText, -1
	object_event 22, 32, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityFisherText, -1

	object_const_def
	const CIANWOODCITY_EUSINE
	const CIANWOODCITY_SUICUNE

CianwoodCityFlyPointAndSuicune:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	checkevent EVENT_BEAT_EUSINE
	iffalsefwd .Done
	disappear CIANWOODCITY_EUSINE
.Done:
	endcallback

CianwoodCitySuicuneAndEusine:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneApproachMovement
	turnobject PLAYER, DOWN
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneDepartMovement
	disappear CIANWOODCITY_SUICUNE
	pause 10
	setscene SCENE_CIANWOODCITY_NOOP
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	checkevent EVENT_GOT_HM05_WHIRLPOOL
	iftruefwd .NoLyra
	setmapscene ROUTE_42, SCENE_ROUTE42_LYRA
	sjumpfwd .Continue
.NoLyra
	setmapscene ROUTE_42, SCENE_ROUTE42_SUICUNE
.Continue
	checkevent EVENT_BEAT_EUSINE
	iftrue DoNothingScript
	setevent EVENT_BEAT_EUSINE
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	appear CIANWOODCITY_EUSINE
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineApproachMovement
	showtext EusineSuicuneText
	winlosstext EusineBeatenText, EusineLossText
	setlasttalked CIANWOODCITY_EUSINE
	loadtrainer MYSTICALMAN, EUSINE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	showtext EusineAfterText
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineDepartMovement
	disappear CIANWOODCITY_EUSINE
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	end

CianwoodCityChucksWife:
	checkevent EVENT_BEAT_CHUCK
	iftrue_jumptextfaceplayer ChucksWifeChubbyText
	jumpthistextfaceplayer

	text "¿Cruzaste el mar"
	line "para llegar aquí?"

	para "Debió de ser"
	line "duro."

	para "Sería mucho más"
	line "fácil si tu"
	cont "#mon supiera"
	cont "Vuelo…"
	done

CianwoodCitySuicuneApproachMovement:
	fix_facing
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_right
	step_end

CianwoodCitySuicuneDepartMovement:
	fix_facing
	fast_jump_step_right
	fast_jump_step_up
	fast_jump_step_right
	fast_jump_step_right
	step_end

CianwoodCityEusineApproachMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

CianwoodCityEusineDepartMovement:
	step_down
	step_down
	step_down
	step_down
	step_end


ChucksWifeChubbyText:
	text "¡Esa es la"
	line "Medalla de"
	cont "Orquídea!"

	para "Mi marido perdió"
	line "contra ti, así que"
	cont "debe entrenar más."

	para "Menos mal, porque"
	line "estaba engordando"
	cont "un poco."

	para "Las cascadas de la"
	line "Ruta 47, al norte"
	cont "de aquí,"

	para "son un buen sitio"
	line "para entrenar."
	done

CianwoodCityYoungsterText:
	text "Si usas Vuelo,"
	line "puedes volver"

	para "a Ciudad Olivo"
	line "al instante."
	done

CianwoodCityPokefanMText:
	text "Las rocas al norte"
	line "del pueblo se"
	cont "pueden romper."

	para "Puede que"
	line "escondan algo."

	para "Tu #mon podría"
if DEF(FAITHFUL)
	line "usar Golpe Roca"
	cont "para romperlas."
else
	line "usar Demolición"
	cont "para romperlas."
endc
	done

CianwoodCityLassText:
	text "Aníbal, el Líder"
	line "de Gimnasio,"

	para "entrena con sus"
	line "#mon de lucha."
	done

CianwoodCityRocketText:
	text "¡Por aquí no se"
	line "puede pasar!"

	para "¿Por qué? ¡No te"
	line "metas!"
	done

CianwoodCitySailorText:
	text "Esa cueva es la"
	line "única forma de"
	cont "llegar a la"
	cont "Ruta 47."
	done

CianwoodCityFisherText:
	text "La Farmacia"
	line "Orquídea lleva"
	cont "más de 500 años"
	cont "en el negocio."

	para "Eso debe ser todo"
	line "un récord,"
	cont "¿verdad?"
	done

EusineSuicuneText:
	text "Eusine: Ey,"
	line "<PLAYER>."

	para "¿No era ese"
	line "Suicune de ahí?"

	para "Solo lo vi un"
	line "instante, pero…"

	para "Creo que vi a"
	line "Suicune correr"
	cont "sobre las olas."

	para "Suicune es"
	line "precioso y"
	cont "majestuoso."

	para "Y cruza pueblos"
	line "y caminos"

	para "a una velocidad"
	line "increíble."

	para "Es maravilloso…"

	para "Quiero verlo"
	line "de cerca…"

	para "Ya lo he decidido."

	para "¡Voy a combatir"
	line "contigo como"
	cont "entrenador para"
	cont "ganarme el"
	cont "respeto de"
	cont "Suicune!"

	para "Vamos, <PLAYER>."
	line "¡Combatamos ya!"
	done

EusineBeatenText:
	text "Odio admitirlo,"
	line "pero has ganado."
	done

EusineLossText:
	text "¡Sí!"

	para "Seguro que ahora"
	line "Suicune reconoce"
	cont "mi grandeza!"
	done

EusineAfterText:
	text "¡Eres increíble,"
	line "<PLAYER>!"

	para "No me extraña que"
	line "los #mon te"
	cont "adoren."

	para "Ahora lo entiendo."

	para "Voy a seguir"
	line "buscando a"
	cont "Suicune."

	para "Seguro que nos"
	line "veremos de nuevo."

	para "¡Hasta la vista!"
	done

CianwoodCitySignText:
	text "Ciudad Orquídea"

	para "Un Puerto Rodeado"
	line "de Mares Bravos"
	done

CianwoodGymSignText:
	text "Ciudad Orquídea"
	line "Gimnasio #mon"

	para "Líder: Aníbal"

	para "Sus Puños Rugen"
	line "Más que Palabras"
	done

CianwoodPharmacySignText:
	text "500 Años de"
	line "Tradición"

	para "Farmacia"
	line "Orquídea"

	para "Esperamos tus"
	line "Consultas"
	cont "Médicas"
	done

CianwoodPhotoStudioSignText:
	text "Estudio de Fotos"
	line "Orquídea"

	para "¡Llévate un"
	line "recuerdo con una"
	cont "foto!"
	done

CianwoodCliffEdgeGateSignText:
	text "Paso Acantilado"

	para "¡El Bosque"
	line "Amarillo está"
	cont "cerca!"
	done

CianwoodMoveManiacSignText:
	text "Maníaco de los"
	line "movimientos"
	cont "más adelante"
	done

CianwoodAdvancedTipsSignText:
	text "¡Consejos"
	line "Avanzados!"

	para "Puedes usar una"
	line "# Ball en un"

	para "#mon que hayas"
	line "atrapado para"
	cont "cambiar su Ball!"

	para "Pero no recuperas"
	line "la # Ball"
	cont "original!"
	done
