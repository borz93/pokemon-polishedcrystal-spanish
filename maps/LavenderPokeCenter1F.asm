LavenderPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, LAVENDER_TOWN, 1
	warp_event  6,  7, LAVENDER_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalMrFujiScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  1,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderPokeCenter1FYoungsterScript, -1
	object_event 11,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderPokeCenter1FGentlemanText, -1
	object_event  6,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderPokeCenter1FTeacherText, -1

PokemonJournalMrFujiScript:
	setflag ENGINE_READ_MR_FUJI_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Editor: El"
	line "tímido Sr. Fuji"
	cont "rechazó"
	cont "nuestras"

	para "peticiones de"
	line "entrevista."

	para "Es un hombre"
	line "amable, muy"
	cont "querido y"
	cont "respetado en"
	cont "Pueblo Lavanda."
	done

LavenderPokeCenter1FYoungsterScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumptextfaceplayer .NoMachinePartText
	checkevent EVENT_EXORCISED_LAV_RADIO_TOWER
	iffalse_jumptextfaceplayer .NoExorcismText
	jumpthistextfaceplayer

	text "El director de"
	line "la Emisora de"
	cont "Radio estaba"
	cont "muy feliz."

	para "Dijo que por fin"
	line "están emitiendo"
	cont "de nuevo!"
	done

.NoMachinePartText:
	text "Si la Central"
	line "Eléctrica no"
	cont "funciona, el"

	para "Tren Imán"
	line "tampoco…"

	para "Eso también"
	line "implica que la"
	cont "Torre Radio no"
	cont "puede emitir…"
	done

.NoExorcismText:
	text "La Central"
	line "Eléctrica"
	cont "funciona bien"

	para "de nuevo, pero la"
	line "Torre Radio sigue"
	cont "sin emitir."

	para "¿Qué pasará"
	line "allí?"
	done

LavenderPokeCenter1FGentlemanText:
	text "Al norte de"
	line "Lavanda está el"
	cont "Túnel Roca."

	para "Crúzalo para"
	line "llegar a la"
	cont "Central Eléctrica."
	done

LavenderPokeCenter1FTeacherText:
	text "Hay un programa"
	line "de radio que"
	cont "pone música de"
	cont "Flauta Poké."

	para "¿Eh? Ah, tu"
	line "radio necesita"
	cont "una Tarjeta"
	cont "Expansión para"
	cont "sintonizarlo."
	done
