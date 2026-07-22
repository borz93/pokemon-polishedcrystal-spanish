UnionCaveB2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, UnionCaveB2FLapras

	def_warp_events
	warp_event  5,  3, UNION_CAVE_B1F_SOUTH, 2

	def_coord_events

	def_bg_events
	bg_event  9,  4, BGEVENT_ITEM + CALCIUM, EVENT_UNION_CAVE_B2F_HIDDEN_CALCIUM
	bg_event  2, 25, BGEVENT_ITEM + ULTRA_BALL, EVENT_UNION_CAVE_B2F_HIDDEN_ULTRA_BALL

	def_object_events
	object_event 11, 31, SPRITE_LAPRAS, SPRITEMOVEDATA_SWIM_AROUND, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnionCaveLapras, EVENT_UNION_CAVE_B2F_LAPRAS
	object_event 15, 19, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainermNick, -1
	object_event  5, 13, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerfGwen, -1
	object_event  3, 30, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainerfEmma, -1
	itemball_event  4, 11, ELIXIR, 1, EVENT_UNION_CAVE_B2F_ELIXIR
	itemball_event 12, 19, HYPER_POTION, 1, EVENT_UNION_CAVE_B2F_HYPER_POTION
	itemball_event 16,  2, LINKING_CORD, 1, EVENT_UNION_CAVE_B2F_LINKING_CORD

	object_const_def
	const UNIONCAVEB2F_LAPRAS

UnionCaveB2FLapras:
	checkflag ENGINE_UNION_CAVE_LAPRAS
	iftruefwd .NoAppear
	readvar VAR_WEEKDAY
	ifequalfwd FRIDAY, .Appear
.NoAppear:
	disappear UNIONCAVEB2F_LAPRAS
	endcallback

.Appear:
	appear UNIONCAVEB2F_LAPRAS
	endcallback

UnionCaveLapras:
	faceplayer
	cry LAPRAS
	loadwildmon LAPRAS, 25
	startbattle
	disappear UNIONCAVEB2F_LAPRAS
	setflag ENGINE_UNION_CAVE_LAPRAS
	reloadmapafterbattle
	end

GenericTrainerCooltrainermNick:
	generictrainer COOLTRAINERM, NICK, EVENT_BEAT_COOLTRAINERM_NICK, CooltrainermNickSeenText, CooltrainermNickBeatenText

	text "Tu estilo #mon"
	line "es deslumbrante y"
	cont "colorido, lo"
	cont "admito."

	para "¡Solo seguirás"
	line "mejorando!"
	done

GenericTrainerCooltrainerfGwen:
	generictrainer COOLTRAINERF, GWEN, EVENT_BEAT_COOLTRAINERF_GWEN, CooltrainerfGwenSeenText, CooltrainerfGwenBeatenText

	text "Voy a entrenar"
	line "sola hasta"
	cont "mejorar."
	done

GenericTrainerCooltrainerfEmma:
	generictrainer COOLTRAINERF, EMMA, EVENT_BEAT_COOLTRAINERF_EMMA, CooltrainerfEmmaSeenText, CooltrainerfEmmaBeatenText

	text "Solo una vez por"
	line "semana, un #mon"
	cont "viene a la orilla"
	cont "del agua."

	para "Quería ver a ese"
	line "#mon…"
	done

CooltrainermNickSeenText:
	text "Hay dos tipos"
	line "de personas."

	para "Los que tienen"
	line "estilo, y los"
	cont "que no."

	para "¿Tú de cuál"
	line "eres?"
	done

CooltrainermNickBeatenText:
	text "¡Tienes un estilo"
	line "deslumbrante!"
	done

CooltrainerfGwenSeenText:
	text "Estoy entrenando."
	line "¿Un combate?"
	done

CooltrainerfGwenBeatenText:
	text "¡Ay, no! Eres"
	line "demasiado buena"
	cont "para mí."
	done

CooltrainerfEmmaSeenText:
	text "Si el #mon que"
	line "me gusta estuviera"
	cont "ahí, iría a"
	cont "cualquier lado."

	para "Eso es lo que"
	line "hace un buen"
	cont "entrenador."
	done

CooltrainerfEmmaBeatenText:
	text "¡Prefiero"
	line "acariciar a mis"
	cont "bebés antes que"
	cont "esto!"
	done
