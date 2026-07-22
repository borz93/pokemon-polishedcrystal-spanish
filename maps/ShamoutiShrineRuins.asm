ShamoutiShrineRuins_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 18, NOISY_FOREST, 3
	warp_event  2, 19, NOISY_FOREST, 4

	def_coord_events

	def_bg_events
	bg_event  7, 10, BGEVENT_ITEM + MAX_REVIVE, EVENT_SHAMOUTI_SHRINE_RUINS_HIDDEN_MAX_REVIVE

	def_object_events
	object_event  8, 11, SPRITE_LAWRENCE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ShamoutiShrineRuinsLawrenceScript, EVENT_LAWRENCE_SHAMOUTI_SHRINE_RUINS
	object_event 10, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiShrineRuinsGrampsText, -1
	object_event 14, 13, SPRITE_LADY, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiShrineRuinsLadyText, -1
	itemball_event  4, 27, RARE_CANDY, 1, EVENT_SHAMOUTI_SHRINE_RUINS_RARE_CANDY

	object_const_def
	const SHAMOUTISHRINERUINS_LAWRENCE

ShamoutiShrineRuinsLawrenceScript:
	special Special_FadeOutMusic
	pause 15
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	setlasttalked SHAMOUTISHRINERUINS_LAWRENCE
	loadtrainer LAWRENCE, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	opentext
	writetext .AfterText
	promptbutton
	verbosegivekeyitem SILVER_WING
	writetext .SilverWingText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequalfwd UP, .up
	ifequalfwd DOWN, .down
	ifequalfwd LEFT, .left
.right
	turnobject SHAMOUTISHRINERUINS_LAWRENCE, RIGHT
	sjumpfwd .continue
.up
	turnobject SHAMOUTISHRINERUINS_LAWRENCE, UP
	sjumpfwd .continue
.down
	turnobject SHAMOUTISHRINERUINS_LAWRENCE, DOWN
	sjumpfwd .continue
.left
	turnobject SHAMOUTISHRINERUINS_LAWRENCE, LEFT
.continue
	pause 40
	showtextfaceplayer .GoodbyeText
	playsound SFX_WARP_TO
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SHAMOUTISHRINERUINS_LAWRENCE
	waitsfx
	special Special_FadeInQuickly
	setevent EVENT_BEAT_LAWRENCE
	playmapmusic
	end

.SeenText:
	text "Lawrence: Busqué"
	line "por muchas"

	para "regiones para"
	line "atrapar a"
	cont "Articuno, Zapdos"
	cont "y Moltres."

	para "Sin el conjunto"
	line "completo, no"

	para "puedo despertar al"
	line "guardián del"
	cont "mar…"

	para "¡Me ayudarás a"
	line "completar mi"
	cont "colección!"
	done

.BeatenText:
	text "Increíble."
	line "Venciste a mi"
	cont "colección"
	cont "legendaria…"
	done

.AfterText:
	text "Lawrence: Tus"
	line "#mon no son"
	cont "solo una"
	cont "colección para"
	cont "ti, ¿verdad?"

	para "Los tratas casi"
	line "como amigos."

	para "¿Será así como"
	line "venciste a mis"
	cont "#mon"
	cont "legendarios?"

	para "Bueno, creo que"
	line "te ganaste esto."
	done

.SilverWingText:
	text "Esa pluma Ala de"
	line "Plata viene del"

	para "guardián del mar."

	para "El aroma debería"
	line "atraerlo, pero"

	para "solo si has"
	line "dominado los tres"

	para "espejismos"
	line "alados: las aves"
	cont "del fuego, el"
	cont "hielo y el rayo."

	para "O eso dicen las"
	line "leyendas."
	done

.GoodbyeText:
	text "Mi sueño era"
	line "poseer a ese"
	cont "#mon,"

	para "pero has"
	line "demostrado ser"
	cont "digno. Tómalo."

	para "Empezaré mi"
	line "colección de"
	cont "nuevo."

	para "Adiós."
	done

ShamoutiShrineRuinsGrampsText:
	text "Este santuario era"
	line "magnífico cuando"
	cont "yo era niño."

	para "Pero, ay, una"
	line "tormenta lo"
	cont "destrozó hace"
	cont "muchos años."

	para "La tormenta"
	line "amenazó toda la"
	cont "isla, pero nos"

	para "protegió el"
	line "Guardián de los"
	cont "Mares."

	para "Cada año doy"
	line "gracias en honor"

	para "al gran #mon"
	line "que nos mantuvo"
	cont "a salvo."
	done

ShamoutiShrineRuinsLadyText:
	text "Tenía que parar"
	line "en la Isla"
	cont "Shamouti en mi"
	cont "vuelta al mundo."

	para "Al parecer hay un"
	line "#mon que habla"
	cont "por aquí."
	done
