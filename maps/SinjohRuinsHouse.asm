SinjohRuinsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SINJOH_RUINS, 2
	warp_event  3,  7, SINJOH_RUINS, 2

	def_coord_events

	def_bg_events
	bg_event  1,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  2,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  5,  4, SPRITE_CYNTHIA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SinjohRuinsHouseCynthiaScript, EVENT_SINJOH_RUINS_HOUSE_CYNTHIA
	object_event  5,  3, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SinjohRuinsHousePokefanmText, -1
	object_event  2,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SinjohRuinsHouseGrampsScript, -1
	pokemon_event  2,  3, ABRA, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, SinjohRuinsHouseAbraText, -1

	object_const_def
	const SINJOHRUINSHOUSE_CYNTHIA

SinjohRuinsHouseGrampsScript:
	faceplayer
	opentext
	writetext SinjohRuinsHouseGrampsText
	yesorno
	iffalse_jumpopenedtext SinjohRuinsHouseGrampsNoText
	writetext SinjohRuinsHouseGrampsYesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp NEW_BARK_TOWN, 15, 6
	end

SinjohRuinsHouseCynthiaScript:
	checkevent EVENT_BEAT_CYNTHIA
	iftrue_jumptextfaceplayer SinjohRuinsHouseCynthiaAfterText
	faceplayer
	opentext
	writetext SinjohRuinsHouseCynthiaChallengeText
	yesorno
	iffalse_jumpopenedtext SinjohRuinsHouseCynthiaNoText
	writetext SinjohRuinsHouseCynthiaYesText
	waitbutton
	closetext
	winlosstext SinjohRuinsHouseCynthiaWinText, 0
	setlasttalked SINJOHRUINSHOUSE_CYNTHIA
	loadtrainer CYNTHIA, 2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CYNTHIA
	jumpthistext

SinjohRuinsHouseCynthiaAfterText:
	text "Cintia: ¡Qué"
	line "combate tan"
	cont "increíble!"

	para "Eres un gran"
	line "entrenador, y me"

	para "haría feliz"
	line "verte de nuevo"
	cont "algún día."
	done

SinjohRuinsHousePokefanmText:
	text "Hace mucho"
	line "tiempo, la gente"

	para "tenía lazos más"
	line "cercanos con los"
	cont "#mon."

	para "Se formaron mitos"
	line "y leyendas sobre"
	cont "#mon poderosos,"

	para "y esas leyendas"
	line "viajaron a"
	cont "distintas"
	cont "regiones."

	para "Estas ruinas"
	line "recibieron"
	cont "influencia de los"

	para "antiguos pueblos"
	line "de Alph en Johto y"

	para "el Pilar Lanza en"
	line "Sinnoh."
	done

SinjohRuinsHouseGrampsText:
	text "Pareces fuera de"
	line "lugar, sin ni"

	para "siquiera saber por"
	line "qué estás aquí."

	para "¿Quieres que mi"
	line "Abra te teletrans-"
	cont "porte a casa?"
	done

SinjohRuinsHouseGrampsYesText:
	text "Vale, vale."
	line "Imagina tu casa"
	cont "en tu mente…"
	done

SinjohRuinsHouseGrampsNoText:
	text "Vale, vale."
	line "¡Buena suerte!"
	done

SinjohRuinsHouseAbraText:
	text "Abra: Aabra…"
	done

SinjohRuinsHouseCynthiaChallengeText:
	text "Cintia: Hola,"
	line "<PLAYER>."

	para "¿Has estado bien?"

	para "¡Ganaste una"
	line "revancha contra"
	cont "el Alto Mando!"
	cont "¡Bien hecho!"

	para "Tengo curiosidad"
	line "por lo que"
	cont "aprendiste desde"
	cont "que nos vimos."

	para "¿Combatimos de"
	line "nuevo, <PLAYER>?"
	done

SinjohRuinsHouseCynthiaNoText:
	text "Cintia: Vuelve"
	line "cuando quieras si"
	cont "cambias de idea."
	done

SinjohRuinsHouseCynthiaYesText:
	text "Cintia: Antes de"
	line "sacar a mis"
	cont "#mon,"

	para "mi corazón siempre"
	line "se acelera…"
	done

SinjohRuinsHouseCynthiaWinText:
	text "No recuerdo la"
	line "última vez que"

	para "me superaron así!"
	done
