SafariZoneWestRestHouse2_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_WEST, 8
	warp_event  3,  7, SAFARI_ZONE_WEST, 8

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, PokemonJournalKogaScript
	bg_event  5,  1, BGEVENT_READ, PokemonJournalKogaScript
	bg_event  6,  1, BGEVENT_READ, PokemonJournalKogaScript
	bg_event  7,  1, BGEVENT_READ, PokemonJournalKogaScript

	def_object_events
	object_event  3,  4, SPRITE_FLANNERY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestRestHouse2FlanneryScript, -1

	object_const_def
	const SAFARIZONEWESTRESTHOUSE2_FLANNERY

SafariZoneWestRestHouse2FlanneryScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FLANNERY
	iftruefwd .Beaten
	checkevent EVENT_INTRODUCED_FLANNERY
	iftruefwd .Introduced
	writetext .IntroText
	sjumpfwd .Question
.Introduced
	writetext .RematchText
.Question
	yesorno
	iffalsefwd .Refused
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked SAFARIZONEWESTRESTHOUSE2_FLANNERY
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch
	loadtrainer FLANNERY, 1
	sjumpfwd .StartBattle
.Rematch
	loadtrainer FLANNERY, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	setevent EVENT_INTRODUCED_FLANNERY
	setevent EVENT_BEAT_FLANNERY
	opentext
.Beaten:
	jumpopenedtext .AfterText

.Refused:
	jumpopenedtext .RefusedText

.IntroText:
	text "¡Hola!"

	para "¡Qué bien ver a"
	line "alguien más"
	cont "explorando este"
	cont "lugar!"

	para "Soy Flannery."

	para "Soy de la región"
	line "de Hoenn, así que"

	para "me gustan la"
	line "humedad y las"
	cont "aguas termales."

	para "¡La Zona Safari"
	line "se siente como"
	cont "en casa!"

	para "¡Intercambiemos"
	line "movimientos"
	cont "abrasadores en un"
	cont "combate!"
	done

.RematchText:
	text "¡Hola,"
	line "<PLAYER>!"

	para "¡Qué bien verte"
	line "otra vez!"

	para "Perder un combate"
	line "no me va a"
	cont "desinflar."

	para "¡Intercambiemos"
	line "movimientos"
	cont "abrasadores en"
	cont "otro combate!"
	done

.SeenText:
	text "Voy a demostrar"
	line "los movimientos"

	para "calientes que"
	line "perfeccioné cerca"
	cont "de un volcán!"
	done

.BeatenText:
	text "¡Uf! ¡Al borde"
	line "de la erupción!"
	done

.AfterText:
	text "Perdí el combate,"
	line "pero estoy"
	cont "totalmente"
	cont "satisfecha."

	para "No a menudo"
	line "disfruto de un"

	para "combate tan"
	line "candente."

	para "¡Tengamos otro"
	line "así algún día!"
	done

.RefusedText:
	text "Vale… Eh…"
	line "No seas tímido"
	cont "si vuelves!"
	done
