ViridianCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ViridianCityFlyPoint

	def_warp_events
	warp_event 30,  7, VIRIDIAN_GYM, 1
	warp_event 21,  5, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 25, VIRIDIAN_POKECENTER_1F, 1
	warp_event 20, 33, ROUTE_1_VIRIDIAN_GATE, 1
	warp_event 21, 33, ROUTE_1_VIRIDIAN_GATE, 2
	warp_event 21,  9, VIRIDIAN_SCHOOL_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 17, 17, BGEVENT_JUMPTEXT, ViridianCitySignText
	bg_event 31,  7, BGEVENT_JUMPTEXT, ViridianGymSignText
	bg_event 19,  1, BGEVENT_JUMPTEXT, ViridianCityTrainerTips1Text
	bg_event 21, 29, BGEVENT_JUMPTEXT, ViridianCityTrainerTips2Text
	bg_event 21, 15, BGEVENT_JUMPTEXT, TrainerHouseSignText

	def_object_events
	object_event 18,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeGramps, -1
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, EVENT_BLUE_IN_CINNABAR
	object_event 33,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, EVENT_VIRIDIAN_GYM_BLUE
	object_event  6, 23, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 17, 21, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 3, 3, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianCityYoungsterText, -1
	object_event 31, 23, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianCityYoungster2Text, -1
	cuttree_event 14,  4, EVENT_VIRIDIAN_CITY_CUT_TREE_1
	cuttree_event  8, 22, EVENT_VIRIDIAN_CITY_CUT_TREE_2

ViridianCityFlyPoint:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	endcallback

ViridianCityCoffeeGramps:
	faceplayer
	opentext
	writetext ViridianCityCoffeeGrampsQuestionText
	yesorno
	iffalse_jumpopenedtext ViridianCityCoffeeGrampsDoubtedText
	jumpthisopenedtext

	text "Bien, bien. Sí,"
	line "era algo fuera de"

	para "lo común, ¡te lo"
	line "aseguro!"
	done

ViridianCityGrampsNearGym:
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue_jumptextfaceplayer ViridianCityGrampsNearGymBlueReturnedText
	jumpthistextfaceplayer

	text "Este Gimnasio no"
	line "tuvo Líder hasta"
	cont "hace poco."

	para "Un joven de"
	line "Pueblo Paleta se"
	cont "convirtió en el"
	cont "Líder, pero suele"
	cont "estar fuera."
	done

ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_DREAM_EATER_INTRO
	iftruefwd ViridianCityTutorDreamEaterScript
	writetext ViridianCityDreamEaterFisherText
	waitbutton
	setevent EVENT_LISTENED_TO_DREAM_EATER_INTRO
ViridianCityTutorDreamEaterScript:
	writetext Text_ViridianCityTutorDreamEater
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_ViridianCityTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval DREAM_EATER
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_ViridianCityTutorRefused

.NoSilverLeaf
	jumpthisopenedtext

	text "No tienes ninguna"
	line "Hoja Plateada…"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Ahora tu #mon"
	line "sabe usar"
	cont "Comesueños…"

	para "…Zzzzz…"
	done

ViridianCityCoffeeGrampsQuestionText:
	text "¡Eh, chaval! Acabo"
	line "de tomarme un"
	cont "doble espresso, y"
	cont "estoy que me"
	cont "subo por las"
	cont "paredes."

	para "Necesito hablar"
	line "con alguien, ¡así"
	cont "que tú servirás!"

	para "Puede que ahora no"
	line "lo parezca, pero"

	para "yo era un experto"
	line "atrapando #mon."

	para "¿Me crees?"
	done


ViridianCityCoffeeGrampsDoubtedText:
	text "¿Qué? ¡Mocoso"
	line "insolente!"

	para "Si fuera un poco"
	line "más joven, te"

	para "enseñaría un par"
	line "de cosas. ¡Já!"
	done


ViridianCityGrampsNearGymBlueReturnedText:
	text "¿Vas a combatir"
	line "contra el Líder?"

	para "Buena suerte. La"
	line "vas a necesitar."
	done

ViridianCityDreamEaterFisherText:
	text "¡Bostezo!"

	para "Debí de quedarme"
	line "dormido al sol."

	para "…Tuve un sueño"
	line "sobre un Drowzee"

	para "comiéndose mi"
	line "sueño. Y…"

	para "Aprendí a comer"
	line "sueños…"

	para "¡Oh, esto da"
	line "escalofríos!"
	cont "Pero ahora…"
	done

Text_ViridianCityTutorDreamEater:
	text "Puedo enseñarle a"
	line "tu #mon a comer"
	cont "sueños."

	para "Solo quiero una"
	line "Hoja Plateada a"
	cont "cambio."
	done


Text_ViridianCityTutorQuestion:
	text "¿Debería enseñarle"
	line "Comesueños a tu"
	cont "#mon?"
	done

Text_ViridianCityTutorRefused: ; text > text
	text "Vale…"
	done


ViridianCityYoungsterText:
	text "Oí que hay muchos"
	line "objetos en el"

	para "suelo del Bosque"
	line "Verde."
	done

ViridianCityYoungster2Text:
	text "El líder del Team"
	line "Rocket fue el"
	cont "Líder de este"
	cont "Gimnasio durante"

	para "un tiempo, pero un"
	line "día, hace tres"
	cont "años, desapareció."

	para "De todos modos no"
	line "solía estar en el"
	cont "Gimnasio…"
	done

ViridianCitySignText:
	text "Ciudad Verde"

	para "El Paraíso"
	line "Eternamente Verde"
	done

ViridianGymSignText:
	text "Gimnasio #mon"
	line "de Ciudad Verde"
	cont "Líder: …"

	para "El resto del texto"
	line "es ilegible…"
	done

ViridianCityTrainerTips1Text:
	text "Consejos de"
	line "entrenador"

	para "¡Atrapa #mon y"
	line "amplía tu"
	cont "colección!"

	para "¡Cuantos más"
	line "tengas, más fácil"
	cont "será combatir!"
	done

ViridianCityTrainerTips2Text:
	text "Consejos de"
	line "entrenador"

	para "¡El mundo es un"
	line "lugar enorme!"

	para "No te limites a"
	line "correr o volar,"
	cont "¡mira a tu"
	cont "alrededor!"

	para "¡Encontrarás cosas"
	line "nuevas y"
	cont "emocionantes!"
	done

TrainerHouseSignText:
	text "Casa de"
	line "Entrenadores"

	para "El Club de los"
	line "Mejores Combates"
	done
