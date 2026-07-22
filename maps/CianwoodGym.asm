CianwoodGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, CianwoodGymBouldersCallback
	callback MAPCALLBACK_STONETABLE, CianwoodGymSetUpStoneTable

	def_warp_events
	warp_event 12, 17, CIANWOOD_CITY, 2
	warp_event 13, 17, CIANWOOD_CITY, 2
	warp_event 12,  4, CIANWOOD_GYM, 1 ; for stonetable
	warp_event 13,  4, CIANWOOD_GYM, 2 ; for stonetable

	def_coord_events

	def_bg_events
	bg_event 11, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event 14, 15, BGEVENT_READ, CianwoodGymStatue

	def_object_events
	object_event 12, 11, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	object_event 12, 11, SPRITE_BIG_HO_OH, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptext, CianwoodGymChuckTrainingText, EVENT_BOULDERS_IN_CIANWOOD_GYM
	object_event 13, 11, SPRITE_BOULDER_ROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CianwoodGymChucksBoulderText, -1
	strengthboulder_event  9,  4, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	strengthboulder_event 16,  4, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	object_event 12,  4, SPRITE_BOULDER_ROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CianwoodGymBoulderText, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	object_event 13,  4, SPRITE_BOULDER_ROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CianwoodGymBoulderText, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	object_event  5, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltYoshi, -1
	object_event 21, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltLao, -1
	object_event  9,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltNob, -1
	object_event 20,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltLung, -1
	object_event 15, 15, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodGymBlackBeltText, -1

	object_const_def
	const CIANWOODGYM_CHUCK1
	const CIANWOODGYM_CHUCK2
	const CIANWOODGYM_BOULDER1
	const CIANWOODGYM_BOULDER2
	const CIANWOODGYM_BOULDER3
	const CIANWOODGYM_BOULDER4
	const CIANWOODGYM_BOULDER5

CianwoodGymBouldersCallback:
	checkevent EVENT_BOULDERS_IN_CIANWOOD_GYM
	iftruefwd .WaterfallBlocked
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	endcallback

.WaterfallBlocked:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	changeblock 12,  4, $83
	changeblock 12,  6, $7d
	changeblock 12,  8, $7d
	changeblock 12, 10, $8f
	endcallback

CianwoodGymSetUpStoneTable:
	usestonetable .StoneTable
	endcallback

.StoneTable:
	stonetable 3, CIANWOODGYM_BOULDER2, .Boulder2
	stonetable 4, CIANWOODGYM_BOULDER3, .Boulder3
	db -1

.Boulder2:
	appear CIANWOODGYM_BOULDER4
	disappear CIANWOODGYM_BOULDER2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iffalsefwd .Done
	sjumpfwd .BlockWaterfall

.Boulder3:
	appear CIANWOODGYM_BOULDER5
	disappear CIANWOODGYM_BOULDER3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftruefwd .BlockWaterfall
.Done:
	end

.BlockWaterfall:
	appear CIANWOODGYM_CHUCK1
	disappear CIANWOODGYM_CHUCK2
	applyonemovement PLAYER, step_end
	reanchormap
	pause 10
	playsound SFX_STRENGTH
	changeblock 12,  4, $98
	refreshmap
	pause 7
	changeblock 12,  4, $83
	changeblock 12,  6, $94
	refreshmap
	pause 7
	changeblock 12,  6, $95
	refreshmap
	pause 7
	changeblock 12,  6, $96
	refreshmap
	pause 7
	changeblock 12,  6, $97
	refreshmap
	pause 7
	changeblock 12,  6, $7d
	changeblock 12,  8, $94
	refreshmap
	pause 7
	changeblock 12,  8, $95
	refreshmap
	pause 7
	changeblock 12,  8, $96
	refreshmap
	pause 7
	changeblock 12,  8, $97
	refreshmap
	pause 7
	changeblock 12,  8, $7d
	changeblock 12, 10, $8f
	refreshmap
	jumpthistext

	text "¡Las rocas"
	line "bloquearon la"
	cont "cascada!"
	done

CianwoodGymChuckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftruefwd .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	turnobject CIANWOODGYM_CHUCK1, RIGHT
	showtext ChuckIntroText2
	applymovement CIANWOODGYM_BOULDER1, CianwoodGymMovement_ChuckChucksBoulder
	playsound SFX_STRENGTH
	earthquake 80
	disappear CIANWOODGYM_BOULDER1
	pause 30
	showtextfaceplayer ChuckIntroText3
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	givebadge STORMBADGE, JOHTO_REGION
	specialphonecall SPECIALCALL_YELLOWFOREST
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue_jumpopenedtext ChuckAfterText
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	promptbutton
	verbosegivetmhm TM_DYNAMICPUNCH
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	jumpthisopenedtext

	text "Eso es Puño"
	line "Dinámico."

	para "No siempre"
	line "acierta, pero"

	para "cuando lo hace,"
	line "causa confusión!"
	done

GenericTrainerBlackbeltYoshi:
	generictrainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText

	text "¡Parece que tú"
	line "también tienes un"
	cont "vínculo fuerte"
	cont "con tu #mon!"
	done

GenericTrainerBlackbeltLao:
	generictrainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText

	text "Los #mon de"
	line "lucha temen a"
	cont "los psíquicos…"
	done

GenericTrainerBlackbeltNob:
	generictrainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText

	text "¡Perdí!"
	line "¡Me he quedado"
	cont "sin palabras!"
	done

GenericTrainerBlackbeltLung:
	generictrainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText

	text "Mi #mon"
	line "perdió…"
	cont "Mi… mi orgullo"
	cont "está hecho"
	cont "trizas…"
	done

CianwoodGymStatue:
	gettrainername CHUCK, 1, STRING_BUFFER_4
	checkflag ENGINE_STORMBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 12, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

CianwoodGymMovement_ChuckChucksBoulder:
	fix_facing
	set_sliding
	run_step_left
	run_step_up
	fast_jump_step_right
	remove_sliding
	remove_fixed_facing
	step_end

ChuckIntroText1:
	text "¡AAAARGH!"

	para "El agua me cae"
	line "justo en la"
	cont "cabeza…"

	para "¿Por qué paraste"
	line "la cascada?"

	para "¡Acabas de"
	line "arruinar mi"
	cont "entrenamiento!"

	para "Te lo advierto,"
	line "¡soy duro!"

	para "¡Mis #mon"
	line "aplastarán piedras"
	cont "y romperán huesos!"

	para "¡Mira esto!"
	done

ChuckIntroText2:
	text "Aníbal: ¡Urgh!"
	line "…"

	para "¡Oooargh!"
	done

ChuckIntroText3:
	text "¡Toma! ¿Ahora sí"
	line "tienes miedo?"

	para "¿Qué?"
	line "¿Que no tiene que"

	para "ver con los"
	line "#mon?"
	cont "¡Es verdad!"

	para "Vamos. ¡Vamos a"
	line "combatir!"
	done

ChuckLossText:
	text "¿Qué? ¿Eh?"
	line "¿He perdido?"

	para "¡Vaya!"
	line "¡Mereces la"
	cont "Medalla Tormenta!"
	done

ChuckExplainBadgeText:
	text "La Medalla"
	line "Tormenta permite"
	cont "a tus #mon"
	cont "usar Vuelo"

	para "para ir a"
	line "cualquier ciudad"
	cont "o pueblo que ya"
	cont "hayas visitado."

	para "Toma, ¡esto"
	line "también!"
	done

ChuckAfterText:
	text "¡JAJAJA! ¡Disfruté"
	line "combatiendo"
	cont "contigo!"

	para "¡Pero una derrota"
	line "es una derrota!"

	para "A partir de ahora,"
	line "entrenaré 24"
	cont "horas al día!"
	done

BlackbeltYoshiSeenText:
	text "Mi #mon y yo"
	line "estamos unidos"
	cont "por la amistad."

	para "¡Nuestro vínculo"
	line "nunca se romperá!"
	done

BlackbeltYoshiBeatenText:
	text "¡Esto no puede"
	line "ser real!"
	done

BlackbeltLaoSeenText:
	text "¡Los artistas"
	line "marciales no"
	cont "tememos nada!"
	done

BlackbeltLaoBeatenText:
	text "¡Qué impacto!"
	done

BlackbeltNobSeenText:
	text "Las palabras"
	line "sobran. ¡Deja que"
	cont "hablen tus puños!"
	done

BlackbeltNobBeatenText: ; text > text
	text "…"
	done

BlackbeltLungSeenText:
	text "Mis puños"
	line "furiosos harán"
	cont "trizas a"
	cont "tu #mon!"
	done

BlackbeltLungBeatenText:
	text "¡Quedé hecho"
	line "trizas!"
	done

CianwoodGymBlackBeltText:
	text "El guía del"
	line "Gimnasio nos tiene"
	cont "demasiado miedo"
	cont "para quedarse."

	para "¡Qué blandengue!"
	done

CianwoodGymChuckTrainingText:
	text "Está tan metido"
	line "en su"
	cont "entrenamiento que"
	cont "no se da cuenta"
	cont "de ti."
	done

CianwoodGymBoulderText:
	text "La roca está"
	line "bloqueando la"
	cont "cascada."
	done

CianwoodGymChucksBoulderText:
	text "La roca pesa"
	line "demasiado para"
	cont "moverla."
	done
