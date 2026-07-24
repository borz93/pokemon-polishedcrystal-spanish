CeladonCafe_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  7, CELADON_CITY, 9
	warp_event  7,  7, CELADON_CITY, 9

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_JUMPTEXT, EatathonContestPosterText
	bg_event  7,  1, BGEVENT_JUMPTEXT, EatathonContestTrashCanText

	def_object_events
	object_event  7,  4, SPRITE_MAYLENE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MayleneScript, -1
	object_event  4,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCafeTeacher, -1
	object_event  4,  6, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher1, -1
	object_event  1,  7, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher2, -1
	object_event  1,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher3, -1
	object_event  9,  3, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ChefText_Eatathon, -1
	object_event 11,  4, SPRITE_BAKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCafeBakerText, -1

	object_const_def
	const CELADONCAFE_MAYLENE
	const CELADONCAFE_TEACHER

MayleneScript:
	showtext MayleneText1
	faceplayer
	opentext
	writetext MayleneText2
	waitbutton
	checkevent EVENT_BEAT_MAYLENE
	iftruefwd .Done
	writetext MayleneText3
	yesorno
	iffalsefwd .Refused
	writetext MayleneSeenText
	waitbutton
	closetext
	winlosstext MayleneBeatenText, 0
	setlasttalked CELADONCAFE_MAYLENE
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch
	loadtrainer MAYLENE, 1
	sjumpfwd .StartBattle
.Rematch
	loadtrainer MAYLENE, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MAYLENE
	opentext
	writetext MayleneAfterText
	waitbutton
.Done
	closetext
	turnobject CELADONCAFE_MAYLENE, RIGHT
	end

.Refused
	writetext MayleneRefusedText
	waitbutton
	closetext
	turnobject CELADONCAFE_MAYLENE, RIGHT
	end

CeladonCafeTeacher:
	checkkeyitem COIN_CASE
	iftruefwd .NoCoinCase
	showtext TeacherText_CrunchCrunch
	showtextfaceplayer TeacherText_NoCoinCase
	turnobject LAST_TALKED, LEFT
	end

.NoCoinCase:
	showtext TeacherText_KeepEating
	turnobject CELADONCAFE_TEACHER, RIGHT
	showtext TeacherText_MoreChef
	turnobject CELADONCAFE_TEACHER, LEFT
	end

CeladonCafeFisher1:
	showtext Fisher1Text_Snarfle
	showtextfaceplayer Fisher1Text_Concentration
	turnobject LAST_TALKED, LEFT
	end

CeladonCafeFisher2:
	showtext Fisher2Text_GulpChew
	showtextfaceplayer Fisher2Text_Quantity
	turnobject LAST_TALKED, RIGHT
	end

CeladonCafeFisher3:
	showtext Fisher3Text_MunchMunch
	showtextfaceplayer Fisher3Text_GoldenrodIsBest
	turnobject LAST_TALKED, RIGHT
	end

ChefText_Eatathon:
	text "¡Hola!"

	para "Estamos"
	line "celebrando un"
	cont "concurso de"
	cont "comilones."

	para "No podemos"
	line "servirte ahora."
	cont "Lo siento."
	done

Fisher1Text_Snarfle:
	text "…ñam, mastica…"
	done

Fisher1Text_Concentration:
	text "¡No me hables!"

	para "¡Vas a romper mi"
	line "concentración!"
	done

Fisher2Text_GulpChew:
	text "…Glup… Mastica…"
	done

Fisher2Text_Quantity:
	text "¡Prefiero"
	line "cantidad antes"
	cont "que calidad!"

	para "¡Soy feliz cuando"
	line "estoy lleno!"
	done

Fisher3Text_MunchMunch:
	text "ñam, ñam…"
	done

Fisher3Text_GoldenrodIsBest:
	text "La comida aquí es"
	line "buena, pero en"

	para "Ciudad Trigal está"
	line "la mejor comida de"
	cont "todas partes."
	done

TeacherText_CrunchCrunch:
	text "Cruc… Cruc…"
	done

TeacherText_NoCoinCase:
	text "Nadie aquí te dará"
	line "una Caja de"

	para "Monedas. Deberías"
	line "buscar en Johto."
	done

TeacherText_KeepEating:
	text "Cruc… Cruc…"

	para "¡Puedo seguir"
	line "comiendo!"
	done

TeacherText_MoreChef:
	text "¡Más, chef!"
	done

MayleneText1:
	text "Maylene: ñam ñam"
	line "ñam…"
	done

MayleneText2:
	text "¡El concurso de"
	line "comilones!"

	para "Nunca soñé con"
	line "algo tan"
	cont "maravilloso."

	para "Tras una dieta"
	line "estricta durante"
	cont "el entrenamiento,"
	cont "puedo comer como"
	cont "un Snorlax."

	para "El ganador come"
	line "gratis, además."

	para "¡Eso sí que es un"
	line "sueño hecho"
	cont "realidad!"
	done

MayleneText3:
	text "Estoy empezando a"
	line "sentirme llena…"

	para "Oye, como"
	line "descanso, ¿Quieres"
	cont "combatir conmigo?"
	done

MayleneRefusedText:
	text "Suspiro… Vale."
	done

MayleneSeenText:
	text "¡Vale! ¡Rei!"

	para "Ah, esa es mi"
	line "reverencia antes"
	cont "de un combate."

	para "¡Voy a darlo todo"
	line "contra ti!"
	done

MayleneBeatenText:
	text "Me veo obligada a"
	line "admitir la"
	cont "derrota…"

	para "Eres demasiado"
	line "fuerte."
	done

MayleneAfterText:
	text "¡Gracias,"
	line "<PLAYER>!"

	para "¡Estoy lista para"
	line "seguir comiendo!"
	done

CeladonCafeBakerText:
	text "Trabajo aquí"
	line "porque puedo"

	para "comer cuando"
	line "quiera. Sencillo."
	done

EatathonContestPosterText:
	text "¡Concurso de"
	line "comilones! ¡Sin"
	cont "límite de tiempo!"

	para "¡Un combate sin"
	line "final! ¡El mayor"

	para "tragón se lo lleva"
	line "todo gratis!"
	done

EatathonContestTrashCanText:
	text "La basura está"
	line "llena de sobras"
	cont "del concurso de"
	cont "comilones…"
	done
