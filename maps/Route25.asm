Route25_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 30,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainermKevin, EVENT_ROUTE_25_COOLTRAINER_M_BEFORE
	object_event 32,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CooltrainermKevinAfterBattleText, EVENT_ROUTE_25_COOLTRAINER_M_AFTER
	object_event  7,  9, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboyDudley, -1
	object_event 11,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerLassEllen, -1
	object_event 14,  8, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSchoolboyJoe, -1
	object_event 12,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerLassLaura, -1
	object_event 18,  7, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperLloyd, -1
	object_event 22,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerLassShannon, -1
	object_event 25,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSupernerdPat, -1
	itemball_event 25,  2, PROTEIN, 1, EVENT_ROUTE_25_PROTEIN
	cuttree_event 28,  4, EVENT_ROUTE_25_CUT_TREE
	object_event 20,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route25MewYoungsterText, -1
	object_event 21,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, Route25SlowpokeScript, -1

	object_const_def
	const ROUTE25_COOLTRAINERM_BEFORE
	const ROUTE25_COOLTRAINERM_AFTER

GenericTrainerSchoolboyDudley:
	generictrainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText

	text "Di lo mejor de"
	line "mí. No me"
	cont "arrepiento."
	done

GenericTrainerLassEllen:
	generictrainer LASS, ELLEN, EVENT_BEAT_LASS_ELLEN, LassEllenSeenText, LassEllenBeatenText

	text "Di lo mejor de"
	line "mí. No me"
	cont "arrepiento."
	done

GenericTrainerSchoolboyJoe:
	generictrainer SCHOOLBOY, JOE, EVENT_BEAT_SCHOOLBOY_JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText

	text "Di lo mejor de"
	line "mí. No me"
	cont "arrepiento."
	done

GenericTrainerLassLaura:
	generictrainer LASS, LAURA, EVENT_BEAT_LASS_LAURA, LassLauraSeenText, LassLauraBeatenText

	text "Di lo mejor de"
	line "mí. No me"
	cont "arrepiento."
	done

GenericTrainerCamperLloyd:
	generictrainer CAMPER, LLOYD, EVENT_BEAT_CAMPER_LLOYD, CamperLloydSeenText, CamperLloydBeatenText

	text "Di lo mejor de"
	line "mí. No me"
	cont "arrepiento."
	done

GenericTrainerLassShannon:
	generictrainer LASS, SHANNON, EVENT_BEAT_LASS_SHANNON, LassShannonSeenText, LassShannonBeatenText

	text "Di lo mejor de"
	line "mí. No me"
	cont "arrepiento."
	done

GenericTrainerSupernerdPat:
	generictrainer SUPER_NERD, PAT, EVENT_BEAT_SUPER_NERD_PAT, SupernerdPatSeenText, SupernerdPatBeatenText

	text "Lo siento… No"
	line "haré más trampa…"
	done

Route25SlowpokeScript:
	opentext
	writetext Route25SlowpokeText1
	pause 60
	writetext Route25SlowpokeText2
	cry SLOWPOKE
	waitendtext

TrainerCooltrainermKevin:
	checkevent EVENT_BEAT_SUPER_NERD_PAT
	iffalse_jumptextfaceplayer NuggetBridgeNotClearedText
	faceplayer
	opentext
	checkevent EVENT_CLEARED_NUGGET_BRIDGE
	iftruefwd .AfterNuggetBridge
	writetext CooltrainermKevinNuggetText
	promptbutton
	verbosegiveitem NUGGET
	iffalse_endtext
	setevent EVENT_CLEARED_NUGGET_BRIDGE
.AfterNuggetBridge:
	writetext CooltrainermKevinSeenText
	waitbutton
	closetext
	follow ROUTE25_COOLTRAINERM_BEFORE, PLAYER
	applymovement ROUTE25_COOLTRAINERM_BEFORE, Route25CooltrainerMovementData
	stopfollow
	turnobject ROUTE25_COOLTRAINERM_BEFORE, LEFT
	winlosstext CooltrainermKevinBeatenText, 0
	loadtrainer COOLTRAINERM, KEVIN
	startbattle
	disappear ROUTE25_COOLTRAINERM_BEFORE
	appear ROUTE25_COOLTRAINERM_AFTER
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_KEVIN
	jumptext CooltrainermKevinAfterBattleText

Route25CooltrainerMovementData:
	step_right
	step_right
	step_end

SchoolboyDudleySeenText:
	text "¡Vence a los seis"
	line "entrenadores para"
	cont "ganar un premio"
	cont "fabuloso!"

	para "¿Crees que tienes"
	line "lo necesario?"
	done

SchoolboyDudleyBeatenText:
	text "¡Uh! Qué bueno."
	done

LassEllenSeenText:
	text "Soy la segunda."
	line "¡Ahora va en"
	cont "serio!"
	done

LassEllenBeatenText:
	text "¿Cómo pude"
	line "perder?"
	done

SchoolboyJoeSeenText:
	text "¡Aquí está el"
	line "número 3!"
	cont "No seré fácil."
	done

SchoolboyJoeBeatenText:
	text "¡Ay! Aplastado."
	done

LassLauraSeenText:
	text "¡Soy la número 4!"
	line "¿Ya te cansaste?"
	done

LassLauraBeatenText:
	text "Yo también"
	line "perdí…"
	done

CamperLloydSeenText:
	text "¡Vale! Soy el"
	line "número 5."
	cont "¡Te aplastaré!"
	done

CamperLloydBeatenText:
	text "¡Vaya! Demasiado."
	done

LassShannonSeenText:
	text "¡Soy la última de"
	line "la fila, pero te"
	cont "digo que soy"
	cont "dura!"
	done

LassShannonBeatenText:
	text "Estás de broma."
	done

SupernerdPatSeenText:
	text "Mufufufu…"

	para "No tengo nada que"
	line "ver con los seis"
	cont "entrenadores."

	para "Esperé aquí para"
	line "vencerte cuando"

	para "estuvieras"
	line "agotado por todos"
	cont "esos combates."
	done

SupernerdPatBeatenText:
	text "¿No estás nada"
	line "cansado?"
	done

Route25MewYoungsterText:
	text "¡Una vez vi un Mew"
	line "por aquí!"

	para "¿No me crees?"
	line "¡Slowpoke también"
	cont "lo vio!"
	done

Route25SlowpokeText1:
	text "Slowpoke: …"

	para "…… …… ……"
	done

Route25SlowpokeText2:
	text "…… ……¿Bostezo?"
	done

CooltrainermKevinNuggetText:
	text "Aceptaste un"
	line "combate más de lo"

	para "que esperabas,"
	line "pero aun así"
	cont "ganaste."

	para "Como prometí,"
	line "ganas un premio."
	done

CooltrainermKevinSeenText:
	text "Pero tras ver"
	line "cómo combates,"

	para "quiero ver cómo"
	line "me irá a mí."

	para "¿Qué tal? Deja que"
	line "te desafíe."
	done

CooltrainermKevinBeatenText:
	text "¡Nunca había"
	line "tenido un combate"
	cont "tan bueno!"
	done

CooltrainermKevinAfterBattleText:
	text "¡Ese fue un gran"
	line "combate!"

	para "¡Tú y tus #mon"
	line "sois realmente"
	cont "sobresalientes!"
	done

NuggetBridgeNotClearedText:
	text "¡Oye!"

	para "Seis entrenadores"
	line "y yo organizamos"

	para "un desafío de"
	line "combates en esta"
	cont "ruta."

	para "¡No puedes"
	line "saltártelos!"

	para "Hay un atajo justo"
	line "debajo de"
	cont "nosotros de vuelta"
	cont "a la Ruta 24."
	done
