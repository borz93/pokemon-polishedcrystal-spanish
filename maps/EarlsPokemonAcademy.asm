EarlsPokemonAcademy_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3, 15, VIOLET_CITY, 3
	warp_event  4, 15, VIOLET_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PokemonJournalWalkerScript
	bg_event  1,  1, BGEVENT_READ, PokemonJournalWalkerScript
	bg_event  3,  0, BGEVENT_READ, AcademyBlackboard
	bg_event  4,  0, BGEVENT_READ, AcademyBlackboard

	def_object_events
	object_event  4,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AcademyEarl, EVENT_EARLS_ACADEMY_EARL
	object_event  2,  4, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
	object_event  2,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, EarlsPokemonAcademyYoungster1Text, -1
	object_event  4,  7, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, EarlsPokemonAcademyYoungster2Text, -1
	object_event  3, 11, SPRITE_GAMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid1Script, -1
	object_event  4, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid2Script, -1

	object_const_def
	const EARLSPOKEMONACADEMY_EARL

AcademyEarl:
	givekeyitem TYPE_CHART ; failsafe in case Violet City Earl is gone already in a save
	applymovement EARLSPOKEMONACADEMY_EARL, AcademyEarlSpinMovement
	faceplayer
	opentext
	writetext AcademyEarlIntroText
	yesorno
	iffalsefwd .Part1
	writetext AcademyEarlTeachHowToWinText
	yesorno
	iffalse_jumpopenedtext AcademyEarlNoMoreToTeachText
.Part1:
	writetext AcademyEarlTeachMoreText
	yesorno
	iffalse_jumpopenedtext AcademyEarlNoMoreToTeachText
	jumpthisopenedtext

	text "¡Bien! ¡Enseñar"
	line "te voy!"

	para "Si #mon salen"
	line "en combate aunque"

	para "sea un momento,"
	line "algo de Exp."
	cont "reciben."

	para "En lo alto de la"
	line "lista pon a"
	cont "#mon débiles."

	para "¡Cambiar en"
	line "combate rápido!"

	para "¡Así, débiles"
	line "#mon fuertes"
	cont "se vuelven!"
	done

EarlsPokemonAcademyGameboyKid1Script:
	showtextfaceplayer EarlsPokemonAcademyGameboyKid1Text
	turnobject LAST_TALKED, DOWN
	end

EarlsPokemonAcademyGameboyKid2Script:
	showtextfaceplayer EarlsPokemonAcademyGameboyKid2Text
	turnobject LAST_TALKED, DOWN
	end

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .MenuHeader
	_2dmenu
	closewindow
	ifequalfwd $1, .Poison
	ifequalfwd $2, .Paralysis
	ifequalfwd $3, .Sleep
	ifequalfwd $4, .Burn
	ifequalfwd $5, .Freeze
	endtext

.Poison:
	writetext AcademyPoisonText
	waitbutton
	sjump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	sjump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	sjump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	sjump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	sjump .Loop

.MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 0, 11, 8
	dw .Data
	db 1 ; default option

.Data:
	db $80 ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(AcademyBlackboard), 0

.Text:
	db "Psn@"
	db "Par@"
	db "Slp@"
	db "Brn@"
	db "Frz@"
	db "Quit@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalsefwd .Done
	writetext AcademyNotebookText1
	yesorno
	iffalsefwd .Done
	writetext AcademyNotebookText2
	yesorno
	iffalsefwd .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	endtext

PokemonJournalWalkerScript:
	setflag ENGINE_READ_WALKER_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje"
	line "especial: ¡El"
	cont "Ex-Líder Walker!"

	para "Se rumorea que"
	line "Walker, el padre"

	para "de Falkner,"
	line "vagabundea por"
	cont "Johto."
	done

AcademyEarlSpinMovement:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

AcademyEarlIntroText:
	text "¡Earl, yo ser!"

	para "¡Maravillosos son"
	line "los #mon, sí!"

	para "¡Enseñar te voy a"
	line "ser mejor"
	cont "entrenador!"

	para "¿Qué saber tú"
	line "quieres? ¿Ser"
	cont "ganador tú"
	cont "quieres?"
	done

AcademyEarlTeachHowToWinText:
	text "¡Bien! ¡Enseñar"
	line "te voy!"

	para "¡En combate,"
	line "#mon arriba en"
	cont "lista salir"
	cont "primero!"

	para "¡Cambiar orden en"
	line "lista, combate"
	cont "fácil hacer,"
	cont "quizás!"

	para "¿Más de mí quieres"
	line "oír?"
	done

AcademyEarlTeachMoreText:
	text "Entonces, ¿saber"
	line "quieres cómo"
	cont "criar bien a"
	cont "#mon?"
	done


AcademyEarlNoMoreToTeachText:
	text "¡Oh! ¡Estudiante"
	line "listo tú eres!"
	cont "¡Nada más enseñar"
	cont "yo puedo!"

	para "¡Bueno con #mon"
	line "tú debes ser!"
	done

EarlsPokemonAcademyYoungster1Text:
	text "Tomo notas de la"
	line "lección del"
	cont "profesor."

	para "Mejor copio lo"
	line "de la pizarra"
	cont "también."
	done

EarlsPokemonAcademyGameboyKid1Text:
	text "Cambié a mi"
	line "mejor #mon con"
	cont "el tipo de al"
	cont "lado."
	done

EarlsPokemonAcademyGameboyKid2Text:
	text "¿Eh? ¡El #mon"
	line "que acabo de"
	cont "conseguir lleva"
	cont "algo!"
	done

EarlsPokemonAcademyYoungster2Text:
	text "Un #mon que"
	line "lleve una Baya"
	cont "se curará solo en"
	cont "combate."

	para "Muchos otros"
	line "objetos pueden"
	cont "llevar los"
	cont "#mon…"

	para "Vaya que cuesta"
	line "tomar notas…"
	done

AcademyBlackboardText:
	text "La pizarra"
	line "describe cambios"

	para "de estado #mon"
	line "en combate."
	done

AcademyPoisonText:
	text "Si está"
	line "envenenado, un"
	cont "#mon pierde PS"
	cont "poco a poco."

	para "El veneno"
	line "persiste tras el"
	cont "combate,"

	para "y pierdes PS al"
	line "caminar."

	para "Para curarlo, usa"
	line "un Antídoto."
	done

AcademyParalysisText:
	text "La parálisis"
	line "reduce la"
	cont "velocidad y puede"
	cont "impedir el"
	cont "movimiento."

	para "Persiste tras el"
	line "combate, así que"
	cont "usa un"
	cont "Antiparál."
	done

AcademySleepText:
	text "Si está dormido,"
	line "tu #mon no"
	cont "puede hacer un"
	cont "movimiento."

	para "Un #mon dormido"
	line "no despierta tras"
	cont "el combate."

	para "Despiértalo con un"
	line "Despertar."
	done

AcademyBurnText:
	text "Una quemadura"
	line "consume PS poco a"
	cont "poco."

	para "También reduce el"
	line "poder de ataque."

	para "Persiste tras el"
	line "combate."

	para "Usa un Antiquemad."
	line "como cura."
	done

AcademyFreezeText:
	text "Si tu #mon está"
	line "congelado, no"
	cont "puede hacer nada."

	para "Sigue congelado"
	line "tras el combate."

	para "Descongélalo con"
	line "un Antihielo."
	done

AcademyNotebookText:
	text "Es el cuaderno de"
	line "este niño…"

	para "Atrapa #mon"
	line "usando Poké"
	cont "Balls."

	para "Hasta seis pueden"
	line "estar en tu"
	cont "equipo."

	para "¿Sigo leyendo?"
	done

AcademyNotebookText1:
	text "Antes de lanzar"
	line "una Poké Ball,"
	cont "debilita primero"
	cont "al objetivo."

	para "Un #mon"
	line "envenenado o"
	cont "quemado es más"
	cont "fácil de atrapar."

	para "¿Sigo leyendo?"
	done

AcademyNotebookText2:
	text "Algunos"
	line "movimientos"
	cont "pueden causar"
	cont "confusión."

	para "La confusión"
	line "puede hacer que"
	cont "un #mon se"
	cont "ataque a sí"
	cont "mismo."

	para "Salir del combate"
	line "elimina cualquier"
	cont "confusión."

	para "¿Sigo leyendo?"
	done

AcademyNotebookText3:
	text "Quienes atrapan y"
	line "usan #mon en"

	para "combate son"
	line "entrenadores"
	cont "#mon."

	para "Se espera que"
	line "visiten Gimnasios"

	para "#mon y venzan a"
	line "otros"
	cont "entrenadores."

	para "La siguiente"
	line "página está…"
	cont "¡En blanco!"

	para "Niño: E-je-je…"

	para "No he escrito"
	line "nada más…"
	done
