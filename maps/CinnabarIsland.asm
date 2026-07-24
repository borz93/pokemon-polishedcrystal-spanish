CinnabarIsland_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CinnabarIslandFlyPoint

	def_warp_events
	warp_event 11, 15, CINNABAR_POKECENTER_1F, 1
	warp_event 18,  9, CINNABAR_VOLCANO_1F, 1
	warp_event  7,  7, POKEMON_MANSION_1F, 1

	def_coord_events

	def_bg_events
	bg_event  9, 15, BGEVENT_JUMPTEXT, CinnabarIslandGymSignText
	bg_event  9, 11, BGEVENT_JUMPTEXT, CinnabarIslandSignText
	bg_event 21, 11, BGEVENT_JUMPTEXT, CinnabarIslandVolcanoWarningSignText
	bg_event 11, 12, BGEVENT_ITEM + RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

	def_object_events
	object_event 20, 14, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandBlue, EVENT_BLUE_IN_CINNABAR
	itemball_event 22,  2, MAGMARIZER, 1, EVENT_CINNABAR_ISLAND_MAGMARIZER

	object_const_def
	const CINNABARISLAND_BLUE

CinnabarIslandFlyPoint:
	setflag ENGINE_FLYPOINT_CINNABAR
	endcallback

CinnabarIslandBlue:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_BLUE_INTRO
	iftruefwd .HeardIntro
	writetext CinnabarIslandBlueText
	waitbutton
	setevent EVENT_LISTENED_TO_BLUE_INTRO
.HeardIntro
	writetext CinnabarIslandBlueBattleText
	waitbutton
	readvar VAR_BADGES
	ifgreater 14, .Ready
	jumpthisopenedtext

	text "Si quieres"
	line "combatir conmigo,"

	para "muéstrame cuántas"
	line "Medallas de Kanto"
	cont "tienes."

	para "Menos de siete…"
	line "No estás listo"
	cont "para combatir"
	cont "conmigo."
	done

.Ready
	writetext CinnabarIslandBlueReadyText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applyonemovement CINNABARISLAND_BLUE, teleport_from
	disappear CINNABARISLAND_BLUE
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	end

CinnabarIslandBlueText:
	text "¿Quién eres?"

if !DEF(DEBUG)
	para "Bueno, se nota"
	line "que eres un"
	cont "entrenador…"

	para "Me llamo Blue."

	para "Fui Campeón una"
	line "vez, aunque solo"
	cont "por poco tiempo…"

	para "Ese entrometido de"
	line "Red me venció…"

	para "Bueno, ¿Qué"
	line "quieres? ¿Quieres"
	cont "retarme o algo?"

	para "…Odio decirlo,"
	line "pero no tengo"
	cont "ganas de combatir"
	cont "ahora."

	para "Mira bien a tu"
	line "alrededor…"

	para "Un volcán entra en"
	line "erupción, y así"
	cont "sin más, un pueblo"
	cont "entero"
	cont "desaparece."

	para "Podemos seguir"
	line "ganando y"
	cont "perdiendo en"
	cont "#mon. Pero si"

	para "la naturaleza se"
	line "inmuta un poco,"
	cont "podemos perder en"
	cont "un segundo."

	para "…"

	para "Así son las"
	line "cosas…"

	para "Pero, en fin, sigo"
	line "siendo entrenador."
endc
	done

CinnabarIslandBlueBattleText:
	text "Si veo a un rival"
	line "fuerte, me dan"
	cont "ganas de"
	cont "combatir."
	done

CinnabarIslandBlueReadyText:
	text "Si quieres"
	line "combatir conmigo,"

	para "ve al Gimnasio de"
	line "Ciudad Verde."

	para "Te enfrentaré"
	line "entonces."
	done


CinnabarIslandGymSignText:
	text "Hay un aviso"
	line "aquí…"

	para "“El Gimnasio de"
	line "Canela se mudó a"
	cont "las Islas Espuma.”"

	para "-- Blaine"
	done

CinnabarIslandSignText:
	text "Isla Canela"

	para "El Ardiente Pueblo"
	line "del Deseo"
	cont "Abrasador"
	done

CinnabarIslandVolcanoWarningSignText:
	text "CUIDADO"

	para "El Volcán Canela"
	line "está inactivo,"
	cont "¡pero sigue"
	cont "activo!"

	para "¡No entres al"
	line "volcán sin forma"
	cont "de escapar!"
	done
