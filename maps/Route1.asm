Route1_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 10,  1, ROUTE_1_VIRIDIAN_GATE, 3

	def_coord_events

	def_bg_events
	bg_event  9, 27, BGEVENT_JUMPTEXT, Route1SignText

	def_object_events
	object_event  6, 12, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboyDanny, -1
	object_event 17, 14, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboySherman, -1
	object_event 16, 21, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCooltrainermFrench, -1
	object_event 11, 25, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCooltrainerfQuinn, -1
	fruittree_event  5,  7, FRUITTREE_ROUTE_1, FIGY_BERRY, PAL_NPC_BROWN

GenericTrainerSchoolboyDanny:
	generictrainer SCHOOLBOY, DANNY, EVENT_BEAT_SCHOOLBOY_DANNY, SchoolboyDannySeenText, SchoolboyDannyBeatenText

	text "Para los"
	line "entrenadores, es"

	para "normal combatir"
	line "cada vez que nos"
	cont "vemos."
	done

GenericTrainerSchoolboySherman:
	generictrainer SCHOOLBOY, SHERMAN, EVENT_BEAT_SCHOOLBOY_SHERMAN, SchoolboyShermanSeenText, SchoolboyShermanBeatenText

	text "Debería anotar"
	line "todos los"
	cont "errores de hoy."
	done

GenericTrainerCooltrainermFrench:
	generictrainer COOLTRAINERM, FRENCH, EVENT_BEAT_COOLTRAINERM_FRENCH, CooltrainermFrenchSeenText, CooltrainermFrenchBeatenText

	text "¡Qué buen"
	line "combate!"
	cont "¿No crees?"
	done

GenericTrainerCooltrainerfQuinn:
	generictrainer COOLTRAINERF, QUINN, EVENT_BEAT_COOLTRAINERF_QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText

	text "Eres fuerte."

	para "Está claro que"
	line "has entrenado"
	cont "mucho."
	done

SchoolboyDannySeenText:
	text "Si dos"
	line "entrenadores se"
	cont "encuentran, lo"
	cont "primero es"
	cont "combatir."
	done

SchoolboyDannyBeatenText:
	text "Vaya… tengo un"
	line "historial de"
	cont "derrotas…"
	done

SchoolboyShermanSeenText:
	text "Justo después de"
	line "clase, ¡salgo a"
	cont "practicar!"
	done

SchoolboyShermanBeatenText:
	text "Debo seguir el"
	line "libro de texto."
	done

CooltrainermFrenchSeenText:
	text "¡Tú!"

	para "Llevo esperando"
	line "a alguien"
	cont "como tú!"
	done

CooltrainermFrenchBeatenText:
	text "¡Sí, tan fuerte"
	line "como esperaba!"
	done

CooltrainerfQuinnSeenText:
	text "¡Eh, tú! ¿Quieres"
	line "combatir?"
	done

CooltrainerfQuinnBeatenText:
	text "Fuera de combate…"
	done

Route1SignText:
	text "Ruta 1"

	para "Pueblo Paleta -"
	line "Ciudad Verde"
	done
