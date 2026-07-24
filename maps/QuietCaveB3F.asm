QuietCaveB3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  8, 33, QUIET_CAVE_B2F, 5 ; hole
	warp_event 33,  9, QUIET_CAVE_B2F, 6
	warp_event 15, 11, QUIET_CAVE_B3F, 4
	warp_event  5, 11, QUIET_CAVE_B3F, 3

	def_coord_events

	def_bg_events
	bg_event 16, 22, BGEVENT_ITEM + PP_UP, EVENT_QUIET_CAVE_B3F_HIDDEN_PP_UP
	bg_event 12, 24, BGEVENT_ITEM + MAX_REVIVE, EVENT_QUIET_CAVE_B3F_HIDDEN_MAX_REVIVE

	def_object_events
	object_event  5,  5, SPRITE_MARLEY, SPRITEMOVEDATA_WANDER, 1, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, QuietCaveB3FMarleyScript, EVENT_QUIET_CAVE_MARLEY
	tmhmball_event  7, 24, TM_FOCUS_BLAST, EVENT_QUIET_CAVE_B3F_TM_FOCUS_BLAST

	object_const_def
	const QUIETCAVEB3F_MARLEY

QuietCaveB3FMarleyScript:
	faceplayer
	checkevent EVENT_BEAT_MARLEY
	iftruefwd .Beaten
	opentext
	writetext .ChallengeText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked QUIETCAVEB3F_MARLEY
	loadtrainer MARLEY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MARLEY
.Beaten
	opentext
	writetext .ItemText
	promptbutton
	verbosegiveitem POWER_ANKLET
	iffalse_endtext
	writetext .GoodbyeText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear QUIETCAVEB3F_MARLEY
	pause 15
	special Special_FadeInQuickly
	clearevent EVENT_BATTLE_TOWER_MARLEY
	end

.ChallengeText:
	text "…Soy Marley."
	line "…¿Y tú eres?"

	para "Ah… <PLAYER>,"
	line "¿Combatirías"
	cont "conmigo, por"
	cont "favor?"
	done

.YesText:
	text "…Vale. Haré lo"
	line "que pueda."
	done

.NoText:
	text "…Qué pena…"
	done

.BeatenText:
	text "…Vaya."
	done

.ItemText:
	text "Yo… no me gusta"
	line "hablar…"

	para "Elijo mis palabras"
	line "con cuidado, pero"

	para "aun así pueden"
	line "herir a alguien"
	cont "sin querer…"

	para "Así que tendré que"
	line "agradecerte de"
	cont "otra forma…"
	done

.GoodbyeText:
	text "…Te agradezco que"
	line "combatieras"
	cont "conmigo…"
	cont "…Un poquito…"

	para "Voy a la Torre"
	line "Batalla…"

	para "Adiós…"
	done
