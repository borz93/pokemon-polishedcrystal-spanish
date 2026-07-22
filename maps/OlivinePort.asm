OlivinePort_MapScriptHeader:
	def_scene_scripts
	scene_script OlivinePortAskEnterShipScene, SCENE_OLIVINEPORT_ASK_ENTER_SHIP
	scene_script OlivinePortLeaveShipScene, SCENE_OLIVINEPORT_LEAVE_SHIP

	def_callbacks

	def_warp_events
	warp_event 14,  4, OLIVINE_CITY, 9
	warp_event 15,  4, OLIVINE_CITY, 10
	warp_event  7, 15, FAST_SHIP_1F, 1

	def_coord_events
	coord_event  7,  7, SCENE_OLIVINEPORT_ASK_ENTER_SHIP, OlivinePortWalkUpToShipScript

	def_bg_events
	bg_event  1, 14, BGEVENT_ITEM + PROTEIN, EVENT_OLIVINE_PORT_HIDDEN_PROTEIN

	def_object_events
	object_event  7, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortSailorAtGangwayScript, EVENT_OLIVINE_PORT_SAILOR_AT_GANGWAY
	object_event  7,  7, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivinePortSailorBeforeHOFText, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  4,  6, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlivinePortFishingGuru1Script, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event 13,  6, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OlivinePortFishingGuru2Script, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  6,  7, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortSailorAfterHOFScript, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	object_event  4,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortYoungsterScript, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	object_event 11,  7, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortCooltrainerFScript, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	object_event 16, 13, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, PAL_NPC_ENV_GREEN, OBJECTTYPE_ITEMBALL, PLAYEREVENT_KEYITEMBALL, GO_GOGGLES, EVENT_OLIVINE_PORT_GO_GOGGLES

	object_const_def
	const OLIVINEPORT_SAILOR1
	const OLIVINEPORT_SAILOR3

OlivinePortLeaveShipScene:
	sdefer OlivinePortLeaveShipScript
OlivinePortAskEnterShipScene:
	end

OlivinePortLeaveShipScript:
	applyonemovement PLAYER, step_up
	appear OLIVINEPORT_SAILOR1
	setscene SCENE_OLIVINEPORT_ASK_ENTER_SHIP
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	blackoutmod OLIVINE_CITY
	end

OlivinePortSailorAtGangwayScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd OlivinePortAlreadyRodeScript
	writetext OlivinePortSailorGetOnBoardText
	waitbutton
	closetext
	turnobject OLIVINEPORT_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear OLIVINEPORT_SAILOR1
	waitsfx
	applyonemovement PLAYER, step_down
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalsefwd .FirstTime
	clearevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	setevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	clearevent EVENT_BEAT_COOLTRAINERM_SEAN
	clearevent EVENT_BEAT_COOLTRAINERF_CAROL
	clearevent EVENT_BEAT_GENTLEMAN_EDWARD
	clearevent EVENT_BEAT_BEAUTY_CASSIE
	clearevent EVENT_BEAT_PSYCHIC_RODNEY
	clearevent EVENT_BEAT_SUPER_NERD_SHAWN
	clearevent EVENT_BEAT_SAILOR_GARRETT
	clearevent EVENT_BEAT_FISHER_JONAH
	clearevent EVENT_BEAT_BLACKBELT_WAI
	clearevent EVENT_BEAT_RICH_BOY_WINSTON
.FirstTime:
	clearevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	appear OLIVINEPORT_SAILOR1
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_ENTER_SHIP
	warp FAST_SHIP_1F, 25, 1
	end

OlivinePortAlreadyRodeScript:
	jumpthisopenedtext

	text "Lo siento. No"
	line "puedes embarcar"
	cont "ahora."
	done

OlivinePortWalkUpToShipScript:
	turnobject OLIVINEPORT_SAILOR3, RIGHT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd .skip
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftruefwd .skip
	turnobject PLAYER, LEFT
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalsefwd .FirstTime
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .NextShipMonday
	ifequalfwd SATURDAY, .NextShipMonday
	ifequalfwd TUESDAY, .NextShipFriday
	ifequalfwd WEDNESDAY, .NextShipFriday
	ifequalfwd THURSDAY, .NextShipFriday
.FirstTime:
	writetext OlivinePortAskBoardText
	yesorno
	iffalsefwd OlivinePortNotRidingMoveAwayScript
	writetext OlivinePortAskTicketText
	promptbutton
	checkkeyitem S_S_TICKET
	iffalsefwd .NoTicket
	writetext OlivinePortFlashTicketText
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	applymovement PLAYER, OlivinePortApproachFastShipFirstTimeMovement
	sjump OlivinePortSailorAtGangwayScript

.NoTicket:
	writetext OlivinePortNoTicketText
	waitbutton
	closetext
	applymovement PLAYER, OlivinePortCannotEnterFastShipMovement
	end

.NextShipMonday:
	writetext OlivinePortMondayShipText
	waitbutton
	closetext
	applymovement PLAYER, OlivinePortCannotEnterFastShipMovement
	end

.NextShipFriday:
	writetext OlivinePortFridayShipText
	waitbutton
	closetext
	applymovement PLAYER, OlivinePortCannotEnterFastShipMovement
	end

.skip:
	end

OlivinePortNotRidingScript:
	jumpopenedtext OlivinePortComeAgainText

OlivinePortNotRidingMoveAwayScript:
	writetext OlivinePortComeAgainText
	waitbutton
	closetext
	applymovement PLAYER, OlivinePortCannotEnterFastShipMovement
	end

OlivinePortSailorAfterHOFScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue OlivinePortAlreadyRodeScript
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalsefwd .FirstTime
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .NextShipMonday
	ifequalfwd SATURDAY, .NextShipMonday
	ifequalfwd TUESDAY, .NextShipFriday
	ifequalfwd WEDNESDAY, .NextShipFriday
	ifequalfwd THURSDAY, .NextShipFriday
.FirstTime:
	writetext OlivinePortAskBoardText
	yesorno
	iffalse OlivinePortNotRidingScript
	writetext OlivinePortAskTicketText
	promptbutton
	checkkeyitem S_S_TICKET
	iffalsefwd .NoTicket
	writetext OlivinePortFlashTicketText
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	readvar VAR_FACING
	ifequalfwd RIGHT, .Right
	applymovement PLAYER, OlivinePortApproachFastShipAfterHOFMovement
	sjump OlivinePortSailorAtGangwayScript

.Right:
	applymovement PLAYER, OlivinePortApproachFastShipAfterHOFRightMovement
	sjump OlivinePortSailorAtGangwayScript

.NoTicket:
	jumpopenedtext OlivinePortNoTicketText

.NextShipMonday:
	jumpopenedtext OlivinePortMondayShipText

.NextShipFriday:
	jumpopenedtext OlivinePortFridayShipText

OlivinePortFishingGuru1Script:
	showtextfaceplayer OlivinePortFishingGuru1Text
	turnobject LAST_TALKED, UP
	end

OlivinePortFishingGuru2Script:
	showtextfaceplayer OlivinePortFishingGuru2Text
	turnobject LAST_TALKED, UP
	end

OlivinePortYoungsterScript:
	showtextfaceplayer OlivinePortYoungsterText
	turnobject LAST_TALKED, DOWN
	end

OlivinePortCooltrainerFScript:
	showtextfaceplayer OlivinePortCooltrainerFText
	turnobject LAST_TALKED, DOWN
	end

OlivinePortCannotEnterFastShipMovement:
	step_right
	turn_head_left
	step_end

OlivinePortApproachFastShipFirstTimeMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

OlivinePortApproachFastShipAfterHOFMovement:
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

OlivinePortApproachFastShipAfterHOFRightMovement:
	step_up
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

OlivinePortSailorGetOnBoardText:
	text "Zarpamos pronto."
	line "Suba a bordo,"
	cont "por favor."
	done


OlivinePortAskBoardText:
	text "Bienvenido al"
	line "Barco Rápido"
	cont "S.S.Aqua."

	para "¿Va a embarcar"
	line "hoy?"
	done

OlivinePortAskTicketText:
	text "¿Me enseña su"
	line "Billete S.S.?"
	done

OlivinePortComeAgainText:
	text "¡Esperamos verle"
	line "de nuevo!"
	done

OlivinePortFlashTicketText:
	text "<PLAYER> mostró"
	line "el Billete S.S."

	para "Eso es."
	line "¡Gracias!"
	done

OlivinePortNoTicketText:
	text "<PLAYER> intentó"
	line "mostrar el"
	cont "Billete S.S…"

	para "…¡Pero no hay"
	line "Billete!"

	para "¡Lo siento! Solo"
	line "puede embarcar"

	para "si tiene un"
	line "Billete S.S."
	done

OlivinePortMondayShipText:
	text "El Barco Rápido"
	line "zarpa el próximo"
	cont "lunes."
	done

OlivinePortFridayShipText:
	text "El Barco Rápido"
	line "zarpa el próximo"
	cont "viernes."
	done

OlivinePortFishingGuru1Text:
	text "Los Shellder son"
	line "fáciles de pescar"
	cont "aquí."

	para "Son bastante raros"
	line "en otros sitios."
	done

OlivinePortFishingGuru2Text:
	text "¿Cuántas Cañas"
	line "tienes?"

	para "Cada Caña pesca"
	line "#mon"
	cont "diferentes."
	done

OlivinePortYoungsterText:
	text "¡El S.S.Aqua usa"
	line "chorros para"
	cont "deslizarse sobre"
	cont "las olas!"
	done

OlivinePortCooltrainerFText:
	text "Hay muchos #mon"
	line "en Kanto."

	para "Ojalá pudiera ir…"
	done

OlivinePortSailorBeforeHOFText:
	text "No queremos que"
	line "caiga al mar, así"

	para "que no se le"
	line "permite entrar."
	done
