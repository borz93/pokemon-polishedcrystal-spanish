MountMoon1F_MapScriptHeader:
	def_scene_scripts
	scene_script MountMoon1FRivalBattleScene, SCENE_MOUNTMOON1F_RIVAL_BATTLE
	scene_const SCENE_MOUNTMOON1F_NOOP

	def_callbacks

	def_warp_events
	warp_event 11, 23, ROUTE_3, 1
	warp_event 22, 12, MOUNT_MOON_B1F, 1
	warp_event 11,  9, MOUNT_MOON_B1F, 2
	warp_event  4,  4, MOUNT_MOON_B1F, 3

	def_coord_events

	def_bg_events
	bg_event  2, 17, BGEVENT_ITEM + RARE_CANDY, EVENT_MOUNT_MOON_1F_HIDDEN_RARE_CANDY
	bg_event 12, 16, BGEVENT_ITEM + FULL_RESTORE, EVENT_MOUNT_MOON_1F_HIDDEN_FULL_RESTORE

	def_object_events
	object_event 10, 19, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
	object_event  4, 18, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBugManiacKenta, -1
	object_event 11, 14, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerLassMiriam, -1
	object_event 20, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSuperNerdJovan, -1
	object_event 27, 14, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBugManiacRobby, -1
	object_event 20,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassIris, -1
	object_event  5,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerMarcos, -1
	itemball_event  3,  2, REVIVE, 1, EVENT_MOUNT_MOON_1F_REVIVE
	itemball_event  2, 20, X_ACCURACY, 1, EVENT_MOUNT_MOON_1F_X_ACCURACY
	itemball_event 16, 22, CALCIUM, 1, EVENT_MOUNT_MOON_1F_CALCIUM

	object_const_def
	const MOUNTMOON1F_RIVAL

MountMoon1FRivalBattleScene:
	sdefer .RivalBattle
	end

.RivalBattle:
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	applymovement MOUNTMOON1F_RIVAL, MountMoon1FRivalMovementBefore
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext MountMoonRivalTextBefore
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON1F_RIVAL
	loadtrainer RIVAL2, 3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .FinishBattle

.Totodile:
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON1F_RIVAL
	loadtrainer RIVAL2, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .FinishBattle

.Chikorita:
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON1F_RIVAL
	loadtrainer RIVAL2, 2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	; fallthrough

.FinishBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	showtext MountMoonRivalTextAfter
	applymovement PLAYER, MountMoon1FPlayerMovement
	applymovement MOUNTMOON1F_RIVAL, MountMoon1FRivalMovementAfter
	disappear MOUNTMOON1F_RIVAL
	playsound SFX_EXIT_BUILDING
	waitsfx
	setscene SCENE_MOUNTMOON1F_NOOP
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end

GenericTrainerBugManiacKenta:
	generictrainer BUG_MANIAC, KENTA, EVENT_BEAT_BUG_MANIAC_KENTA, BugManiacKentaSeenText, BugManiacKentaBeatenText

	text "El Team Rocket"
	line "solía merodear"
	cont "por aquí."

	para "Me pregunto si el"
	line "chico pelirrojo"
	cont "tiene alguna"
	cont "relación con"
	cont "ellos."
	done

GenericTrainerLassMiriam:
	generictrainer LASS, MIRIAM, EVENT_BEAT_LASS_MIRIAM, LassMiriamSeenText, LassMiriamBeatenText

	text "El Monte Moon es"
	line "grande, pero te"
	cont "acostumbrarás"
	cont "pronto."
	done

GenericTrainerSuperNerdJovan:
	generictrainer SUPER_NERD, JOVAN, EVENT_BEAT_SUPER_NERD_JOVAN, SuperNerdJovanSeenText, SuperNerdJovanBeatenText

	text "Aún no he"
	line "encontrado #mon"
	cont "más fuertes."

	para "¿Dónde estarán?"
	done

GenericTrainerBugManiacRobby:
	generictrainer BUG_MANIAC, ROBBY, EVENT_BEAT_BUG_MANIAC_ROBBY, BugManiacRobbySeenText, BugManiacRobbyBeatenText

	text "Antes solo"
	line "atrapaba #mon"
	cont "bicho por hobby,"

	para "pero ahora es mi"
	line "mayor orgullo."
	done

GenericTrainerLassIris:
	generictrainer LASS, IRIS, EVENT_BEAT_LASS_IRIS, LassIrisSeenText, LassIrisBeatenText

	text "Vengo aquí cada"
	line "día solo para"
	cont "atrapar un"
	cont "Clefairy, pero"

	para "no he visto ni"
	line "uno…"
	done

GenericTrainerHikerMarcos:
	generictrainer HIKER, MARCOS, EVENT_BEAT_HIKER_MARCOS, HikerMarcosSeenText, HikerMarcosBeatenText

	text "Hace mucho tiempo,"
	line "me venció un niño"
	cont "igual que tú."
	done

MountMoon1FRivalMovementBefore:
	step_down
	step_down
	step_down
	step_down
	turn_head_right
	step_end

MountMoon1FPlayerMovement:
	slow_step_up
	turn_head_down
	step_end

MountMoon1FRivalMovementAfter:
	step_right
	turn_head_down
	step_end

MountMoonRivalTextBefore:
	text "…… …… ……"

	para "Ha pasado tiempo,"
	line "<PLAYER>."

	para "…Desde que perdí"
	line "contra ti, pensé"

	para "en lo que le"
	line "faltaba a mi"
	cont "#mon…"

	para "Y encontramos una"
	line "respuesta."

	para "<PLAYER>, ¡ahora te"
	line "lo mostraremos!"
	done

MountMoonRivalTextWin:
	text "…… …… ……"

	para "Pensé que había"
	line "criado a mi"
	cont "#mon para ser"
	cont "lo mejor"
	cont "posible…"

	para "…Pero aún no fue"
	line "suficiente…"
	done

MountMoonRivalTextAfter:
	text "…… …… ……"

	para "…Ganaste, limpia y"
	line "justamente."

	para "Lo admito. Pero"
	line "esto no es el"
	cont "final."

	para "Tras entrenar más"
	line "en la Guarida"
	cont "Dragón…"

	para "Voy a ser el mejor"
	line "entrenador #mon"
	cont "de todos."

	para "Porque estos"
	line "chicos están"
	cont "detrás de mí."

	para "…Escucha,"
	line "<PLAYER>."

	para "Un día de estos"
	line "voy a demostrar"

	para "lo bueno que soy"
	line "venciéndote."
	done

MountMoonRivalTextLoss:
	text "…… …… ……"

	para "He pagado mi deuda"
	line "contigo."

	para "Con mi #mon,"
	line "voy a vencer al"

	para "Campeón y"
	line "convertirme en el"
	cont "mejor entrenador"
	cont "del mundo."
	done

BugManiacKentaSeenText:
	text "Vi a un chico"
	line "pelirrojo"
	cont "entrenando aquí."

	para "¿Has combatido con"
	line "él?"
	done

BugManiacKentaBeatenText:
	text "¡Me venciste!"
	done

LassMiriamSeenText:
	text "Cuando era más"
	line "joven, siempre me"

	para "perdía en este"
	line "lugar."
	done

LassMiriamBeatenText:
	text "¡Oh! ¡Lo perdí!"
	done

SuperNerdJovanSeenText:
	text "¡¿Qué?! ¡No te"
	line "acerques sigiloso!"
	done

SuperNerdJovanBeatenText:
	text "¡Mis #mon no"
	line "sirven!"
	done

BugManiacRobbySeenText:
	text "Tienes que pasar"
	line "por esta cueva"

	para "para llegar a"
	line "Ciudad Celeste."
	done

BugManiacRobbyBeatenText:
	text "Perdí…"
	done

LassIrisSeenText:
	text "¿Has visto un"
	line "Clefairy?"

	para "¡Son tan monos!"
	done

LassIrisBeatenText:
	text "Qué rápido fue"
	line "eso…"
	done

HikerMarcosSeenText:
	text "Niños como tú no"
	line "deberían andar"

	para "vagando por aquí"
	line "en la oscuridad."
	done

HikerMarcosBeatenText:
	text "¡Vaya!"
	line "¡Eres fuerte!"
	done
