ViridianGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6, 43, VIRIDIAN_CITY, 1
	warp_event  7, 43, VIRIDIAN_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  4, 41, BGEVENT_READ, ViridianGymStatue
	bg_event  9, 41, BGEVENT_READ, ViridianGymStatue

	def_object_events
	object_event  7,  2, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  8, 41, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuyScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 33, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoAraandbela1, -1
	object_event  6, 33, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoAraandbela2, -1
	object_event  3, 32, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerfSalma, -1
	object_event  3, 18, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerfBonita, -1
	object_event  6,  8, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoElanandida1, -1
	object_event  7,  8, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoElanandida2, -1

ViridianGymBlueScript:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftruefwd .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	setevent EVENT_BEAT_ACE_DUO_ARA_AND_BELA
	setevent EVENT_BEAT_COOLTRAINERF_SALMA
	setevent EVENT_BEAT_COOLTRAINERF_BONITA
	setevent EVENT_BEAT_ACE_DUO_ELAN_AND_IDA
	opentext
	givebadge EARTHBADGE, KANTO_REGION
	setevent EVENT_FINAL_BATTLE_WITH_LYRA
.FightDone:
	checkevent EVENT_GOT_TM71_STONE_EDGE
	iftrue_jumpopenedtext LeaderBlueEpilogueText
	writetext LeaderBlueAfterText
	promptbutton
	verbosegivetmhm TM_STONE_EDGE
	setevent EVENT_GOT_TM71_STONE_EDGE
	jumpthisopenedtext

	text "Contiene Roca"
	line "Afilada. No solo"

	para "sirve para #mon"
	line "de tipo Roca,"
	cont "¿Entendido?"

	para "…"

	para "Está bien, me"
	line "equivoqué. Eres"

	para "de verdad. Eres"
	line "un buen"
	cont "entrenador."

	para "Con ocho Medallas"
	line "de Kanto, puedes"

	para "retar al Alto"
	line "Mando de nuevo."

	para "No se lo pondrán"
	line "fácil a un"
	cont "entrenador que"
	cont "venció dos"
	cont "regiones."

	para "Puedes practicar"
	line "conmigo en el"

	para "Dojo de Lucha en"
	line "Ciudad Azafrán"
	cont "los lunes."

	para "Todos los Líderes"
	line "de Gimnasio van"
	cont "allí a entrenar."

	para "Algún día te"
	line "venceré."

	para "¡No lo olvides!"
	done

ViridianGymGuyScript:
	checkevent EVENT_BEAT_BLUE
	iftrue_jumptextfaceplayer ViridianGymGuyWinText
	jumpthistextfaceplayer

	text "¡Eh, futuro"
	line "Campeón!"

	para "¿Qué tal? Parece"
	line "que estás en"
	cont "racha."

	para "El Líder de"
	line "Gimnasio es un"

	para "tipo que combatió"
	line "contra el Campeón"
	cont "hace tres años."

	para "No es fácil de"
	line "vencer."

	para "¡Da todo lo que"
	line "tengas!"
	done

GenericTrainerAceDuoAraandbela1:
	generictrainer ACE_DUO, ARAANDBELA1, EVENT_BEAT_ACE_DUO_ARA_AND_BELA, AceDuoAraandbela1SeenText, AceDuoAraandbela1BeatenText

	text "Ara: Yo debería"
	line "ser una buena"
	cont "compañera de"
	cont "práctica…"
	done

GenericTrainerAceDuoAraandbela2:
	generictrainer ACE_DUO, ARAANDBELA2, EVENT_BEAT_ACE_DUO_ARA_AND_BELA, AceDuoAraandbela2SeenText, AceDuoAraandbela2BeatenText

	text "Bela: Nuestros"
	line "combates de"
	cont "práctica no nos"
	cont "prepararon para"
	cont "esto."
	done

GenericTrainerCooltrainerfSalma:
	generictrainer COOLTRAINERF, SALMA, EVENT_BEAT_COOLTRAINERF_SALMA, CooltrainerfSalmaSeenText, CooltrainerfSalmaBeatenText

	text "Hay muchos"
	line "Gimnasios en el"
	cont "mundo,"

	para "¡pero este me"
	line "encanta de"
	cont "verdad!"
	done

GenericTrainerCooltrainerfBonita:
	generictrainer COOLTRAINERF, BONITA, EVENT_BEAT_COOLTRAINERF_BONITA, CooltrainerfBonitaSeenText, CooltrainerfBonitaBeatenText

	text "Parece que aún te"
	line "queda algo de"
	cont "energía."
	done

GenericTrainerAceDuoElanandida1:
	generictrainer ACE_DUO, ELANANDIDA1, EVENT_BEAT_ACE_DUO_ELAN_AND_IDA, AceDuoElanandida1SeenText, AceDuoElanandida1BeatenText

	text "Elan: ¡Eres más"
	line "fuerte de lo que"
	cont "esperábamos!"
	done

GenericTrainerAceDuoElanandida2:
	generictrainer ACE_DUO, ELANANDIDA2, EVENT_BEAT_ACE_DUO_ELAN_AND_IDA, AceDuoElanandida2SeenText, AceDuoElanandida2BeatenText

	text "Ida: Si solo"
	line "tienes fuerza,"
	cont "no te irá bien."

	para "¡La estrategia"
	line "también es"
	cont "importante!"
	done

ViridianGymStatue:
	gettrainername BLUE, 1, STRING_BUFFER_4
	checkflag ENGINE_EARTHBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

LeaderBlueBeforeText:
	text "Blue: ¡Eh! Por fin"
	line "llegaste, ¿Eh?"

	para "No tenía ganas en"
	line "Isla Canela,"

	para "pero ahora estoy"
	line "listo para"
	cont "combatir."

	para "…"

	para "¿Me dices que"
	line "conquistaste todos"
	cont "los Gimnasios de"
	cont "Johto?"

	para "¡Já! Los Gimnasios"
	line "de Johto deben ser"
	cont "bastante"
	cont "patéticos."

	para "Oye, no te"
	line "preocupes."

	para "Sabré si eres"
	line "bueno o no"

	para "combatiendo"
	line "contigo ahora"
	cont "mismo."

	para "¿Listo, Campeón"
	line "de Johto?"
	done

LeaderBlueWinText:
	text "Blue: ¿Qué?"

	para "¿Cómo diablos"
	line "perdí contigo?"

	para "…"

	para "Tch, está bien…"
	line "Toma esto,"

	para "es la Medalla"
	line "Tierra."
	done

LeaderBlueAfterText:
	text "Blue: ¡Toma! ¡Toma"
	line "esto también!"
	done


LeaderBlueEpilogueText:
	text "Blue: Escucha,"
	line "tú."

	para "Más te vale no"
	line "perder hasta que"
	cont "te venza. ¿Vale?"
	done


ViridianGymGuyWinText:
	text "Vaya, eres de"
	line "verdad duro…"

	para "Ese fue un combate"
	line "de lo más"

	para "inspirador. Se me"
	line "saltaron las"
	cont "lágrimas."
	done

AceDuoAraandbela1SeenText:
	text "Ara: ¡Vamos,"
	line "lucha contra"
	cont "nosotras y verás"
	cont "lo buenas que"
	cont "somos!"
	done

AceDuoAraandbela1BeatenText:
	text "Ara: ¡Nos"
	line "engañaron!"
	done

AceDuoAraandbela2SeenText:
	text "Bela: ¡Vamos,"
	line "lucha contra"
	cont "nosotras y verás"
	cont "lo buenas que"
	cont "somos!"
	done

AceDuoAraandbela2BeatenText:
	text "Bela: ¡Nos"
	line "engañaron!"
	done

CooltrainerfSalmaSeenText:
	text "¿Qué te parece?"

	para "Nunca habías visto"
	line "un Gimnasio tan"
	cont "maravilloso,"
	cont "¿Verdad?"
	done

CooltrainerfSalmaBeatenText:
	text "¡Lo que sea!"
	done

CooltrainerfBonitaSeenText:
	text "Al mirar por la"
	line "sala, ¿No te da"
	cont "mareo?"
	done

CooltrainerfBonitaBeatenText:
	text "Todos mis #mon…"

	para "Todos mareados y"
	line "desmayados…"
	done

AceDuoElanandida1SeenText:
	text "Elan: Muy bien,"
	line "¡que empiece la"
	cont "lucha!"
	done

AceDuoElanandida1BeatenText:
	text "Elan: Vaya, esto"
	line "es sorprendente."
	done

AceDuoElanandida2SeenText:
	text "Ida: ¡Soy Ida!"
	line "¡Junto a mí está"
	cont "Elan!"

	para "¡Juntos somos un"
	line "Dúo Élite!"
	done

AceDuoElanandida2BeatenText:
	text "Ida: Vaya. Eres"
	line "realmente bueno."
	done
