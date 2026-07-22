SaffronTrainStation_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_SAFFRONTRAINSTATION_ARRIVE_FROM_GOLDENROD

	def_callbacks

	def_warp_events
	warp_event  8, 17, SAFFRON_CITY, 6
	warp_event  9, 17, SAFFRON_CITY, 6
	warp_event  6,  5, GOLDENROD_MAGNET_TRAIN_STATION, 4
	warp_event 11,  5, GOLDENROD_MAGNET_TRAIN_STATION, 3

	def_coord_events
	coord_event 11,  6, SCENE_SAFFRONTRAINSTATION_ARRIVE_FROM_GOLDENROD, Script_ArriveFromGoldenrod

	def_bg_events

	def_object_events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationOfficerScript, -1
	object_event 11, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationGymGuideScript, -1
	object_event  6, 11, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronMagnetTrainStationTeacherText, EVENT_SAFFRON_TRAIN_STATION_POPULATION
	object_event  6, 10, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronMagnetTrainStationLassText, EVENT_SAFFRON_TRAIN_STATION_POPULATION

	object_const_def
	const SAFFRONTRAINSTATION_OFFICER

SaffronMagnetTrainStationOfficerScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumptextfaceplayer SaffronMagnetTrainStationOfficerTrainIsntOperatingText
	faceplayer
	opentext
	writetext SaffronMagnetTrainStationOfficerAreYouComingOnBoardText
	yesorno
	iffalse_jumpopenedtext SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText
	checkkeyitem PASS
	iffalse_jumpopenedtext SaffronMagnetTrainStationOfficerYouDontHaveAPassText
	writetext SaffronMagnetTrainStationOfficerRightThisWayText
	waitbutton
	closetext
	applymovement SAFFRONTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement
	setval $1
	special Special_MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applyonemovement PLAYER, turn_head_down
	wait 2
	end

Script_ArriveFromGoldenrod:
	applymovement SAFFRONTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement
	applymovement SAFFRONTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement
	showtext SaffronMagnetTrainStationOfficerArrivedInSaffronText
	turnobject PLAYER, DOWN
	end

SaffronMagnetTrainStationGymGuideScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer SaffronMagnetTrainStationGymGuideText_ReturnedMachinePart
	jumpthistextfaceplayer

	text "El Tren Imán es"
	line "un tren"
	cont "supermoderno"

	para "que usa"
	line "electricidad e"

	para "imanes para"
	line "alcanzar una"
	cont "velocidad"
	cont "increíble."

	para "Pero si no hay"
	line "electricidad…"
	done

SaffronMagnetTrainStationOfficerApproachTrainDoorMovement:
	step_up
	step_up
	step_right
	turn_head_left
	step_end

SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement:
	step_left
	step_down
	step_down
	step_end

SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement:
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	turn_head_up
	step_end

SaffronMagnetTrainStationOfficerTrainIsntOperatingText:
	text "Lo siento, pero el"
	line "Tren Imán no está"
	cont "operativo ahora."
	done

SaffronMagnetTrainStationOfficerAreYouComingOnBoardText:
	text "Partiremos pronto"
	line "hacia Ciudad"
	cont "Trigal."

	para "¿Vienes a bordo?"
	done

SaffronMagnetTrainStationOfficerRightThisWayText:
	text "¿Me enseñas tu"
	line "pase de tren, por"
	cont "favor?"

	para "Vale. Por aquí,"
	line "por favor."
	done

SaffronMagnetTrainStationOfficerYouDontHaveAPassText:
	text "Lo siento, pero no"
	line "tienes pase."
	done

SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText:
	text "Esperamos verte"
	line "de nuevo."
	done

SaffronMagnetTrainStationOfficerArrivedInSaffronText:
	text "Hemos llegado a"
	line "Azafrán."

	para "Esperamos verte"
	line "de nuevo."
	done


SaffronMagnetTrainStationGymGuideText_ReturnedMachinePart:
	text "Fiu…"

	para "¿Cuántas veces he"
	line "ido y venido entre"

	para "Kanto y Johto?"
	done

SaffronMagnetTrainStationTeacherText:
	text "Antes de que se"
	line "construyera la"

	para "estación del Tren"
	line "Imán, había una"
	cont "casa ahí."

	para "Ahí vivía una"
	line "niña llamada"
	cont "Copycat."
	done

SaffronMagnetTrainStationLassText:
	text "Hola. ¿Tienes un"
	line "pase de tren? Yo"

	para "tengo uno. Toda la"
	line "gente de Azafrán"

	para "que monta en el"
	line "Tren Imán tiene"
	cont "pase."
	done
