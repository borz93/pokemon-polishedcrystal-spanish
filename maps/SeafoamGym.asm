SeafoamGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12, 20, SEAFOAM_ISLANDS_1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10, 20, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuyScript, EVENT_SEAFOAM_GYM_GYM_GUY
	object_event  7, 16, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerScientistLowell, -1
	object_event 14, 14, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerScientistDennett, -1
	object_event 19, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSupernerdCary, -1
	object_event 12,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 1, TrainerScientistLinden, -1
	object_event 10,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSupernerdWaldo, -1
	object_event  6, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSupernerdMerle, -1
	object_event 12, 11, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1

	object_const_def
	const SEAFOAMGYM_GYM_GUY

GenericTrainerScientistLowell:
	generictrainer SCIENTIST, LOWELL, EVENT_BEAT_SCIENTIST_LOWELL, ScientistLowellSeenText, ScientistLowellBeatenText

	text "Puede que estemos"
	line "en una cueva, pero"
	cont "siempre hacemos la"
	cont "colada."
	done

GenericTrainerScientistDennett:
	generictrainer SCIENTIST, DENNETT, EVENT_BEAT_SCIENTIST_DENNETT, ScientistDennettSeenText, ScientistDennettBeatenText

	text "¡Junto a Blaine,"
	line "reconstruiremos"
	cont "nuestro Gimnasio!"
	done

GenericTrainerSupernerdCary:
	generictrainer SUPER_NERD, CARY, EVENT_BEAT_SUPER_NERD_CARY, SupernerdCarySeenText, SupernerdCaryBeatenText

	text "La amargura lleva"
	line "a la mejora."
	done

TrainerScientistLinden:
	trainer SCIENTIST, LINDEN, EVENT_BEAT_SCIENTIST_LINDEN, ScientistLindenSeenText, ScientistLindenBeatenText, 0, .Script, TRAINERPAL_DARK_SCIENTIST

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "No todos los"
	line "científicos ayudan"
	cont "a los malos."
	done

GenericTrainerSupernerdWaldo:
	generictrainer SUPER_NERD, WALDO, EVENT_BEAT_SUPER_NERD_WALDO, SupernerdWaldoSeenText, SupernerdWaldoBeatenText

	text "¿Quién demonios"
	line "eres tú?"
	done

GenericTrainerSupernerdMerle:
	generictrainer SUPER_NERD, MERLE, EVENT_BEAT_SUPER_NERD_MERLE, SupernerdMerleSeenText, SupernerdMerleBeatenText

	text "No logré sentir lo"
	line "fuerte que eres."
	done

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftruefwd .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, 1
	startbattle
	reloadmapafterbattle
	iftruefwd .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUY
.ReturnAfterBattle:
	setevent EVENT_BEAT_BLAINE
	setevent EVENT_BEAT_SCIENTIST_LOWELL
	setevent EVENT_BEAT_SCIENTIST_DENNETT
	setevent EVENT_BEAT_SUPER_NERD_CARY
	setevent EVENT_BEAT_SCIENTIST_LINDEN
	setevent EVENT_BEAT_SUPER_NERD_WALDO
	setevent EVENT_BEAT_SUPER_NERD_MERLE
	opentext
	givebadge VOLCANOBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM61_WILL_O_WISP
	iftrue_jumpopenedtext BlaineFightDoneText
	writetext BlaineAfterBattleText
	promptbutton
	verbosegivetmhm TM_WILL_O_WISP
	setevent EVENT_GOT_TM61_WILL_O_WISP
	jumpthisopenedtext

	text "¡Se llama Fuego"
	line "Fatuo!"

	para "Debilita a tu"
	line "rival infligiendo"
	cont "una quemadura."

	para "Perdí esta vez,"
	line "pero ganaré la"
	cont "próxima."

	para "Cuando reconstruya"
	line "mi Gimnasio de"
	cont "Isla Canela,"

	para "tendremos que"
	line "tener una"
	cont "revancha."
	done

SeafoamGymGuyScript:
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	iftrue_jumptextfaceplayer SeafoamGymGuyWinText2
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	jumpthistextfaceplayer

	text "¡Eh!"

	para "…¿Eh? ¿Ya se"
	line "acabó?"

	para "¡Lo siento, lo"
	line "siento!"

	para "El Gimnasio de"
	line "Isla Canela había"
	cont "desaparecido, así"
	cont "que no sabía dónde"
	cont "encontrarte."

	para "Pero, oye, eres"
	line "muy fuerte incluso"
	cont "sin mi consejo."
	cont "¡Sabía que"
	cont "ganarías!"
	done

ScientistLowellSeenText:
	text "Esta bata blanca"
	line "me hace sentir más"
	cont "listo por alguna"
	cont "razón."
	done

ScientistLowellBeatenText:
	text "Una bata blanca es"
	line "la vida de un"
	cont "investigador."
	done

ScientistDennettSeenText:
	text "¡Blaine puede"
	line "haber perdido su"
	cont "Gimnasio, pero"
	cont "nunca se rinde!"
	done

ScientistDennettBeatenText:
	text "¡La perseverancia"
	line "de Blaine me"
	cont "motiva!"
	done

SupernerdCarySeenText:
	text "Vaya, ¿un"
	line "Gimnasio en una"
	cont "cueva como esta?"

	para "Me encantaría"
	line "explorarla."
	done

SupernerdCaryBeatenText:
	text "Una amarga"
	line "derrota…"
	done

ScientistLindenSeenText:
	text "Perdimos el"
	line "Gimnasio de Isla"
	cont "Canela, pero"
	cont "vinimos aquí."
	done

ScientistLindenBeatenText:
	text "Aceptamos la"
	line "derrota con"
	cont "elegancia…"
	done

SupernerdWaldoSeenText:
	text "Estoy recopilando"
	line "registros de"
	cont "combate."

	para "¿Puedes ayudarme?"
	done

SupernerdWaldoBeatenText:
	text "¡No esperaba que"
	line "fueras tan bueno!"
	done

SupernerdMerleSeenText:
	text "¡Oh!"
	line "¡Pareces fácil de"
	cont "vencer!"
	done

SupernerdMerleBeatenText:
	text "¡Perdona!"
	done

BlaineIntroText:
	text "Blaine: ¡Guaaah!"

	para "Mi Gimnasio de"
	line "Isla Canela se"
	cont "quemó."

	para "Mis #mon"
	line "lanzallamas y yo"

	para "nos quedamos sin"
	line "hogar por culpa"
	cont "del volcán."

	para "¡Guaaah!"

	para "Pero he vuelto al"
	line "negocio como Líder"

	para "de Gimnasio aquí"
	line "en esta cueva."

	para "Si logras"
	line "vencerme, te daré"
	cont "una Medalla."

	para "¡Ja! ¡Más te vale"
	line "tener un"
	cont "Antiquemad.!"
	done

BlaineWinLossText:
	text "Blaine: Increíble."
	line "Me he quemado por"
	cont "completo…"

	para "¡Has ganado la"
	line "Medalla Volcán!"
	done

BlaineAfterBattleText:
	text "Toma, te daré esto"
	line "también."
	done

BlaineFightDoneText:
	text "Blaine: Mis"
	line "#mon de fuego"
	cont "serán aún más"
	cont "fuertes. ¡Ya lo"
	cont "verás!"
	done

SeafoamGymGuyWinText2:
	text "Un Gimnasio"
	line "#mon puede"
	cont "estar en"

	para "cualquier sitio"
	line "mientras el Líder"
	cont "esté ahí."

	para "No hace falta un"
	line "edificio."
	done
