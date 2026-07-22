VioletPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, VIOLET_CITY, 5
	warp_event  6,  7, VIOLET_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalFalknerScript

	def_object_events
	object_event 10,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VioletPokeCenter1FElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	pc_nurse_event  5, 1
	object_event  9,  4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FGameboyKidText, -1
	object_event  2,  3	, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FGentlemanText, -1
	object_event  0,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FSageText, -1
	object_event 11,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FYoungsterText, -1

	object_const_def
	const VIOLETPOKECENTER1F_SCIENTIST

PokemonJournalFalknerScript:
	setflag ENGINE_READ_FALKNER_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: ¡el"
	cont "Líder Falkner!"

	para "Dicen que Falkner"
	line "venera a su"
	cont "padre, quien"

	para "lideró el Gimnasio"
	line "Iris antes que él."
	done

VioletPokeCenter1FElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftruefwd .SecondTimeAsking
	writetext .IntroText
	sjumpfwd .AskTakeEgg
.SecondTimeAsking:
	writetext .QuestionText
.AskTakeEgg:
	yesorno
	iffalsefwd .RefusedEgg
	giveegg TOGEPI
	iffalse_jumpopenedtext .PartyAndBoxFull
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	setmapscene ROUTE_32, SCENE_ROUTE32_LYRA_GROTTOES
	writetext .GoodbyeText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequalfwd UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_SCIENTIST, .WalkStraightMovement
	sjumpfwd .Finish
.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_SCIENTIST, .WalkAroundMovement
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_SCIENTIST, .WalkDownMovement
.Finish:
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_SCIENTIST
	waitsfx
	end

.PartyAndBoxFull:
	text "Oh, no. No puedes"
	line "llevar más #mon"
	cont "contigo."

	para "Tampoco tienes"
	line "espacio en tu"
	cont "Caja."

	para "Esperaré aquí"
	line "mientras haces"
	cont "sitio para el"
	cont "Huevo."
	done

.RefusedEgg:
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	jumpthisopenedtext

	text "P-pero… El Prof."
	line "Elm te lo pidió…"
	done

.IntroText:
	text "<PLAYER>, cuánto"
	line "tiempo."

	para "Estaba mirando el"
	line "Diario #mon"
	cont "mientras esperaba."

	para "Sus chismes son un"
	line "buen"
	cont "entretenimiento…"

	para "En fin, el Prof."
	line "Elm tiene otro"
	cont "favor que pedirte."

	para "¿Aceptas el Huevo"
	line "#mon?"
	done

.QuestionText:
	text "<PLAYER>, ¿aceptas"
	line "el Huevo?"
	done

.GoodbyeText:
	text "Descubrimos que"
	line "un #mon no"
	cont "eclosiona hasta"
	cont "que crece en el"
	cont "Huevo."

	para "También debe estar"
	line "con otros #mon"
	cont "activos para"
	cont "eclosionar."

	para "<PLAYER>, eres la"
	line "única persona en"
	cont "quien confiamos."

	para "¡Llama al Prof."
	line "Elm cuando el"
	cont "Huevo eclosione!"
	done

.WalkAroundMovement:
	step_left
	step_left
	step_down
	step_left
	step_left
	step_end

.WalkStraightMovement:
	step_down
	step_left
	step_left
	step_left
	step_left
.WalkDownMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

VioletPokeCenter1FGameboyKidText:
	text "Un tipo llamado"
	line "Bill creó el"
	cont "sistema de"
	cont "almacenaje PC"
	cont "#mon."
	done

VioletPokeCenter1FGentlemanText:
	text "Fue hace unos"
	line "tres años."

	para "El Team Rocket"
	line "tramaba algo malo"
	cont "con #mon."

	para "Pero la justicia"
	line "prevaleció: un"
	cont "joven los"
	cont "desarticuló."
	done

VioletPokeCenter1FSageText:
	text "Algunos Bellsprout"
	line "se encuentran con"
	cont "Hoja Oro."

	para "Y algunos Oddish"
	line "se encuentran con"
	cont "Hoja Plata."

	para "Cierto tipo de"
	line "persona las"
	cont "valora mucho."
	done

VioletPokeCenter1FYoungsterText:
	text "Los #mon son"
	line "listos. No"

	para "obedecerán a un"
	line "entrenador que no"
	cont "respetan."

	para "Sin las Medallas"
	line "de Gimnasio"
	cont "correctas, harán"

	para "lo que les"
	line "plazca."
	done
