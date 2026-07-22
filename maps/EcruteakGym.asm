EcruteakGym_MapScriptHeader:
	def_scene_scripts
	scene_script EcruteakGymForcedToLeaveScene, SCENE_ECRUTEAKGYM_FORCED_TO_LEAVE
	scene_const SCENE_ECRUTEAKGYM_NOOP

	def_callbacks

	def_warp_events
	warp_event  4, 21, ECRUTEAK_CITY, 10
	warp_event  5, 21, ECRUTEAK_CITY, 10
	warp_event  4, 18, ECRUTEAK_GYM, 4
	warp_event  2,  4, ECRUTEAK_GYM, 3
	warp_event  3,  4, ECRUTEAK_GYM, 3
	warp_event  4,  4, ECRUTEAK_GYM, 3
	warp_event  6,  4, ECRUTEAK_GYM, 3
	warp_event  7,  4, ECRUTEAK_GYM, 3
	warp_event  4,  5, ECRUTEAK_GYM, 3
	warp_event  2,  6, ECRUTEAK_GYM, 3
	warp_event  3,  6, ECRUTEAK_GYM, 3
	warp_event  4,  6, ECRUTEAK_GYM, 3
	warp_event  5,  6, ECRUTEAK_GYM, 3
	warp_event  7,  6, ECRUTEAK_GYM, 3
	warp_event  5,  7, ECRUTEAK_GYM, 3
	warp_event  7,  7, ECRUTEAK_GYM, 3
	warp_event  2,  8, ECRUTEAK_GYM, 3
	warp_event  3,  8, ECRUTEAK_GYM, 3
	warp_event  4,  8, ECRUTEAK_GYM, 3
	warp_event  5,  8, ECRUTEAK_GYM, 3
	warp_event  7,  8, ECRUTEAK_GYM, 3
	warp_event  7,  9, ECRUTEAK_GYM, 3
	warp_event  2, 10, ECRUTEAK_GYM, 3
	warp_event  4, 10, ECRUTEAK_GYM, 3
	warp_event  5, 10, ECRUTEAK_GYM, 3
	warp_event  6, 10, ECRUTEAK_GYM, 3
	warp_event  7, 10, ECRUTEAK_GYM, 3
	warp_event  2, 11, ECRUTEAK_GYM, 3
	warp_event  4, 11, ECRUTEAK_GYM, 3
	warp_event  2, 12, ECRUTEAK_GYM, 3
	warp_event  4, 12, ECRUTEAK_GYM, 3
	warp_event  5, 12, ECRUTEAK_GYM, 3
	warp_event  6, 12, ECRUTEAK_GYM, 3
	warp_event  7, 12, ECRUTEAK_GYM, 3
	warp_event  2, 13, ECRUTEAK_GYM, 3
	warp_event  2, 14, ECRUTEAK_GYM, 3
	warp_event  3, 14, ECRUTEAK_GYM, 3
	warp_event  4, 14, ECRUTEAK_GYM, 3
	warp_event  5, 14, ECRUTEAK_GYM, 3
	warp_event  7, 14, ECRUTEAK_GYM, 3
	warp_event  5, 15, ECRUTEAK_GYM, 3
	warp_event  7, 15, ECRUTEAK_GYM, 3
	warp_event  2, 16, ECRUTEAK_GYM, 3
	warp_event  3, 16, ECRUTEAK_GYM, 3
	warp_event  4, 16, ECRUTEAK_GYM, 3
	warp_event  5, 16, ECRUTEAK_GYM, 3
	warp_event  7, 16, ECRUTEAK_GYM, 3
	warp_event  2, 17, ECRUTEAK_GYM, 3
	warp_event  7, 17, ECRUTEAK_GYM, 3

	def_coord_events

	def_bg_events
	bg_event  3, 19, BGEVENT_READ, EcruteakGymStatue
	bg_event  6, 19, BGEVENT_READ, EcruteakGymStatue

	def_object_events
	object_event  4, 18, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
	object_event  5,  1, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, -1
	object_event  2,  9, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSageJeffrey, -1
	object_event  3, 17, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSagePing, -1
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerMediumMartha, -1
	object_event  7, 13, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerMediumGrace, -1
	object_event  7, 19, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuyScript, -1

	object_const_def
	const ECRUTEAKGYM_GRAMPS

EcruteakGymForcedToLeaveScene:
	sdefer EcruteakGymClosed
	end

EcruteakGymMortyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftruefwd .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	opentext
	givebadge FOGBADGE, JOHTO_REGION
	setmapscene ECRUTEAK_HOUSE, SCENE_ECRUTEAKHOUSE_NOOP
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue_jumpopenedtext MortyFightDoneText
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_MEDIUM_MARTHA
	setevent EVENT_BEAT_MEDIUM_GRACE
	writetext MortyText_FogBadgeSpeech
	promptbutton
	verbosegivetmhm TM_SHADOW_BALL
	setevent EVENT_GOT_TM30_SHADOW_BALL
	jumpthisopenedtext

	text "Es Bola Sombra."
	line "Causa daño"

	para "y puede reducir"
	line "la Def.Especial."

	para "Utilízalo si te"
	line "atrae."
	done

EcruteakGymClosed:
	applyonemovement PLAYER, step_up
	applyonemovement ECRUTEAKGYM_GRAMPS, slow_step_down
	showtext EcruteakGymClosedText
	follow PLAYER, ECRUTEAKGYM_GRAMPS
	applymovement PLAYER, EcruteakGymPlayerSlowStepDownMovement
	stopfollow
	warpcheck
	warpsound
	newloadmap MAPSETUP_DOOR
	end

GenericTrainerSageJeffrey:
	generictrainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText

	text "¿De dónde vinieron"
	line "los #mon?"
	done

GenericTrainerSagePing:
	generictrainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText

	text "Solo usamos"
	line "#mon de tipo"
	cont "Fantasma."

	para "¡Ningún ataque de"
	line "tipo Normal puede"
	cont "dañarlos!"
	done

GenericTrainerMediumMartha:
	generictrainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText

	text "¡Quien más quiera"
	line "ganar, ganará!"
	done

GenericTrainerMediumGrace:
	generictrainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText

	text "Bien. Te contaré"
	line "el secreto del"

	para "suelo invisible."

	para "¡El camino está"
	line "justo ante"
	cont "nuestros ojos!"
	done

EcruteakGymGuyScript:
	checkevent EVENT_BEAT_MORTY
	iftrue_jumptextfaceplayer EcruteakGymGuyWinText
	jumpthistextfaceplayer

	text "Los entrenadores"
	line "de aquí tienen"
	cont "motivos secretos."

	para "Si ganas, quizá te"
	line "cuenten secretos"

	para "profundos sobre"
	line "Ciudad Iris."
	done

EcruteakGymStatue:
	gettrainername MORTY, 1, STRING_BUFFER_4
	checkflag ENGINE_FOGBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 11, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

EcruteakGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step_down
	remove_fixed_facing
	step_end

MortyIntroText:
	text "Qué bien que"
	line "hayas venido."

	para "Aquí en Ciudad"
	line "Iris, los #mon"
	cont "han sido"
	cont "reverenciados."

	para "Se dice que un"
	line "#mon de colores"

	para "del arcoíris"
	line "descenderá ante"

	para "un entrenador"
	line "verdaderamente"
	cont "poderoso."

	para "Creí esa leyenda,"
	line "así que he"

	para "entrenado en"
	line "secreto aquí toda"
	cont "mi vida."

	para "Como resultado,"
	line "ahora puedo ver lo"
	cont "que otros no"
	cont "pueden."

	para "Solo un poco más…"

	para "Con un poco más,"
	line "podría ver un"

	para "futuro en el que"
	line "me encuentre con"
	cont "el #mon de"
	cont "colores del"
	cont "arcoíris."

	para "¡Vas a ayudarme a"
	line "alcanzar ese"
	cont "nivel!"
	done

MortyWinLossText:
	text "Aún no soy lo"
	line "bastante bueno…"

	para "Está bien. Esta"
	line "Medalla es tuya."
	done

MortyText_FogBadgeSpeech:
	text "Al tener la"
	line "Medalla Niebla,"

	para "los #mon hasta"
	line "<LV>50 te"
	cont "obedecerán."

	para "Además, los"
	line "#mon que sepan"
	cont "Surf"

	para "podrán usar ese"
	line "movimiento cuando"
	cont "quieras."

	para "Quiero que tengas"
	line "esto también."
	done


MortyFightDoneText:
	text "Ya veo…"

	para "Tu viaje te ha"
	line "llevado a lugares"
	cont "lejanos."

	para "Y has presenciado"
	line "mucho más que yo."

	para "Te envidio por"
	line "eso…"
	done

SageJeffreySeenText:
	text "Pasé la primavera"
	line "con mi #mon."

	para "Luego verano,"
	line "otoño e"
	cont "invierno…"

	para "Y llegó la"
	line "primavera de"

	para "nuevo. Hemos"
	line "vivido juntos"
	cont "mucho tiempo."
	done

SageJeffreyBeatenText:
	text "Victorias y"
	line "derrotas, viví"
	cont "ambas."
	done

SagePingSeenText:
	text "¿Puedes dañar a"
	line "nuestros #mon?"
	done

SagePingBeatenText:
	text "¡Ah! ¡Bien hecho!"
	done

MediumMarthaSeenText:
	text "¡Voy a ganar!"
	done

MediumMarthaBeatenText:
	text "¡Yo, yo, yo perdí!"
	done

MediumGraceSeenText:
	text "¿Confundido por"
	line "nuestro suelo"
	cont "invisible?"

	para "¡Véncenme si"
	line "quieres una"
	cont "pista!"
	done

MediumGraceBeatenText:
	text "¿Qu-qué?"
	done


EcruteakGymGuyWinText:
	text "Fiu, <PLAYER>."
	line "¡Lo hiciste"
	cont "genial!"

	para "¡Estaba"
	line "acurrucado en la"
	cont "esquina de puro"
	cont "terror!"
	done

EcruteakGymClosedText:
	text "Morty, el Líder de"
	line "Gimnasio, está"
	cont "ausente."

	para "Lo siento, pero"
	line "tendrás que"
	cont "irte."

	para "Jojojojo."
	done
