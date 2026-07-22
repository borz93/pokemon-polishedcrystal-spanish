Route27RestHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_27, 1
	warp_event  3,  7, ROUTE_27, 1

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route27RestHouseGranny, -1

Route27RestHouseGranny:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SKILL_SWAP_INTRO
	iftruefwd .HeardIntro
	writetext .IntroText
	setevent EVENT_LISTENED_TO_SKILL_SWAP_INTRO
	sjumpfwd .Continue
.HeardIntro
	writetext .HeardIntroText
.Continue
	promptbutton
	special GetFirstPokemonHappiness
	ifgreater FRIEND_BALL_HAPPINESS - 1, .Loyal
	jumpthisopenedtext

	text "Si no confía más"
	line "en ti, esto podría"

	para "ser difícil de"
	line "conseguir."

	para "La confianza une"
	line "a los #mon"
	cont "y entrenadores."
	done

.Loyal:
	writetext .QuestionText
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	yesorno
	iffalsefwd .TutorRefused
	setval SKILL_SWAP
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpopenedtext .RefusedText

.NoSilverLeaf
	waitbutton
	jumpthisopenedtext

	text "Aún no has"
	line "encontrado ninguna"
	cont "Hoja Plata…"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Cambiazo es un"
	line "movimiento que"

	para "intercambia tu"
	line "habilidad con la"
	cont "de tu rival."

	para "Es solo para"
	line "entrenadores"
	cont "avanzados."

	para "Si te atreves,"
	line "úsalo. ¡Suerte!"
	done

.IntroText:
	text "¿A dónde vas con"
	line "tus #mon?"

	para "¿A la Liga"
	line "#mon?"

	para "¿Son tus #mon"
	line "lo bastante"
	cont "leales para"
	cont "ganar?"

	para "Déjame ver…"
	done

.HeardIntroText:
	text "Déjame ver a tu"
	line "#mon…"
	done

.QuestionText:
	text "¡Ah! Tu #mon"
	line "confía mucho en"
	cont "ti."

	para "Qué bien ver a un"
	line "buen entrenador."

	para "Puedo enseñarle mi"
	line "técnica secreta,"

	para "Cambiazo, si"
	line "quieres."
	done

.RefusedText:
	text "Buena suerte en"
	line "tu viaje."
	done
