PewterGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	def_object_events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  2,  7, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperJerry, -1
	object_event  7,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerEdwin, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuyScript, -1

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftruefwd .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	setevent EVENT_BEAT_HIKER_EDWIN
	opentext
	givebadge BOULDERBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM48_ROCK_SLIDE
	iftrue_jumpopenedtext BrockFightDoneText
	writetext BrockBoulderBadgeText
	promptbutton
	verbosegivetmhm TM_ROCK_SLIDE
	setevent EVENT_GOT_TM48_ROCK_SLIDE
	jumpthisopenedtext

	text "A veces puede"
	line "hacer que tu"
	cont "rival retroceda."
	done

GenericTrainerCamperJerry:
	generictrainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText

	text "¡Oye, tú!"
	line "¡Entrenador de"
	cont "Johto! Brock es"

	para "duro. Te castigará"
	line "si no lo tomas en"

	para "serio."
	done

GenericTrainerHikerEdwin:
	generictrainer HIKER, EDWIN, EVENT_BEAT_HIKER_EDWIN, HikerEdwinSeenText, HikerEdwinBeatenText

	text "Uf… Hecho"
	line "pedazos."
	done

PewterGymGuyScript:
	checkevent EVENT_BEAT_BROCK
	iftrue_jumptextfaceplayer PewterGymGuyWinText
	jumpthistextfaceplayer

	text "¡Yo! ¡Futuro"
	line "Campeón! De"

	para "verdad que rocas."
	line "¿Estás combatiendo"

	para "contra los Líderes"
	line "de Gimnasio de"
	cont "Kanto?"

	para "Son gente fuerte y"
	line "dedicada, igual"

	para "que los Líderes de"
	line "Gimnasio de Johto."
	done

PewterGymStatue:
	gettrainername BROCK, 1, STRING_BUFFER_4
	checkflag ENGINE_BOULDERBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

BrockIntroText:
	text "Brock: Vaya, no es"
	line "común que tengamos"

	para "un retador de"
	line "Johto."

	para "Soy Brock, el"
	line "Líder de Gimnasio"
	cont "de Ciudad"
	cont "Plateada."

	para "Soy experto en"
	line "#mon tipo Roca."

	para "Mis #mon son"
	line "casi inmunes a la"

	para "mayoría de ataques"
	line "físicos. Te será"

	para "difícil hacerles"
	line "algo de daño."

	para "¡Vamos!"
	done

BrockWinLossText:
	text "Brock: Los"
	line "poderosos ataques"
	cont "de tu #mon"
	cont "vencieron mi"
	cont "defensa de roca…"

	para "Eres más fuerte de"
	line "lo que esperaba…"

	para "Adelante, toma"
	line "esta Medalla."
	done

BrockBoulderBadgeText:
	text "Brock: <PLAYER>,"
	line "gracias. Disfruté"

	para "el combate,"
	line "aunque estoy algo"
	cont "molesto."

	para "También te daré la"
	line "MT de Avalancha."
	done

BrockFightDoneText:
	text "Brock: El mundo es"
	line "enorme. Aún hay"

	para "muchos"
	line "entrenadores"
	cont "fuertes como tú."

	para "Ya verás. Yo"
	line "también me"
	cont "volveré mucho más"
	cont "fuerte."
	done

CamperJerrySeenText:
	text "Los entrenadores"
	line "de este Gimnasio"
	cont "usan #mon tipo"
	cont "Roca."

	para "El tipo Roca tiene"
	line "alta Defensa."

	para "Los combates"
	line "podrían alargarse"

	para "mucho. ¿Estás"
	line "listo para esto?"
	done

CamperJerryBeatenText:
	text "Tengo que ganar"
	line "estos combates…"
	done

HikerEdwinSeenText: ; text > text
	text "¡R-r-r-R-R…CRASH!"
	done

HikerEdwinBeatenText: ; text > text
	text "¡BOOM!"
	done


PewterGymGuyWinText:
	text "¡Yo! ¡Futuro"
	line "Campeón! Ese"

	para "Gimnasio no te dio"
	line "mucho problema."

	para "La forma en que"
	line "tomaste el mando"

	para "fue inspiradora."
	line "Lo digo en serio."
	done
