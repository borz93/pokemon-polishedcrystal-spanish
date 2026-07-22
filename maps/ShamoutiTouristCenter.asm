ShamoutiTouristCenter_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SHAMOUTI_ISLAND, 4
	warp_event  3,  7, SHAMOUTI_ISLAND, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_LARRY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LarryScript, -1

	object_const_def
	const SHAMOUTITOURISTCENTER_LARRY

LarryScript:
	faceplayer
	checkevent EVENT_BEAT_LARRY
	iftruefwd .After
	opentext
	checkevent EVENT_INTRODUCED_LARRY
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
	setevent EVENT_INTRODUCED_LARRY
	winlosstext .BeatenText, 0
	setlasttalked SHAMOUTITOURISTCENTER_LARRY
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch
	loadtrainer LARRY, 1
	sjumpfwd .StartBattle
.Rematch
	loadtrainer LARRY, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LARRY
.After
	opentext
	checkevent EVENT_GOT_SWEET_HONEY_FROM_LARRY
	iftruefwd .Done
	writetext .RewardText
	promptbutton
	verbosegiveitem SWEET_HONEY
	iffalse_endtext
	setevent EVENT_GOT_SWEET_HONEY_FROM_LARRY
.Done
	jumpthisopenedtext

	text "Bueno, será mejor"
	line "que vuelva al"
	cont "trabajo."

	para "Si me disculpas."
	done

.RewardText:
	text "Para mí, lo mejor"
	line "de viajar"

	para "es probar la"
	line "comida local."

	para "El restaurante de"
	line "aquí cerca hace"

	para "un postre"
if DEF(FAITHFUL)
	line "decadente con"
	cont "Miel."
else
	line "decadente con"
	cont "Miel Dulce."
endc

	para "Deja que comparta"
	line "un poco contigo."
	done

.IntroText:
	text "Hola."
	line "Soy Larry."

	para "Mi jefe me envió"
	line "aquí por trabajo,"

	para "pero también"
	line "puedo disfrutar"
	cont "un poco."

	para "Comí en el"
	line "Restaurante Oasis"
	cont "del hotel."

	para "Me abrió el"
	line "apetito por un"
	cont "combate aún más"
	cont "fuerte."

	para "¿Te unes?"
	done

.RematchText:
	text "Hola de nuevo,"
	line "<PLAYER>."

	para "Ya me enfrentaste,"
	line "así que dudo que"

	para "esto te deje muy"
	line "impresionado."

	para "De todos modos,"
	line "¿empezamos?"
	done

.SeenText:
	text "Yo, Larry, estaré"
	line "a tu servicio."
	done

.BeatenText:
	text "Bueno, ya he"
	line "tenido bastante…"
	done

.RefusedText:
	text "Quizá en otro"
	line "momento, cuando"
	cont "coincidan nuestros"
	cont "horarios."
	done
