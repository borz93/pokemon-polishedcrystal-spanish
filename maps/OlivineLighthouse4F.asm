OlivineLighthouse4F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_3F, 1
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_5F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_5F, 3
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_3F, 3
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_3F, 6
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_3F, 7
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_3F, 8
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_3F, 9
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_5F, 4
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_5F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7, 14, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorKent, -1
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerLassConnie, EVENT_OLIVINE_LIGHTHOUSE_JASMINE

GenericTrainerLassConnie:
	generictrainer LASS, CONNIE, EVENT_BEAT_LASS_CONNIE, LassConnieSeenText, LassConnieBeatenText

	text "Claro. Cualquiera"
	line "se preocuparía"

	para "si su propio"
	line "#mon estuviera"
	cont "herido."

	para "Rezaré por el"
	line "#mon de aquí,"

	para "para que Jasmine"
	line "vuelva al"
	cont "gimnasio."
	done

TrainerSailorKent:
	trainer SAILOR, KENT, EVENT_BEAT_SAILOR_KENT, SailorKentSeenText, SailorKentBeatenText, 0, SailorKentScript, TRAINERPAL_DARK_SAILOR

SailorKentScript:
	endifjustbattled
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue_jumptextfaceplayer SailorKentFinalText
	jumpthistextfaceplayer

	text "Hablando de"
	line "enfermos, oí que"
	cont "hay"

	para "una buena"
	line "farmacia en"
	cont "Ciudad Orquídea."
	done

SailorKentSeenText:
	text "Jasmine debe"
	line "estar"
	cont "preocupadísima"
	cont "por el #mon."

	para "Ya ni sonríe"
	line "estos días."
	done

SailorKentBeatenText:
	text "Tampoco puedo"
	line "sonreír…"
	done

SailorKentFinalText:
	text "El #mon de"
	line "aquí ya está"
	cont "bien."

	para "La Farmacia de"
	line "Ciudad Orquídea"
	cont "estuvo a la"
	cont "altura de su fama!"
	done

LassConnieSeenText:
	text "Jasmine es la"
	line "Líder del"
	cont "Gimnasio de esta"
	cont "ciudad."

	para "Pienso traerla"
	line "de vuelta."

	para "¡Más vale que"
	line "nadie se"
	cont "interponga!"
	done

LassConnieBeatenText:
	text "¡Aaay! Mi #mon!"
	done
