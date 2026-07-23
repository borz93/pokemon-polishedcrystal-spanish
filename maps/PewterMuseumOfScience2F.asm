PewterMuseumOfScience2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, PEWTER_MUSEUM_OF_SCIENCE_1F, 5

	def_coord_events

	def_bg_events
	bg_event  3,  6, BGEVENT_READ, Museum2FMoonStoneSignpostScript
	bg_event 11,  2, BGEVENT_JUMPTEXT, Museum2FSpaceShuttleSignpostText
	bg_event  0,  1, BGEVENT_READ, PokemonJournalStevenScript
	bg_event  1,  1, BGEVENT_READ, PokemonJournalStevenScript
	bg_event  4,  1, BGEVENT_READ, PokemonJournalCynthiaScript
	bg_event  5,  1, BGEVENT_READ, PokemonJournalCynthiaScript

	def_object_events
	object_event  7,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GRAY, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FScientistText, -1
	object_event  1,  7, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FChildText, -1
	object_event  2,  7, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FTeacherText, -1
	object_event  2,  1, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FLassText, -1
	object_event 12,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Museum2FPokefanMScript, -1

Museum2FPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SEISMIC_TOSS_INTRO
	iftruefwd Museum2FTutorSeismicTossScript
	checkunits
	iftruefwd .metric
	writetext Museum2FPokefanMImperialText
	sjumpfwd .ok
.metric
	writetext Museum2FPokefanMMetricText
.ok
	waitbutton
	setevent EVENT_LISTENED_TO_SEISMIC_TOSS_INTRO
Museum2FTutorSeismicTossScript:
	writetext Text_Museum2FTutorSeismicToss
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Museum2FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval SEISMIC_TOSS
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Como quieras."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "¡No tienes ninguna"
	line "Hoja Plata!"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Ahora tu #mon"
	line "sabe usar"
	cont "Sísmico!"
	done

Museum2FMoonStoneSignpostScript:
	reanchormap
	trainerpic METEORITE
	waitbutton
	closepokepic
	jumpthistext

	text "Meteorito que"
	line "cayó en el Monte"
	cont "Moon."
	cont "(Piedra Lunar)"
	done

Museum2FScientistText:
	text "Meteoritos"
	line "impactaron el"
	cont "Monte Moon cerca"
	cont "de Ciudad"
	cont "Plateada."

	para "Tenemos uno"
	line "expuesto."

	para "Parece emitir"
	line "energía extraña…"
	done


Museum2FLassText:
	text "Los #mon"
	line "revividos de"
	cont "fósiles son todos"
	cont "tipo Roca en"
	cont "parte."

	para "¿Siempre fueron"
	line "así, o es"

	para "resultado del"
	line "proceso de"
	cont "fosilización?"
	done

Museum2FPokefanMImperialText:
	text "Este transbordador"
	line "espacial volaba a"
	cont "160 millas sobre"

	para "la tierra,"
	line "¡desafiando la"
	cont "gravedad!"

	para "¿Sabes qué más"
	line "desafía la"
	cont "gravedad?"

	para "¡Sísmico,"
	line "por supuesto!"
	done

Museum2FChildText:
	text "Cosas y rocas y"
	line "rocas y cosas."

	para "¿Ya podemos"
	line "irnos?"
	done

Museum2FTeacherText:
	text "Suspiro… Mi hijo"
	line "no disfruta el"
	cont "museo tanto como"
	cont "esperaba."

	para "Niños, ¿eh?"
	done

Museum2FPokefanMMetricText:
	text "Este transbordador"
	line "espacial volaba a"
	cont "250 kilómetros"

	para "sobre la tierra,"
	line "¡desafiando la"
	cont "gravedad!"

	para "¿Sabes qué más"
	line "desafía la"
	cont "gravedad?"

	para "¡Sísmico,"
	line "por supuesto!"
	done

Text_Museum2FTutorSeismicToss:
	text "Puedo enseñar a"
	line "tu #mon a usar"

	para "Sísmico por"
	line "una Hoja Plata."
	done


Text_Museum2FTutorQuestion:
	text "¿Debería enseñar"
	line "a tu #mon"
	cont "Sísmico?"
	done




Museum2FSpaceShuttleSignpostText:
	text "Transbordador"
	line "Espacial"
	done

PokemonJournalStevenScript:
	setflag ENGINE_READ_STEVEN_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: ¡el"
	cont "Sabueso de Rocas"
	cont "Steven!"

	para "Se dice que"
	line "Steven Stone"
	cont "ayuda a Devon"
	cont "Corp, dirigida"

	para "por su padre"
	line "Joseph Stone,"

	para "buscando"
	line "minerales raros"
	cont "e incluso"
	cont "fósiles."
	done

PokemonJournalCynthiaScript: ; TODO: move to Goldenrod Museum
	setflag ENGINE_READ_CYNTHIA_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial:"
	cont "¡Investigadora"
	cont "Cintia!"

	para "Se dice que"
	line "Cintia aprendió"

	para "muchas leyendas y"
	line "mitos de su"
	cont "abuela en Sinnoh."
	done
