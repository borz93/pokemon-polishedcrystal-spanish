HallOfFame_MapScriptHeader:
	def_scene_scripts
	scene_script HallOfFameEnterScene, SCENE_HALLOFFAME_ENTER
	scene_const SCENE_HALLOFFAME_NOOP

	def_callbacks

	def_warp_events
	warp_event  4, 13, LANCES_ROOM, 3
	warp_event  5, 13, LANCES_ROOM, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 12, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1

	object_const_def
	const HALLOFFAME_LANCE

HallOfFameEnterScene:
	sdefer .Script
	end

.Script:
	follow HALLOFFAME_LANCE, PLAYER
	applymovement HALLOFFAME_LANCE, .WalkUpMovement
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext .LanceText1
	waitbutton
	readvar VAR_BADGES
	ifequalfwd 16, .CheckGoldTrophy
	checkevent EVENT_DECO_SILVER_TROPHY
	iftruefwd .NoTrophy
	sjumpfwd .SilverTrophy
.CheckGoldTrophy
	checkevent EVENT_DECO_GOLD_TROPHY
	iftruefwd .NoTrophy
	sjumpfwd .GoldTrophy
.SilverTrophy
	writetext .LanceTrophyText
	waitbutton
	setevent EVENT_DECO_SILVER_TROPHY
	writetext .SilverTrophyText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext .SilverTrophySentText
	waitbutton
	sjumpfwd .NoTrophy
.GoldTrophy
	writetext .LanceTrophyText
	waitbutton
	setevent EVENT_DECO_GOLD_TROPHY
	writetext .GoldTrophyText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext .GoldTrophySentText
	waitbutton
.NoTrophy
	writetext .LanceText2
	waitbutton
	closetext
	turnobject HALLOFFAME_LANCE, UP
	applyonemovement PLAYER, slow_step_up
	setscene SCENE_HALLOFFAME_NOOP
	pause 15
	setval 2 ; Machine is in the Hall of Fame
	special HealMachineAnim
	readvar VAR_BADGES
	ifless 16, .NotATrueRematch
	setevent EVENT_BEAT_ELITE_FOUR_AGAIN
.NotATrueRematch
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_RIVAL_SPROUT_TOWER
	setevent EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	clearevent EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	special RespawnOneOffs
	setmapscene SPROUT_TOWER_3F, SCENE_SPROUTTOWER3F_NOOP
	special HealParty
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftruefwd .SkipPhoneCall
	specialphonecall SPECIALCALL_SSTICKET
	setevent EVENT_BATTLE_TOWER_OPEN
	clearevent EVENT_BATTLE_TOWER_CLOSED
.SkipPhoneCall:
	blackoutmod NEW_BARK_TOWN
	halloffame
	end

.WalkUpMovement:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	turn_head_left
	step_end

.LanceText1:
	text "Lance: Hace mucho"
	line "que no venía por"
	cont "aquí."

	para "Aquí honramos a"
	line "los Campeones de"

	para "la Liga por toda"
	line "la eternidad."

	para "Sus valientes"
	line "#mon también"
	cont "son incluidos."
	done

.LanceTrophyText:
	text "Toma esto como"
	line "recuerdo de lo"

	para "que lograste hoy"
	line "aquí."
	done

.LanceText2:
	text "Hoy, aquí,"
	line "presenciamos el"
	cont "ascenso de un"
	cont "nuevo Campeón de"
	cont "la Liga: un"

	para "entrenador que"
	line "siente compasión"

	para "y confianza hacia"
	line "todos los #mon."

	para "Un entrenador que"
	line "triunfó gracias a"

	para "la perseverancia"
	line "y la"
	cont "determinación."

	para "¡El nuevo Campeón"
	line "de la Liga, que"

	para "tiene todo lo"
	line "necesario para la"
	cont "grandeza!"

	para "¡<PLAYER>, permite"
	line "que registre a ti"

	para "y a tus"
	line "compañeros como"
	cont "Campeones!"
	done

.GoldTrophyText:
	text "<PLAYER> recibió el"
	line "Trofeo Oro."
	done

.GoldTrophySentText:
	text "El Trofeo Oro se"
	line "envió a casa."
	done

.SilverTrophyText:
	text "<PLAYER> recibió el"
	line "Trofeo Plata."
	done

.SilverTrophySentText:
	text "El Trofeo Plata se"
	line "envió a casa."
	done
