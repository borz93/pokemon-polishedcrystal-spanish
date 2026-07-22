GoldenrodMagnetTrainStation_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_GOLDENRODMAGNETTRAINSTATION_ARRIVE_FROM_SAFFRON

	def_callbacks

	def_warp_events
	warp_event  8, 17, GOLDENROD_CITY, 5
	warp_event  9, 17, GOLDENROD_CITY, 5
	warp_event  6,  5, SAFFRON_TRAIN_STATION, 4
	warp_event 11,  5, SAFFRON_TRAIN_STATION, 3

	def_coord_events
	coord_event 11,  6, SCENE_GOLDENRODMAGNETTRAINSTATION_ARRIVE_FROM_SAFFRON, Script_ArriveFromSaffron

	def_bg_events

	def_object_events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationOfficerScript, -1
	object_event 11, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodMagnetTrainStationGentlemanText, EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
	object_event  6, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationCooltrainerfScript, -1

	object_const_def
	const GOLDENRODMAGNETTRAINSTATION_OFFICER

GoldenrodMagnetTrainStationOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .MagnetTrainToSaffron
	jumpthisopenedtext

	text "El tren no ha"
	line "llegado…"

	para "¡Ya sé! ¡Llevaré a"
	line "los pasajeros a"
	cont "cuestas!"

	para "Eso no funcionará."
	done

.MagnetTrainToSaffron:
	writetext GoldenrodMagnetTrainStationOfficerAreYouComingAboardText
	yesorno
	iffalse_jumpopenedtext GoldenrodMagnetTrainStationOfficerHopeToSeeYouAgainText
	checkkeyitem PASS
	iffalse_jumpopenedtext GoldenrodMagnetTrainStationOfficerYouDontHaveARailPassText
	writetext GoldenrodMagnetTrainStationOfficerRightThisWayText
	waitbutton
	closetext
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, GoldenrodMagnetTrainStationPlayerApproachAndEnterTrainMovement
	setval $0
	special Special_MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applyonemovement PLAYER, turn_head_down
	wait 2
	end

Script_ArriveFromSaffron:
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, GoldenrodMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerReturnToBoardingGateMovement
	showtext GoldenrodMagnetTrainStationOfficerArrivedInGoldenrodText
	turnobject PLAYER, DOWN
	end

GoldenrodMagnetTrainStationCooltrainerfScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .PowerRestored
	jumpthistextfaceplayer

	text "El Tren Imán es"
	line "como, ¡fiuuum,"
	cont "buum! ¡Shuuu!"

	para "Al menos cuando"
	line "funciona…"
	done

.PowerRestored
	jumpthistextfaceplayer

	text "El Tren Imán es"
	line "como, ¡fiuuum,"
	cont "buum! ¡Shuuu!"

	para "¡Es tan chulo!"
	done

GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement:
	step_up
	step_up
	step_right
	turn_head_left
	step_end

GoldenrodMagnetTrainStationOfficerReturnToBoardingGateMovement:
	step_left
	step_down
	step_down
	step_end

GoldenrodMagnetTrainStationPlayerApproachAndEnterTrainMovement:
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

GoldenrodMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	turn_head_up
	step_end


GoldenrodMagnetTrainStationOfficerAreYouComingAboardText:
	text "Partiremos pronto"
	line "hacia Azafrán."

	para "¿Vienes a bordo?"
	done

GoldenrodMagnetTrainStationOfficerRightThisWayText:
	text "¿Me enseñas tu"
	line "pase de tren, por"
	cont "favor?"

	para "Vale. Por aquí,"
	line "por favor."
	done

GoldenrodMagnetTrainStationOfficerYouDontHaveARailPassText:
	text "Lo siento. No"
	line "tienes pase de"
	cont "tren."
	done

GoldenrodMagnetTrainStationOfficerHopeToSeeYouAgainText:
	text "¡Esperamos verte"
	line "de nuevo!"
	done

GoldenrodMagnetTrainStationOfficerArrivedInGoldenrodText:
	text "Hemos llegado a"
	line "Ciudad Trigal."

	para "Esperamos verte"
	line "de nuevo."
	done

GoldenrodMagnetTrainStationGentlemanText:
	text "Soy el"
	line "Presidente."

	para "Mi sueño era"
	line "construir un tren"

	para "más rápido que"
	line "cualquier #mon."

	para "De verdad acerca"
	line "Johto mucho más a"
	cont "Kanto."
	done
