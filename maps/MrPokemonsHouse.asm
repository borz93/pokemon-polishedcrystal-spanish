MrPokemonsHouse_MapScriptHeader:
	def_scene_scripts
	scene_script MrPokemonsHouseMeetMrPokemonScene, SCENE_MRPOKEMONSHOUSE_MEET_MR_POKEMON
	scene_const SCENE_MRPOKEMONSHOUSE_NOOP

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_30, 2
	warp_event  3,  7, ROUTE_30, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPTEXT, MrPokemonsHouse_ForeignMagazinesText
	bg_event  1,  1, BGEVENT_JUMPTEXT, MrPokemonsHouse_ForeignMagazinesText
	bg_event  6,  1, BGEVENT_JUMPTEXT, MrPokemonsHouse_BrokenComputerText
	bg_event  7,  1, BGEVENT_JUMPTEXT, MrPokemonsHouse_BrokenComputerText
	bg_event  6,  4, BGEVENT_JUMPTEXT, MrPokemonsHouse_StrangeCoinsText
	bg_event  3,  1, BGEVENT_READ, MrPokemonsHouse_CabinetScript

	def_object_events
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_MrPokemonScript, -1
	object_event  6,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MR_POKEMONS_HOUSE_OAK
	object_event  4,  4, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GOT_POKEDEX_FROM_OAK

	object_const_def
	const MRPOKEMONSHOUSE_GENTLEMAN
	const MRPOKEMONSHOUSE_OAK
	const MRPOKEMONSHOUSE_POKEDEX

MrPokemonsHouseMeetMrPokemonScene:
	sdefer .MrPokemonEvent
	end

.MrPokemonEvent:
	showemote EMOTE_SHOCK, MRPOKEMONSHOUSE_GENTLEMAN, 15
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	showtext MrPokemonIntroText1
	applymovement PLAYER, MrPokemonsHouse_PlayerWalksToMrPokemon
	opentext
	writetext MrPokemonIntroText2
	promptbutton
	waitsfx
	verbosegivekeyitem MYSTERY_EGG
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	blackoutmod CHERRYGROVE_CITY
if !DEF(DEBUG)
	writetext MrPokemonIntroText3
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, RIGHT
	writetext MrPokemonIntroText4
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	turnobject MRPOKEMONSHOUSE_OAK, LEFT
	writetext MrPokemonIntroText5
	waitbutton
endc
	closetext
	sjumpfwd MrPokemonsHouse_OakScript

MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkkeyitem RED_SCALE
	iftruefwd .RedScale
	checkitem ODD_SOUVENIR
	iftrue_jumpopenedtext MrPokemonText_OddSouvenir
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumpopenedtext MrPokemonText_AlwaysNewDiscoveries
	jumpopenedtext MrPokemonText_ImDependingOnYou

.RedScale:
	writetext MrPokemonText_GimmeTheScale
	yesorno
	iffalse_jumpopenedtext MrPokemonText_Disappointed
	special SpecialGiveShinyDitto
	iffalse_jumpopenedtext MrPokemonText_PartyAndBoxFull
	writetext MrPokemonText_GotShinyDitto
	playsound SFX_KEY_ITEM
	waitsfx
	ifequalfwd 1, .in_party
	special Special_CurBoxFullCheck
	iffalsefwd .BoxNotFull
	farwritetext _CurBoxFullText
.BoxNotFull
	special GetCurBoxName
	writetext MrPokemonText_SentToPC
	promptbutton
.in_party
	takekeyitem RED_SCALE
	setevent EVENT_TRADED_RED_SCALE
	jumpopenedtext MrPokemonText_AlwaysNewDiscoveries

MrPokemonsHouse_OakScript:
	playmusic MUSIC_PROF_OAK
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakWalksToPlayer
	turnobject PLAYER, RIGHT
	showtext MrPokemonsHouse_OakText1
	turnobject MRPOKEMONSHOUSE_OAK, UP
	pause 10
	applymovement MRPOKEMONSHOUSE_POKEDEX, MrPokemonsHouse_OakTakesPokedex
	disappear MRPOKEMONSHOUSE_POKEDEX
	pause 10
	turnobject MRPOKEMONSHOUSE_OAK, LEFT
	pause 10
	opentext
	givespecialitem POKEDEX
	setflag ENGINE_POKEDEX
	writetext MrPokemonsHouse_OakText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakExits
	playsound SFX_EXIT_BUILDING
	disappear MRPOKEMONSHOUSE_OAK
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, UP
	showtext MrPokemonsHouse_MrPokemonHealText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	showtext MrPokemonText_ImDependingOnYou
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setscene SCENE_MRPOKEMONSHOUSE_NOOP
	setmapscene CHERRYGROVE_CITY, SCENE_CHERRYGROVECITY_MEET_RIVAL
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
	specialphonecall SPECIALCALL_ROBBED
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .RivalTakesChikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .RivalTakesCyndaquil
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesChikorita:
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesCyndaquil:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	end

MrPokemonsHouse_CabinetScript:
	opentext
	writetext MrPokemonsHouse_CabinetText
	checkevent EVENT_TRADED_RED_SCALE
	iffalsefwd .NoRedScale
	promptbutton
	writetext MrPokemonsHouse_RedScaleCabinetText
.NoRedScale
	waitbutton
	closetext
	end

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step_right
	step_up
	step_end

MrPokemonsHouse_OakWalksToPlayer:
	step_down
	step_left
	step_left
	step_end

MrPokemonsHouse_OakTakesPokedex:
	fix_facing
	slide_step_down
	remove_fixed_facing
	step_end

MrPokemonsHouse_OakExits:
	step_down
	step_left
	turn_head_down
	step_sleep_2
	step_end

MrPokemonIntroText1:
	text "¡Hola, hola! Tú"
	line "debes de ser"
	cont "<PLAYER>."

	para "El Prof. Elm dijo"
	line "que vendrías."
	done

MrPokemonIntroText2:
	text "Esto es lo que"
	line "quiero que examine"
	cont "el Prof. Elm."
	done

MrPokemonIntroText3:
	text "Conozco a una"
	line "pareja que dirige"
	cont "una Guardería"
	cont "#mon."

	para "Me dieron ese"
	line "Huevo."

	para "Me intrigó, así"
	line "que le envié un"
	cont "correo al"
	cont "Prof. Elm."

	para "Para evolucionar"
	line "#mon, el Prof."
	cont "Elm es la"
	cont "autoridad."
	done

MrPokemonIntroText4:
	text "Hasta el Prof. Oak"
	line "lo reconoce."
	done

MrPokemonIntroText5:
	text "Si mi suposición"
	line "es correcta, el"
	cont "Prof. Elm lo"
	cont "sabrá."
	done

MrPokemonsHouse_MrPokemonHealText:
	text "¿Vas a volver"
	line "con el Prof. Elm?"

	para "Toma. Tus #mon"
	line "deberían"
	cont "descansar."
	done

MrPokemonText_OddSouvenir:
	text "¡Oh! ¡Ese suvenir!"

	para "Conseguí uno en"
	line "mi viaje a las"
	cont "Islas Naranja."

	para "También vi #mon"
	line "con formas raras"
	cont "allí!"

	para "Mmm… Me pregunto…"

	para "¿Habrá alguna"
	line "conexión"

	para "entre ese suvenir"
	line "y esas formas"
	cont "raras de #mon?"
	done

MrPokemonText_ImDependingOnYou:
	text "¡Cuento contigo!"
	done

MrPokemonText_AlwaysNewDiscoveries:
	text "¡La vida es"
	line "maravillosa!"

	para "¡Siempre hay"
	line "nuevos"
	cont "descubrimientos!"
	done

MrPokemonsHouse_OakText1:
	text "Oak: ¡Ajá! Así"
	line "que tú eres"
	cont "<PLAYER>!"

if !DEF(DEBUG)
	para "¡Soy Oak!"
	line "Investigo #mon."

	para "Estaba visitando"
	line "a mi viejo amigo"
	cont "el Sr. #mon."

	para "Oí que hacías un"
	line "recado."

	para "Fue para el Prof."
	line "Elm, así que"
	cont "esperé aquí."

	para "¡Oh! ¿Qué es esto?"
	line "¡Un #mon raro!"

	para "A ver…"

	para "¡Ah, ya veo!"

	para "Entiendo por qué"
	line "el Prof. Elm te"
	cont "dio un #mon"

	para "para este recado."

	para "Para"
	line "investigadores"
	cont "como el Prof. Elm"
	cont "y para mí,"

	para "los #mon son"
	line "nuestros amigos."

	para "Vio que tratarías"
	line "a tus #mon"

	para "con amor y"
	line "cuidado."

	para "…¡Ah!"

	para "Pareces ser"
	line "de fiar."

	para "¿Te gustaría"
	line "ayudarme?"

	para "¿Ves? Esta es la"
	line "última versión de"
	cont "la #dex."

	para "Registra datos"
	line "automáticamente"

	para "de los #mon que"
	line "has visto o"
	cont "capturado."

	para "¡Es una"
	line "enciclopedia"
	cont "de alta"
	cont "tecnología!"
endc
	done

MrPokemonsHouse_OakText2:
	text "Ve a conocer"
	line "muchos tipos de"
	cont "#mon,"

	para "y completa"
	line "esa #dex!"

if !DEF(DEBUG)
	para "Pero me he"
	line "quedado mucho"
	cont "tiempo."

	para "Debo ir a Ciudad"
	line "Trigal para mi"
	cont "programa de radio"
	cont "habitual."

	para "<PLAYER>, cuento"
	line "contigo!"
endc
	done

MrPokemonText_GimmeTheScale:
	text "¿Eh? ¡Esa Escama!"
	line "¿Qué es eso?"
	cont "¿Un Gyarados rojo?"

	para "¡Debe de haber"
	line "mantenido su color"
	cont "siendo un"
	cont "Magikarp!"

	para "¡Eso podría ser"
	line "único en su tipo!"
	cont "Lo, lo quiero…"

	para "<PLAYER>, ¿Te"
	line "importaría"
	cont "cambiármela?"

	para "Puedo ofrecerte"
	line "un #mon raro."
	done

MrPokemonText_GotShinyDitto:
	text "<PLAYER> recibió"
	line "un #mon."
	done

MrPokemonText_SentToPC:
	text "El #mon fue"
	line "enviado a "
	text_ram wStringBuffer1
	text "."
	done

MrPokemonText_PartyAndBoxFull:
	text "No tienes sitio"
	line "para esto, ¡ni"
	cont "siquiera en tu"
	cont "Caja!"
	done

MrPokemonText_Disappointed:
	text "Qué decepción."
	line "Eso es muy raro"
	cont "de encontrar."
	done

MrPokemonsHouse_ForeignMagazinesText:
	text "Está lleno de"
	line "revistas"
	cont "extranjeras."

	para "Ni siquiera puedo"
	line "leer sus títulos…"
	done

MrPokemonsHouse_BrokenComputerText:
	text "Es un ordenador"
	line "grande. Mmm. Está"
	cont "roto."
	done

MrPokemonsHouse_StrangeCoinsText:
	text "Un montón de"
	line "monedas raras!"

	para "Quizá sean de"
	line "otro país…"
	done

MrPokemonsHouse_CabinetText:
	text "Una colección de"
	line "rarezas de todo"
	cont "el mundo!"
	done

MrPokemonsHouse_RedScaleCabinetText:
	text "Una de ellas es"
	line "la Escama Roja"
	cont "brillante!"
	done
