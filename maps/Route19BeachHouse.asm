Route19BeachHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_19, 2
	warp_event  3,  7, ROUTE_19, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19BeachHouseVictorScript, -1
	object_event  6,  4, SPRITE_SURFING_PIKACHU, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route19BeachHouseSurfingPikachuScript, -1

	object_const_def
	const ROUTE19BEACHHOUSE_VICTOR

Route19BeachHouseVictorScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_VICTOR
	iftruefwd .AfterScript
	writetext .GreetingText
	waitbutton
	special CheckForSurfingPikachu
	iffalsefwd .NoPikachu
	writetext .ChallengeText
	yesorno
	iffalsefwd .NoBattle
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE19BEACHHOUSE_VICTOR
	loadtrainer VICTOR, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_VICTOR
	opentext
.AfterScript:
	jumpopenedtext .AfterText

.NoPikachu:
	jumpthisopenedtext

	text "¡Tú también"
	line "puedes!"

	para "¡Sal ahí fuera y"
	line "busca un Pikachu"
	cont "Surfista!"

	para "¡Demuéstrame que"
	line "a ti también te"
	cont "encanta el surf!"
	done

.NoBattle:
	jumpopenedtext .NoBattleText

.GreetingText:
	text "¡Hola, amigo!"
	line "Soy Victor."

	para "Me encanta el"
	line "surf, y a Puka"
	cont "también. ¡Es mi"
	cont "Pikachu!"
	done

.ChallengeText:
	text "¡Vaya!"

	para "¡Tu Pikachu sabe"
	line "hacer surf! Así"
	cont "que no estoy"
	cont "solo…"

	para "¡Genial! Te"
	line "ganaste el"
	cont "derecho a un"

	para "combate de surf"
	line "conmigo y Puka!"

	para "¿Te animas?"
	done

.SeenText:
	text "¡El mar une a"
	line "todos los"
	cont "surfistas!"
	cont "¡Vamos!"
	done

.BeatenText:
	text "¡Sabía que podías"
	line "hacerlo!"
	done

.AfterText:
	text "Oí que algunos"
	line "Pikachu de Johto"
	cont "aprendieron solos"
	cont "a hacer surf."

	para "Quizá de ahí"
	line "viene el mío."

	para "Encontré a Puka"
	line "varado en la"
	cont "orilla hace años,"
	cont "y desde entonces"

	para "somos"
	line "compañeros."
	done


.NoBattleText:
	text "Vaya. ¡Ven a"
	line "hacer surf cuando"
	cont "quieras, amigo!"
	done

Route19BeachHouseSurfingPikachuScript:
	faceplayer
	showcrytext .Text, PIKACHU
	end

.Text:
	text "Puka: Pi-kaa!"
	done
