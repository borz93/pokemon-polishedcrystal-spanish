Route14_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 15, 12, BGEVENT_JUMPTEXT, Route14SignText

	def_object_events
	object_event 13,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokefanmTrevor, -1
	object_event 11, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokefanmCarter, -1
	object_event 11, 29, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperRoy, -1
	object_event 15, 15, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBird_keeperJosh, -1
	object_event  4, 19, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSchoolboyConnor, -1
	object_event  4, 17, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSchoolboyTorin, -1
	object_event  4, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSchoolboyTravis, -1
	object_event  9, 17, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerTeacherClarice, -1
	object_event  7,  7, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, trade, NPC_TRADE_KIM, -1
	cuttree_event  4,  9, EVENT_ROUTE_14_CUT_TREE_1
	cuttree_event 10, 18, EVENT_ROUTE_14_CUT_TREE_2
	cuttree_event  3, 25, EVENT_ROUTE_14_CUT_TREE_3
	fruittree_event  5, 12, FRUITTREE_ROUTE_14, CUSTAP_BERRY, PAL_NPC_RED

GenericTrainerPokefanmTrevor:
	generictrainer POKEFANM, TREVOR, EVENT_BEAT_POKEFANM_TREVOR, PokefanmTrevorSeenText, PokefanmTrevorBeatenText

	text "Ojalá hubiera una"
	line "forma fácil de"

	para "identificar dónde"
	line "conseguí mi"
	cont "#mon…"

	para "¡Oh! ¡Puedo"
	line "revisar sus"
	cont "estadísticas!"
	done

PokefanmTrevorSeenText:
	text "Hola. ¿Sabías…?"

	para "Los #mon se"
	line "vuelven más"

	para "amistosos si los"
	line "entrenas en un"
	cont "lugar que"
	cont "recuerdan."
	done

PokefanmTrevorBeatenText:
	text "¿Dónde conocí a"
	line "este Psyduck?"
	done

GenericTrainerPokefanmCarter:
	generictrainer POKEFANM, CARTER, EVENT_BEAT_POKEFANM_CARTER, PokefanmCarterSeenText, PokefanmCarterBeatenText

	text "Squirtle,"
	line "Charmander y"
	cont "Bulbasaur…"

	para "Creo que es una"
	line "mezcla bien"
	cont "equilibrada."
	done

PokefanmCarterSeenText:
	text "Te cuento, me"
	line "costó mucho"

	para "atrapar a mi"
	line "#mon más"
	cont "preciado."
	done

PokefanmCarterBeatenText:
	text "¡Awaaah!"
	done

GenericTrainerBird_keeperRoy:
	generictrainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, Bird_keeperRoySeenText, Bird_keeperRoyBeatenText

	text "Tienes #mon que"
	line "conocen la MO"

	para "Vuelo, ¿Verdad?"
	line "Te envidio."
	done

Bird_keeperRoySeenText:
	text "Mi sueño es volar"
	line "con mi querido"
	cont "#mon pájaro."
	done

Bird_keeperRoyBeatenText:
	text "Puedo soñar, pero"
	line "nunca podré"
	cont "volar…"
	done

GenericTrainerBird_keeperJosh:
	generictrainer BIRD_KEEPER, BIRD_KEEPER_JOSH, EVENT_BEAT_BIRD_KEEPER_JOSH, .SeenText, .BeatenText

	text "Quizá debería"
	line "mentir y decir que"
	cont "estoy en peso"
	cont "pesado…"
	done

.SeenText:
	text "¡Mi peso me pone"
	line "en la categoría de"
	cont "peso pluma!"

	para "…¿Eh? ¿Qué quieres"
	line "decir con que eso"
	cont "no suena muy"
	cont "fuerte?"
	done

.BeatenText:
	text "¡Perdí tan"
	line "ligero como flota"
	cont "una pluma!"
	done

GenericTrainerSchoolboyConnor:
	generictrainer SCHOOLBOY, SCHOOLBOY_CONNOR, EVENT_BEAT_SCHOOLBOY_CONNOR, .SeenText, .BeatenText

	text "No te apresures,"
	line "y toma el camino"
	cont "paso a paso."

	para "¡Gran consejo!"
	done

.SeenText:
	text "¡No veo la hora de"
	line "ir a casa y dejar"
	cont "mi Bolso!"
	done

.BeatenText:
	text "Tenía demasiada"
	line "prisa."
	done

GenericTrainerSchoolboyTorin:
	generictrainer SCHOOLBOY, TORIN, EVENT_BEAT_SCHOOLBOY_TORIN, .SeenText, .BeatenText

	text "¡Muy bien! ¡La"
	line "próxima, no"
	cont "cometeré ningún"
	cont "error!"
	done

.SeenText:
	text "¡Es bueno usar lo"
	line "que aprendes de"
	cont "inmediato!"
	done

.BeatenText:
	text "Ya veo. Ya veo."
	done

GenericTrainerSchoolboyTravis:
	generictrainer SCHOOLBOY, TRAVIS, EVENT_BEAT_SCHOOLBOY_TRAVIS, .SeenText, .BeatenText

	text "¡Quizá debería"
	line "unirme a tus"
	cont "sesiones de"
	cont "estudio!"
	done

.SeenText:
	text "¿Tienes sesiones"
	line "de estudio"
	cont "después de clase?"
	done

.BeatenText:
	text "Qué fuerte…"
	done

GenericTrainerTeacherClarice:
	generictrainer TEACHER_F, CLARICE, EVENT_BEAT_TEACHER_CLARICE, .SeenText, .BeatenText

	text "No te relajes solo"
	line "porque ganaste."

	para "¡Al llegar a casa,"
	line "deberías hacer un"
	cont "repaso completo!"
	done

.SeenText:
	text "Muy bien,"
	line "¡empecemos este"
	cont "combate #mon!"
	done

.BeatenText:
	text "¡Muy bien! Eso"
	line "concluye el"
	cont "combate de hoy."
	done

Route14SignText:
	text "Ruta 14"

	para "Ciudad Fucsia -"
	line "Pueblo Lavanda"
	done
