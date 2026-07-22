BrunosRoom_MapScriptHeader:
	def_scene_scripts
	scene_script BrunosRoomLockDoorScene, SCENE_BRUNOSROOM_LOCK_DOOR
	scene_const SCENE_BRUNOSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, BrunosRoomDoorCallback

	def_warp_events
	warp_event  4, 17, KOGAS_ROOM, 3
	warp_event  5, 17, KOGAS_ROOM, 4
	warp_event  4,  2, KARENS_ROOM, 1
	warp_event  5,  2, KARENS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_BRUNO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BrunoScript, -1

BrunosRoomLockDoorScene:
	sdefer .Script
	end

.Script:
	applymovement PLAYER, WalkIntoEliteFourRoomMovement
	reanchormap
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a
	refreshmap
	closetext
	setscene SCENE_BRUNOSROOM_NOOP
	setevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

BrunosRoomDoorCallback:
	checkevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	iffalsefwd .KeepDoorClosed
	changeblock 4, 14, $2a
.KeepDoorClosed:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalsefwd .OpenDoor
	changeblock 4, 2, $16
.OpenDoor:
	endcallback

BrunoScript:
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue_jumptextfaceplayer .AfterText
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer BRUNO, 1
	startbattle
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue_jumptextfaceplayer .AfterRematchText
	showtextfaceplayer .SeenRematchText
	winlosstext .BeatenText, 0
	loadtrainer BRUNO, 2
	startbattle
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16
	refreshmap
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	setevent EVENT_BEAT_ELITE_4_BRUNO
	waitsfx
	end

.SeenText:
	text "Soy Bruno, del"
	line "Alto Mando."

	para "Siempre entreno al"
	line "extremo porque"
	cont "creo en nuestro"
	cont "potencial."

	para "Así nos volvimos"
	line "fuertes."

	para "¿Puedes resistir"
	line "nuestro poder?"

	para "¿Eh? No veo miedo"
	line "en ti. Pareces"

	para "decidido."
	line "¡Perfecto para"
	cont "combatir!"

	para "¿Listo, <PLAYER>?"
	line "Te postrarás ante"

	para "nuestro poder"
	line "arrollador!"

	para "¡Hoo ha!"
	done

.BeatenText:
	text "¿Por qué? ¿Cómo"
	line "pudimos perder?"
	done

.AfterText:
	text "Al perder, no"
	line "tengo derecho a"
	cont "decir nada…"

	para "¡Ve a enfrentar tu"
	line "próximo reto!"
	done

.SeenRematchText:
	text "Hola de nuevo."

	para "Como miembro del"
	line "Alto Mando,"
	cont "¡afrontaré tu"
	cont "reto!"

	para "Me molestaría que"
	line "subestimaras a"
	cont "mis #mon"
	cont "luchadores."

	para "¡Prepárate!"
	done

.AfterRematchText:
	text "Lo intentamos"
	line "mucho."

	para "¡Sigue adelante!"
	done
