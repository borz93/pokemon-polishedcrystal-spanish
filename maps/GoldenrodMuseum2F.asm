GoldenrodMuseum2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  7, GOLDENROD_MUSEUM_1F, 3

	def_coord_events

	def_bg_events
	bg_event  1,  0, BGEVENT_READ, LugiaPaintingScript
	bg_event  2,  0, BGEVENT_READ, LugiaPaintingScript
	bg_event  4,  0, BGEVENT_READ, BellTowerPaintingScript
	bg_event  5,  0, BGEVENT_READ, BellTowerPaintingScript
	bg_event  7,  0, BGEVENT_READ, HoOhPaintingScript
	bg_event  8,  0, BGEVENT_READ, HoOhPaintingScript
	bg_event  1,  4, BGEVENT_READ, KabutoPuzzleScript
	bg_event  1,  5, BGEVENT_READ, KabutoPuzzleScript
	bg_event  5,  4, BGEVENT_READ, OmanytePuzzleScript
	bg_event  5,  5, BGEVENT_READ, OmanytePuzzleScript
	bg_event  1,  6, BGEVENT_READ, AerodactylPuzzleScript
	bg_event  1,  7, BGEVENT_READ, AerodactylPuzzleScript
	bg_event  5,  6, BGEVENT_READ, HoOhPuzzleScript
	bg_event  5,  7, BGEVENT_READ, HoOhPuzzleScript
	bg_event 10,  1, BGEVENT_JUMPTEXT, TowerRelicText
	bg_event 11,  1, BGEVENT_JUMPTEXT, TowerRelicText
	bg_event 11,  1, BGEVENT_JUMPTEXT, TowerRelicText

	def_object_events
	object_event  4,  2, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodMuseum2FSightseerMText, -1
	pokemon_event 5,  2, SMEARGLE, SPRITEMOVEDATA_POKEMON, (1 << EVE) | (1 << NITE), PAL_MON_BROWN, GoldenrodMuseum2FSmeargleText, -1
	object_event  3,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodMuseum2FScientistScript, -1
	object_event 11,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodMuseum2FTeacherScript, -1

LugiaPaintingScript:
	reanchormap
	paintingpic LUGIA_PAINTING
	waitbutton
	closepokepic
	jumpthistext

	text "  El Leviatán"
	line "    Despierta"
	done

HoOhPaintingScript:
	reanchormap
	paintingpic HO_OH_PAINTING
	waitbutton
	closepokepic
	jumpthistext

	text "   El Fénix"
	line "   Ascendiendo"
	done

BellTowerPaintingScript:
	reanchormap
	paintingpic BELL_TOWER_PAINTING
	waitbutton
	closepokepic
	jumpthistext

	text "    Amistad"
	line "   y Esperanza"
	done

KabutoPuzzleScript:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse_jumptext EmptyPuzzleText
	showtext .Text
	paintingpic KABUTO_PUZZLE
	waitbutton
	closepokepic
	end

.Text:
	text "¡Es el panel"
	line "completo de"
	cont "Kabuto!"
	done

OmanytePuzzleScript:
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iffalse_jumptext EmptyPuzzleText
	showtext .Text
	paintingpic OMANYTE_PUZZLE
	waitbutton
	closepokepic
	end

.Text:
	text "¡Es el panel"
	line "completo de"
	cont "Omanyte!"
	done

AerodactylPuzzleScript:
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse_jumptext EmptyPuzzleText
	showtext .Text
	paintingpic AERODACTYL_PUZZLE
	waitbutton
	closepokepic
	end

.Text:
	text "¡Es el panel"
	line "completo de"
	cont "Aerodactyl!"
	done

HoOhPuzzleScript:
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse_jumptext EmptyPuzzleText
	showtext .Text
	paintingpic HO_OH_PUZZLE
	waitbutton
	closepokepic
	end

.Text:
	text "¡Es el panel"
	line "completo de"
	cont "Ho-Oh!"
	done

EmptyPuzzleText:
	text "Réplica del panel"
	line "de Ruinas Alph"

	para "(en proceso de"
	line "restauración)"
	done

TowerRelicText:
	text "Un mural antiguo"
	line "que representa"
	cont "un #mon"
	cont "misterioso."
	done

GoldenrodMuseum2FSightseerMText:
	text "¡Estas pinturas"
	line "son hermosas!"

	para "Algún día, espero"
	line "que mi arte"
	cont "cuelgue en un"
	cont "museo para que"
	cont "todos lo vean."
	done

GoldenrodMuseum2FSmeargleText:
	text "Smeargle: ¡Smeer!"
	done

GoldenrodMuseum2FScientistScript:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iftrue_jumptextfaceplayer GoldenrodMuseum2FScientistSomeArtifactsText
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iftrue_jumptextfaceplayer GoldenrodMuseum2FScientistSomeArtifactsText
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iftrue_jumptextfaceplayer GoldenrodMuseum2FScientistSomeArtifactsText
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iftrue_jumptextfaceplayer GoldenrodMuseum2FScientistSomeArtifactsText
	jumpthistextfaceplayer

	text "Esperaba que"
	line "hubiera más"
	cont "exhibiciones…"

	para "¿Dónde están los"
	line "grabados de Alph?"
	done

GoldenrodMuseum2FScientistSomeArtifactsText:
	text "¡Estos artefactos"
	line "son fascinantes!"

	para "Es una pena que"
	line "sean solo"
	cont "réplicas…"

	para "Me encantaría"
	line "estudiar el"
	cont "original de cerca."
	done

GoldenrodMuseum2FTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_BATON_PASS_INTRO
	iftruefwd GoldenrodMuseum2FTutorBatonPassScript
	writetext GoldenrodMuseum2FTutorIntroText
	waitbutton
	setevent EVENT_LISTENED_TO_BATON_PASS_INTRO
; fallthrough
GoldenrodMuseum2FTutorBatonPassScript:
	writetext GoldenrodMuseum2FTutorBatonPassText
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext GoldenrodMuseum2FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval BATON_PASS
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Como quieras."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "¡No tienes una"
	line "Hoja Plateada!"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Listo! ¡Tu"
	line "#mon aprendió a"
	cont "usar Relevo!"
	done

GoldenrodMuseum2FTutorIntroText:
	text "Antes de la"
	line "construcción de la"

	para "nueva Torre Radio,"
	line "una vez hubo una"

	para "antigua torre de"
	line "madera."

	para "Este mural estaba"
	line "originalmente en"
	cont "esa torre."

	para "Trasladarlo aquí"
	line "fue necesario"

	para "para preservar un"
	line "trozo de la"
	cont "historia de Johto."

	para "¡Incluso los"
	line "#mon pueden"

	para "entender el valor"
	line "de la"
	cont "preservación!"
	done

GoldenrodMuseum2FTutorBatonPassText:
	text "Le enseñaré a tu"
	line "#mon a usar"

	para "Relevo a cambio de"
	line "una Hoja Plateada."
	done


GoldenrodMuseum2FTutorQuestion:
	text "¿Debería"
	line "enseñarle Relevo"
	cont "a tu #mon?"
	done
