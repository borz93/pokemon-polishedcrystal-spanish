EusinesHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CELADON_CITY, 14
	warp_event  3,  7, CELADON_CITY, 14

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_EUSINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonEusine, EVENT_EUSINES_HOUSE_EUSINE
	object_event  5,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EusinesHouseGrampsScript, -1

	object_const_def
	const EUSINESHOUSE_EUSINE

CeladonEusine:
	faceplayer
	opentext
	writetext CeladonEusineText1
	promptbutton
	special SpecialBeastsCheck
	iftruefwd .HoOh
	writetext EusineNoBeastsText
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_CAUGHT_RAIKOU
	iftruefwd .OwnRaikou
	showtext EusineShowsRaikouText
	reanchormap
	pokepic RAIKOU
	cry RAIKOU
	waitbutton
	closepokepic
	setmonval RAIKOU
	special SpecialSeenMon
.OwnRaikou
	checkflag ENGINE_PLAYER_CAUGHT_ENTEI
	iftruefwd .OwnEntei
	showtext EusineShowsEnteiText
	reanchormap
	pokepic ENTEI
	cry ENTEI
	waitbutton
	closepokepic
	setmonval ENTEI
	special SpecialSeenMon
.OwnEntei
	checkflag ENGINE_PLAYER_CAUGHT_SUICUNE
	iftruefwd .OwnSuicune
	showtext EusineShowsSuicuneText
	reanchormap
	pokepic SUICUNE
	cry SUICUNE
	waitbutton
	closepokepic
	setmonval SUICUNE
	special SpecialSeenMon
.OwnSuicune
	jumpthistext

	text "Si atrapas alguno,"
	line "espero que me"
	cont "avises."

	para "¡Cuento contigo,"
	line "<PLAYER>!"
	done

.HoOh:
	writetext EusineLeavesCeladonText
	waitbutton
	closetext
	readvar VAR_FACING
	ifnotequal UP, .PathClear
	applymovement PLAYER, .PlayerStepsAsideMovement
.PathClear:
	applymovement EUSINESHOUSE_EUSINE, .EusineLeavesMovement
	disappear EUSINESHOUSE_EUSINE
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

.PlayerStepsAsideMovement:
	step_left
	turn_head_right
	step_end

.EusineLeavesMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

EusinesHouseGrampsScript:
	checkevent EVENT_EUSINES_HOUSE_EUSINE
	iffalse_jumptextfaceplayer EusinesHouseGrampsGrandsonHomeText
	checkevent EVENT_FOUGHT_SUICUNE
	iffalse_jumptextfaceplayer EusinesHouseGrampsEusineSearchingForSuicuneText
	checkevent EVENT_DECO_ABRA_DOLL
	iftrue_jumptextfaceplayer EusinesHouseGrampsEusineTravelingWorldText
	checkevent EVENT_FOUGHT_HO_OH
	iftruefwd .AfterHoOhFight
	jumpthistextfaceplayer

	text "Mi nieto Eusine"
	line "está en otra"
	cont "aventura."

	para "Se fue a visitar"
	line "la Torre Campana"
	cont "en Ciudad Iris."
	done

.AfterHoOhFight:
	faceplayer
	opentext
	writetext EusinesHouseGrampsThankYouGiftText
	waitbutton
	writetext ReceivedAbraDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext AbraDollSentHomeText
	setevent EVENT_DECO_ABRA_DOLL
	waitbutton
	closetext
	end

ReceivedAbraDollText:
	text "<PLAYER> recibió"
	line "un Muñeco Abra."
	done

AbraDollSentHomeText:
	text "El Muñeco Abra"
	line "fue enviado a"
	cont "casa."
	done

CeladonEusineText1:
	text "Eusine: ¡Hola!"

	para "He vuelto a"
	line "visitar mi ciudad"
	cont "natal."

	para "Ha pasado bastante"
	line "tiempo."
	done

EusineLeavesCeladonText:
	text "<PLAYER>, ¿Te has"
	line "enterado?"

	para "Hay nuevos rumores"
	line "de un #mon de"
	cont "colores del"
	cont "arcoíris en la"
	cont "Torre Campana."

	para "Acabo de curar a"
	line "mi equipo, así que"

	para "ahora me dirijo a"
	line "Ciudad Iris."

	para "¡Nos vemos,"
	line "<PLAYER>!"
	done

EusineNoBeastsText:
	text "Ah, por cierto,"
	line "<PLAYER>."

	para "¿Has atrapado a"
	line "las bestias"
	cont "legendarias?"

	para "………………"

	para "Vale…"

	para "Deja que te dé mis"
	line "notas de"
	cont "investigación."
	done

EusineShowsRaikouText:
	text "Este es Raikou:"
	done

EusineShowsEnteiText:
	text "Este es Entei:"
	done

EusineShowsSuicuneText:
	text "Y esta, por"
	line "supuesto, es"
	cont "Suicune:"
	done


EusinesHouseGrampsGrandsonHomeText:
	text "¡Mi nieto ha"
	line "vuelto a casa!"
	cont "¡Qué alegría!"
	done

EusinesHouseGrampsEusineSearchingForSuicuneText:
	text "Mi nieto Eusine"
	line "está en Johto,"

	para "buscando a Suicune"
	line "por todas partes."

	para "¡Le enseñé todo"
	line "sobre esos #mon"
	cont "legendarios!"
	done


EusinesHouseGrampsThankYouGiftText:
	text "Mi nieto Eusine"
	line "llamó."

	para "Le va bien."
	line "¡Me alegro por él!"

	para "¡Gracias por"
	line "preocuparte por"
	cont "mí, <PLAYER>!"

	para "Por favor, toma"
	line "esto como muestra"
	cont "de mi gratitud."
	done

EusinesHouseGrampsEusineTravelingWorldText:
	text "Eusine está"
	line "viajando por el"
	cont "mundo."

	para "¡Estoy muy"
	line "orgulloso de él!"
	done
