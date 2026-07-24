KogasRoom_MapScriptHeader:
	def_scene_scripts
	scene_script KogasRoomLockDoorScene, SCENE_KOGASROOM_LOCK_DOOR
	scene_const SCENE_KOGASROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KogasRoomDoorCallback

	def_warp_events
	warp_event  4, 17, WILLS_ROOM, 2
	warp_event  5, 17, WILLS_ROOM, 3
	warp_event  4,  2, BRUNOS_ROOM, 1
	warp_event  5,  2, BRUNOS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KogaScript, -1

KogasRoomLockDoorScene:
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
	setscene SCENE_KOGASROOM_NOOP
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KogasRoomDoorCallback:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalsefwd .KeepDoorClosed
	changeblock 4, 14, $2a
.KeepDoorClosed:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalsefwd .OpenDoor
	changeblock 4, 2, $16
.OpenDoor:
	endcallback

KogaScript:
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue_jumptextfaceplayer .AfterText
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer KOGA, 1
	startbattle
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue_jumptextfaceplayer .AfterRematchText
	showtextfaceplayer .SeenRematchText
	winlosstext .BeatenText, 0
	loadtrainer KOGA, 2
	startbattle
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16
	refreshmap
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	setevent EVENT_BEAT_ELITE_4_KOGA
	waitsfx
	end

.SeenText:
	text "¡Fuajajaja!"

	para "Soy Koga, del"
	line "Alto Mando."

	para "¡Vivo en las"
	line "sombras, un"
	cont "ninja!"

	para "¡Mi intrincado"
	line "estilo te"
	cont "confundirá y"
	cont "destruirá!"

	para "Confusión, sueño,"
	line "veneno…"

	para "¡Prepárate para"
	line "ser víctima de mi"
	cont "técnica siniestra!"

	para "¡Fuajajaja!"

	para "Los #mon no son"
	line "solo fuerza"

	para "bruta. ¡Lo verás"
	line "pronto!"
	done

.BeatenText:
	text "¡Ah!"
	line "¡Has demostrado"
	cont "tu valía!"
	done

.AfterText:
	text "Te sometí a todo"
	line "lo que pude"
	cont "reunir."

	para "Pero mis esfuerzos"
	line "fallaron. Debo"
	cont "pulir mis"
	cont "habilidades."

	para "¡Ve a la siguiente"
	line "sala, y pon a"
	cont "prueba tus"
	cont "habilidades!"
	done

.SeenRematchText:
	text "Tu llegada es"
	line "impresionante,"
	cont "como tu mirada"
	cont "decidida."

	para "¡Fuajajaja!"

	para "¡Mi habilidad será"
	line "difícil de"
	cont "superar!"

	para "¡Deja que te"
	line "muestre a qué me"
	cont "refiero!"
	done

.AfterRematchText:
	text "Nunca conocí a"
	line "alguien como tú."

	para "Debo dedicarme a"
	line "mi"
	cont "entrenamiento."
	done
