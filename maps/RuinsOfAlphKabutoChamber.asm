RuinsOfAlphKabutoChamber_MapScriptHeader:
	def_scene_scripts
	scene_script RuinsOfAlphKabutoChamberCheckWallScene, SCENE_RUINSOFALPHKABUTOCHAMBER_CHECK_WALL
	scene_const SCENE_RUINSOFALPHKABUTOCHAMBER_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsofAlphKabutoChamberHiddenDoorsCallback

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 4
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 5
	warp_event  4,  0, RUINS_OF_ALPH_KABUTO_ITEM_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  3,  2, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost2Script
	bg_event  4,  2, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost3Script
	bg_event  3,  0, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost4Script
	bg_event  4,  0, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost5Script

	def_object_events
	object_event  5,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, RuinsOfAlphKabutoChamberReceptionistText, EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	object_event  3,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberScientistScript, -1

RuinsOfAlphKabutoChamberCheckWallScene:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iffalsefwd .End
	sdefer RuinsofAlphKabutoChamberWallOpenScript
.End
	end

RuinsofAlphKabutoChamberHiddenDoorsCallback:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftruefwd .WallOpen
	changeblock 4, 0, $24
.WallOpen:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalsefwd .FloorClosed
	endcallback

.FloorClosed:
	changeblock 2, 2, $1
	changeblock 4, 2, $2
	endcallback

RuinsofAlphKabutoChamberWallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $25
	refreshmap
	earthquake 50
	setscene SCENE_RUINSOFALPHKABUTOCHAMBER_NOOP
	endtext

MapRuinsofAlphKabutoChamberSignpost2Script:
	reanchormap
	setval $0
	special Special_UnownPuzzle
	closetext
	iftruefwd .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_KABUTO_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_A_TO_J
	setevent EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $14
	changeblock 4, 2, $15
	refreshmap
	playsound SFX_STRENGTH
	earthquake 80
	applyonemovement PLAYER, skyfall_top
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

RuinsOfAlphKabutoChamberScientistScript:
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .AllUnownCaught
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue_jumptextfaceplayer RuinsOfAlphKabutoChamberScientistHoleText
	faceplayer
	opentext
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalsefwd .PuzzleIncomplete
	writetext RuinsOfAlphKabutoChamberScientistTremorText
	promptbutton
.PuzzleIncomplete:
	writetext RuinsOfAlphKabutoChamberScientistCrypticText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

.AllUnownCaught:
	jumptextfaceplayer RuinsOfAlphResearchCenterScientist1Text_GotAllUnown

MapRuinsofAlphKabutoChamberSignpost3Script:
	opentext
	unowntypeface
	writetext RuinsOfAlphKabutoChamberDescriptionText
	waitbutton
	closetext
	restoretypeface
	special RefreshSprites
	end

MapRuinsofAlphKabutoChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue_jumptext RuinsOfAlphAerodactylChamberWallHoleText
MapRuinsofAlphKabutoChamberSignpost4Script:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	iftruefwd .unsolved
	writetext RuinsOfAlphChambersItsUnownText
	sjumpfwd .unownwords
.unsolved
	writetext RuinsOfAlphAerodactylChamberWallPatternLeftText
.unownwords
	setval $0
	special Special_DisplayUnownWords
	endtext

RuinsOfAlphKabutoChamberReceptionistText:
	text "Bienvenido a esta"
	line "cámara."

	para "Hay paneles"
	line "deslizantes que"
	cont "muestran un"
	cont "#mon dibujado"
	cont "por los antiguos."

	para "Desliza los"
	line "paneles para"
	cont "formar la imagen."

	para "A la derecha hay"
	line "una descripción"
	cont "del #mon."

	para "Científicos al"
	line "fondo examinan"

	para "unos patrones"
	line "recién"
	cont "encontrados."
	done

RuinsOfAlphKabutoChamberScientistCrypticText:
	text "Hace poco"
	line "aparecieron"
	cont "patrones extraños"
	cont "y crípticos."

	para "Qué raro. No"
	line "estaban hace"
	cont "poco…"

	para "Deberías mirar"
	line "las paredes."
	done

RuinsOfAlphKabutoChamberScientistHoleText:
	text "¡Ah! ¡Aquí hay"
	line "otro agujero"
	cont "enorme!"

	para "¡Es lo bastante"
	line "grande para pasar"
	cont "por él!"
	done

RuinsOfAlphKabutoChamberScientistTremorText:
	text "¡Ese temblor fue"
	line "bastante"
	cont "aterrador!"

	para "Pero me preocupa"
	line "más este muro"
	cont "de aquí…"
	done

RuinsOfAlphKabutoChamberDescriptionText:
	text "Un #mon que se"
	line "escondía en el"
	cont "fondo marino."

	para "Ojos en su espalda"
	line "escaneaban el"
	cont "área."
	done
