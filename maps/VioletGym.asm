VioletGym_MapScriptHeader:
	def_scene_scripts
	scene_script VioletGymFalknerAwayScene, SCENE_VIOLETGYM_FALKNER_AWAY
	scene_const SCENE_VIOLETGYM_NOOP

	def_callbacks

	def_warp_events
	warp_event  4, 17, VIOLET_CITY, 2
	warp_event  5, 17, VIOLET_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, VioletGymStatue
	bg_event  6, 15, BGEVENT_READ, VioletGymStatue

	def_object_events
	object_event  4, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DARK_CAVE_FALKNER
	object_event  5,  2, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, EVENT_VIOLET_GYM_FALKNER
	object_event  7,  7, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperRod, EVENT_VIOLET_GYM_FALKNER
	object_event  2, 11, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperAbe, EVENT_VIOLET_GYM_FALKNER
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuyScript, EVENT_VIOLET_GYM_FALKNER

	object_const_def
	const VIOLETGYM_GYM_GUY2

VioletGymFalknerAwayScene:
	sdefer .Script
	end

.Script:
	showemote EMOTE_SHOCK, VIOLETGYM_GYM_GUY2, 15
	applyonemovement VIOLETGYM_GYM_GUY2, step_down
	showtext VioletGymGuyFalknerAwayText
	turnobject PLAYER, DOWN
	warpcheck
	warpsound
	newloadmap MAPSETUP_DOOR
	end

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftruefwd .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	givebadge ZEPHYRBADGE, JOHTO_REGION
.FightDone:
	checkevent EVENT_GOT_TM31_ROOST
	iftrue_jumpopenedtext FalknerFightDoneText
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOOP
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	promptbutton
	verbosegivetmhm TM_ROOST
	setevent EVENT_GOT_TM31_ROOST
	jumpthisopenedtext

	text "Al usar una MT, un"
	line "#mon aprenderá"
	cont "un movimiento"
	cont "nuevo al instante."

	para "Una MT se puede"
	line "usar tantas veces"
	cont "como quieras."

	para "La MT51 contiene"
	line "Reposo."

	para "Aterriza para"
	line "restaurar la mitad"
	cont "de los PS máx."
	done

GenericTrainerBird_keeperRod:
	generictrainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, Bird_keeperRodSeenText, Bird_keeperRodBeatenText

	text "¡Las habilidades"
	line "de Pegaso son"
	cont "reales!"

	para "¡No te confíes"
	line "solo porque me"
	cont "hayas ganado!"
	done

GenericTrainerBird_keeperAbe:
	generictrainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, Bird_keeperAbeSeenText, Bird_keeperAbeBeatenText

	text "Qué patético,"
	line "perder contra un"
	cont "novato…"
	done

VioletGymGuyScript:
	checkevent EVENT_BEAT_FALKNER
	iftrue_jumptextfaceplayer VioletGymGuyWinText
	jumpthistextfaceplayer

	text "¡Oye! No soy"
	line "entrenador, pero"
	cont "puedo darte algún"
	cont "consejo."

	para "¡Créeme! Si"
	line "crees, un sueño de"

	para "campeonato puede"
	line "hacerse realidad."

	para "¿Me crees?"
	line "Entonces escucha."

	para "El tipo Planta es"
	line "débil contra el"

	para "tipo Volador. Ten"
	line "esto en mente."
	done

VioletGymStatue:
	gettrainername FALKNER, 1, STRING_BUFFER_4
	checkflag ENGINE_ZEPHYRBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 8, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

FalknerIntroText:
	text "Soy Pegaso, el"
	line "Líder del Gimnasio"
	cont "#mon de Ciudad"
	cont "Malva."

	para "Dicen que puedes"
	line "recortarle las"

	para "alas a los #mon"
	line "de tipo Volador"
	cont "con una descarga"
	cont "eléctrica…"

	para "¡No permitiré"
	line "tales insultos a"
	cont "los #mon"
	cont "voladores!"

	para "¡Te mostraré el"
	line "verdadero poder de"

	para "estas magníficas"
	line "aves #mon!"
	done

FalknerWinLossText:
	text "…¡Vaya! El #mon"
	line "ave preciado de mi"
	cont "padre…"

	para "Está bien."
	line "Toma esto."

	para "Es la Medalla"
	line "Céfiro oficial de"
	cont "la Liga #mon."
	done

FalknerZephyrBadgeText:
	text "La Medalla Céfiro"
	line "te permite"
	cont "controlar"

	para "#mon, incluso"
	line "intercambiados,"
	cont "hasta el <LV>20."

	para "Toma esto"
	line "también."
	done


FalknerFightDoneText:
	text "Hay Gimnasios"
	line "#mon en las"
	cont "ciudades y pueblos"
	cont "que te esperan."

	para "Deberías poner a"
	line "prueba tus"
	cont "habilidades en"
	cont "esos Gimnasios."

	para "¡Voy a entrenar"
	line "más duro para"

	para "convertirme en el"
	line "mejor maestro de"
	cont "aves!"
	done

Bird_keeperRodSeenText:
	text "¡La palabra clave"
	line "es agallas!"

	para "Aquí entrenamos"
	line "noche y día para"

	para "ser maestros de"
	line "#mon ave."

	para "¡Vamos!"
	done

Bird_keeperRodBeatenText:
	text "¡Aaargh!"
	done

Bird_keeperAbeSeenText:
	text "¡Veamos si eres"
	line "lo bastante bueno"
	cont "para enfrentarte a"
	cont "Pegaso!"
	done

Bird_keeperAbeBeatenText:
	text "¡Esto no puede"
	line "ser verdad!"
	done


VioletGymGuyWinText:
	text "¡Buen combate!"
	line "¡Sigue así y serás"

	para "el Campeón en un"
	line "abrir y cerrar de"
	cont "ojos!"
	done

VioletGymGuyFalknerAwayText:
	text "¡Oye! No puedes"
	line "retar a Pegaso"
	cont "ahora mismo."

	para "Está en la Cueva"
	line "Oscura domando a"

	para "un Ursaring que"
	line "atacó a un joven"
	cont "entrenador."

	para "Vuelve más tarde."
	done
