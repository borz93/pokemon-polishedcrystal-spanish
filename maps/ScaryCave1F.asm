ScaryCave1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 33, 31, URAGA_CHANNEL_EAST, 1
	warp_event 11, 31, URAGA_CHANNEL_WEST, 1
	warp_event 20, 30, SCARY_CAVE_B1F, 1
	warp_event 34, 10, SCARY_CAVE_B1F, 2
	warp_event  9,  1, SCARY_CAVE_SHIPWRECK, 1

	def_coord_events

	def_bg_events
	bg_event 34,  3, BGEVENT_ITEM + MAX_ELIXIR, EVENT_SCARY_CAVE_1F_HIDDEN_MAX_ELIXIR
	bg_event 18, 28, BGEVENT_ITEM + PEARL_STRING, EVENT_SCARY_CAVE_1F_HIDDEN_PEARL_STRING
	bg_event 30, 29, BGEVENT_ITEM + PEARL, EVENT_SCARY_CAVE_1F_HIDDEN_PEARL

	def_object_events
	object_event 15,  5, SPRITE_MIRA, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScaryCave1FMiraScript, EVENT_SCARY_CAVE_MIRA
	object_event  8, 24, SPRITE_BURGLAR, SPRITEMOVEDATA_WANDER, 1, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, ScaryCave1FPharmacistScript, -1
	object_event 36,  2, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRuin_maniacSmilte, -1
	object_event  8, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSuper_nerdKouta, -1
	object_event 22, 20, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 1, TrainerCoupleJoeandjo1, -1
	object_event 23, 20, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 1, TrainerCoupleJoeandjo2, -1
	object_event 37, 16, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHex_maniacBethany, -1
	object_event 36, 29, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerScientistPiotr, -1
	itemball_event 27,  7, X_SP_DEF, 1, EVENT_SCARY_CAVE_1F_X_SP_DEF
	itemball_event  4,  9, DUSK_STONE, 1, EVENT_SCARY_CAVE_1F_DUSK_STONE
	itemball_event 33, 19, HYPER_POTION, 1, EVENT_SCARY_CAVE_1F_HYPER_POTION
	itemball_event 28, 23, MAX_REPEL, 1, EVENT_SCARY_CAVE_1F_MAX_REPEL
	itemball_event  3, 29, REVIVE, 1, EVENT_SCARY_CAVE_1F_REVIVE

	object_const_def
	const SCARYCAVE1F_MIRA

ScaryCave1FMiraScript:
	faceplayer
	checkevent EVENT_BEAT_MIRA
	iftruefwd .Beaten
	opentext
	writetext .ChallengeText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked SCARYCAVE1F_MIRA
	loadtrainer MIRA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MIRA
.Beaten
	opentext
	writetext .ItemText
	promptbutton
	verbosegiveitem POWER_LENS
	iffalse_endtext
	writetext .GoodbyeText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SCARYCAVE1F_MIRA
	pause 15
	special Special_FadeInQuickly
	clearevent EVENT_BATTLE_TOWER_MIRA
	end

.ChallengeText:
	text "Soy Mira…"
	line "Estaba atrapando"

	para "#mon, pero esta"
	line "cueva da mucho"
	cont "miedo…"

	para "Quiero volverme"
	line "más fuerte para"
	cont "no ser tan"
	cont "miedica."

	para "¡Por favor!"
	line "¡Combate conmigo!"
	done

.YesText:
	text "¡Sí! Mira te"
	line "mostrará a sus"
	cont "¡#mon!"
	done

.NoText:
	text "Mira está"
	line "triste…"
	done

.BeatenText:
	text "Mira quiere"
	line "volverse mucho,"
	cont "mucho más fuerte,"
	cont "¡como <PLAYER>!"
	done

.ItemText:
	text "<PLAYER>, ¿Te"
	line "volviste tan"
	cont "fuerte porque"

	para "siempre estás con"
	line "tus #mon?"

	para "¡Sí! ¡Debe ser"
	line "eso!"

	para "¡Mira empieza a"
	line "entender!"

	para "¡Gracias,"
	line "<PLAYER>!"

	para "¡Mira quiere que"
	line "tengas esto!"
	done

.GoodbyeText:
	text "¡Mira lo"
	line "intentará como tú,"
	cont "<PLAYER>!"

	para "¡Me haré más"
	line "fuerte en la Torre"
	cont "Batalla!"

	para "<PLAYER>,"
	line "¡adiós!"
	done

ScaryCave1FPharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SUCKER_PUNCH_INTRO
	iftruefwd .HeardIntro
	writetext .IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_SUCKER_PUNCH_INTRO
.HeardIntro:
	writetext .QuestionText
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	yesorno
	iffalsefwd .TutorRefused
	setval SUCKER_PUNCH
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Es tu funeral."
	done

.IntroText:
	text "Los fantasmas son"
	line "maestros del golpe"
	cont "barato."

	para "La forma de"
	line "lidiar con ellos"
	cont "es golpear"
	cont "primero."

	para "¡Dales un buen"
	line "Golpe Bajo"
	cont "sorpresa!"
	done

.QuestionText:
	text "Te enseñaré Golpe"
	line "Bajo, pero quiero"

	para "una Hoja"
	line "Plateada."
	done

.NoSilverLeaf
	waitbutton
	jumpthisopenedtext

	text "¿No tienes Hoja"
	line "Plateada? Olvídalo"
	cont "entonces."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Ahora puedes usar"
	line "Golpe Bajo!"

	para "Si un rival está a"
	line "punto de"
	cont "golpearte, ¡tú"
	cont "golpeas primero!"
	done

GenericTrainerRuin_maniacSmilte:
	generictrainer RUIN_MANIAC, SMILTE, EVENT_BEAT_RUIN_MANIAC_SMILTE, .SeenText, .BeatenText

	text "Oigo un eco."
	line "¡Hay una cueva más"
	cont "profunda cerca!"

	para "Me pregunto si ahí"
	line "encontraré mi gran"
	cont "descubrimiento…"
	done

.SeenText:
	text "¡Estoy a punto de"
	line "un gran"
	cont "descubrimiento!"

	para "¡Puedo sentirlo!"
	done

.BeatenText:
	text "¿¡Vas tras mi"
	line "descubrimiento!?"
	done

GenericTrainerSuper_nerdKouta:
	generictrainer SUPER_NERD, KOUTA, EVENT_BEAT_SUPER_NERD_KOUTA, .SeenText, .BeatenText

	text "Supongo que hasta"
	line "los mejores planes"
	cont "pueden arruinarse."
	done

.SeenText:
	text "¡No puedes"
	line "vencerme! ¡Tengo"
	cont "el plan perfecto!"
	done

.BeatenText:
	text "¿¡Mi plan"
	line "falló!?"

	para "Vuelta a la mesa"
	line "de dibujo…"
	done

TrainerCoupleJoeandjo1:
	trainer COUPLE, JOEANDJO1, EVENT_BEAT_COUPLE_JOE_AND_JO, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_COUPLE

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Joe: Estamos de"
	line "caza de fantasmas,"

	para "pero no tengo"
	line "miedo mientras"
	cont "tenga a mi Jo a mi"
	cont "lado."
	done

.SeenText:
	text "Joe: ¡Un"
	line "fantasma! ¡Quédate"
	cont "cerca, mi querida"
	cont "Jo!"
	done

.BeatenText:
	text "Joe: Oh. Solo era"
	line "un entrenador."
	done

TrainerCoupleJoeandjo2:
	trainer COUPLE, JOEANDJO2, EVENT_BEAT_COUPLE_JOE_AND_JO, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_COUPLE

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Jo: Qué suerte"
	line "tengo de tener a"
	cont "mi maravilloso Joe"

	para "para ahuyentar"
	line "fantasmas"
	cont "espeluznantes."
	done

.SeenText:
	text "Jo: ¡Eek!"
	line "¡Abrázame fuerte,"
	cont "Joe!"
	done

.BeatenText:
	text "Jo: ¿No tienes"
	line "miedo?"
	done

GenericTrainerHex_maniacBethany:
	generictrainer HEX_MANIAC, BETHANY, EVENT_BEAT_HEX_MANIAC_BETHANY, .SeenText, .BeatenText

	text "El aura de miedo"
	line "en esta cueva es"
	cont "deliciosa…"
	cont "Fufufufu…"
	done

.SeenText: ; text > text
	text "¡BU!"
	done

.BeatenText:
	text "¿Te asusté?"
	done

GenericTrainerScientistPiotr:
	generictrainer SCIENTIST, PIOTR, EVENT_BEAT_SCIENTIST_PIOTR, .SeenText, .BeatenText

	text "Aquí crecen algas"
	line "que liberan un"

	para "pigmento turbio en"
	line "el agua."

	para "¡No hay nada que"
	line "temer!"
	cont "…¿Verdad?"
	done

.SeenText:
	text "¿Sabes por qué el"
	line "agua de aquí es"
	cont "tan oscura?"
	done

.BeatenText:
	text "Vale, ¡te lo"
	line "diré!"
	done
