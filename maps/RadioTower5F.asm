RadioTower5F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_RADIOTOWER5F_FAKE_DIRECTOR
	scene_const SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_const SCENE_RADIOTOWER5F_NOOP

	def_callbacks

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event 12,  0, RADIO_TOWER_4F, 3

	def_coord_events
	coord_event  0,  3, SCENE_RADIOTOWER5F_FAKE_DIRECTOR, FakeDirectorScript
	coord_event 16,  5, SCENE_RADIOTOWER5F_ROCKET_BOSS, RadioTower5FRocketBossTrigger

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, SignpostRadioTower5FOffice
	bg_event 11,  0, BGEVENT_JUMPTEXT, SignpostRadioTower5FStudio
	bg_event 15,  0, BGEVENT_JUMPTEXT, SignpostRadioTower5FStudio

	def_object_events
	object_event  3,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower5FDirectorText, EVENT_RADIO_TOWER_DIRECTOR
	object_event  0,  4, SPRITE_PETREL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Petrel1Script, EVENT_RADIO_TOWER_PETREL
	object_event 13,  5, SPRITE_ARCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 17,  2, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAriana1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BenText, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	itemball_event  8,  5, ZOOM_LENS, 1, EVENT_RADIO_TOWER_5F_ZOOM_LENS

	object_const_def
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_PETREL
	const RADIOTOWER5F_ARCHER
	const RADIOTOWER5F_ARIANA

FakeDirectorScript:
	turnobject RADIOTOWER5F_DIRECTOR, UP
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	showtext FakeDirectorTextBefore1
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	special SaveMusic
	playmusic MUSIC_ROCKET_ENCOUNTER
	showtext FakeDirectorTextBefore2
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorSpinMovement
	appear RADIOTOWER5F_PETREL
	disappear RADIOTOWER5F_DIRECTOR
	turnobject RADIOTOWER5F_PETREL, UP
	pause 10
Petrel1Script:
	checkevent EVENT_BEAT_PETREL_1
	iftrue_jumptextfaceplayer FakeDirectorTextAfter
	setscene SCENE_RADIOTOWER5F_ROCKET_BOSS
	faceplayer
	showtext FakeDirectorTextBefore3
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_PETREL
	loadtrainer PETREL, PETREL1
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	promptbutton
	verbosegivekeyitem BASEMENT_KEY
	closetext
	setevent EVENT_BEAT_PETREL_1
	end

GenericTrainerAriana1:
	generictrainer ARIANA, ARIANA1, EVENT_BEAT_ARIANA_1, Ariana1SeenText, Ariana1BeatenText

	text "<PLAYER>, ¿Verdad?"

	para "Un mocoso como tú"
	line "no apreciará"

	para "la grandeza del"
	line "Team Rocket."

	para "Qué pena. La"
	line "verdad es que"
	cont "admiro tu poder."
	done

RadioTower5FRocketBossTrigger:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject RADIOTOWER5F_ARCHER, RIGHT
	showtext RadioTower5FRocketBossBeforeText
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_ARCHER
	loadtrainer ARCHER, ARCHER1
	startbattle
	reloadmapafterbattle
	showtext RadioTower5FRocketBossAfterText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ARCHER
	disappear RADIOTOWER5F_ARIANA
	pause 15
	special Special_FadeInQuickly
	setevent EVENT_BEAT_ARCHER_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_DRAGON_TAMER_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_DRAGON_TAMER_DOES_NOT_BLOCK_GYM
	special PlayMapMusic
	disappear RADIOTOWER5F_PETREL
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 12, 0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower5FDirectorThankYouText
	promptbutton
	verbosegivekeyitem CLEAR_BELL
	writetext RadioTower5FDirectorDescribeClearBellText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOOP
	setmapscene ECRUTEAK_HOUSE, SCENE_ECRUTEAKHOUSE_SAGE_BLOCKS
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 3, 6
	appear RADIOTOWER5F_DIRECTOR
	end

FakeDirectorMovement:
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

FakeDirectorSpinMovement:
	turn_head_left
	turn_head_down
	turn_head_right
	turn_head_up
	turn_head_left
	turn_head_down
	turn_head_right
	turn_head_up
	turn_head_left
	turn_head_down
	turn_head_right
	turn_head_up
	step_sleep 8
	step_end

RadioTower5FDirectorWalksIn:
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_left
	step_end

RadioTower5FDirectorWalksOut:
	step_right
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

RadioTower5FPlayerTwoStepsLeftMovement:
	step_left
	step_left
	step_end

FakeDirectorTextBefore1:
	text "¡T-tú! ¿Has venido"
	line "a rescatarme?"
	done

FakeDirectorTextBefore2:
	text "¿Eso es lo que"
	line "esperabas?"

	para "¡Te equivocas!"
	line "¡Soy un impostor!"
	done

FakeDirectorTextBefore3:
	text "Fingí ser el"
	line "verdadero para"

	para "preparar nuestra"
	line "toma de poder."

	para "¿Quieres saber"
	line "dónde escondimos"
	cont "al Director real?"

	para "Claro, te lo diré."
	line "¡Pero solo si"
	cont "puedes vencerme!"
	done

FakeDirectorWinText:
	text "Vale, vale. Te"
	line "diré dónde está."
	done

FakeDirectorTextAfter:
	text "Escondimos al"
	line "Director real en"

	para "el Almacén"
	line "Subterráneo."

	para "Está al final del"
	line "todo del"
	cont "Subterráneo."

	para "Pero dudo que"
	line "llegues tan"
	cont "lejos."
	done

Ariana1SeenText:
	text "¿Te acuerdas de mí"
	line "del escondite en"
	cont "Pueblo Caoba?"

	para "Perdí entonces,"
	line "pero esta vez no."
	done

Ariana1BeatenText:
	text "¡Esto no puede"
	line "estar pasando!"

	para "Luché con todo,"
	line "pero aun así"
	cont "perdí…"
	done

RadioTower5FRocketBossBeforeText:
	text "¿Oh? ¿Has llegado"
	line "hasta aquí?"

	para "Debes de ser un"
	line "buen entrenador."

	para "Pretendemos"
	line "hacernos con esta"

	para "Emisora de Radio"
	line "y anunciar"
	cont "nuestro regreso."

	para "Eso debería traer"
	line "de vuelta a"

	para "nuestro jefe"
	line "Giovanni de su"
	cont "entrenamiento en"
	cont "solitario."

	para "Vamos a recuperar"
	line "nuestra antigua"
	cont "gloria."

	para "No permitiré que"
	line "interfieras con"
	cont "nuestros planes."
	done

RadioTower5FRocketBossWinText:
	text "¡No! ¡Perdóname,"
	line "Giovanni!"
	done

RadioTower5FRocketBossAfterText:
	text "¿Cómo puede ser"
	line "esto?"

	para "Nuestros sueños"
	line "se han quedado en"
	cont "nada."

	para "No estuve a la"
	line "altura después de"
	cont "todo."

	para "Como hizo Giovanni"
	line "antes que yo,"

	para "disolveré al Team"
	line "Rocket hoy mismo."

	para "Adiós."
	done

RadioTower5FDirectorThankYouText:
	text "Director: <PLAYER>,"
	line "¡gracias!"

	para "Tus valientes"
	line "acciones han"
	cont "salvado a"
	cont "#mon en todo el"
	cont "país."

	para "Sé que no es"
	line "mucho, pero por"
	cont "favor, toma esto."
	done

RadioTower5FDirectorDescribeClearBellText:
	text "Antes había una"
	line "torre aquí mismo"
	cont "en Ciudad"
	cont "Trigal."

	para "Pero era vieja y"
	line "crujía."

	para "Así que la"
	line "sustituimos por"
	cont "nuestra Torre de"
	cont "Radio."

	para "Desenterramos esa"
	line "campana durante"
	cont "la construcción."

	para "Oí que todo tipo"
	line "de #mon vivían"

	para "en Trigal en el"
	line "pasado."

	para "Quizás…"

	para "Esa campana tenga"
	line "alguna conexión"

	para "con la Torre"
	line "Campana en"
	cont "Ciudad Iris…"

	para "¡Ah!"

	para "Eso me recuerda…"

	para "Oí al Team Rocket"
	line "susurrando."

	para "Al parecer, algo"
	line "está pasando en"
	cont "la Torre Campana."

	para "No tengo ni idea"
	line "de qué está"
	cont "pasando,"

	para "pero deberías"
	line "echar un vistazo."

	para "Bueno, mejor voy a"
	line "mi despacho."
	done

RadioTower5FDirectorText:
	text "Director: ¡Hola,"
	line "<PLAYER>!"

	para "Sabes, me encantan"
	line "los #mon."

	para "Construí esta"
	line "Torre de Radio"

	para "para expresar mi"
	line "amor por los"
	cont "#mon."

	para "Estaría bien que"
	line "la gente"
	cont "disfrutara de"
	cont "nuestros"
	cont "programas."
	done

BenText:
	text "Ben: ¿Escuchas"
	line "nuestra música?"
	done

SignpostRadioTower5FOffice:
	text "5F Despacho del"
	line "  Director"
	done

SignpostRadioTower5FStudio:
	text "5F Estudio 1"
	done
