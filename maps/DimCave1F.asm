DimCave1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 30,  2, DIM_CAVE_2F, 5
	warp_event  5, 17, DIM_CAVE_2F, 6
	warp_event 28, 18, DIM_CAVE_2F, 7
	warp_event 24, 32, DIM_CAVE_2F, 8

	def_coord_events

	def_bg_events
	bg_event 28,  2, BGEVENT_ITEM + FULL_HEAL, EVENT_DIM_CAVE_1F_HIDDEN_FULL_HEAL

	def_object_events
	object_event 30,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSuper_nerdGregg, -1
	object_event 12, 18, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerScientistDexter, -1
	object_event 27, 21, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 2, TrainerGuitaristmBiff, -1
	itemball_event  3, 20, DUSK_BALL, 1, EVENT_DIM_CAVE_1F_DUSK_BALL
	itemball_event 28, 31, RARE_BONE, 1, EVENT_DIM_CAVE_1F_RARE_BONE

GenericTrainerSuper_nerdGregg:
	generictrainer SUPER_NERD, GREGG, EVENT_BEAT_SUPER_NERD_GREGG, .SeenText, .BeatenText

	text "El Tren Imán es"
	line "rápido, pero"
	cont "no derrapa."
	done

.SeenText:
	text "¡Estos vagones"
	line "son un rollo!"
	cont "No derrapan!"
	done

.BeatenText:
	text "¡Me da igual!"
	done

GenericTrainerScientistDexter:
	generictrainer SCIENTIST, DEXTER, EVENT_BEAT_SCIENTIST_DEXTER, .SeenText, .BeatenText

	text "Trabajo para la"
	line "Central"
	cont "Eléctrica."

	para "Usamos la"
	line "cascada de esta"
	cont "cueva para"
	cont "energía limpia"
	cont "renovable!"
	done

.SeenText:
	text "Primero soy"
	line "hidrólogo, y"
	cont "entrenador"
	cont "después."
	done

.BeatenText:
	text "Debería"
	line "centrarme en"
	cont "hidrología…"
	done

TrainerGuitaristmBiff:
	trainer GUITARISTM, BIFF, EVENT_BEAT_GUITARISTM_BIFF, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_GUITARIST_M

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "¡Me encanta el"
	line "heavy metal y"
	cont "metales pesados!"
	done

.SeenText:
	text "¡Me flipa el"
	line "rock y cavar"
	cont "rocas!"
	done

.BeatenText:
	text "¡Molido contra"
	line "el suelo!"
	done
