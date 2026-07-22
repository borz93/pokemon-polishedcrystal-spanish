Route32Coast_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 55, UNION_CAVE_B1F_SOUTH, 4
	warp_event 17, 49, ROUTE_32_COAST_HOUSE, 1
	warp_event  8, 42, HIDDEN_TREE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 15, 27, BGEVENT_JUMPTEXT, Route32CoastTrainerTipsText
	bg_event  5, 57, BGEVENT_JUMPTEXT, Route32CoastUnionCaveSignText
	bg_event 17, 32, BGEVENT_ITEM + LEVEL_BALL, EVENT_ROUTE_32_COAST_HIDDEN_LEVEL_BALL
	bg_event  5, 43, BGEVENT_ITEM + HYPER_POTION, EVENT_ROUTE_32_COAST_HIDDEN_HYPER_POTION
	bg_event 14,  6, BGEVENT_ITEM + ELIXIR, EVENT_ROUTE_32_COAST_HIDDEN_ELIXIR
	bg_event  8, 41, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_32_COAST
	bg_event  9, 41, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_32_COAST

	def_object_events
	object_event  9,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmermMichel, -1
	object_event 18, 65, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermLucas, -1
	object_event 20,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfAlison, -1
	object_event 23, 15, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfStephanie, -1
	object_event 17, 21, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBird_keeperPowell, -1
	object_event 14, 60, SPRITE_COSPLAYER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCosplayerChloe, -1
	object_event 24, 60, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherKiley, -1
	object_event  6, 20, SPRITE_CAMPER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCamperCraig, -1
	object_event 11, 43, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassLayla, -1
	object_event 25, 33, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleFoxandrae1, -1
	object_event 25, 34, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleFoxandrae2, -1
	object_event  6, 59, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route32CoastLassText, -1
	fruittree_event 21, 49, FRUITTREE_ROUTE_32_COAST, ASPEAR_BERRY, PAL_NPC_BROWN
	itemball_event  5, 16, WHITE_HERB, 1, EVENT_ROUTE_32_COAST_WHITE_HERB
	object_event 21, 61, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_ITEMBALL, PLAYEREVENT_ITEMBALL, SOFT_SAND, 1, EVENT_ROUTE_32_COAST_SOFT_SAND

GenericTrainerSwimmermMichel:
	generictrainer SWIMMERM, MICHEL, EVENT_BEAT_SWIMMERM_MICHEL, .SeenText, .BeatenText

	text "Lección"
	line "aprendida:"
	cont "haz ejercicios de"
	cont "calentamiento."
	done

.SeenText:
	text "¡Te estaba"
	line "esperando!"

	para "¡Combatamos!"
	line "¡Ahora!"
	done

.BeatenText:
	text "¡Ay, ay!"
	line "¡Me dio un"
	cont "calambre!"
	done

TrainerSwimmermLucas:
	trainer SWIMMERM, LUCAS, EVENT_BEAT_SWIMMERM_LUCAS, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERM

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Los arcoíris"
	line "causados por la"

	para "luz solar aparecen"
	line "opuestos al sol en"
	cont "el cielo."

	para "Interesante, ¿eh?"
	done

.SeenText:
	text "Reflejar y"
	line "refractar la luz"

	para "a través de gotas"
	line "de agua crea un"
	cont "arcoíris."
	done

.BeatenText:
	text "¡Ese combate"
	line "estuvo lleno de"
	cont "color!"
	done

GenericTrainerSwimmerfAlison:
	generictrainer SWIMMERF, ALISON, EVENT_BEAT_SWIMMERF_ALISON, .SeenText, .BeatenText

	text "Inhala…"
	line "Exhala…"

	para "¿No es"
	line "refrescante?"
	done

.SeenText:
	text "Antes de combatir"
	line "debes respirar"
	cont "hondo."
	done

.BeatenText:
	text "Glub… Inhalé algo"
	line "de agua de mar…"
	done

GenericTrainerSwimmerfStephanie:
	generictrainer SWIMMERF, STEPHANIE, EVENT_BEAT_SWIMMERF_STEPHANIE, .SeenText, .BeatenText

	text "El sonido viaja"
	line "más rápido en el"
	cont "agua que en el"
	cont "aire."

	para "Curioso, ¿verdad?"
	done

.SeenText:
	text "¿Oíste eso?"
	done

.BeatenText:
	text "¡Bu!"
	done

TrainerBird_keeperPowell:
	trainer BIRD_KEEPER, POWELL, EVENT_BEAT_BIRD_KEEPER_POWELL, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_BIRD_KEEPER

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Mi #mon puede"
	line "usar Vuelo incluso"

	para "debilitado, así"
	line "que puedo llegar"
	cont "a casa igual."

	para "Conveniente, ¿eh?"
	done

.SeenText:
	text "No sé nadar, así"
	line "que volé aquí con"
	cont "mi #mon."
	done

.BeatenText:
	text "¡Oh, no! ¡Mi"
	line "#mon!"
	done

GenericTrainerCosplayerChloe:
	generictrainer COSPLAYER, CHLOE, EVENT_BEAT_COSPLAYER_CHLOE, .SeenText, .BeatenText

	text "Cuando visto así,"
	line "la gente dice que"
	para "soy la más mona"
	line "donde sea que voy."
	done

.SeenText:
	text "¿Te gusta mi"
	line "traje? ¡Es"
	cont "supereficaz!"
	done

.BeatenText:
	text "Bueno, eso no fue"
	line "muy eficaz…"
	done

GenericTrainerFisherKiley:
	generictrainer FISHER, KILEY, EVENT_BEAT_FISHER_KILEY, .SeenText, .BeatenText

	text "Tienes que tener"
	line "una buena caña si"

	para "quieres atrapar"
	line "buenos #mon."
	done

.SeenText:
	text "Je, hoy estoy en"
	line "racha. ¿Qué tal un"
	cont "combate, chaval?"
	done

.BeatenText:
	text "Vaya. No tuve"
	line "suerte esta vez."
	done

GenericTrainerCamperCraig:
	generictrainer CAMPER, CRAIG, EVENT_BEAT_CAMPER_CRAIG, .SeenText, .BeatenText

	text "La aventura vive"
	line "fuera de tu"
	cont "tienda,"

	para "¡así que sal ahí"
	line "y disfrútalo!"
	done

.SeenText:
	text "¡Nada supera el"
	line "aire libre!"
	done

.BeatenText:
	text "Soy un montañero"
	line "feliz."
	done

GenericTrainerLassLayla:
	generictrainer LASS, LAYLA, EVENT_BEAT_LASS_LAYLA, .SeenText, .BeatenText

	text "Si pides un deseo"
	line "y le dices a"
	cont "alguien cuál es,"
	cont "¡no se cumplirá!"
	done

.SeenText:
	text "Si tuvieras un"
	line "deseo, ¿cuál"
	cont "sería?"
	done

.BeatenText:
	text "¡Pero no me digas"
	line "tu deseo!"
	done

GenericTrainerCoupleFoxandrae1:
	generictrainer COUPLE, FOXANDRAE1, EVENT_BEAT_COUPLE_FOX_AND_RAE, .SeenText, .BeatenText

	text "Fox: Nuestro"
	line "trabajo en equipo"
	cont "no fue suficiente"
	cont "esta vez."
	done

.SeenText:
	text "Fox: Vamos, Rae,"
	line "¡combatamos!"
	done

.BeatenText:
	text "Fox: Nos venciste"
	line "a Rae y a mí…"
	done

GenericTrainerCoupleFoxandrae2:
	generictrainer COUPLE, FOXANDRAE2, EVENT_BEAT_COUPLE_FOX_AND_RAE, .SeenText, .BeatenText

	text "Rae: Perdimos,"
	line "pero seguimos"
	cont "siendo una pareja"
	cont "feliz."
	done

.SeenText:
	text "Rae: Oye Fox, ¿por"
	line "qué no combatimos?"
	done

.BeatenText:
	text "Rae: ¿Cómo pudiste"
	line "vencernos a Fox y"
	cont "a mí?"
	done

Route32CoastLassText:
	text "Jadeo, jadeo…"

	para "Por fin crucé esa"
	line "cueva."

	para "Era mucho más"
	line "grande de lo que"
	cont "esperaba."

	para "Me cansé demasiado"
	line "para explorarla"

	para "toda, así que salí"
	line "afuera."
	done

Route32CoastTrainerTipsText:
	text "Consejos de"
	line "entrenador"

	para "¡Un #mon con la"
	line "habilidad Recogida"

	para "podría tener un"
	line "objeto tras un"
	cont "combate!"
	done

Route32CoastUnionCaveSignText:
	text "Cueva Unión"
	line "Adelante"
	done
