Route49_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  5, VALENCIA_PORT, 1

	def_coord_events

	def_bg_events
	bg_event 31, 11, BGEVENT_JUMPTEXT, Route49SignText

	def_object_events
	object_event  5, 12, SPRITE_LADY, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route49LadyText, -1
	object_event 31, 17, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route49YoungsterText, -1
	object_event 15,  8, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSightseermHari, -1
	object_event 12, 16, SPRITE_TAMER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerTamerJordan, -1
	object_event 25, 19, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerAromaLadyPeony, -1
	object_event 25,  7, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerGuitaristmGeddy, -1
	itemball_event 21,  6, WHITE_HERB, 1, EVENT_ROUTE_49_WHITE_HERB
	itemball_event 18, 20, CALCIUM, 1, EVENT_ROUTE_49_CALCIUM
	fruittree_event 29, 14, FRUITTREE_ROUTE_49, LUM_BERRY, PAL_NPC_GREEN
	cuttree_event 26, 12, EVENT_ROUTE_49_CUT_TREE_1
	cuttree_event 20, 15, EVENT_ROUTE_49_CUT_TREE_2

Route49LadyText:
	text "¡Mira la hierba y"
	line "los árboles de"
	cont "aquí!"

	para "Valencia está"
	line "llena de flora"
	cont "única."
	done

Route49YoungsterText:
	text "Este paisaje me"
	line "hace sentir como"

	para "un aventurero en"
	line "medio de la"
	cont "jungla!"
	done

GenericTrainerSightseermHari:
	generictrainer SIGHTSEERM, HARI, EVENT_BEAT_SIGHTSEERM_HARI, .SeenText, .BeatenText

	text "He viajado mucho"
	line "solo para conocer"

	para "a cada Prof."
	line "#mon."

	para "¿Quieres ver las"
	line "fotos que tomé?"
	done

.SeenText:
	text "¡Oye! Vine a"
	line "conocer a la Prof."
	cont "Ivy!"
	done

.BeatenText:
	text "¿Qué? ¿Ya la"
	line "conoces?"
	done

GenericTrainerTamerJordan:
	generictrainer TAMER, JORDAN, EVENT_BEAT_TAMER_JORDAN, .SeenText, .BeatenText

	text "¿Cómo domaste tan"
	line "bien a tu #mon?"

	para "Son fuertes, pero"
	line "tranquilos a la"
	cont "vez."
	done

.SeenText:
	text "¡Cuidado! Los"
	line "#mon de aquí"
	cont "pueden ser muy"
	cont "salvajes!"
	done

.BeatenText:
	text "¡Vaya! Parece que"
	line "los tuyos son más"
	cont "salvajes."
	done

GenericTrainerAromaLadyPeony:
	generictrainer AROMA_LADY, PEONY, EVENT_BEAT_AROMA_LADY_PEONY, .SeenText, .BeatenText

	text "A mi Bellossom le"
	line "encanta vivir en"

	para "esta isla"
	line "tranquila."
	done

.SeenText:
	text "¿Quieres ver a"
	line "mi Bellossom?"
	done

.BeatenText:
	text "Ah… Bellossom no"
	line "quería"
	cont "combatir…"
	done

GenericTrainerGuitaristmGeddy:
	generictrainer GUITARISTM, GEDDY, EVENT_BEAT_GUITARISTM_GEDDY, .SeenText, .BeatenText

	text "¿Crees que toco"
	line "una guitarra?"
	cont "¡Error!"

	para "Es un bajo de"
	line "6 cuerdas."
	done

.SeenText:
	text "Me parece que"
	line "podría vivir"

	para "mucho mejor de lo"
	line "que creo…"

	para "Supongo que por"
	line "eso me llaman…"

	para "¡me llaman el"
	line "hombre currante!"
	done

.BeatenText:
	text "¡Buen combate!"
	line "Puede que escriba"
	cont "una canción de"
	cont "esto."
	done

Route49SignText:
	text "Ruta 49"
	line "Isla Valencia"
	done
