SaffronGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  8, 17, SAFFRON_CITY, 2
	warp_event  9, 17, SAFFRON_CITY, 2
	warp_event 11, 14, SAFFRON_GYM, 18
	warp_event 19, 14, SAFFRON_GYM, 19
	warp_event 19, 10, SAFFRON_GYM, 20
	warp_event  0, 10, SAFFRON_GYM, 21
	warp_event  4,  2, SAFFRON_GYM, 22
	warp_event 11,  4, SAFFRON_GYM, 23
	warp_event  0, 14, SAFFRON_GYM, 24
	warp_event 19,  2, SAFFRON_GYM, 25
	warp_event 15, 16, SAFFRON_GYM, 26
	warp_event  4, 16, SAFFRON_GYM, 27
	warp_event  4,  8, SAFFRON_GYM, 28
	warp_event  8,  2, SAFFRON_GYM, 29
	warp_event 15,  8, SAFFRON_GYM, 30
	warp_event 15,  4, SAFFRON_GYM, 31
	warp_event  0,  4, SAFFRON_GYM, 32
	warp_event 19, 16, SAFFRON_GYM, 3
	warp_event 19,  8, SAFFRON_GYM, 4
	warp_event  0,  8, SAFFRON_GYM, 5
	warp_event  4,  4, SAFFRON_GYM, 6
	warp_event 11,  2, SAFFRON_GYM, 7
	warp_event  0, 16, SAFFRON_GYM, 8
	warp_event 19,  4, SAFFRON_GYM, 9
	warp_event 15, 14, SAFFRON_GYM, 10
	warp_event  4, 14, SAFFRON_GYM, 11
	warp_event  4, 10, SAFFRON_GYM, 12
	warp_event  8,  4, SAFFRON_GYM, 13
	warp_event 15, 10, SAFFRON_GYM, 14
	warp_event 15,  2, SAFFRON_GYM, 15
	warp_event  0,  2, SAFFRON_GYM, 16
	warp_event 11, 10, SAFFRON_GYM, 17
	warp_event  8, 10, SAFFRON_GYM, 3

	def_coord_events

	def_bg_events
	bg_event  8, 15, BGEVENT_READ, SaffronGymStatue

	def_object_events
	object_event  9,  8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronGymSabrinaScript, -1
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerMediumDoris, -1
	object_event  9,  3, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicLeon, -1
	object_event 17,  3, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicJared, -1
	object_event  2,  9, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHexManiacLuna, -1
	object_event 17,  9, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHexManiacNatalie, -1
	object_event  2, 15, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicFranklin, -1
	object_event 17, 15, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerMediumRebecca, -1
	object_event  9, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymGuyScript, -1

SaffronGymSabrinaScript:
	faceplayer
	opentext
	checkflag ENGINE_SOULBADGE
	iftruefwd .FightDone
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaWinLossText, 0
	loadtrainer SABRINA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_PSYCHIC_LEON
	setevent EVENT_BEAT_PSYCHIC_JARED
	setevent EVENT_BEAT_HEX_MANIAC_LUNA
	setevent EVENT_BEAT_HEX_MANIAC_NATALIE
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_MEDIUM_REBECCA
	opentext
	givebadge SOULBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM29_PSYCHIC
	iftrue_jumpopenedtext SabrinaFightDoneText
	writetext SabrinaMarshBadgeText
	promptbutton
	verbosegivetmhm TM_PSYCHIC
	setevent EVENT_GOT_TM29_PSYCHIC
	jumpthisopenedtext

	text "La MT29 es"
	line "Psíquico."

	para "Puede reducir el"
	line "Def.Esp. del"
	cont "objetivo."

	para "¡Te convertirás en"
	line "un Campeón"
	cont "célebre y"
	cont "querido!"
	done

GenericTrainerMediumDoris:
	generictrainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText

	text "¡Rayos! Olvidé que"
	line "predije que"
	cont "perdería contra"
	cont "ti."
	done

GenericTrainerPsychicLeon:
	generictrainer PSYCHIC_T, LEON, EVENT_BEAT_PSYCHIC_LEON, PsychicLeonSeenText, PsychicLeonBeatenText

	text "¡El poder de"
	line "Sabrina es mayor"
	cont "que el mío!"
	done

GenericTrainerPsychicJared:
	generictrainer PSYCHIC_T, JARED, EVENT_BEAT_PSYCHIC_JARED, PsychicJaredSeenText, PsychicJaredBeatenText

	text "El Rey del Karate,"
	line "maestro del Dojo"

	para "de Lucha, fue"
	line "destruido por"
	cont "Sabrina."
	done

GenericTrainerHexManiacLuna:
	generictrainer HEX_MANIAC, LUNA, EVENT_BEAT_HEX_MANIAC_LUNA, HexManiacLunaSeenText, HexManiacLunaBeatenText

	text "Alakazam es un"
	line "#mon poderoso,"

	para "así que las"
	line "Brujas usan su"
	cont "nombre para"
	cont "hechizos"
	cont "poderosos."
	done

GenericTrainerHexManiacNatalie:
	generictrainer HEX_MANIAC, NATALIE, EVENT_BEAT_HEX_MANIAC_NATALIE, HexManiacNatalieSeenText, HexManiacNatalieBeatenText

	text "Quizá no esté"
	line "hecha para ser"
	cont "Bruja…"
	done

GenericTrainerPsychicFranklin:
	generictrainer PSYCHIC_T, FRANKLIN, EVENT_BEAT_PSYCHIC_FRANKLIN, PsychicFranklinSeenText, PsychicFranklinBeatenText

	text "Fortaleciste tu"
	line "alma, no solo tus"
	cont "habilidades."
	done

GenericTrainerMediumRebecca:
	generictrainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText

	text "¿Cuál es la fuente"
	line "de tu poder?"
	done

SaffronGymGuyScript:
	checkevent EVENT_BEAT_SABRINA
	iftrue_jumptextfaceplayer SaffronGymGuyWinText
	jumpthistextfaceplayer

	text "¡Eh! ¡Futuro"
	line "Campeón!"

	para "Un entrenador tan"
	line "hábil como tú no"

	para "necesita que le"
	line "digan cómo tratar"

	para "con #mon de"
	line "tipo Psíquico,"
	cont "¿Verdad?"

	para "¡Espero grandes"
	line "cosas de ti!"

	para "¡Buena suerte!"
	done

SaffronGymStatue:
	gettrainername SABRINA, 1, STRING_BUFFER_4
	checkflag ENGINE_SOULBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

SabrinaIntroText:
	text "Sabrina: Sabía"
	line "que vendrías…"

	para "Hace tres años"
	line "tuve una visión"
	cont "de tu llegada."

	para "Vienes por mi"
	line "Medalla."

	para "No disfruto"
	line "combatiendo, pero"

	para "es mi deber como"
	line "Líder conceder"

	para "Medallas a quien"
	line "haya demostrado"
	cont "ser digno."

	para "Ya que lo deseas,"
	line "¡te mostraré mis"
	cont "poderes"
	cont "psíquicos!"
	done

SabrinaWinLossText:
	text "Sabrina: Tu"
	line "poder…"

	para "Supera con creces"
	line "lo que preví…"

	para "Quizá no sea"
	line "posible predecir"

	para "por completo lo"
	line "que depara el"
	cont "futuro…"

	para "Vale, ganas. Te"
	line "has ganado"
if DEF(FAITHFUL)
	cont "la Medalla"
	cont "Pantano."
else
	cont "la Medalla Alma."
endc
	done

SabrinaMarshBadgeText:
	text "Sabrina: No logré"
	line "predecir con"

	para "precisión tu"
	line "poder. Eso"

	para "significa que tu"
	line "poder está más"

	para "allá de mi"
	line "habilidad"
	cont "psíquica."

	para "¡Mereces esta MT"
	line "también!"
	done

SabrinaFightDoneText:
	text "Sabrina: Tu amor"
	line "por tus #mon"

	para "abrumó mi poder"
	line "psíquico…"

	para "El poder del amor,"
	line "creo, también es"

	para "un tipo de poder"
	line "psíquico…"
	done

MediumDorisSeenText:
	text "Fufufufu…"
	line "Lo veo claramente."

	para "¡Puedo ver dentro"
	line "de tu alma!"
	done

MediumDorisBeatenText:
	text "Aunque te leí, aun"
	line "así perdí…"
	done

PsychicLeonSeenText:
	text "¡No puedes"
	line "resistir mi poder"
	cont "psíquico!"
	done

PsychicLeonBeatenText:
	text "Mi predicción fue"
	line "incorrecta…"
	done

PsychicJaredSeenText:
	text "El Dojo de Lucha"
	line "de al lado fue una"
	cont "vez el Gimnasio de"
	cont "esta ciudad."
	done

PsychicJaredBeatenText:
	text "No fui rival…"
	done

HexManiacLunaSeenText:
	text "¡Abra, Kadabra,"
	line "Alakazam!"
	done

HexManiacLunaBeatenText:
	text "¿Mi maldición"
	line "falló?"
	done

HexManiacNatalieSeenText:
	text "¡Combatamos!"
	line "¡Mwahaha!"
	done

HexManiacNatalieBeatenText:
	text "Mwaha… ¡Cof!"
	done

PsychicFranklinSeenText:
	text "El poder psíquico"
	line "es el poder de tu"
	cont "alma."
	done

PsychicFranklinBeatenText:
	text "¡Tu alma tiene más"
	line "poder que la mía!"
	done

MediumRebeccaSeenText:
	text "¡El poder de"
	line "todos a quienes"
	cont "venciste llega a"
	cont "mí!"
	done

MediumRebeccaBeatenText:
	text "Fuerte…"
	line "Demasiado"
	cont "fuerte…"
	done


SaffronGymGuyWinText:
	text "¡Ese fue otro"
	line "combate"
	cont "fantástico!"
	done
