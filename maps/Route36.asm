Route36_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE36_NOOP
	scene_const SCENE_ROUTE36_SUICUNE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route36ArthurCallback

	def_warp_events
	warp_event 22,  8, ROUTE_36_NATIONAL_PARK_GATE, 3
	warp_event 22,  9, ROUTE_36_NATIONAL_PARK_GATE, 4
	warp_event 51, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 1
	warp_event 52, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 2
	warp_event 61,  8, ROUTE_36_VIOLET_GATE, 1
	warp_event 61,  9, ROUTE_36_VIOLET_GATE, 2
	warp_event 30, 12, HIDDEN_TREE_GROTTO, 1

	def_coord_events
	coord_event 24,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript
	coord_event 26,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript

	def_bg_events
	bg_event 33,  1, BGEVENT_JUMPTEXT, Route36TrainerTips2Text
	bg_event 49, 11, BGEVENT_JUMPTEXT, RuinsOfAlphNorthSignText
	bg_event 59,  7, BGEVENT_JUMPTEXT, Route36SignText
	bg_event 25,  7, BGEVENT_JUMPTEXT, Route36TrainerTips1Text
	bg_event 53,  4, BGEVENT_JUMPTEXT, Route36AdvancedTips1Text
	bg_event 34,  7, BGEVENT_JUMPTEXT, Route36AdvancedTips2Text
	bg_event 30, 11, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_36
	bg_event 31, 11, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_36

	def_object_events
	object_event 39,  9, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SudowoodoScript, EVENT_ROUTE_36_SUDOWOODO
	object_event 53,  6, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
	object_event 37, 12, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route36FloriaScript, EVENT_FLORIA_AT_SUDOWOODO
	pokemon_event 25,  6, SUICUNE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, ClearText, EVENT_SAW_SUICUNE_ON_ROUTE_36
	object_event 30,  6, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36CooltrainerfChiaraScript, -1
	object_event 24, 13, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicMark, -1
	object_event 35, 14, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 57,  9, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route36LassScript, -1
	object_event 48,  9, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route36RockSmashGuyScript, -1
	fruittree_event 25,  4, FRUITTREE_ROUTE_36, RAWST_BERRY, PAL_NPC_TEAL
	object_event 50,  5, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSchoolgirlMolly, -1

	object_const_def
	const ROUTE36_WEIRD_TREE
	const ROUTE36_ARTHUR
	const ROUTE36_FLORIA
	const ROUTE36_SUICUNE
	const ROUTE36_COOLTRAINERF

Route36ArthurCallback:
	readvar VAR_WEEKDAY
	ifequalfwd THURSDAY, .ArthurAppears
	disappear ROUTE36_ARTHUR
	endcallback

.ArthurAppears:
	appear ROUTE36_ARTHUR
	endcallback

Route36SuicuneScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	turnobject PLAYER, UP
	applymovement ROUTE36_SUICUNE, Route36SuicuneMovement
	disappear ROUTE36_SUICUNE
	turnobject PLAYER, DOWN
	pause 10
	setscene SCENE_ROUTE36_NOOP
	clearevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE
	end

SudowoodoScript:
	checkkeyitem SQUIRTBOTTLE
	iftruefwd .Fight
	waitsfx
	playsound SFX_SANDSTORM
	applyonemovement ROUTE36_WEIRD_TREE, tree_shake
	end

.Fight:
	opentext
	writetext UseSquirtbottleText
	yesorno
	iffalse_endtext
	closetext
WateredWeirdTreeScript:: ; export (for when you use Squirtbottle from pack)
	showtext UsedSquirtbottleText
	waitsfx
	playsound SFX_SANDSTORM
	applyonemovement ROUTE36_WEIRD_TREE, tree_shake
	showtext SudowoodoAttackedText
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon SUDOWOODO, 20
	startbattle
	setevent EVENT_FOUGHT_SUDOWOODO
	ifequalfwd $2, DidntCatchSudowoodo
	disappear ROUTE36_WEIRD_TREE
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .nocatch
	setflag ENGINE_PLAYER_CAUGHT_SUDOWOODO
.nocatch
	end

DidntCatchSudowoodo:
	reloadmapafterbattle
	applymovement ROUTE36_WEIRD_TREE, WeirdTreeMovement_Flee
	disappear ROUTE36_WEIRD_TREE
	special RefreshSprites
	end

Route36FloriaScript:
	scall .FloriaMessage
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	readvar VAR_FACING
	ifequalfwd UP, .Up
	applymovement ROUTE36_FLORIA, FloriaMovement1
	disappear ROUTE36_FLORIA
	end

.Up:
	applymovement ROUTE36_FLORIA, FloriaMovement2
	disappear ROUTE36_FLORIA
	end

.FloriaMessage:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue_jumptextfaceplayer FloriaTextAfterSudowoodo
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue_jumptextfaceplayer FloriaTextAfterSquirtBottle
	jumpthistextfaceplayer

	text "¡Soy Floria, de"
	line "la Floristería!"

	para "¡Escucha,"
	line "escucha!"

	para "Cuando eché agua"
	line "sobre ese árbol"

	para "tembloroso,"
	line "¡saltó de"
	cont "repente!"

	para "Tiene que ser"
	line "un #mon."

	para "¡Seguro que"
	line "saldría de su"

	para "disfraz si lo"
	line "empapas!"

	para "¡Ya sé! ¡Le"
	line "pediré a mi"
	cont "hermana su"
	cont "botella de agua!"
	done

Route36RockSmashGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM50_ROCK_SMASH
	iftruefwd .AlreadyGotRockSmash
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftruefwd .ClearedSudowoodo
	jumpthisopenedtext

	text "¡Vaya!"

	para "Iba a partir ese"
	line "árbol con mi"

	para "puñetazo"
	line "directo."

	para "¡Pero no pude!"
	line "¡Soy un fracaso!"
	done

.ClearedSudowoodo:
	writetext RockSmashGuyText2
	promptbutton
	verbosegivetmhm TM_ROCK_SMASH
	setevent EVENT_GOT_TM50_ROCK_SMASH
.AlreadyGotRockSmash:
	jumpthisopenedtext

	text "Resulta que eso es"
if DEF(FAITHFUL)
	line "Golpe Roca."
else
	line "Demolición."
endc

	para "Puedes romper"
	line "rocas con un solo"

	para "golpe bien"
	line "dirigido."

	para "Si hay rocas en tu"
	line "camino, ¡solo"
if DEF(FAITHFUL)
	cont "demuélelas!"
else
	cont "rómpelas!"
endc
	done

Route36LassScript:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue_jumptextfaceplayer Route36LassText_ClearedSudowoodo
	jumpthistextfaceplayer

	text "Un árbol raro"
	line "bloquea el paso a"
	cont "Ciudad Trigal."

	para "Quería ver el"
	line "enorme Centro"

	para "#mon que acaban"
	line "de abrir…"
	done

TrainerSchoolboyAlan1:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_ALAN
	opentext
	checkflag ENGINE_ALAN_READY_FOR_REMATCH
	iftruefwd .ChooseRematch
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftruefwd .GiveFireStone
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftruefwd .NumberAccepted
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgainForPhoneNumber
	writetext SchoolboyAlanBooksText
	promptbutton
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	sjumpfwd .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	callstd asknumber2m
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername SCHOOLBOY, ALAN1, STRING_BUFFER_3
	callstd registerednumberm
	jumpstd numberacceptedm

.ChooseRematch:
	callstd rematchm
	winlosstext SchoolboyAlan1BeatenText, 0
	readmem wAlanFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 1
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 2
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 3
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, ALAN4
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 4
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, ALAN5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.GiveFireStone:
	callstd giftm
	verbosegiveitem FIRE_STONE
	iffalsefwd .BagFull
	clearflag ENGINE_ALAN_HAS_FIRE_STONE
	setevent EVENT_ALAN_GAVE_FIRE_STONE
	jumpstd numberacceptedm

.BagFull:
	jumpstd packfullm

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

Route36CooltrainerfChiaraScript:
	checkevent EVENT_GOT_BINDING_BAND_FROM_ROUTE_36_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_COOLTRAINERF_CHIARA
	iftruefwd .Beaten
	checkevent EVENT_BEAT_SCHOOLBOY_ALAN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PSYCHIC_MARK
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_SCHOOLGIRL_MOLLY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_TWINS_ANN_AND_ANNE
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PSYCHIC_GREG
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BEAUTY_CALLIE
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BEAUTY_CASSANDRA
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE36_COOLTRAINERF
	loadtrainer COOLTRAINERF, CHIARA
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERF_CHIARA
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem BINDING_BAND
	iffalse_endtext
	setevent EVENT_GOT_BINDING_BAND_FROM_ROUTE_36_LEADER
	jumpthisopenedtext

.AfterText2:
	text "Con tu habilidad,"
	line "no soy la única"

	para "entrenadora"
	line "élite que querrá"
	cont "ponerte a prueba."
	done

.IntroText:
	text "Vi cómo"
	line "despertaste a ese"
	cont "Sudowoodo."

	para "¡Lo hiciste"
	line "genial!"

	para "Y tienes una"
	line "Medalla Planicie."
	cont "¡Yo también!"

	para "¿Qué tal esto?"
	line "Vence a todos los"

	para "entrenadores de"
	line "las Rutas 36 y 37."

	para "¡Entonces yo"
	line "misma lucharé"
	cont "contigo!"
	done

.QuestionText:
	text "Así que venciste"
	line "a todos los demás"
	cont "en la zona."

	para "¡Es hora de"
	line "nuestro"
	cont "enfrentamiento!"

	para "Uso una Banda"
	line "Atadura para"
	cont "reforzar mi"
	cont "ventaja."

	para "¿Crees estar"
	line "lista para mí?"
	done

.RefusedText:
	text "Bueno, ¡estoy"
	line "lista cuando tú"
	cont "quieras!"
	done

.SeenText:
	text "¡No durarás mucho"
	line "contra mi"
	cont "técnica!"
	done

.BeatenText:
	text "¿¡La que no duró"
	line "fui yo?!"
	done

.AfterText1:
	text "Observaste mi"
	line "técnica y la"
	cont "contrarrestaste."

	para "¿Por qué no la"
	line "pruebas tú"
	cont "misma?"

	para "Toma, ¡es para"
	line "ti!"
	done

GenericTrainerPsychicMark:
	generictrainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText

	text "Sería fuerte si"
	line "pudiera saber qué"

	para "piensa mi"
	line "oponente."
	done

GenericTrainerSchoolgirlMolly:
	generictrainer SCHOOLGIRL, MOLLY, EVENT_BEAT_SCHOOLGIRL_MOLLY, SchoolgirlMollySeenText, SchoolgirlMollyBeatenText

	text "Aún me queda"
	line "mucho por"
	cont "aprender."
	done

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftruefwd .AlreadyGotStone
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftruefwd .MetArthur
	writetext MeetArthurText
	promptbutton
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	promptbutton
	verbosegiveitem HARD_STONE
	iffalsefwd .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	jumpthisopenedtext

	text "Julio: Un #mon"
	line "que use"

	para "movimientos Roca"
	line "debería quedarse"
	cont "con esto."

	para "Potencia los"
	line "ataques Roca."
	done

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	endtext

ArthurNotThursdayScript:
	jumpthisopenedtext

	text "Julio: Hoy no es"
	line "jueves. Qué"
	cont "decepción."
	done

WeirdTreeMovement_Flee:
	fast_jump_step_up
	fast_jump_step_up
	step_end

FloriaMovement1:
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

FloriaMovement2:
	step_left
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

Route36SuicuneMovement:
	fix_facing
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_right
	fast_jump_step_right
	fast_jump_step_right
	step_end

UseSquirtbottleText:
	text "Es un árbol raro."
	line "¿Usar Rociador?"
	done

UsedSquirtbottleText:
	text "<PLAYER> usó el"
	line "Rociador."
	done

SudowoodoAttackedText:
	text "¡Al árbol raro no"
	line "le gusta el"
	cont "Rociador!"

	para "¡El árbol raro"
	line "atacó!"
	done


FloriaTextAfterSquirtBottle:
	text "¡Soy Floria, de"
	line "la Floristería!"

	para "Cuando le conté a"
	line "mi hermana sobre"

	para "el árbol"
	line "tembloroso, dijo"
	cont "que es peligroso."

	para "¿Te prestó su"
	line "botella de agua?"

	para "¡Debes ser una"
	line "buena entrenadora"
	cont "entonces!"

	para "Te dejo el árbol"
	line "raro a ti."

	para "¡Hasta luego!"
	done

FloriaTextAfterSudowoodo:
	text "¡Sabía que ese"
	line "árbol tembloroso"
	cont "era un #mon!"

	para "Iba a hacer que"
	line "saliera de su"

	para "disfraz, ¡pero te"
	line "me adelantaste!"

	para "En fin, volveré a"
	line "la Floristería."

	para "Por cierto, soy"
	line "Floria."

	para "¡Hasta luego!"
	done


RockSmashGuyText2:
	text "¿Acabaste con ese"
	line "árbol maldito?"

	para "¡Estoy"
	line "impresionado!"
	cont "Quiero que tengas"
	cont "esto."
	done



Route36LassText_ClearedSudowoodo:
	text "Ese árbol raro"
	line "desapareció sin"
	cont "dejar rastro."

	para "¡Oh! ¿Ese árbol"
	line "era de verdad un"
	cont "#mon?"
	done

PsychicMarkSeenText:
	text "¡Voy a leer tu"
	line "mente!"
	done

PsychicMarkBeatenText:
	text "¡Te leí mal!"
	done

SchoolgirlMollySeenText:
	text "¡El Sr. Earl me"
	line "enseñó a luchar"
	cont "con #mon!"
	done

SchoolgirlMollyBeatenText:
	text "Mis estudios…"
	done

SchoolboyAlan1SeenText:
	text "Gracias a mis"
	line "estudios, ¡estoy"
	cont "listo para"
	cont "cualquier #mon!"
	done

SchoolboyAlan1BeatenText:
	text "¡Vaya! ¿Error de"
	line "cálculo?"
	done

SchoolboyAlanBooksText:
	text "Vaya. Yo también"
	line "estudio cinco"
	cont "horas al día."

	para "Aprender es más"
	line "que solo leer"
	cont "libros."
	done

MeetArthurText:
	text "Julio: ¿Quién"
	line "eres?"

	para "Soy Julio del"
	line "Jueves."
	done

ArthurGivesGiftText:
	text "Toma. Puedes"
	line "quedarte con"
	cont "esto."
	done


ArthurThursdayText:
	text "Julio: Soy Julio"
	line "del Jueves."

	para "Soy el segundo"
	line "hijo de siete"
	cont "hermanos."
	done


Route36SignText:
	text "Ruta 36"
	done

RuinsOfAlphNorthSignText:
	text "Ruinas de Alph"
	line "Entrada Norte"
	done

Route36TrainerTips1Text:
	text "Consejos de"
	line "Entrenador"

	para "Las stats de los"
	line "#mon varían,"
	cont "incluso dentro de"
	cont "la misma especie."

	para "Sus stats pueden"
	line "ser similares al"
	cont "principio."

	para "Pero las"
	line "diferencias se"

	para "notarán a medida"
	line "que crecen."
	done

Route36TrainerTips2Text:
	text "Consejos de"
	line "Entrenador"

	para "Usa Excavar para"
	line "volver a la"
	cont "entrada de"
	cont "cualquier lugar."

	para "Es útil para"
	line "explorar cuevas"

	para "y otros puntos de"
	line "interés."
	done

Route36AdvancedTips1Text:
	text "¡Consejos"
	line "avanzados!"

	para "Puedes elegir"
	line "entre veinte"
	cont "marcos de"
	cont "diálogo y ocho"

	para "¡tipos de letra"
	line "distintos en"
	cont "las Opciones!"
	done

Route36AdvancedTips2Text:
	text "¡Consejos"
	line "avanzados!"

	para "Cuidar a tus"
	line "#mon con cortes"
	cont "de pelo,"
	cont "bendiciones o"

	para "¡masajes puede"
	line "hacer que te"

	para "ayuden en batalla"
	line "por su cariño!"
	done
