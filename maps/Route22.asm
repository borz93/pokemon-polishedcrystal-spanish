Route22_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  4, POKEMON_LEAGUE_GATE, 1
	warp_event  4,  5, POKEMON_LEAGUE_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  7,  7, BGEVENT_JUMPTEXT, VictoryRoadEntranceSignText
	bg_event 23, 11, BGEVENT_JUMPTEXT, Route22AdvancedTipsSignText

	def_object_events
	object_event 20, 11, SPRITE_KUKUI, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KukuiScript, -1
	object_event 28,  2, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route22CooltrainerfText, -1

	object_const_def
	const ROUTE22_KUKUI

KukuiScript:
	checkevent EVENT_BEAT_KUKUI
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	checkevent EVENT_INTRODUCED_KUKUI
	iftruefwd .Introduced
	writetext .IntroText
	sjumpfwd .Question
.Introduced
	writetext .RematchText
.Question
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	setevent EVENT_INTRODUCED_KUKUI
	winlosstext .BeatenText, 0
	setlasttalked ROUTE22_KUKUI
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch
	loadtrainer KUKUI, 1
	sjumpfwd .StartBattle
.Rematch
	loadtrainer KUKUI, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KUKUI
	jumpthistext

.AfterText:
	text "¡Increíble! Fui a"
	line "por ti y aun así"
	cont "ganaste!"

	para "¡Con razón eres"
	line "el Campeón!"

	para "Necesito entrenar"
	line "más antes de"

	para "estar listo para"
	line "la Liga."

	para "Y cuando lo esté,"
	line "te retaré de"
	cont "nuevo! ¡Bien!"
	done

.IntroText:
	text "¡Hola!"
	line "Me llamo Kukui."

	para "Así que tú eres"
	line "<PLAYER>? ¡Genial,"
	cont "compañero!"

	para "Vengo de la"
	line "lejana región de"
	cont "Alola!"

	para "Pero allí no hay"
	line "Liga #mon, así"

	para "que vine a Kanto a"
	line "combatir contra"
	cont "el Alto Mando!"

	para "¿Eh? ¿Tú eres el"
	line "nuevo Campeón?"

	para "¡Vaya, con razón"
	line "tienes ese estilo!"

	para "Mi equipo y yo nos"
	line "sentimos listos."

	para "¿Qué tal si nos"
	line "saltamos la Liga"
	cont "y te reto ya?"
	done

.RematchText:
	text "¡Hola de nuevo,"
	line "<PLAYER>!"

	para "He entrenado duro"
	line "desde nuestro"
	cont "último combate!"

	para "¡Tú también"
	line "pareces más"
	cont "fuerte!"

	para "Oye, ¿qué tal una"
	line "revancha?"
	done

.SeenText:
	text "¡Tengamos un"
	line "combate a la"
	cont "altura!"
	done

.BeatenText:
	text "No pude ganar"
	line "aunque di todo"
	cont "de mí…"
	done

.RefusedText:
	text "Muy centrado en tu"
	line "propia misión,"
	cont "¿eh?"

	para "¡Eso lo respeto!"
	done

Route22CooltrainerfText:
	text "El nombre “Kanto”"
	line "significa “este de"
	cont "la barrera”."

	para "Supongo que esa"
	line "barrera debe ser"
	cont "el Monte Plateado."
	done

VictoryRoadEntranceSignText:
	text "Ruta 22"

	para "Puerta de la Liga"
	line "#mon"
	done

Route22AdvancedTipsSignText:
	text "¡Consejo"
	line "avanzado!"

	para "Empezar una Nueva"
	line "Partida+ conserva"

	para "el dinero, los PC"
	line "y los #mon"
	cont "guardados en la PC"
	cont "de tu partida"
	cont "anterior."
	done
