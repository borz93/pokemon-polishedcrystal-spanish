MahoganyGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	def_object_events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderRonald, -1
	object_event  9, 17, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSkierClarissa, -1
	object_event  5,  9, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_BOARDER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuyScript, -1

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftruefwd .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	givebadge GLACIERBADGE, JOHTO_REGION
	; Begin Team Rocket takeover of Radio Tower
	setflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_CIVILIANS
	setevent EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	clearevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	clearevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	specialphonecall SPECIALCALL_WEIRDBROADCAST
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	setmapscene MAHOGANY_TOWN, SCENE_MAHOGANYTOWN_NOOP
.FightDone:
	checkevent EVENT_GOT_TM67_AVALANCHE
	iftrue_jumpopenedtext PryceText_CherishYourPokemon
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	promptbutton
	verbosegivetmhm TM_AVALANCHE
	setevent EVENT_GOT_TM67_AVALANCHE
	jumpthisopenedtext

	text "Esa MT contiene"
	line "Avalancha."

	para "Hace más daño si"
	line "el usuario fue"
	cont "herido antes."

	para "Demuestra la"
	line "dureza del"
	cont "invierno."
	done

GenericTrainerSkierRoxanne:
	generictrainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText

	text "Si no esquías con"
	line "precisión,"

	para "no llegarás lejos"
	line "en este Gimnasio."
	done

GenericTrainerSkierClarissa:
	generictrainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText

	text "No debí"
	line "presumir de mi"
	cont "esquí…"
	done

GenericTrainerBoarderRonald:
	generictrainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText

	text "Creo que hay un"
	line "movimiento que un"

	para "#mon puede usar"
	line "mientras está"
	cont "congelado."
	done

GenericTrainerBoarderBrad:
	generictrainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText

	text "Este Gimnasio es"
	line "genial. ¡Me"
	cont "encanta el"
	cont "snowboard con mi"
	cont "#mon!"
	done

GenericTrainerBoarderDouglas:
	generictrainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText

	text "El secreto detrás"
	line "del poder de"
	cont "Pryce…"

	para "Medita bajo una"
	line "cascada a diario"

	para "para fortalecer su"
	line "mente y cuerpo."
	done

MahoganyGymGuyScript:
	checkevent EVENT_BEAT_PRYCE
	iftrue_jumptextfaceplayer MahoganyGymGuyWinText
	jumpthistextfaceplayer

	text "Pryce es un"
	line "veterano que ha"
	cont "entrenado #mon"
	cont "durante 50 años."

	para "Dicen que se le da"
	line "bien congelar a"

	para "sus rivales con"
	line "movimientos de"
	cont "tipo Hielo."

	para "Eso significa que"
	line "deberías"

	para "¡derretirlo con tu"
	line "ambición ardiente!"
	done

MahoganyGymStatue:
	gettrainername PRYCE, 1, STRING_BUFFER_4
	checkflag ENGINE_GLACIERBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 14, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

PryceText_Intro:
	text "Los #mon tienen"
	line "muchas"
	cont "experiencias en"
	cont "sus vidas, igual"
	cont "que nosotros."

	para "Yo también he"
	line "visto y sufrido"
	cont "mucho en mi vida."

	para "Como soy tu mayor,"
	line "deja que te"
	cont "muestre a qué me"
	cont "refiero."

	para "He estado con"
	line "#mon desde"

	para "antes de que"
	line "nacieras."

	para "No pierdo"
	line "fácilmente."

	para "Yo, Pryce, el"
	line "entrenador del"
	cont "invierno,"

	para "¡demostraré mi"
	line "poder!"
	done

PryceText_Impressed:
	text "Ah, me impresiona"
	line "tu destreza."

	para "Con tu fuerte"
	line "voluntad, sé que"

	para "superarás todos"
	line "los obstáculos de"
	cont "la vida."

	para "¡Eres digno de"
	line "esta Medalla!"
	done

PryceText_GlacierBadgeSpeech:
	text "Esa Medalla dejará"
	line "que tus #mon"

	para "usen Remolino"
	line "para cruzar"
	cont "torbellinos."

	para "Y esto… ¡Esto es"
	line "un regalo mío!"
	done

PryceText_CherishYourPokemon:
	text "Cuando el hielo y"
	line "la nieve se"
	cont "derriten, llega"
	cont "la primavera."

	para "Tú y tus #mon"
	line "estaréis juntos"

	para "durante muchos"
	line "años más."

	para "¡Aprecia el tiempo"
	line "que pasáis juntos!"
	done

BoarderRonaldSeenText:
	text "Congelaré a tus"
	line "#mon, ¡así no"
	cont "podrás hacer nada!"
	done

BoarderRonaldBeatenText:
	text "Vaya. No pude"
	line "hacer nada."
	done

BoarderBradSeenText:
	text "Este Gimnasio"
	line "tiene un suelo"
	cont "resbaladizo."

	para "Es divertido,"
	line "¿Verdad?"

	para "Pero oye, ¡no"
	line "estamos jugando"
	cont "aquí!"
	done

BoarderBradBeatenText:
	text "¿Ves lo en serio"
	line "que vamos?"
	done

BoarderDouglasSeenText:
	text "Conozco el secreto"
	line "de Pryce."
	done

BoarderDouglasBeatenText:
	text "Vale. Te contaré"
	line "el secreto de"
	cont "Pryce."
	done

SkierRoxanneSeenText:
	text "Para llegar a"
	line "Pryce, nuestro"
	cont "Líder de Gimnasio,"

	para "tienes que pensar"
	line "antes de esquiar."
	done

SkierRoxanneBeatenText:
	text "¡No perdería"
	line "contra ti"
	cont "esquiando!"
	done

SkierClarissaSeenText:
	text "¡Mira mi giro"
	line "paralelo!"
	done

SkierClarissaBeatenText:
	text "¡No! ¡Me hiciste"
	line "caer!"
	done


MahoganyGymGuyWinText:
	text "Pryce es algo,"
	line "¡pero tú eres otra"
	cont "cosa!"

	para "¡Ese fue un"
	line "combate candente"

	para "que unió la brecha"
	line "generacional!"
	done
