EmbeddedTower_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6, 23, ROUTE_47, 6
	warp_event  7, 23, ROUTE_47, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  9, SPRITE_STEVEN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EmbeddedTowerSteven1Script, EVENT_EMBEDDED_TOWER_STEVEN_1
	object_event  4, 11, SPRITE_STEVEN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EmbeddedTowerSteven2Script, EVENT_EMBEDDED_TOWER_STEVEN_2

	object_const_def
	const EMBEDDEDTOWER_STEVEN1
	const EMBEDDEDTOWER_STEVEN2

EmbeddedTowerSteven1Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_STEVEN
	iftruefwd .Beaten
	checkevent EVENT_LISTENED_TO_STEVEN_INTRO
	iftruefwd .HeardIntro
	writetext EmbeddedTowerSteven1IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_STEVEN_INTRO
.HeardIntro
	writetext EmbeddedTowerSteven1TowerText
	waitbutton
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse_jumpopenedtext EmbeddedTowerSteven1NotNowText
	writetext EmbeddedTowerSteven1ChallengeText
	yesorno
	iffalse_jumpopenedtext EmbeddedTowerSteven1NoText
	writetext EmbeddedTowerSteven1YesText
	waitbutton
	closetext
	winlosstext EmbeddedTowerSteven1WinText, 0
	setlasttalked EMBEDDEDTOWER_STEVEN1
	loadtrainer STEVEN, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_STEVEN
	opentext
.Beaten:
	checkevent EVENT_GOT_MUSCLE_BAND_FROM_STEVEN
	iftrue_jumpopenedtext EmbeddedTowerSteven1AfterText
	writetext EmbeddedTowerSteven1ItemText
	waitbutton
	verbosegiveitem MUSCLE_BAND
	iffalse_endtext
	setevent EVENT_GOT_MUSCLE_BAND_FROM_STEVEN
.GotMuscleBand
	jumpopenedtext EmbeddedTowerSteven1AfterText

EmbeddedTowerSteven2Script:
	checkevent EVENT_BEAT_STEVEN
	iftrue_jumptextfaceplayer EmbeddedTowerSteven2AfterText
	faceplayer
	opentext
	writetext EmbeddedTowerSteven2ChallengeText
	yesorno
	iffalse_jumpopenedtext EmbeddedTowerSteven2NoText
	writetext EmbeddedTowerSteven2YesText
	waitbutton
	closetext
	winlosstext EmbeddedTowerSteven2WinText, 0
	setlasttalked EMBEDDEDTOWER_STEVEN2
	loadtrainer STEVEN, 2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_STEVEN
	opentext
	jumpopenedtext EmbeddedTowerSteven2AfterText

EmbeddedTowerSteven1IntroText:
	text "¡Hola! Soy Steven."
	line "Las piedras raras"
	cont "son mi pasión."

	para "Vengo de la región"
	line "Hoenn. Es un lugar"

	para "hermoso, con el"
	line "océano más claro"

	para "que puedas"
	line "imaginar."

	para "Deberías visitarlo"
	line "algún día."
	done

EmbeddedTowerSteven1TowerText:
	text "Steven: Estoy aquí"
	line "buscando piedras"
	cont "para mi colección."

	para "Esta es la Torre"
	line "Incrustada."

	para "Fue construida por"
	line "gente de Hoenn"

	para "para unir el mar,"
	line "la tierra y el"
	cont "cielo."
	done

EmbeddedTowerSteven1NotNowText:
	text "Steven: Tus"
	line "#mon se ven"
	cont "bastante bien."

	para "Si logras vencer"
	line "al Alto Mando,"

	para "vuelve aquí para"
	line "combatir conmigo."
	done

EmbeddedTowerSteven1ChallengeText:
	text "Steven: Tus"
	line "#mon se ven"
	cont "bastante bien."

	para "Ya que ambos"
	line "estamos aquí,"
	cont "¿Combatimos?"
	done

EmbeddedTowerSteven1NoText:
EmbeddedTowerSteven2NoText:
	text "Steven: Hmm."
	line "Si cambias de"

	para "opinión, estaré"
	line "aquí mismo."
	done

EmbeddedTowerSteven1YesText:
EmbeddedTowerSteven2YesText:
	text "Steven: ¡Quiero"
	line "que me des con"

	para "todo! ¡Ahora,"
	line "adelante!"
	done

EmbeddedTowerSteven1WinText:
EmbeddedTowerSteven2WinText:
	text "¡Eres un"
	line "entrenador #mon"
	cont "verdaderamente"
	cont "noble!"
	done

EmbeddedTowerSteven1ItemText:
	text "Steven:"
	line "¡Felicidades!"

	para "Los sentimientos"
	line "que tienes por"
	cont "tus #mon…"

	para "Y los #mon que"
	line "respondieron a"

	para "esos sentimientos"
	line "con todas sus"
	cont "fuerzas…"

	para "Se unieron como"
	line "uno solo y"

	para "crearon un poder"
	line "aún mayor."

	para "¡Y así, lograste"
	line "alcanzar la"
	cont "victoria!"

	para "Seguro que este"
	line "objeto te será"
	cont "útil."
	done

EmbeddedTowerSteven1AfterText:
	text "Steven: Que"
	line "nuestros caminos"
	cont "se crucen de"
	cont "nuevo."
	done

EmbeddedTowerSteven2ChallengeText:
	text "Steven: ¡Nos"
	line "vemos de nuevo,"
	cont "<PLAYER>!"

	para "Encontré unas"
	line "piedras excelentes"
	cont "para mi colección."

	para "¿Qué has estado"
	line "haciendo?"

	para "¿Venciste al Alto"
	line "Mando de nuevo?"
	cont "¡Gran trabajo!"

	para "¿Por qué no"
	line "tenemos otro"
	cont "combate?"
	done

EmbeddedTowerSteven2AfterText:
	text "Steven: Al final,"
	line "sigues siendo el"
	cont "más fuerte."

	para "Pero no me"
	line "arrepiento de"
	cont "nuestro combate."

	para "Porque cada vez"
	line "que combato"
	cont "contigo,"

	para "¡aprendo más"
	line "sobre los #mon!"
	done
