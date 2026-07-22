SproutTower1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7, 15, VIOLET_CITY, 7
	warp_event  8, 15, VIOLET_CITY, 7
	warp_event  4,  4, SPROUT_TOWER_2F, 1
	warp_event  0,  6, SPROUT_TOWER_2F, 2
	warp_event 15,  3, SPROUT_TOWER_2F, 3

	def_coord_events

	def_bg_events
	bg_event  5, 15, BGEVENT_JUMPTEXT, SproutTower1FStatueText
	bg_event 10, 15, BGEVENT_JUMPTEXT, SproutTower1FStatueText

	def_object_events
	object_event 11,  4, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KimonoGirlMakoScript, -1
	object_event  5,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SproutTower1FSage1Text, -1
	object_event  4,  7, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SproutTower1FSage2Text, -1
	object_event  9, 12, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SproutTower1FGrannyScript, -1
	object_event  7,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, SproutTower1FTeacherText, -1
	object_event  1,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSageChow, -1
	itemball_event 14,  7, PARALYZEHEAL, 1, EVENT_SPROUT_TOWER1F_PARALYZEHEAL

	object_const_def
	const SPROUTTOWER1F_KIMONO_GIRL

SproutTower1FGrannyScript:
	checkunits
	iftrue_jumptextfaceplayer .MetricText
	jumpthistextfaceplayer

	text "Un Bellsprout de"
	line "más de 30 metros…"

	para "Dicen que se"
	line "convirtió en el"
	cont "pilar central de"
	cont "aquí."
	done

.MetricText:
	text "Un Bellsprout de"
	line "más de 30 metros…"

	para "Dicen que se"
	line "convirtió en el"
	cont "pilar central de"
	cont "aquí."
	done

GenericTrainerSageChow:
	generictrainer SAGE, CHOW, EVENT_BEAT_SAGE_CHOW, SageChowSeenText, SageChowBeatenText

	text "Todos los seres"
	line "vivos coexisten"
	cont "mediante la"
	cont "cooperación."

	para "Siempre debemos"
	line "estar"
	cont "agradecidos por"
	cont "ello."
	done

SageChowSeenText:
	text "Vigilamos esta"
	line "torre."

	para "Aquí expresamos"
	line "nuestra gratitud"
	cont "en honor a todos"
	cont "los #mon."
	done

SageChowBeatenText:
	text "¡Gr-Gracias!"
	done

SproutTower1FSage1Text:
	text "Solo si llegas a"
	line "la cima"
	cont "conseguirás una"
	cont "MT."
	done

SproutTower1FSage2Text:
	text "La Torre"
	line "Bellsprout se"
	cont "construyó hace"
	cont "mucho tiempo"

	para "como lugar para"
	line "entrenar #mon."
	done

SproutTower1FTeacherText:
	text "¿Ves el pilar"
	line "temblar?"

	para "Hay gente"
	line "entrenando"
	cont "arriba."
	done

SproutTower1FStatueText:
	text "Una estatua"
	line "#mon…"

	para "Se ve muy"
	line "distinguida."
	done

KimonoGirlMakoScript:
	checkevent EVENT_GOT_RARE_CANDY_FROM_KIMONO_GIRL_MAKO
	iftrue_jumptextfaceplayer .OutroText
	faceplayer
	checkevent EVENT_BEAT_KIMONO_GIRL_MAKO
	iftruefwd .Beaten
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse_jumptext .IntroText
	showtext .SeenText
	winlosstext .BeatenText, 0
	setlasttalked SPROUTTOWER1F_KIMONO_GIRL
	loadtrainerwithpal KIMONO_GIRL, MAKO, TRAINERPAL_MAKO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KIMONO_GIRL_MAKO
.Beaten:
	opentext
	writetext .AfterText
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse_endtext
	setevent EVENT_GOT_RARE_CANDY_FROM_KIMONO_GIRL_MAKO
	jumpthisopenedtext

.OutroText:
	text "Las Chicas Kimono"
	line "bailamos, pero"
	cont "también"
	cont "combatimos."
	done

.IntroText:
	text "Hola, entrenador."

	para "Soy una Chica"
	line "Kimono."

	para "Viajé hasta aquí"
	line "desde Ciudad"
	cont "Iris, a través del"
	cont "bosque y la"
	cont "caverna,"

	para "para entrenar en"
	line "esta torre."

	para "¿Has conocido a"
	line "mis cinco primas"
	cont "bailarinas en"
	cont "Ciudad Iris?"

	para "¡Vuelve y"
	line "cuéntamelo si es"
	cont "así!"
	done

.SeenText:
	text "Vaya, vaya…"
	line "¿Venciste a mis"

	para "cinco primas"
	line "bailarinas?"

	para "¡Entonces déjame"
	line "retarte a ti y a"
	cont "tus #mon!"
	done

.BeatenText:
	text "Vaya, de verdad"
	line "eres fuerte…"
	done

.AfterText:
	text "¡Excelente"
	line "espíritu de"
	cont "lucha!"

	para "¡Sabrás qué hacer"
	line "con esto!"
	done
