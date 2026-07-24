RocketHideoutB4F_MapScriptHeader:
	def_scene_scripts
	scene_script RocketHideoutB4FMeetLeadersScene, SCENE_ROCKETHIDEOUTB4F_MEET_LEADERS
	scene_script RocketHideoutB4FMetLeadersScene, SCENE_ROCKETHIDEOUTB4F_MET_LEADERS
	scene_const SCENE_ROCKETHIDEOUTB4F_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RocketHideoutB4FLiftKeyScript
	callback MAPCALLBACK_TILES, RocketHideoutB4FDoorScript

	def_warp_events
	warp_event 11, 10, ROCKET_HIDEOUT_B3F, 2
	warp_event 16, 15, ROCKET_HIDEOUT_ELEVATOR, 1
	warp_event 17, 15, ROCKET_HIDEOUT_ELEVATOR, 1

	def_coord_events
	coord_event 16, 11, SCENE_ROCKETHIDEOUTB4F_MEET_LEADERS, RocketHideoutB4FMeetLeadersLeftScript
	coord_event 17, 11, SCENE_ROCKETHIDEOUTB4F_MEET_LEADERS, RocketHideoutB4FMeetLeadersRightScript

	def_bg_events
	bg_event 17,  1, BGEVENT_ITEM + MAX_POTION, EVENT_ROCKET_HIDEOUT_B4F_HIDDEN_MAX_POTION

	def_object_events
	object_event 17,  3, SPRITE_CANDELA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FCandelaScript, -1
	object_event 16,  6, SPRITE_SPARK, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FSparkScript, -1
	object_event 19,  6, SPRITE_BLANCHE, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FBlancheScript, -1
	object_event  3,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FYoungsterArdenScript, -1
	object_event 15, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, RocketHideoutB4FTeacherSerena, -1
	object_event 18, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, RocketHideoutB4FSuperNerdNolan, -1
	keyitemball_event 2,  2, LIFT_KEY, EVENT_ROCKET_HIDEOUT_B4F_LIFT_KEY
	itemball_event 1,  4, X_SP_ATK,    1, EVENT_ROCKET_HIDEOUT_B4F_X_SP_ATK
	itemball_event 2, 12, PP_UP,        1, EVENT_ROCKET_HIDEOUT_B4F_PP_UP
	itemball_event 4, 20, DUBIOUS_DISC, 1, EVENT_ROCKET_HIDEOUT_B4F_DUBIOUS_DISC

	object_const_def
	const ROCKETHIDEOUTB4F_CANDELA
	const ROCKETHIDEOUTB4F_SPARK
	const ROCKETHIDEOUTB4F_BLANCHE
	const ROCKETHIDEOUTB4F_YOUNGSTER_ARDEN
	const ROCKETHIDEOUTB4F_TEACHER_SERENA
	const ROCKETHIDEOUTB4F_SUPER_NERD_NOLAN
	const ROCKETHIDEOUTB4F_LIFT_KEY

RocketHideoutB4FDoorScript:
	checkevent EVENT_BEAT_TEACHER_SERENA
	iftruefwd .beat_serena
	changeblock 16, 10, $07
	endcallback
.beat_serena
	checkevent EVENT_BEAT_SUPER_NERD_NOLAN
	iftruefwd .beat_theo
	changeblock 16, 10, $07
	endcallback
.beat_theo
	changeblock 16, 10, $0d
	endcallback

RocketHideoutB4FLiftKeyScript:
	checkevent EVENT_BEAT_YOUNGSTER_ARDEN
	iftruefwd .beat_arden
	disappear ROCKETHIDEOUTB4F_LIFT_KEY
.beat_arden
	endcallback

RocketHideoutB4FMeetLeadersLeftScript:
	checktime (1 << EVE) | (1 << NITE)
	iffalse TooEarly
	applymovement PLAYER, .MovePlayerUp
	sjumpfwd RocketHideoutB4FMeetLeadersScript

.MovePlayerUp:
	step_up
	step_up
	step_up
	step_up
	step_right
	turn_head_up
	step_end

RocketHideoutB4FMeetLeadersRightScript:
	checktime (1 << EVE) | (1 << NITE)
	iffalse TooEarly
	applymovement PLAYER, .MovePlayerUp
	sjumpfwd RocketHideoutB4FMeetLeadersScript

.MovePlayerUp:
	step_up
	step_up
	step_up
	step_up
	step_end

RocketHideoutB4FMeetLeadersScript:
	setscene SCENE_ROCKETHIDEOUTB4F_MET_LEADERS
	showtext .CandelaIntro1Text
	turnobject ROCKETHIDEOUTB4F_SPARK, RIGHT
	showtext .BlancheIntro1Text
	turnobject ROCKETHIDEOUTB4F_BLANCHE, LEFT
	turnobject ROCKETHIDEOUTB4F_SPARK, UP
	pause 20
	turnobject ROCKETHIDEOUTB4F_SPARK, RIGHT
	showtext .SparkIntro1Text
	turnobject ROCKETHIDEOUTB4F_SPARK, UP
	turnobject ROCKETHIDEOUTB4F_BLANCHE, UP
	showtext .CandelaIntro2Text
	turnobject ROCKETHIDEOUTB4F_SPARK, RIGHT
	showtext .BlancheIntro2Text
	turnobject ROCKETHIDEOUTB4F_BLANCHE, LEFT
	turnobject ROCKETHIDEOUTB4F_SPARK, UP
	showtext .SparkIntro2Text
	turnobject ROCKETHIDEOUTB4F_SPARK, DOWN
	showtext .SparkIntro3Text
	turnobject ROCKETHIDEOUTB4F_BLANCHE, DOWN
	showtext .CandelaIntro3Text
	setmapobjectmovedata ROCKETHIDEOUTB4F_SPARK, SPRITEMOVEDATA_STANDING_DOWN
	setmapobjectmovedata ROCKETHIDEOUTB4F_BLANCHE, SPRITEMOVEDATA_STANDING_DOWN
	end


.CandelaIntro1Text:
	text "Candela: Te lo"
	line "digo, ¡el poder"
	cont "puro gana"
	cont "siempre!"

	para "¡El entrenamiento"
	line "debe ser duro,"
	cont "como un combate!"
	done

.BlancheIntro1Text:
	text "Blanche: La"
	line "fuerza no sirve de"
	cont "nada sin"
	cont "estrategia."

	para "La planificación"
	line "inteligente gana,"
	cont "siempre."
	done

.SparkIntro1Text:
	text "Spark: ¡Las dos os"
	line "estáis perdiendo"
	cont "lo importante!"

	para "El instinto es la"
	line "clave… ¡Confiad en"
	cont "vuestro olfato!"
	done

.CandelaIntro2Text:
	text "Candela:"
	line "¿Instinto? ¡Eso"
	cont "es solo"
	cont "adivinar!"

	para "¡Los entrenadores"
	line "de verdad confían"
	cont "en la fuerza!"
	done

.BlancheIntro2Text:
	text "Blanche: Candela,"
	line "Spark, ¡no es"
	cont "momento para eso!"

	para "¿Qué hay del"
	line "proyecto del gran"
	cont "árbol?"
	done

.SparkIntro2Text:
	text "Spark: ¡Cierto! El"
	line "gran cerezo…"
	done

.SparkIntro3Text:
	text "Espera, ¿Quién es"
	line "ese?"
	done

.CandelaIntro3Text:
	text "Candela: Parece"
	line "que este tiene"
	cont "poder."

	para "Ya que llegaste"
	line "hasta aquí,"
	cont "¡combatamos!"

	para "Si ganas, te"
	line "dejaremos"
	cont "participar en"
	cont "nuestro gran"
	cont "proyecto."
	done

RocketHideoutB4FMeetLeadersScene:
RocketHideoutB4FMetLeadersScene:
TooEarly:
	end


RocketHideoutB4FSparkScript:
	faceplayer
	checkevent EVENT_BEAT_SPARK
	iftrue_jumptext .AfterText2
	opentext
	writetext .GreetingText
	yesorno
	iffalsefwd .Refused
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer SPARK_T, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SPARK
	opentext
	writetext .AfterText1
	waitbutton
	verbosegivekeyitem MALIGN_LURE
	writetext .AfterText2
	waitbutton
	checkevent EVENT_BEAT_CANDELA
	iffalse_endtext
	checkevent EVENT_BEAT_BLANCHE
	iffalse_endtext
	sjump RocketHideoutB4FDefeatedAllLeadersScript

.Refused:
	jumpopenedtext .RefusedText

.GreetingText:
	text "Spark: ¡Ey!"
	line "¿Listo para"
	cont "confiar en tu"
	cont "olfato? ¿En un"
	cont "combate?"
	done

.SeenText:
	text "¡Genial! ¡Veamos"
	line "hasta dónde te"
	cont "lleva tu"
	cont "instinto!"
	done

.BeatenText:
	text "¡Vaya, lo"
	line "clavaste!"

	para "¡Tu olfato tenía"
	line "razón!"
	done

.AfterText1:
	text "Spark: Toma el"
	line "Señuelo Vil."
	done

.AfterText2:
	text "El Señuelo Vil"
	line "atrae energía"
	cont "audaz."

	para "¡Es mi forma de"
	line "encender la"
	cont "creatividad!"

	para "¡Empléalo con"
	line "audacia!"
	done

.RefusedText:
	text "¡Ay, qué chasco!"
	line "¡No dejes que el"
	cont "miedo te frene!"

	para "Vuelve cuando lo"
	line "sientas."
	done

RocketHideoutB4FCandelaScript:
	faceplayer
	checkevent EVENT_BEAT_CANDELA
	iftrue_jumptext .AfterText2
	opentext
	writetext .GreetingText
	yesorno
	iffalsefwd .Refused
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer CANDELA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CANDELA
	opentext
	writetext .AfterText1
	waitbutton
	verbosegivekeyitem HARSH_LURE
	writetext .AfterText2
	waitbutton
	checkevent EVENT_BEAT_SPARK
	iffalse_endtext
	checkevent EVENT_BEAT_BLANCHE
	iffalse_endtext
	sjump RocketHideoutB4FDefeatedAllLeadersScript

.Refused:
	jumpopenedtext .RefusedText

.GreetingText:
	text "Candela: ¿Quieres"
	line "probar tu"
	cont "fuerza?"
	done

.SeenText:
	text "¡Ese es el"
	line "espíritu!"
	cont "¡Muéstrame tu"
	cont "poder!"
	done

.BeatenText:
	text "Bien, hoy has"
	line "demostrado tu"
	cont "fuerza."

	para "Admito mi"
	line "derrota."
	done

.AfterText1:
	text "Candela: Toma el"
	line "Señuelo Duro."
	done

.AfterText2:
	text "Candela: El"
	line "Señuelo Duro"
	cont "atrae poder"
	cont "feroz."

	para "Esta es mi"
	line "contribución a"
	cont "nuestro proyecto."

	para "Empléalo con"
	line "sabiduría."
	done

.RefusedText:
	text "¿No? Supongo que"
	line "aún no es tu"
	cont "momento."

	para "Vuelve cuando"
	line "tengas más fuego."
	done

RocketHideoutB4FBlancheScript:
	faceplayer
	checkevent EVENT_BEAT_BLANCHE
	iftrue_jumptext .AfterText2
	opentext
	writetext .GreetingText
	yesorno
	iffalsefwd .Refused
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer BLANCHE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLANCHE
	opentext
	writetext .AfterText1
	waitbutton
	verbosegivekeyitem POTENT_LURE
	writetext .AfterText2
	waitbutton
	checkevent EVENT_BEAT_SPARK
	iffalse_endtext
	checkevent EVENT_BEAT_CANDELA
	iffalse_endtext
	sjump RocketHideoutB4FDefeatedAllLeadersScript

.Refused:
	jumpopenedtext .RefusedText

.GreetingText:
	text "Blanche: ¿Valoras"
	line "la estrategia?"

	para "¿Ponemos a prueba"
	line "tus tácticas?"
	done

.SeenText:
	text "Muy bien, ¡veamos"
	line "tu técnica!"
	done

.BeatenText:
	text "Un plan bien"
	line "ejecutado, sin"
	cont "duda."

	para "Me has superado."
	done

.AfterText1:
	text "Blanche: Esto es"
	line "el Señ. Fuerte."
	done

.AfterText2:
	text "El Señ. Fuerte"
	line "amplifica su"
	cont "precisión."

	para "Es mi"
	line "contribución para"
	cont "asegurar nuestro"
	cont "éxito."

	para "Empléalo con"
	line "cuidado."
	done

.RefusedText:
	text "Hmm, ¿No te"
	line "sientes seguro?"

	para "Vuelve cuando"
	line "estés listo para"
	cont "pensar con"
	cont "antelación."
	done

RocketHideoutB4FYoungsterArdenScript:
	faceplayer
	checkevent EVENT_BEAT_YOUNGSTER_ARDEN
	iftruefwd .AfterBattle
	showtext .GreetingText
	winlosstext .BeatenText, 0
	loadtrainer YOUNGSTER, ARDEN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_YOUNGSTER_ARDEN
	readvar VAR_FACING
	ifnotequal RIGHT, .NotLeftOfArden
	moveobject ROCKETHIDEOUTB4F_LIFT_KEY, 4, 2
.NotLeftOfArden
	appear ROCKETHIDEOUTB4F_LIFT_KEY
.AfterBattle
	showtext .AfterText
	end

.GreetingText
	text "El Team Valor"
	line "es…"

	para "¡Espera… No!"

	para "Digo, ¡creo que"
	line "estoy perdido!"
	done

.BeatenText:
	text "¿Por dónde era"
	line "el ascensor?"
	done

.AfterText:
	text "Ay, ¡se me cayó"
	line "la llave del"
	cont "ascensor!"

	para "¡Candela se va a"
	line "enfadar mucho!"
	done

RocketHideoutB4FTeacherSerena:
	trainer TEACHER_F, SERENA, EVENT_BEAT_TEACHER_SERENA, .SeenText, .AfterText, 0, .Script

.Script
	checkevent EVENT_BEAT_TEACHER_SERENA
	iftruefwd .AfterScript
	jumpthistextfaceplayer

.AfterScript
	checkevent EVENT_BEAT_SUPER_NERD_NOLAN
	iftruefwd .DoorScript
	endifjustbattled
	jumptextfaceplayer .AfterText
	end

.DoorScript
	checkjustbattled
	iffalsefwd .skip_open
	changeblock 16, 10, $0d
	playsound SFX_ENTER_DOOR
	waitsfx
	refreshmap
	special RestartMapMusic
	end
.skip_open
	jumptextfaceplayer .AfterText
	end

.AfterText
	text "Los líderes solo"
	line "están aquí de"
	cont "noche."

	para "Trabajan en la"
	line "universidad de"
	cont "día."
	done

.SeenText:
	text "Veamos si eres lo"
	line "bastante listo"

	para "para enfrentarte a"
	line "los líderes."
	done

.BeatenText:
	text "¡Se acabó la"
	line "clase!"
	done

RocketHideoutB4FSuperNerdNolan:
	trainer TEACHER_M, NOLAN, EVENT_BEAT_SUPER_NERD_NOLAN, .SeenText, .AfterText, 0, .Script

.Script
	checkevent EVENT_BEAT_SUPER_NERD_NOLAN
	iftruefwd .AfterScript
	jumpthistextfaceplayer

.AfterScript
	checkevent EVENT_BEAT_TEACHER_SERENA
	iftruefwd .DoorScript
	endifjustbattled
	jumptextfaceplayer .AfterText
	end

.DoorScript
	checkjustbattled
	iffalsefwd .skip_open
	changeblock 16, 10, $0d
	playsound SFX_ENTER_DOOR
	waitsfx
	refreshmap
	special RestartMapMusic
	end
.skip_open
	jumptextfaceplayer .AfterText
	end

.AfterText
	text "Los líderes"
	line "discuten mucho,"
	cont "pero son buenos"
	cont "amigos."
	done

.SeenText:
	text "¿Vienes a desafiar"
	line "a los líderes?"

	para "¡Primero tienes"
	line "que vencerme a"
	cont "mí!"
	done

.BeatenText:
	text "¡Me quedé en"
	line "blanco!"
	done

RocketHideoutB4FDefeatedAllLeadersScript:
	closetext
	special FadeOutPalettes
	warpfacing UP, ROCKET_HIDEOUT_B4F, 17, 7
	turnobject ROCKETHIDEOUTB4F_SPARK, DOWN
	turnobject ROCKETHIDEOUTB4F_BLANCHE, DOWN
	special LoadMapPalettes
	special FadeInPalettes_EnableDynNoApply
	showtext .FinalText
	end

.FinalText:
	text "Candela: Eres más"
	line "fuerte de lo que"
	cont "esperaba."

	para "Los aerosoles que"
	line "te dimos son más"
	cont "de lo que"
	cont "parecen."

	para "Blanche: Cada"
	line "señuelo contiene"

	para "la esencia de un"
	line "ave legendaria"
	cont "#mon."

	para "Fueron creados"
	line "para llamar a"

	para "otros de su"
	line "especie."

	para "Spark: Pero solo"
	line "son útiles en el"
	cont "lugar correcto."

	para "Por eso el gran"
	line "árbol es"
	cont "importante."

	para "Candela: El árbol"
	line "es antiguo,"

	para "un lugar sagrado"
	line "para anidar."

	para "Está conectado a"
	line "la energía de la"
	cont "región."

	para "Blanche: Aves de"
	line "gran poder se han"

	para "reunido ahí"
	line "durante"
	cont "generaciones."

	para "El árbol amplifica"
	line "la llamada de los"
	cont "señuelos."

	para "Spark: Así que si"
	line "los usas allí,"

	para "¡quién sabe qué"
	line "podría aparecer!"
	done
