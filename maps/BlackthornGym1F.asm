BlackthornGym1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, BlackthornGym1FBoulderCallback

	def_warp_events
	warp_event  4, 17, BLACKTHORN_CITY, 1
	warp_event  5, 17, BLACKTHORN_CITY, 1
	warp_event  1,  7, BLACKTHORN_GYM_2F, 1
	warp_event  7,  9, BLACKTHORN_GYM_2F, 2
	warp_event  2,  6, BLACKTHORN_GYM_2F, 3
	warp_event  7,  7, BLACKTHORN_GYM_2F, 4
	warp_event  7,  6, BLACKTHORN_GYM_2F, 5

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, BlackthornGymStatue
	bg_event  6, 15, BGEVENT_READ, BlackthornGymStatue

	def_object_events
	object_event  5,  3, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuyScript, -1
	object_event  1, 14, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerDragonTamerPaul, -1
	object_event  6,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainermMike, -1
	object_event  9,  2, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerfLola, -1

BlackthornGym1FBoulderCallback:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalsefwd .skip1
	changeblock 8, 2, $3b
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalsefwd .skip2
	changeblock 2, 4, $3a
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalsefwd .skip3
	changeblock 8, 6, $3b
.skip3
	endcallback

BlackthornGymStatue:
	gettrainername CLAIR, 1, STRING_BUFFER_4
	checkflag ENGINE_RISINGBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 15, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

BlackthornGymClairScript:
	checkflag ENGINE_RISINGBADGE
	iftrue_jumptextfaceplayer ClairPokemonLeagueDirectionsText
	checkevent EVENT_BEAT_CLAIR
	iftrue_jumptextfaceplayer .TooMuchToExpectText
	showtextfaceplayer .IntroText
	winlosstext .WinText, 0
	loadtrainer CLAIR, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	showtext .GoToDragonsDenText
	setevent EVENT_BEAT_DRAGON_TAMER_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

.IntroText:
	text "Soy Clair."

	para "La mejor maestra"
	line "Dragón del mundo."

	para "Puedo hacer frente"
	line "incluso al Alto"

	para "Mando de la Liga"
	line "#mon."

	para "¿Aún quieres"
	line "enfrentarte a mí?"

	para "…Bien."
	line "¡Hagámoslo!"

	para "Como Líder de"
	line "Gimnasio, usaré"

	para "¡todo mi poder"
	line "contra cualquier"
	cont "rival!"
	done

.WinText:
	text "¿Perdí?"

	para "No me lo creo."
	line "Debe de haber"
	cont "algún error…"
	done

.GoToDragonsDenText:
	text "No pienso"
	line "admitirlo."

	para "Puede que haya"
	line "perdido, pero aún"

	para "no estás listo"
	line "para la Liga"
	cont "#mon."

	para "Ya sé. Deberías"
	line "afrontar el reto"
	cont "de maestro Dragón."

	para "Detrás de este"
	line "Gimnasio hay un"
	cont "lugar llamado"
	cont "Guarida Dragón."

	para "Hay un pequeño"
	line "santuario en su"
	cont "centro."
	cont "Ve allí."

	para "Si puedes"
	line "demostrar que has"

	para "abandonado tus"
	line "ideales"
	cont "perezosos,"

	para "¡te reconoceré"
	line "como un entrenador"
	cont "digno de una"
	cont "Medalla!"
	done

.TooMuchToExpectText:
	text "¿Qué pasa?"

	para "¿Es demasiado"
	line "esperar de ti?"
	done

ClairPokemonLeagueDirectionsText:
	text "¿Qué pasa?"

	para "¿No te diriges a"
	line "la Liga #mon?"

	para "¿Sabes cómo"
	line "llegar?"

	para "Desde aquí, ve a"
	line "Pueblo Primavera."
	cont "Luego surfea al"
	cont "este."

	para "La ruta hasta allí"
	line "es muy dura."

	para "¡No te atrevas a"
	line "perder en la Liga"
	cont "#mon!"

	para "Si lo haces, me"
	line "sentiré aún peor"

	para "por haber perdido"
	line "contra ti."

	para "Da todo lo que"
	line "tengas."
	done

BlackthornGymGuyScript:
	checkevent EVENT_BEAT_CLAIR
	iftrue_jumptextfaceplayer .WinText
	jumpthistextfaceplayer

	text "¡Eh! ¡Futuro"
	line "Campeón!"

	para "Ha sido un viaje"
	line "largo, pero"

	para "¡ya casi hemos"
	line "terminado! ¡Cuenta"
	cont "conmigo!"

	para "Clair usa #mon"
	line "de tipo Dragón,"
	cont "míticos y"
	cont "sagrados."

	para "No es fácil"
	line "dañarlos."

	para "Pero ya sabes,"
	line "se supone que son"

	para "débiles contra los"
	line "movimientos de"
	cont "tipo Hielo."
	done

.WinText:
	text "¡Fue genial que"
	line "vencieras a Clair!"

	para "Solo queda el"
	line "reto de la Liga"
	cont "#mon."

	para "¡Estás en camino"
	line "de convertirte en"
	cont "el Campeón"
	cont "#mon!"
	done

GenericTrainerDragonTamerPaul:
	generictrainer DRAGON_TAMER, PAUL, EVENT_BEAT_DRAGON_TAMER_PAUL, .SeenText, .BeatenText

	text "¿Lance te dijo que"
	line "le gustaría verte"

	para "otra vez? ¡Ni"
	line "hablar!"
	done

.SeenText:
	text "¿Tu primer combate"
	line "contra dragones?"

	para "¡Te mostraré lo"
	line "duros que son!"
	done

.BeatenText:
	text "¿Mis #mon"
	line "dragón perdieron?"
	done

GenericTrainerCooltrainermMike:
	generictrainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, .SeenText, .BeatenText

	text "Ahora conozco mis"
	line "carencias."

	para "¡Gracias por"
	line "mostrármelas!"
	done

.SeenText:
	text "¿Mis posibilidades"
	line "de perder? ¡Ni un"
	cont "uno por ciento!"
	done

.BeatenText:
	text "Qué raro."
	done

GenericTrainerCooltrainerfLola:
	generictrainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, .SeenText, .BeatenText

	text "Los dragones son"
	line "débiles contra"
	cont "movimientos de"
	cont "tipo Dragón."
	done

.SeenText:
	text "Los dragones son"
	line "#mon sagrados."

	para "Están llenos de"
	line "energía vital."

	para "Si no vas en"
	line "serio, no podrás"

	para "vencerlos."
	done

.BeatenText:
	text "¡Bien hecho!"
	done
