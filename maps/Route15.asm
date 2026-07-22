Route15_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  4, ROUTE_15_FUCHSIA_GATE, 3
	warp_event  4,  5, ROUTE_15_FUCHSIA_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 19,  9, BGEVENT_JUMPTEXT, Route15SignText

	def_object_events
	object_event 10, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSchoolboyKipp, -1
	object_event 15, 13, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboyTommy, -1
	object_event 27, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboyBilly, -1
	object_event 33, 10, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolgirlFaith, -1
	object_event 30, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerTeacherColette, -1
	object_event 20, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_DARK_GREEN, OBJECTTYPE_TRAINER, 3, TrainerTeacherHillary, -1
	object_event 30,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokefanfBoone, -1
	object_event 14,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPokefanfEleanor, -1
	object_event 19,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsKayandtia1, -1
	object_event 20,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsKayandtia2, -1
	itemball_event 12,  5, PP_UP, 1, EVENT_ROUTE_15_PP_UP
	cuttree_event 43,  5, EVENT_ROUTE_14_CUT_TREE_3

GenericTrainerTeacherColette:
	generictrainer TEACHER_F, COLETTE, EVENT_BEAT_TEACHER_COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText

	text "Antes de ser"
	line "profesora, solía"

	para "olvidarme de"
	line "muchas cosas."
	done

TrainerTeacherHillary:
	trainer TEACHER_F, HILLARY, EVENT_BEAT_TEACHER_HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, 0, .Script, TRAINERPAL_DARK_TEACHER_F

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Estudiar es"
	line "importante, pero"
	cont "hacer ejercicio es"
	cont "igual de vital."
	done

GenericTrainerSchoolboyKipp:
	generictrainer SCHOOLBOY, KIPP, EVENT_BEAT_SCHOOLBOY_KIP, SchoolboyKippSeenText, SchoolboyKippBeatenText

	text "Mi madre se"
	line "preocupa tanto por"
	cont "mí que tengo que"

	para "llamarla a todas"
	line "horas."
	done

GenericTrainerSchoolboyTommy:
	generictrainer SCHOOLBOY, TOMMY, EVENT_BEAT_SCHOOLBOY_TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText

	text "¡Sayonara! Acabo"
	line "de aprender eso en"
	cont "japonés."
	done

GenericTrainerSchoolboyBilly:
	generictrainer SCHOOLBOY, BILLY, EVENT_BEAT_SCHOOLBOY_BILLY, SchoolboyBillySeenText, SchoolboyBillyBeatenText

	text "¡Si los #mon"
	line "fueran una"
	cont "asignatura, sería"
	cont "el mejor!"
	done

GenericTrainerSchoolgirlFaith:
	generictrainer SCHOOLGIRL, FAITH, EVENT_BEAT_SCHOOLGIRL_FAITH, SchoolgirlFaithSeenText, SchoolgirlFaithBeatenText

	text "Estoy cansada de"
	line "andar. Necesito"
	cont "descansar."
	done

GenericTrainerPokefanfBoone:
	generictrainer POKEFANF, BOONE, EVENT_BEAT_POKEFANF_BOONE, PokefanfBooneSeenText, PokefanfBooneBeatenText

	text "Al combatir, ves"
	line "#mon que nunca"
	cont "habías visto"
	cont "antes."

	para "¡Es genial!"
	done

GenericTrainerPokefanfEleanor:
	generictrainer POKEFANF, ELEANOR, EVENT_BEAT_POKEFANF_ELEANOR, PokefanfEleanorSeenText, PokefanfEleanorBeatenText

	text "¡Mis #mon no"
	line "son débiles! ¡Los"
	cont "tuyos son"
	cont "demasiado fuertes!"
	done

GenericTrainerTwinsKayandtia1:
	generictrainer TWINS, KAYANDTIA1, EVENT_BEAT_TWINS_KAY_AND_TIA, TwinsKayandtia1SeenText, TwinsKayandtia1BeatenText

	text "Verdad absoluta:"
	line "¡Soy Kay! Quizá…"
	done

GenericTrainerTwinsKayandtia2:
	generictrainer TWINS, KAYANDTIA2, EVENT_BEAT_TWINS_KAY_AND_TIA, TwinsKayandtia2SeenText, TwinsKayandtia2BeatenText

	text "Quizá verdad:"
	line "¡Soy Tia! ¡Sin"
	cont "duda!"
	done

TeacherColetteSeenText:
	text "¿Se te ha"
	line "olvidado algo?"
	done

TeacherColetteBeatenText:
	text "¡Kyaaah!"
	done

TeacherHillarySeenText:
	text "En días soleados,"
	line "creo que a los"

	para "niños les"
	line "gustaría más jugar"

	para "en el patio que"
	line "estudiar en clase."
	done

TeacherHillaryBeatenText:
	text "No quería"
	line "perder…"
	done

SchoolboyKippSeenText:
	text "Espera. Tengo que"
	line "llamar a mi madre."
	done

SchoolboyKippBeatenText:
	text "¡Lo siento, mamá!"
	line "¡Me han vencido!"
	done

SchoolboyTommySeenText:
	text "Combatamos."
	line "¡No pienso perder!"
	done

SchoolboyTommyBeatenText:
	text "¡Se me olvidó"
	line "hacer los deberes!"
	done

SchoolgirlFaithSeenText:
	text "Estamos de viaje"
	line "de estudios a la"

	para "Radio Lavanda para"
	line "ciencias sociales."
	done

SchoolgirlFaithBeatenText:
	text "¡Eres"
	line "tremendamente"
	cont "fuerte!"
	done

SchoolboyBillySeenText:
	text "¡Mi asignatura"
	line "favorita es"
	cont "gimnasia!"
	done

SchoolboyBillyBeatenText:
	text "¡Oh, no!"
	line "¿Cómo pude perder?"
	done

PokefanfBooneSeenText:
	text "Oye, tus"
	line "#mon…"

	para "Enséñamelos."
	line "¡Enséñamelos!"
	done

PokefanfBooneBeatenText:
	text "¡Genial! ¡Ha sido"
	line "estupendo!"
	done

PokefanfEleanorSeenText:
	text "Muy bien,"
	line "#mon, ¡hora de"
	cont "combatir!"
	done

PokefanfEleanorBeatenText:
	text "Oh, vaya…"
	done

TwinsKayandtia1SeenText:
	text "¡Somos las"
	line "gemelas Kay y Tia!"

	para "¿Sabes cuál de las"
	line "dos soy?"
	done

TwinsKayandtia1BeatenText:
	text "Tia y Kay"
	line "perdieron…"
	done

TwinsKayandtia2SeenText:
	text "¡Somos las"
	line "gemelas Kay y Tia!"

	para "¿Sabes cuál de las"
	line "dos soy?"
	done

TwinsKayandtia2BeatenText:
	text "Tia y Kay"
	line "perdieron…"
	done

Route15SignText:
	text "Ruta 15"

	para "Ciudad Fucsia -"
	line "Pueblo Lavanda"
	done
