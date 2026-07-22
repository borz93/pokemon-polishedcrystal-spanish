GoldenrodNetBallHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 19
	warp_event  3,  7, GOLDENROD_CITY, 19

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodNetBallHouseYoungsterScript, -1
	object_event  6,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodNetBallHouseBugCatcherText, -1

GoldenrodNetBallHouseYoungsterScript:
	checkevent EVENT_GOT_NET_BALL_FROM_GOLDENROD
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem NET_BALL
	iffalse_endtext
	setevent EVENT_GOT_NET_BALL_FROM_GOLDENROD
	jumpthisopenedtext

.Text2:
	text "A veces tienes"
	line "suerte y capturas"
	cont "a un #mon con"

	para "toda su PS. Me"
	line "encanta esa"
	cont "sensación."
	done

.Text1:
	text "Compré Malla Ball"
	line "para atrapar un"
	cont "Pineco, y lo"

	para "logré con la"
	line "primera que usé."

	para "Ya no la voy a"
	line "necesitar."
	done

GoldenrodNetBallHouseBugCatcherText:
	text "Hacen Concursos"
	line "de Captura"

	para "en el Parque"
	line "Nacional de la"
	cont "Ruta 35."

	para "A veces hasta"
	line "compite Bugsy."
	done
