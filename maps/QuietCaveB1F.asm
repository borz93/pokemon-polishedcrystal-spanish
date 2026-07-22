QuietCaveB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5, 25, QUIET_CAVE_1F, 2
	warp_event 29, 23, QUIET_CAVE_1F, 3
	warp_event 19, 11, QUIET_CAVE_1F, 4
	warp_event  3, 15, QUIET_CAVE_1F, 5
	warp_event 31, 15, QUIET_CAVE_1F, 6
	warp_event 21,  3, QUIET_CAVE_B2F, 1
	warp_event 17, 25, QUIET_CAVE_B2F, 2
	warp_event 23, 33, QUIET_CAVE_B2F, 3
	warp_event 32,  2, QUIET_CAVE_B2F, 4

	def_coord_events

	def_bg_events
	bg_event 26, 33, BGEVENT_ITEM + HYPER_POTION, EVENT_QUIET_CAVE_B1F_HIDDEN_HYPER_POTION

	def_object_events
	object_event  6, 20, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, QuietCaveB1FNurseKeikoScript, -1
	object_event 25,  4, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBattleGirlKagami, -1
	object_event 21, 17, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPokemaniacAidan, -1
	object_event 33, 30, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerHikerSteve, -1
	object_event  4,  7, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPsychicVirgil, -1
	itemball_event  8,  3, BIG_PEARL, 1, EVENT_QUIET_CAVE_B1F_BIG_PEARL
	itemball_event 14, 13, ELIXIR, 1, EVENT_QUIET_CAVE_B1F_ELIXIR

	object_const_def
	const QUIETCAVEB1F_NURSE

QuietCaveB1FNurseKeikoScript:
	faceplayer
	checkevent EVENT_BEAT_NURSE_KEIKO
	iftruefwd .Beaten
	showtext .SeenText
	winlosstext .BeatenText, 0
	setlasttalked QUIETCAVEB1F_NURSE
	loadtrainer NURSE, KEIKO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_NURSE_KEIKO
.Beaten
	showtext .AfterText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	jumpthistext

	text "¡Mira qué"
	line "enérgicos están"
	cont "tus #mon!"
	done

.SeenText:
	text "¿Necesitas la"
	line "ayuda de una"
	cont "enfermera?"

	para "Claro, si me"
	line "ganas, ¡te curo!"
	done

.BeatenText:
	text "¿De verdad"
	line "necesitas curarte?"
	done

.AfterText:
	text "Vale… Hora de"
	line "darle energía a"
	cont "tus #mon!"
	done

GenericTrainerBattleGirlKagami:
	generictrainer BATTLE_GIRL, KAGAMI, EVENT_BEAT_BATTLE_GIRL_KAGAMI, BattleGirlKagamiSeenText, BattleGirlKagamiBeatenText

	text "Vengo aquí a"
	line "entrenar en paz"
	cont "y soledad."
	done

GenericTrainerPokemaniacAidan:
	generictrainer POKEMANIAC, AIDAN, EVENT_BEAT_POKEMANIAC_AIDAN, PokemaniacAidanSeenText, PokemaniacAidanBeatenText

	text "A veces un #mon"
	line "de cierta zona"

	para "conoce un"
	line "movimiento raro."
	done

GenericTrainerHikerSteve:
	generictrainer HIKER, STEVE, EVENT_BEAT_HIKER_STEVE, HikerSteveSeenText, HikerSteveBeatenText

	text "Espeleología es"
	line "explorar cuevas."

	para "¡Eso es lo que"
	line "significa!"
	done

GenericTrainerPsychicVirgil:
	generictrainer PSYCHIC_T, VIRGIL, EVENT_BEAT_PSYCHIC_VIRGIL, PsychicVirgilSeenText, PsychicVirgilBeatenText

	text "El silencio ayuda"
	line "a enfocar mi PES."
	done

BattleGirlKagamiSeenText:
	text "¡No molestes mi"
	line "entrenamiento!"
	done

BattleGirlKagamiBeatenText:
	text "No fue"
	line "suficiente…"
	done

PokemaniacAidanSeenText:
	text "¡Mis #mon!"

	para "¡Deja que te los"
	line "muestre!"
	done

PokemaniacAidanBeatenText: ; text > text
	text "Mis #mon…"
	done

HikerSteveSeenText:
	text "Me llaman"
	line "Montañero, pero"
	cont "ahora soy"
	cont "espeleólogo!"
	done

HikerSteveBeatenText:
	text "Y ahora soy un"
	line "perdedor…"
	done

PsychicVirgilSeenText:
	text "¡Shh! ¡Silencio!"
	done

PsychicVirgilBeatenText:
	text "¿Por qué combatir"
	line "es tan ruidoso?"
	done
