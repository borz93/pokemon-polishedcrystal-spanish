Route32PokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, ROUTE_32, 1
	warp_event  6,  7, ROUTE_32, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalKurtScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  3,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FFishingGuruScript, -1
	object_event  8,  2, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route32Pokecenter1FCooltrainerFText, -1
	object_event  0,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route32PokeCenter1FPokefanMScript, -1

PokemonJournalKurtScript:
	setflag ENGINE_READ_KURT_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: ¡el"
	cont "Artesano Kurt!"

	para "Kurt no deja que"
	line "nadie se acerque"

	para "mientras hace #"
	line "Ball, salvo su"

	para "nieta Maizie."
	done

Route32Pokecenter1FFishingGuruScript:
	checkevent EVENT_GOT_OLD_ROD
	iftrue_jumptextfaceplayer .DoneText
	faceplayer
	opentext
	writetext .IntroText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	promptbutton
	verbosegivekeyitem OLD_ROD
	writetext .AfterText
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.IntroText:
	text "Este es un gran"
	line "sitio de pesca."

	para "¿Viste a gente"
	line "pescando? ¿Y tú"
	cont "qué?"

	para "¿Quieres una de"
	line "mis Cañas?"
	done

.YesText:
	text "Je, qué bueno"
	line "oír eso."

	para "¡Ahora tú también"
	line "eres pescador!"
	done

.AfterText:
	text "¡Pescar es"
	line "genial!"

	para "Si hay agua, sea"
	line "mar o río, prueba"
	cont "tu Caña."
	done

.NoText:
	text "Ah. Qué"
	line "decepcionante…"
	done

.DoneText:
	text "Oye, niño. ¿Cómo"
	line "van los peces?"
	done

Route32PokeCenter1FPokefanMScript:
	checkevent EVENT_GOT_LURE_BALL_FROM_FRENCHMAN
	iftrue_jumptextfaceplayer .Text5
	faceplayer
	opentext
	writetext .Text1
	yesorno
	iftruefwd .Yes
	writetext .Text2
	sjumpfwd .Continue
.Yes:
	writetext .Text3
.Continue
	promptbutton
	verbosegiveitem LURE_BALL
	iffalsefwd .NoRoom
	setevent EVENT_GOT_LURE_BALL_FROM_FRENCHMAN
	jumpthisopenedtext

	text "Esta Ball atrapa"
	line "fácil #mon"
	cont "pescados con"
	cont "una Caña!"

	para "Kurt, de Pueblo"
	line "Azalea, la hizo"
	cont "con un bonguri."

	para "¡Bonguris,"
	line "hurra!"
	done

.NoRoom
	endtext

.Text1:
	text "Bonjour. ¿Cómo"
	line "estás? ¿Conoces"
	cont "los bonguris?"
	done

.Text2:
	text "¿Non? ¡Qué"
	line "desperdicio! ¡Te"
	cont "mostraré lo"
	cont "geniales que son"
	cont "los bonguris!"
	done

.Text3:
	text "¡Youpi! ¡Bien"
	line "hecho! Me siento"
	cont "genial,"

	para "¡quiero darte"
	line "esto!"
	done

.Text5:
	text "Kurt es el héroe"
	line "de todo"
	cont "coleccionista de"
	cont "bonguris."

	para "¡Bonguris,"
	line "hurra!"
	done

Route32Pokecenter1FCooltrainerFText:
	text "¿Qué debería"
	line "darle a mi #mon"
	cont "para que sujete?"

	para "Quizá un objeto"
	line "que suba el"
	cont "Ataque…"
	done
