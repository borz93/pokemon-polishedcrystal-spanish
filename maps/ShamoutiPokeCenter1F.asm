ShamoutiPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, SHAMOUTI_ISLAND, 1
	warp_event  6,  7, SHAMOUTI_ISLAND, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalLoreleiScript

	def_object_events
	object_event  6,  3, SPRITE_IVY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ShamoutiPokeCenter1FIvyScript, EVENT_SHAMOUTI_POKE_CENTER_IVY
	pc_nurse_event  5, 1

	object_const_def
	const SHAMOUTIPOKECENTER1F_IVY

PokemonJournalLoreleiScript:
	setflag ENGINE_READ_LORELEI_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: ¡la"
	cont "ex-Alto Mando"
	cont "Lorelei!"

	para "Se dice que"
	line "Lorelei tiene una"

	para "colección"
	line "completa de"
	cont "muñecos #mon."
	done

ShamoutiPokeCenter1FIvyScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_IVY_INTRO
	iftruefwd .HeardIntro
	writetext .GreetingText
	waitbutton
	setevent EVENT_LISTENED_TO_IVY_INTRO
.HeardIntro
	writetext .OfferText
	loadmenu .KantoStarterMenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .Bulbasaur
	ifequalfwd $2, .Charmander
	ifequalfwd $3, .Squirtle
	jumpthisopenedtext

	text "Ivy: Hm, pensé que"
	line "te alegraría"

	para "criar un #mon"
	line "raro…"
	done

.Bulbasaur:
	writetext .ChoseKantoStarterText
	promptbutton
	waitsfx
	givepoke BULBASAUR, PLAIN_FORM, 10, SITRUS_BERRY
	iffalse_jumpopenedtext .NoRoomText
	getmonname BULBASAUR, STRING_BUFFER_3
	setevent EVENT_GOT_BULBASAUR_FROM_IVY
	sjumpfwd .Finish

.Charmander:
	writetext .ChoseKantoStarterText
	promptbutton
	waitsfx
	givepoke CHARMANDER, PLAIN_FORM, 10, SITRUS_BERRY
	iffalse_jumpopenedtext .NoRoomText
	getmonname CHARMANDER, STRING_BUFFER_3
	setevent EVENT_GOT_CHARMANDER_FROM_IVY
	sjumpfwd .Finish

.Squirtle:
	writetext .ChoseKantoStarterText
	promptbutton
	waitsfx
	givepoke SQUIRTLE, PLAIN_FORM, 10, SITRUS_BERRY
	iffalse_jumpopenedtext .NoRoomText
	getmonname SQUIRTLE, STRING_BUFFER_3
	setevent EVENT_GOT_SQUIRTLE_FROM_IVY
.Finish:
	writetext .GoodbyeText
	waitbutton
	closetext
	readvar VAR_FACING
	turnobject PLAYER, DOWN
	ifnotequal UP, .noleftstep
	applyonemovement SHAMOUTIPOKECENTER1F_IVY, step_left
.noleftstep
	applymovement SHAMOUTIPOKECENTER1F_IVY, .DownMovement
	playsound SFX_EXIT_BUILDING
	disappear SHAMOUTIPOKECENTER1F_IVY
	setevent EVENT_GOT_A_POKEMON_FROM_IVY
	checkevent EVENT_BEAT_YELLOW
	iffalsefwd .skip
	clearevent EVENT_INDIGO_PLATEAU_POKECENTER_YELLOW
.skip
	waitsfx
	end

.NoRoomText:
	text "Vaya, parece que"
	line "no hay sitio ni en"
	cont "tu equipo ni en"
	cont "tu Caja…"
	done

.GreetingText:
	text "Ivy: ¡Oh! Eres"
	line "<PLAYER>, ¡el"
	cont "nuevo Campeón!"

	para "¡Encantada de"
	line "conocerte!"

	para "Soy Ivy, una"
	line "profesora #mon."

	para "Estudio la"
	line "variación local"
	cont "en los fenotipos"
	cont "#mon."

	para "¿Sabías que"
	line "algunos #mon"

	para "salvajes conocen"
	line "movimientos"
	cont "únicos de su"
	cont "hábitat?"

	para "E incluso dos del"
	line "mismo #mon en"

	para "una zona pueden"
	line "tener colores"
	cont "diferentes…"

	para "Ah, perdona, a"
	line "veces me dejo"
	cont "llevar."
	done

.OfferText:
	text "Ivy: Así que"
	line "aceptas un"

	para "desafío de"
	line "Gimnasio en una"
	cont "región nueva…"

	para "¡Ajá! ¿Por qué no"
	line "te doy también un"
	cont "#mon nuevo?"

	para "¿Cuál quieres?"
	done

.ChoseKantoStarterText:
	text "Ivy: ¡Creo que"
	line "ese también es"
	cont "un gran #mon!"
	done

.GoodbyeText:
	text "Ivy: El Prof. Elm"
	line "confió en ti con"
	cont "un #mon, y"

	para "el Prof. Oak te"
	line "dio una #dex,"
	cont "así que sé que"
	cont "cuidarás bien de"
	cont ""
	text_ram wStringBuffer3
	text "."

	para "Bueno, debo tomar"
	line "un ferry de"

	para "vuelta a mi"
	line "laboratorio en"
	cont "Isla Valencia."

	para "¡Saluda al Prof."
	line "Oak de mi parte!"
	done

.DownMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

.KantoStarterMenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 13, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Bulbasaur@"
	db "Charmander@"
	db "Squirtle@"
	db "Salir@"
