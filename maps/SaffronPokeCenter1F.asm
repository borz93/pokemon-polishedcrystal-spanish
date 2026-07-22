SaffronPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, SAFFRON_CITY, 4
	warp_event  6,  7, SAFFRON_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalSabrinaScript

	def_object_events
	pc_nurse_event  5, 1
	object_event 11,  5, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPokeCenter1FFisherScript, -1
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronPokeCenter1FTeacherText, -1
	object_event  8,  4, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronPokeCenter1FYoungsterText, -1

PokemonJournalSabrinaScript:
	setflag ENGINE_READ_SABRINA_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: ¡Líder"
	cont "Sabrina!"

	para "Dicen que Sabrina"
	line "puede comunicarse"
	cont "con sus #mon"
	cont "en combate sin"
	cont "hablar."
	done

SaffronPokeCenter1FFisherScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "Pasé por el"
	line "Túnel Roca por"
	cont "casualidad."

	para "Había jaleo en"
	line "la Central"
	cont "Eléctrica."
	done

.Text2:
	text "Las cuevas se"
	line "derrumban fácil."

	para "Varias han"
	line "desaparecido en"

	para "los últimos años,"
	line "como la de las"
	cont "afueras de"
	cont "Celeste."

	para "Como senderista"
	line "profesional, eso"
	cont "lo sé de sobra."
	done

SaffronPokeCenter1FTeacherText:
	text "¿Cómo son los"
	line "Centros #mon"
	cont "de Johto?"

	para "…Ah, ya veo. No"
	line "son muy"
	cont "distintos de los"
	cont "de Kanto."

	para "¡Entonces puedo"
	line "ir a Johto sin"
	cont "preocuparme!"
	done

SaffronPokeCenter1FYoungsterText:
	text "La sede de Silph"
	line "Co. y la"
	cont "estación del"
	cont "Tren Imán,"

	para "eso hay que ver"
	line "en Azafrán."
	done
