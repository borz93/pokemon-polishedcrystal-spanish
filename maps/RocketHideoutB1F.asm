RocketHideoutB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, RocketHideoutB1FDoorScript

	def_warp_events
	warp_event 15,  2, ROCKET_HIDEOUT_B2F, 1
	warp_event 13,  2, CELADON_GAME_CORNER, 3
	warp_event 16, 19, ROCKET_HIDEOUT_ELEVATOR, 1
	warp_event 13, 24, ROCKET_HIDEOUT_B2F, 4
	warp_event 17, 19, ROCKET_HIDEOUT_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 13, 15, BGEVENT_ITEM + MAX_REVIVE, EVENT_ROCKET_HIDEOUT_B1F_HIDDEN_MAX_REVIVE

	def_object_events
	object_event 20, 18, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 4, RocketHideoutB1FBlackBeltRylan, -1
	object_event  4,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, RocketHideoutB1FScientistSanders, -1
	object_event 18,  8, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, RocketHideoutB1FPicnickerZane, -1
	object_event 12, 19, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, RocketHideoutB1FBattleGirlSasha, -1
	object_event  7, 23, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, RocketHideoutB1FLassMavis, -1
	itemball_event  1, 17, MOON_STONE, 1, EVENT_ROCKET_HIDEOUT_B1F_MOON_STONE
	itemball_event  3, 14, ZINC, 1, EVENT_ROCKET_HIDEOUT_B1F_ZINC

RocketHideoutB1FDoorScript:
	checkevent EVENT_BEAT_BLACKBELT_RYLAN
	iftruefwd .DoorOpen
	changeblock 16, 16, $06
.DoorOpen
	endcallback

RocketHideoutB1FBlackBeltRylan:
	trainer BLACKBELT_T, RYLAN, EVENT_BEAT_BLACKBELT_RYLAN, .SeenText, .BeatenText, 0, .AfterScript

.Script:
	checkevent EVENT_BEAT_BLACKBELT_RYLAN
	iftruefwd .AfterScript
	jumpthistextfaceplayer

.SeenText:
	text "En Team Valor,"
	line "superamos"
	cont "nuestros límites."

	para "¡Solo importa la"
	line "fuerza!"
	done

.AfterScript
	checkjustbattled
	iffalsefwd .AfterText
	changeblock 16, 16, $0d
	playsound SFX_ENTER_DOOR
	waitsfx
	refreshmap
	special RestartMapMusic
	end

.AfterText
	jumptextfaceplayer .Text
	end

.Text
	text "Tienes agallas…"

	para "Quizá deberías"
	line "unirte a Team"
	cont "Valor."
	done

.BeatenText:
	text "Tu fuerza es"
	line "superior…"
	done

RocketHideoutB1FScientistSanders:
	generictrainer SCIENTIST, SANDERS, EVENT_BEAT_SCIENTIST_SANDERS, .SeenText, .BeatenText

	text "La Líder Blanche"
	line "destaca en"
	cont "estrategia."

	para "Ella decide dónde"
	line "nos apostamos."
	done

.SeenText:
	text "Team Mystic"
	line "valora la"
	cont "estrategia."

	para "Solo una mente"
	line "fuerte podría"
	cont "ganar aquí."
	done

.BeatenText:
	text "Tu táctica es"
	line "impecable!"
	done

RocketHideoutB1FPicnickerZane:
	generictrainer PICNICKER, ZANE, EVENT_BEAT_PICNICKER_ZANE, .SeenText, .BeatenText

	text "Spark estaría"
	line "impresionado."

	para "¡Veamos si puedes"
	line "seguir así!"
	done

.SeenText:
	text "Team Instinct"
	line "confía en el"
	cont "instinto."

	para "¡No hay tiempo"
	line "para pensar, solo"
	cont "para actuar!"
	done

.BeatenText:
	text "Sí que tienes esa"
	line "“chispa”."

	para "¡No la pierdas!"
	done

RocketHideoutB1FBattleGirlSasha:
	generictrainer BATTLE_GIRL, SASHA, EVENT_BEAT_BATTLE_GIRL_SASHA, .SeenText, .BeatenText

	text "La llama de Valor"
	line "arde dentro de ti."

	para "La prueba de"
	line "Candela pondrá a"
	cont "prueba tus"
	cont "límites."
	done

.SeenText:
	text "Team Valor es"
	line "pasión y arriesgar"
	cont "el todo por el"
	cont "todo."

	para "¿Crees que puedes"
	line "igualar mi"
	cont "intensidad?"
	done

.BeatenText:
	text "Tu llama…"
	line "¡Demasiado"
	cont "brillante!"
	done

RocketHideoutB1FLassMavis:
	generictrainer LASS, MAVIS, EVENT_BEAT_LASS_MAVIS, .SeenText, .BeatenText

	text "Los combates de"
	line "Spark son"
	cont "impredecibles."

	para "¡Por eso yo"
	line "también innovo!"
	done

.SeenText:
	text "¿Mi estrategia?"

	para "¡Puro instinto y"
	line "nada más!"
	done

.BeatenText:
	text "Supongo que tu"
	line "instinto es mejor"
	cont "que el mío."
	done
