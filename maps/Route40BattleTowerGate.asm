Route40BattleTowerGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, ROUTE_40, 1
	warp_event  5,  7, ROUTE_40, 1
	warp_event  4,  0, BATTLE_TOWER_OUTSIDE, 1
	warp_event  5,  0, BATTLE_TOWER_OUTSIDE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route40BattleTowerGateOfficer, EVENT_BATTLE_TOWER_CLOSED
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateRockerScript, -1
	object_event  7,  5, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateTwinScript, -1

Route40BattleTowerGateOfficer:
	text "¿Vas a la Torre"
	line "Batalla?"

	para "Si ganas mucho,"
	line "puedes conseguir"

	para "PB y cambiarlos"
	line "por objetos"
	cont "especiales."
	done

Route40BattleTowerGateRockerScript:
	checkevent EVENT_BATTLE_TOWER_OPEN
	iftrue_jumptextfaceplayer .OpenText
	jumpthistextfaceplayer

	text "¿Viniste a ver"
	line "la Torre Batalla"
	cont "también?"

	para "Pero supongo que"
	line "aún no puedes"
	cont "entrar."
	done

.OpenText:
	text "La Torre Batalla"
	line "ha abierto."

	para "Quiero ir, pero"
	line "no se me ocurre"

	para "una frase molona"
	line "para cuando gane."
	done

Route40BattleTowerGateTwinScript:
	checkevent EVENT_BATTLE_TOWER_OPEN
	iftrue_jumptextfaceplayer .OpenText
	jumpthistextfaceplayer

	text "Voy a entrenar a"
	line "mis #mon para"

	para "estar lista para"
	line "la Torre Batalla."
	done

.OpenText:
	text "Los niveles de"
	line "los #mon que"
	cont "quiero usar"

	para "son todos"
	line "distintos."

	para "¡Tengo que ir a"
	line "entrenarlos ya!"
	done
