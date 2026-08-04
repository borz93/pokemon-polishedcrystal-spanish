HauntedRadioTower5F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_HAUNTEDRADIOTOWER5F_NOOP

	def_callbacks

	def_warp_events
	warp_event  5,  0, HAUNTED_RADIO_TOWER_4F, 2
	warp_event 11,  0, HAUNTED_RADIO_TOWER_6F, 1

	def_coord_events
	coord_event  4,  7, SCENE_HAUNTEDRADIOTOWER5F_NOOP, HauntedRadioTower5FTrapdoorScript

	def_bg_events
	bg_event  7,  0, BGEVENT_JUMPTEXT, HauntedRadioTower5FDoorsText

	def_object_events
	object_event 11,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, GENGAR, -1, PAL_MON_PURPLE, OBJECTTYPE_SCRIPT, NO_FORM, HauntedRadioTower5FGengarScript, EVENT_HAUNTED_RADIO_TOWER_GENGAR

	object_const_def
	const HAUNTEDRADIOTOWER5F_GENGAR

HauntedRadioTower5FGengarScript:
	faceplayer
	opentext
	writetext HauntedRadioTower5FGengarSeenText
	waitbutton
	closetext
	cry GENGAR
	loadwildmon GENGAR, 54
	startbattle
	reloadmapafterbattle
	ifequalfwd DRAW, .end
	setevent EVENT_HAUNTED_RADIO_TOWER_GENGAR
	disappear HAUNTEDRADIOTOWER5F_GENGAR
.end
	end

HauntedRadioTower5FTrapdoorScript:
	checkevent EVENT_HAUNTED_RADIO_TOWER_TRAPDOOR
	iftrue DoNothingScript
	setevent EVENT_HAUNTED_RADIO_TOWER_TRAPDOOR
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext HauntedRadioTower5FTrapdoorText
	playsound SFX_JUMP_OVER_LEDGE
	waitsfx
	closetext
	warp HAUNTED_RADIO_TOWER_3F, 2, 1
	end

HauntedRadioTower5FDoorsText:
	text "Las puertas de"
	line "esta planta están"
	cont "todas selladas"
	cont "con tablones."
	done

HauntedRadioTower5FGengarSeenText:
	text "¡Una sombra con"
	line "una sonrisa"
	cont "enorme te"
	cont "rodea!"
	done

HauntedRadioTower5FTrapdoorText:
	text "¡El suelo cede"
	line "bajo tus pies!"
	done
