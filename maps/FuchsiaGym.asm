FuchsiaGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 17, FUCHSIA_CITY, 2
	warp_event  5, 17, FUCHSIA_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, FuchsiaGymStatue
	bg_event  6, 15, BGEVENT_READ, FuchsiaGymStatue

	def_object_events
	object_event  5,  7, SPRITE_JANINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaGymJanineScript, -1
	object_event  1, 10, SPRITE_FUCHSIA_GYM_1, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, LassAmandaScript, -1
	object_event  5, 11, SPRITE_FUCHSIA_GYM_2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, LassLindaScript, -1
	object_event  9,  4, SPRITE_FUCHSIA_GYM_3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PicnickerCindyScript, -1
	object_event  4,  2, SPRITE_FUCHSIA_GYM_4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CamperBarryScript, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaGymGuyScript, -1

	object_const_def
	const FUCHSIAGYM_JANINE
	const FUCHSIAGYM_FUCHSIA_GYM_1
	const FUCHSIAGYM_FUCHSIA_GYM_2
	const FUCHSIAGYM_FUCHSIA_GYM_3
	const FUCHSIAGYM_FUCHSIA_GYM_4

FuchsiaGymJanineScript:
	checkflag ENGINE_MARSHBADGE
	iftruefwd .FightDone
	applymovement FUCHSIAGYM_JANINE, Movement_NinjaSpin
	showtextfaceplayer JanineText_DisappointYou
	winlosstext JanineText_ToughOne, 0
	loadtrainer JANINE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JANINE
	setevent EVENT_BEAT_LASS_AMANDA
	setevent EVENT_BEAT_LASS_LINDA
	setevent EVENT_BEAT_PICNICKER_CINDY
	setevent EVENT_BEAT_CAMPER_BARRY
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_CUTE_GIRL
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_CUTE_GIRL
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_CUTE_GIRL
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_SCHOOLBOY
	special RefreshSprites
	opentext
	givebadge MARSHBADGE, KANTO_REGION
	callstd kantopostgymevents
	sjumpfwd .AfterBattle
.FightDone:
	faceplayer
	opentext
.AfterBattle:
	checkevent EVENT_GOT_TM66_POISON_JAB
	iftrue_jumpopenedtext JanineText_ApplyMyself
	writetext JanineText_ToxicSpeech
	promptbutton
	verbosegivetmhm TM_POISON_JAB
	setevent EVENT_GOT_TM66_POISON_JAB
	jumpthisopenedtext

	text "Es Puya Nociva,"
	line "un poderoso"

	para "movimiento de tipo"
	line "Veneno que puede"
	cont "envenenar a la"
	cont "víctima."
	done

LassAmandaScript:
	checkevent EVENT_BEAT_LASS_AMANDA
	iftruefwd .AmandaUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_1, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_LASS
	special RefreshSprites
.AmandaUnmasked:
	checkevent EVENT_BEAT_LASS_AMANDA
	iftrue_jumptextfaceplayer LassAmandaAfterText
	faceplayer
	showtext LassAmandaBeforeText
	winlosstext LassAmandaBeatenText, 0
	loadtrainer LASS, AMANDA
	startbattle
	iftruefwd .AmandaBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_AMANDA
	end

.AmandaBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_JANINE
	reloadmapafterbattle
	end

LassLindaScript:
	checkevent EVENT_BEAT_LASS_LINDA
	iftruefwd .LindaUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_2, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_LASS
	special RefreshSprites
.LindaUnmasked:
	checkevent EVENT_BEAT_LASS_LINDA
	iftrue_jumptextfaceplayer LassLindaAfterText
	faceplayer
	showtext LassLindaBeforeText
	winlosstext LassLindaBeatenText, 0
	loadtrainer LASS, LINDA
	startbattle
	iftruefwd .LindaBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_LINDA
	end

.LindaBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_JANINE
	reloadmapafterbattle
	end

PicnickerCindyScript:
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftruefwd .CindyUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_3, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_PICNICKER
	special RefreshSprites
.CindyUnmasked:
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftrue_jumptextfaceplayer PicnickerCindyAfterText
	faceplayer
	showtext PicnickerCindyBeforeText
	winlosstext PicnickerCindyBeatenText, 0
	loadtrainer PICNICKER, CINDY
	startbattle
	iftruefwd .CindyBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_PICNICKER_CINDY
	end

.CindyBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_JANINE
	reloadmapafterbattle
	end

CamperBarryScript:
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftruefwd .BarryUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_4, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_SCHOOLBOY
	special RefreshSprites
.BarryUnmasked:
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftrue_jumptextfaceplayer CamperBarryAfterText
	faceplayer
	showtext CamperBarryBeforeText
	winlosstext CamperBarryBeatenText, 0
	loadtrainer CAMPER, BARRY
	startbattle
	iftruefwd .BarryBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_CAMPER_BARRY
	end

.BarryBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_JANINE
	reloadmapafterbattle
	end

FuchsiaGymGuyScript:
	checkevent EVENT_BEAT_JANINE
	iftrue_jumptextfaceplayer FuchsiaGymGuyWinText
	jumpthistextfaceplayer

	text "¡Eh! ¡Futuro"
	line "Campeón!"

	para "¡Vaya! Mira bien a"
	line "tu alrededor."

	para "Todas las"
	line "entrenadoras"
	cont "parecen la Líder,"
	cont "Janine."

	para "¿Cuál de ellas es"
	line "la Janine real?"
	done

FuchsiaGymStatue:
	gettrainername JANINE, 1, STRING_BUFFER_4
	checkflag ENGINE_MARSHBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

Movement_NinjaSpin:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

JanineText_DisappointYou:
	text "Fufufufu…"

	para "Siento"
	line "decepcionarte…"

	para "¡Solo bromeaba!"

	para "¡Soy la de"
	line "verdad!"

	para "¡Janine del"
	line "Gimnasio de"
	cont "Fucsia, esa soy"
	cont "yo!"
	done

JanineText_ToughOne:
	text "Janine: Eres"
	line "dura. Sin duda"
	cont "ganaste…"

if DEF(FAITHFUL)
	para "Toma la Medalla"
	line "Alma."
else
	para "Toma la Medalla"
	line "Pantano."
endc
	done

JanineText_ToxicSpeech:
	text "Janine: ¡Eres tan"
	line "dura! ¡Tengo un"
	cont "regalo especial!"
	done

JanineText_ApplyMyself:
	text "Janine: Voy a"
	line "esforzarme de"

	para "verdad y mejorar"
	line "mis habilidades."

	para "¡Quiero ser mejor"
	line "que Padre y tú!"
	done

LassAmandaBeforeText:
	text "¡Fufufu!"

	para "¡Soy Janine, la"
	line "Líder de"
	cont "Gimnasio!"

	para "¡No, no lo soy!"
	line "¡Te engañé,"
	cont "incauta!"
	done

LassAmandaBeatenText:
	text "Te tenía"
	line "engañada…"
	done

LassAmandaAfterText:
	text "¿Cómo"
	line "distinguirás a"
	cont "nuestra Líder"
	cont "real?"
	done

LassLindaBeforeText:
	text "¡Te engañé!"
	line "¡Jajaja!"
	done

LassLindaBeatenText:
	text "Ooh… Perdí…"
	line "No eres débil…"
	done

LassLindaAfterText:
	text "¿Y bien? ¿No fue"
	line "perfecto mi"
	cont "disfraz?"
	done

PicnickerCindyBeforeText:
	text "¡Soy Janine!"

	para "¿Cómo sabías que"
	line "era la real?"

	para "¡Combatamos!"
	done

PicnickerCindyBeatenText:
	text "¡Rayos!"
	line "¡Quería ganar!"
	done

PicnickerCindyAfterText:
	text "Debes estar"
	line "cansándote."
	done

CamperBarryBeforeText:
	text "¡Wajajaja!"

	para "¡Claro que sí!"
	line "¡Soy Janine!"
	done

CamperBarryBeatenText:
	text "¡Mi disfraz era"
	line "perfecto! ¡Vaya!"
	done

CamperBarryAfterText:
	text "Oye, tú. ¿Era mono"
	line "mi disfraz o qué,"
	cont "eh?"
	done


FuchsiaGymGuyWinText:
	text "¡Ese fue un gran"
	line "combate,"
	cont "entrenador de"
	cont "Johto!"
	done
