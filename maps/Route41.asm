Route41_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13, 17, WHIRL_ISLAND_NW, 1
	warp_event 37, 19, WHIRL_ISLAND_NE, 1
	warp_event 13, 37, WHIRL_ISLAND_SW, 1
	warp_event 37, 45, WHIRL_ISLAND_SE, 1

	def_coord_events

	def_bg_events
	bg_event  9, 35, BGEVENT_ITEM + MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

	def_object_events
	object_event 57, 14, SPRITE_MARLON, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route41MarlonScript, -1
	object_event 32,  6, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermCharlie, -1
	object_event 46,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermGeorge, -1
	object_event 20, 26, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermBerke, -1
	object_event 32, 30, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermKirk, -1
	object_event 19, 46, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermMathew, -1
	object_event 57, 24, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermLewis, -1
	object_event 17,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfKaylee, -1
	object_event 23, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfSusie, -1
	object_event 27, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfDenise, -1
	object_event 44, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfKara, -1
	object_event  9, 50, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSwimmerfWendy, -1
	itemball_event 56, 12, SILVER_LEAF, 1, EVENT_ROUTE_41_SILVER_LEAF

	object_const_def
	const ROUTE41_MARLON

Route41MarlonScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MARLON_AGAIN
	iftruefwd .Beaten
	checkevent EVENT_BEAT_MARLON
	iffalsefwd .NotYetBattled
	writetext .RematchText
	sjumpfwd .Battle
.NotYetBattled
	checkevent EVENT_INTRODUCED_MARLON
	iftruefwd .Introduced1
	writetext .IntroText
	waitbutton
	setevent EVENT_INTRODUCED_MARLON
.Introduced1
	writetext .ChallengeText
.Battle
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE41_MARLON
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .Rematch1
	loadtrainer MARLON, 1
	sjumpfwd .StartBattle
.Rematch1
	loadtrainer MARLON, 2
	sjumpfwd .StartBattle
.Rematch2
	loadtrainer MARLON, 3
.StartBattle
	startbattle
	reloadmapafterbattle
	opentext
.Beaten:
	writetext .AfterText
	waitbutton
	closetext
	setevent EVENT_BEAT_MARLON
	setevent EVENT_BEAT_MARLON_AGAIN
	end

.IntroText:
	text "Marlon: ¡Aloha!"

	para "Ey, ¡tú eres"
	line "<PLAYER>!"

	para "Soy Marlon,"
	line "¡el hombre del"
	cont "mar!"

	para "¡Mi #mon y yo"
	line "vinimos nadando"
	cont "desde Unova!"
	done

.ChallengeText:
	text "¡Tienes pinta de"
	line "ser fuerte!"

	para "¡Deberíamos"
	line "echar un combate!"
	done

.RematchText:
	text "¡Ohoho! ¡Ey,"
	line "<PLAYER>!"

	para "¡Otra vez cara a"
	line "cara!"

	para "¡Te va a arrastrar"
	line "la marea,"
	cont "seguro!"
	done

.RefusedText:
	text "¡Vaya chasco!"
	done

.SeenText:
	text "Guay,"
	line "¡vamos allá!"
	done

.BeatenText:
	text "¡Vaya pasada!"

	para "Se te da genial"
	line "esto de entrenar."
	done

.AfterText:
	text "No solo tienes"
	line "pinta de fuerte,"
	cont "¡lo eres de"
	cont "verdad!"

	para "Ey, ¡A mí también"
	line "me arrastró la"
	cont "marea!"
	done

GenericTrainerSwimmerfKaylee:
	generictrainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText

	text "Dicen que hay un"
	line "gran #mon en"
	cont "las profundidades"
	cont "de Islas"
	cont "Remolino."

	para "¿Qué será?"
	done

GenericTrainerSwimmerfSusie:
	generictrainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText

	text "¿No había una"
	line "canción sobre un"
	cont "chico montado en"
	cont "un Lapras?"
	done

GenericTrainerSwimmerfDenise:
	generictrainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText

	text "Las quemaduras son"
	line "lo peor para la"
	cont "piel."

	para "Pero no uso"
	line "crema solar."

	para "No quiero"
	line "contaminar el"
	cont "agua."
	done

GenericTrainerSwimmerfKara:
	generictrainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText

	text "Oí rugidos desde"
	line "el interior de"
	cont "las islas."
	done

GenericTrainerSwimmerfWendy:
	generictrainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText

	text "Los grupos de"
	line "Staryu se"
	cont "iluminan a la"
	cont "vez."

	para "Es tan bonito que"
	line "da miedo."
	done

GenericTrainerSwimmermCharlie:
	generictrainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText

	text "¿Verdad que"
	line "flotar así"
	cont "relaja?"
	done

GenericTrainerSwimmermGeorge:
	generictrainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText

	text "Ciudad Orquídea"
	line "está muy lejos."

	para "Pero volver a"
	line "Ciudad Olivo"
	cont "tampoco es fácil."

	para "¿Qué hago?"
	done

GenericTrainerSwimmermBerke:
	generictrainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText

	text "Era una noche"
	line "oscura y"
	cont "tormentosa…"

	para "Vi a un #mon"
	line "gigante volar"
	cont "desde las islas."

	para "Esparcía plumas de"
	line "sus alas"
	cont "plateadas."
	done

GenericTrainerSwimmermKirk:
	generictrainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText

	text "Las corrientes no"
	line "me dejan llegar a"
	cont "esa isla."
	done

GenericTrainerSwimmermMathew:
	generictrainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText

	text "Un secreto de las"
	line "Islas Remolino…"

	para "¡Dentro está"
	line "oscuro como boca"
	cont "de lobo!"
	done

GenericTrainerSwimmermLewis:
	generictrainer SWIMMERM, LEWIS, EVENT_BEAT_SWIMMERM_LEWIS, SwimmermLewisSeenText, SwimmermLewisBeatenText

	text "Hace falta saber y"
	line "tener experiencia"

	para "para no perderse"
	line "en el agua."
	done

SwimmermCharlieSeenText:
	text "El agua está"
	line "calentita. Estoy"
	cont "bien relajado."

	para "¡Vale, acepto el"
	line "combate!"
	done

SwimmermCharlieBeatenText:
	text "¡Vaya! ¡Tengo la"
	line "piel arrugada!"
	done

SwimmermGeorgeSeenText:
	text "Estoy algo"
	line "cansado. Si gano,"
	cont "préstame tu"
	cont "#mon."
	done

SwimmermGeorgeBeatenText:
	text "Jadeo, jadeo…"
	done

SwimmermBerkeSeenText:
	text "¿Ves esas islas"
	line "bloqueadas por"
	cont "torbellinos?"

	para "¡Tiene que haber"
	line "un secreto!"
	done

SwimmermBerkeBeatenText:
	text "¿Cuál es el"
	line "secreto de tu"
	cont "fuerza?"
	done

SwimmermKirkSeenText:
	text "Las olas están"
	line "bravas aquí."

	para "Te agotan"
	line "mientras nadas."
	done

SwimmermKirkBeatenText:
	text "¡Estoy hecho"
	line "polvo!"
	done

SwimmermMathewSeenText:
	text "¿Buscas los"
	line "secretos de las"
	cont "Islas Remolino?"
	done

SwimmermMathewBeatenText:
	text "¡Vaya, tienes"
	line "mucho aguante!"
	done

SwimmermLewisSeenText:
	text "¡Me siento en mi"
	line "hogar en el mar!"
	done

SwimmermLewisBeatenText:
	text "¿Vencido en mi"
	line "propio hogar?"
	done

SwimmerfKayleeSeenText:
	text "Voy de camino a"
	line "las Islas"
	cont "Remolino."

	para "Voy a explorar"
	line "con amigos."
	done

SwimmerfKayleeBeatenText:
	text "¿Así se hace?"
	done

SwimmerfSusieSeenText:
	text "Qué elegante"
	line "montando tu"
	cont "#mon."
	done

SwimmerfSusieBeatenText:
	text "Estoy destrozada…"
	done

SwimmerfDeniseSeenText:
	text "¡Hace un tiempo"
	line "tan bonito que"
	cont "estoy en las"
	cont "nubes!"
	done

SwimmerfDeniseBeatenText:
	text "¡Ohhh!"
	done

SwimmerfKaraSeenText:
	text "Si necesitas"
	line "descansar, solo"
	cont "flota."

	para "Recuperarás el"
	line "aliento, y así"

	para "seguirás con"
	line "fuerza."
	done

SwimmerfKaraBeatenText:
	text "¡Vaya! Tienes más"
	line "energía que yo."
	done

SwimmerfWendySeenText:
	text "De noche, los"
	line "Staryu se reúnen"
	cont "junto a la"
	cont "superficie."
	done

SwimmerfWendyBeatenText:
	text "Ay, madre…"
	done
