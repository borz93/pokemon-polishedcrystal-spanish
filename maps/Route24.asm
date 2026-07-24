Route24_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE24_BRIDGE_UNDERFOOT
	scene_const SCENE_ROUTE24_BRIDGE_OVERHEAD

	def_callbacks
	callback MAPCALLBACK_TILES, Route24TileScript

	def_warp_events

	def_coord_events
	coord_event 19, 15, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 20, 14, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 21, 14, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 22, 15, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 20, 15, SCENE_ROUTE24_BRIDGE_UNDERFOOT, Route24BridgeUnderfootTrigger
	coord_event 21, 15, SCENE_ROUTE24_BRIDGE_UNDERFOOT, Route24BridgeUnderfootTrigger
	coord_event 20, 39, SCENE_ROUTE24_BRIDGE_UNDERFOOT, Route24BridgeUnderfootTrigger
	coord_event 21, 39, SCENE_ROUTE24_BRIDGE_UNDERFOOT, Route24BridgeUnderfootTrigger
	coord_event 25, 13, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 15, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 16, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 17, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 18, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 19, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 20, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 21, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 22, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger
	coord_event 25, 23, SCENE_ROUTE24_BRIDGE_OVERHEAD, Route24BridgeOverheadTrigger

	def_bg_events
	bg_event 15, 19, BGEVENT_ITEM + MAX_POTION, EVENT_ROUTE_24_HIDDEN_MAX_POTION
	bg_event 23, 11, BGEVENT_JUMPTEXT, Route24AdvancedTipsSignText

	def_object_events
	object_event 21, 25, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM31, EVENT_ROUTE_24_ROCKET
	fruittree_event 16,  5, FRUITTREE_ROUTE_24, LANSAT_BERRY, PAL_NPC_PINK

	object_const_def
	const ROUTE24_ROCKET

Route24TileScript:
	checkscene
	iftruefwd .underfoot
	callasm Route24_OverheadBridgeAsm
	endcallback

.underfoot:
	callasm Route24_UnderfootBridgeAsm
	endcallback

Route24_OverheadBridgeAsm:
	changebridgeblock 20, 16, $39, ROUTE_24
	changebridgeblock 20, 18, $38, ROUTE_24
	changebridgeblock 20, 20, $38, ROUTE_24
	changebridgeblock 20, 22, $38, ROUTE_24
	changebridgeblock 20, 24, $38, ROUTE_24
	changebridgeblock 20, 26, $38, ROUTE_24
	changebridgeblock 20, 28, $38, ROUTE_24
	changebridgeblock 20, 30, $38, ROUTE_24
	changebridgeblock 20, 32, $38, ROUTE_24
	changebridgeblock 20, 34, $38, ROUTE_24
	changebridgeblock 20, 36, $38, ROUTE_24
	changebridgeblock 20, 38, $49, ROUTE_24
	jmp BufferScreen

Route24_UnderfootBridgeAsm:
	changebridgeblock 20, 16, $34, ROUTE_24
	changebridgeblock 20, 18, $34, ROUTE_24
	changebridgeblock 20, 20, $34, ROUTE_24
	changebridgeblock 20, 22, $34, ROUTE_24
	changebridgeblock 20, 24, $34, ROUTE_24
	changebridgeblock 20, 26, $34, ROUTE_24
	changebridgeblock 20, 28, $34, ROUTE_24
	changebridgeblock 20, 30, $34, ROUTE_24
	changebridgeblock 20, 32, $34, ROUTE_24
	changebridgeblock 20, 34, $34, ROUTE_24
	changebridgeblock 20, 36, $34, ROUTE_24
	changebridgeblock 20, 38, $4a, ROUTE_24
	jmp BufferScreen

Route24BridgeOverheadTrigger:
	callasm Route24_OverheadBridgeAsm
	callthisasm
	xor a
	jr Route24_FinishBridge

Route24BridgeUnderfootTrigger:
	callasm Route24_UnderfootBridgeAsm
	callthisasm
	ld a, $1
Route24_FinishBridge:
	ld [wWalkingOnBridge], a
	ld [wRoute24SceneID], a ; setscene a
	jmp GenericFinishBridge

TrainerGruntM31:
	trainer GRUNTM, 31, EVENT_BEAT_ROCKET_GRUNTM_31, Route24RocketSeenText, Route24RocketBeatenText, 0, Route24RocketScript

Route24RocketScript:
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketAfterBattleText
	promptbutton
	special Special_FadeOutMusic
	writetext Route24RocketDisappearsText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear ROUTE24_ROCKET
	setevent EVENT_LEARNED_ABOUT_MACHINE_PART
	clearevent EVENT_CERULEAN_CAPE_BOYFRIEND
	setmapscene CERULEAN_CAPE, SCENE_CERULEANCAPE_MISTYS_DATE
	pause 25
	special Special_FadeInQuickly
	playmusic MUSIC_NUGGET_BRIDGE_HGSS
	end

Route24RocketSeenText:
	text "¡Oye, niño! Yo"
	line "ser tipo miembro"
	cont "de Team Rocket!"

	para "¡Venir de otro"
	line "país, entrenador"
	cont "número uno, yo!"

	para "Pensé, si parar"
	line "la energía,"

	para "¡ser gran pánico"
	line "para gente de"
	cont "aquí!"

	para "¡Secreto es mi"
	line "misión, así que"
	cont "decir yo no!"

	para "¡Pero! Si ganar tú"
	line "haces contra mí,"

	para "un hombre yo ser"
	line "y mi secreto a ti"
	cont "contar."

	para "¡Oye, niño!"
	line "¡Batalla"
	cont "empezamos ya!"
	done

Route24RocketBeatenText:
	text "¡Ayieeeh! No, no,"
	line "no, creer yo no"
	cont "puedo!"

	para "¡Fuerte mucho ser"
	line "tú! Rival yo no"
	cont "soy para ti!"
	done

Route24RocketAfterBattleText:
	text "Vale. Decir a ti"
	line "mi secreto haré"
	cont "yo."

	para "Parte de Máquina"
	line "robar yo, esconder"
	cont "la hice"

	para "en Gimnasio de"
	line "Celeste."

	para "Dentro del agua"
	line "puse yo. Buscar"

	para "en agua centro de"
	line "Gimnasio en."

	para "¡Pero a mí olvidar"
	line "tú no!"

	para "Vencerte seguro"
	line "hará Team Rocket."

	para "Venir de Johto"
	line "harán ellos, mis"

	para "amigos, sí."
	line "Venganza tendrán"
	cont "ellos."
	done

Route24RocketDisappearsText:
	text "…"

	para "¿Tú dices qué? El"
	line "Team Rocket"
	cont "adiós-adiós"

	para "¿Se va? ¿Roto"
	line "está dices tú?"

	para "¡Oh, no! ¿Qué debo"
	line "hacer ahora yo"
	cont "en adelante?"
	done

Route24AdvancedTipsSignText:
	text "¡Consejo"
	line "avanzado!"

	para "La Habilidad"
	line "Potencia Bruta"

	para "anula los efectos"
	line "secundarios de"
	cont "movimientos, ¡pero"

	para "también anula"
	line "otros efectos!"

	para "¡En concreto, se"
	line "ignora el daño"
	cont "por llevar una"
	cont "Vidasfera!"
	done
