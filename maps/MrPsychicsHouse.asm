MrPsychicsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 5
	warp_event  3,  7, SAFFRON_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrPsychic, -1

MrPsychic:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_ZEN_HEADBUTT_INTRO
	iftruefwd MrPsychicsHouseTutorZenHeadbuttScript
	writetext MrPsychicText
	waitbutton
	setevent EVENT_LISTENED_TO_ZEN_HEADBUTT_INTRO
MrPsychicsHouseTutorZenHeadbuttScript:
	writetext Text_MrPsychicsHouseTutorZenHeadbutt
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_MrPsychicsHouseTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval ZEN_HEADBUTT
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "…¿Me equivoqué?"
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "No tienes una"
	line "Hoja Plata…"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Tu #mon ya sabe"
	line "usar Cabezazo"
	cont "Zen."
	done

MrPsychicText:
	text "…"

	para "…"

	para "…"

	para "¡Ya lo tengo!"

	para "¡Quieres"
	line "aprender"
	cont "Cabezazo Zen!"
	done

Text_MrPsychicsHouseTutorZenHeadbutt:
	text "Le enseñaré a tu"
	line "#mon Cabezazo"

	para "Zen por una"
	line "Hoja Plata."
	done


Text_MrPsychicsHouseTutorQuestion:
	text "¿Le enseño a tu"
	line "#mon"
	cont "Cabezazo Zen?"
	done
