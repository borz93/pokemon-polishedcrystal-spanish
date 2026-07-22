PowerPlant_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_POWERPLANT_NOOP
	scene_const SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL

	def_callbacks
	callback MAPCALLBACK_TILES, PowerPlantTurbinesCallback

	def_warp_events
	warp_event  2, 17, ROUTE_10_NORTH, 2
	warp_event  3, 17, ROUTE_10_NORTH, 2

	def_coord_events
	coord_event  5, 12, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL, PowerPlantGuardPhoneScript

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  1,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  4, 14, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficerScript, -1
	object_event  2,  9, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide1Script, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide2Script, -1
	object_event  9,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficer2Script, -1
	object_event  7,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide4Script, -1
	object_event 14, 10, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantManager, -1
	object_event  5,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, PowerPlantForestText, -1

	object_const_def
	const POWERPLANT_OFFICER1
	const POWERPLANT_GYM_GUY1
	const POWERPLANT_GYM_GUY2

PowerPlantTurbinesCallback:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalsefwd .Done
	changeblock 12, 6, $12
	changeblock 14, 6, $47
	changeblock 12, 12, $16
	changeblock 12, 14, $16
.Done:
	endcallback

PowerPlantGuardPhoneScript:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, POWERPLANT_OFFICER1, 15
	waitsfx
	pause 30
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ApproachGymGuide2Movement
	turnobject POWERPLANT_GYM_GUY1, DOWN
	turnobject POWERPLANT_GYM_GUY2, DOWN
	showtext PowerPlantOfficer1CeruleanShadyCharacterText
	turnobject POWERPLANT_OFFICER1, LEFT
	turnobject PLAYER, RIGHT
	showtext PowerPlantOfficer1CouldIAskForYourCooperationText
	turnobject PLAYER, DOWN
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ReturnToPostMovement
	setscene SCENE_POWERPLANT_NOOP
	end

PowerPlantOfficerScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantOfficer1HaveToBeefUpSecurityText
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue_jumptextfaceplayer PowerPlantOfficer1CouldIAskForYourCooperationText
	jumpthistextfaceplayer

	text "Un ladrón entró en"
	line "la Central"
	cont "Eléctrica…"

	para "¿A dónde va el"
	line "mundo?"
	done

PowerPlantGymGuide1Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantGymGuide1GeneratorUpAndRunningText
	jumpthistextfaceplayer

	text "Alguien se llevó"
	line "una pieza esencial"

	para "para el"
	line "generador."

	para "Sin ella, ¡el"
	line "generador nuevo es"
	cont "inútil!"
	done

PowerPlantGymGuide2Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantGymGuide2GeneratorIsRunningAgainText
	jumpthistextfaceplayer

	text "Esta Central"
	line "Eléctrica había"
	cont "sido abandonada"
	cont "en el pasado."

	para "La reactivamos"
	line "para dar energía"

	para "al Tren Imán."
	done

PowerPlantOfficer2Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantOfficer2ManagerHasBeenCheerfulText
	jumpthistextfaceplayer

	text "El Gerente de la"
	line "Central Eléctrica"
	cont "está más adelante."

	para "Pero desde que"
	line "alguien destrozó"
	cont "el generador, ha"
	cont "estado triste y"
	cont "furioso a la"
	cont "vez…"
	done

PowerPlantGymGuide4Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantGymGuide4WeCanGetMagnetTrainRunningText
	jumpthistextfaceplayer

	text "El Tren Imán"
	line "consume mucha"
	cont "electricidad."

	para "No puede moverse"
	line "si el generador"
	cont "nuevo no funciona."
	done

PowerPlantManager:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd PowerPlantTutorZapCannonScript
	checkkeyitem MACHINE_PART
	iftruefwd .FoundMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue_jumpopenedtext PowerPlantManagerIWontForgiveCulpritText
	writetext PowerPlantManagerWhoWouldRuinMyGeneratorText
	waitbutton
	closetext
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	setmapscene CERULEAN_GYM, SCENE_CERULEANGYM_GRUNT_RUNS_OUT
	setscene SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL
	end

.FoundMachinePart:
	writetext PowerPlantManagerThatsThePartText
	waitbutton
	closetext
	takekeyitem MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
	setmapscene ROUTE_10_NORTH, SCENE_ROUTE10NORTH_LAWRENCE
	clearevent EVENT_LAWRENCE_ROUTE_10
	playsound SFX_SLOT_MACHINE_START
	special FadeOutPalettes
	special LoadMapPalettes
	pause 10
	special FadeInPalettes_EnableDynNoApply
	changeblock 12, 6, $12
	changeblock 14, 6, $47
	changeblock 12, 12, $16
	changeblock 12, 14, $16
	refreshmap
	pause 30
	opentext
	writetext PowerPlantManagerYouDeserveARewardText
	waitbutton
PowerPlantTutorZapCannonScript:
	writetext Text_PowerPlantTutorZapCannon
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_PowerPlantTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval ZAP_CANNON
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Como quieras."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "¡Lo siento, pero"
	line "no puedo enseñar"

	para "Electrocañón sin"
	line "esa hoja!"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Tu #mon ya"
	line "sabe"
	cont "Electrocañón!"

	para "¡Wajajajá!"
	done

PowerPlantOfficer1ApproachGymGuide2Movement:
	step_right
	step_right
	step_up
	step_up
	step_end

PowerPlantOfficer1ReturnToPostMovement:
	step_down
	step_down
	step_left
	step_left
	turn_head_down
	step_end


PowerPlantOfficer1CeruleanShadyCharacterText:
	text "Me acaban de"
	line "avisar desde"
	cont "Celeste."

	para "Al parecer, un"
	line "sospechoso ronda"

	para "por la zona."
	done

PowerPlantOfficer1CouldIAskForYourCooperationText:
	text "¿Podría pedirte"
	line "tu ayuda?"
	done

PowerPlantOfficer1HaveToBeefUpSecurityText:
	text "Tendremos que"
	line "reforzar la"
	cont "seguridad."
	done


PowerPlantGymGuide1GeneratorUpAndRunningText:
	text "El generador está"
	line "en marcha. Está"

	para "produciendo"
	line "electricidad de"
	cont "sobra."
	done


PowerPlantGymGuide2GeneratorIsRunningAgainText:
	text "¡El generador"
	line "funciona de nuevo!"
	done


PowerPlantOfficer2ManagerHasBeenCheerfulText:
	text "Desde que"
	line "arreglaron el"
	cont "generador,"

	para "el Gerente está"
	line "más animado."
	done


PowerPlantGymGuide4WeCanGetMagnetTrainRunningText:
	text "¡Muy bien! Por fin"
	line "podemos poner en"

	para "marcha el"
	line "Tren Imán."
	done

PowerPlantManagerWhoWouldRuinMyGeneratorText:
	text "Gerente: ¡Estoy"
	line "que exploto!"

	para "¿Quién se atreve"
	line "a arruinar mi"
	cont "generador?"

	para "¡Le dediqué tanto"
	line "tiempo!"

	para "Si lo atrapo,"
	line "probará mi"

	para "Electrocañón,"
	line "¡ya verá!"
	done

PowerPlantManagerIWontForgiveCulpritText:
	text "Gerente: ¡No le"
	line "perdonaré!"

	para "El culpable puede"
	line "llorar y"
	cont "disculparse,"

	para "¡pero le voy a"
	line "machacar igual!"

	para "¡Gajajajá!"
	done

PowerPlantManagerThatsThePartText:
	text "Gerente: ¡Ah, sí!"

	para "¡Es la pieza que"
	line "le faltaba a mi"
	cont "querido generador!"

	para "¿La encontraste?"
	line "¡Guau! ¡Gracias!"

	para "¡Vamos a poner el"
	line "generador en"
	cont "marcha!"
	done

PowerPlantManagerYouDeserveARewardText:
	text "¡Te mereces una"
	line "recompensa!"
	done

Text_PowerPlantTutorZapCannon:
	text "Gerente: ¡Puedo"
	line "enseñarle a tu"

	para "#mon a usar mi"
	line "Electrocañón!"

	para "No es que sea muy"
	line "preciso, pero"

	para "¡pega como un"
	line "camión!"

	para "Solo necesito una"
	line "Hoja Plateada."
	done


Text_PowerPlantTutorQuestion:
	text "¿Le enseño"
	line "Electrocañón a"
	cont "tu #mon?"
	done



PowerPlantForestText:
	text "Magneton se"
	line "comporta raro en"
	cont "el Túnel Roca."

	para "¿Tendrán algo que"
	line "ver las turbinas"

	para "de la Central"
	line "Eléctrica?"
	done
