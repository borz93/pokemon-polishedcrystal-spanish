SaffronHitmontopKidHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 19
	warp_event  3,  7, SAFFRON_CITY, 19

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_CHILD, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronHitmontopKidHouseChildScript, -1
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronHitmontopKidHouseTeacherScript, -1

	object_const_def
	const SAFFRONHITMONTOPKIDHOUSE_CHILD

SaffronHitmontopKidHouseChildScript:
	showtextfaceplayer .Text1
	applymovement SAFFRONHITMONTOPKIDHOUSE_CHILD, .SpinMovement
	faceplayer
	pause 20
	checkpoke HITMONTOP
	iffalsefwd .Done
	showemote EMOTE_SHOCK, SAFFRONHITMONTOPKIDHOUSE_CHILD, 15
	showtext .Text2
	applymovement SAFFRONHITMONTOPKIDHOUSE_CHILD, .Spin2Movement
	pause 20
	showtext .Text3
	setevent EVENT_SHOWED_SAFFRON_KID_HITMONTOP
.Done
	end

.Text1:
	text "Top! Top!"
	line "Hit-mon-TOP!"
	done

.Text2:
	text "Top… Top? TOP!"
	line "HITMONTOP! ♥"
	done

.Text3:
	text "¡Es un"
	line "Hitmontop!"
	cont "¡Qué guay!"
	done

.SpinMovement:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
.Spin2Movement:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

SaffronHitmontopKidHouseTeacherScript:
	checkevent EVENT_GOT_AIR_BALLOON_FROM_SAFFRON
	iftrue_jumptextfaceplayer .Text3
	faceplayer
	opentext
	checkevent EVENT_SHOWED_SAFFRON_KID_HITMONTOP
	iffalse_jumpopenedtext .Text1
	writetext .Text2
	promptbutton
	verbosegiveitem AIR_BALLOON
	iffalse_endtext
	setevent EVENT_GOT_AIR_BALLOON_FROM_SAFFRON
	jumpthisopenedtext

.Text3:
	text "Mi hijo por fin"
	line "conoció a su"
	cont "#mon favorito."
	done

.Text1:
	text "A mi hijo le gusta"
	line "fingir que es un"
	cont "#mon."

	para "A veces da un"
	line "poco de repelús."

	para "Quizá si viera un"
	line "Hitmontop de"
	cont "verdad, se"
	cont "calmaría…"
	done

.Text2:
	text "¡Vaya! ¡Hiciste"
	line "muy feliz a mi"
	cont "hijo!"

	para "No es gran cosa"
	line "como agradecimien-"
	cont "to, pero quiero"
	cont "que tengas esto."
	done
