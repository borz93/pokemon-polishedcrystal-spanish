Route39_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 19, ROUTE_39_BARN, 1
	warp_event  7, 19, ROUTE_39_FARMHOUSE, 1
	warp_event  9,  5, ROUTE_39_RUGGED_ROAD_GATE, 3
	warp_event  3, 19, ROUTE_39_BARN, 2

	def_coord_events

	def_bg_events
	bg_event  5, 47, BGEVENT_JUMPTEXT, Route39TrainerTipsText
	bg_event  8, 21, BGEVENT_JUMPTEXT, MoomooFarmSignText
	bg_event 11,  7, BGEVENT_JUMPTEXT, RuggedRoadAheadSignText
	bg_event 15, 23, BGEVENT_JUMPTEXT, Route39SignText
	bg_event  8,  9, BGEVENT_JUMPTEXT, Route39AdvancedTips1Text
	bg_event 10, 47, BGEVENT_JUMPTEXT, Route39AdvancedTips2Text
	bg_event  5, 29, BGEVENT_ITEM + NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

	def_object_events
	object_event  7, 30, SPRITE_COWGIRL, SPRITEMOVEDATA_WANDER, 1, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39CowgirlAnnieScript, -1
	object_event 13, 45, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSailorEugene, -1
	object_event 10, 38, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerPokefanmDerek1, -1
	object_event 11, 35, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPokefanfRuth, -1
	pokemon_event  3, 28, MILTANK, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, Route39MiltankText, -1
	pokemon_event  6, 27, MILTANK, SPRITEMOVEDATA_POKEMON, (1 << MORN) | (1 << DAY), PAL_MON_PINK, Route39MiltankText, -1
	pokemon_event  4, 31, MILTANK, SPRITEMOVEDATA_POKEMON, (1 << MORN) | (1 << DAY), PAL_MON_AZURE, Route39MiltankText, -1
	pokemon_event  8, 29, MILTANK, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, Route39MiltankText, -1
	object_event 13, 23, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPsychicNorman, -1
	fruittree_event  9, 26, FRUITTREE_ROUTE_39, CHESTO_BERRY, PAL_NPC_PURPLE
	object_event  4, 38, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_DARK_PURPLE, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
	object_event  4, 46, SPRITE_BEAUTY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route39BeautyText, -1
	object_event 15, 12, SPRITE_HIKER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route39HikerText, -1
	object_event 25, 24, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBeautyOlivia, -1
	tmhmball_event  1, 23, TM_BULLDOZE, EVENT_ROUTE_39_TM_BULLDOZE
	smashrock_event 12, 10
	smashrock_event 15,  8

	object_const_def
	const ROUTE39_COWGIRL

TrainerPokefanmDerek1:
	trainer POKEFANM, DEREK1, EVENT_BEAT_POKEFANM_DEREK, PokefanmDerek1SeenText, PokefanmDerek1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_POKEFANM_DEREK
	opentext
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftruefwd .HasNugget
	checkcellnum PHONE_POKEFANM_DEREK
	iftruefwd .NumberAccepted
	checkpoke PIKACHU
	iffalsefwd .WantsPikachu
	checkevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext PokefanMDerekText_NotBragging
	promptbutton
	setevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEFANM_DEREK
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername POKEFANM, DEREK1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.HasNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalsefwd .NoRoom
	clearflag ENGINE_DEREK_HAS_NUGGET
	sjumpfwd .NumberAccepted

.NoRoom:
	sjumpfwd .PackFull

.WantsPikachu:
	jumpthisopenedtext

	text "¡Pikachu es"
	line "genial! ¿No"
	cont "crees?"
	done

.AskNumber1:
	jumpstd asknumber1m

.AskNumber2:
	jumpstd asknumber2m

.RegisteredNumber:
	jumpstd registerednumberm

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

.Gift:
	jumpstd giftm

.PackFull:
	jumpstd packfullm

GenericTrainerPokefanfRuth:
	generictrainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText

	text "¿Sabes algo de los"
	line "#mon bebé?"

	para "¡Seguro que son"
	line "adorables!"
	done

Route39CowgirlAnnieScript:
	checkevent EVENT_GOT_PP_MAX_FROM_ROUTE_39_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_COWGIRL_ANNIE
	iftruefwd .Beaten
	checkevent EVENT_BEAT_BIRD_KEEPER_TOBY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_SAILOR_HARRY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_LASS_DANA
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_SCHOOLBOY_CHAD
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BEAUTY_VALENCIA
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BEAUTY_OLIVIA
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEFANM_DEREK
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEFANF_RUTH
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_SAILOR_EUGENE
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PSYCHIC_NORMAN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE39_COWGIRL
	loadtrainer COWGIRL, ANNIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COWGIRL_ANNIE
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem PP_MAX
	iffalse_endtext
	setevent EVENT_GOT_PP_MAX_FROM_ROUTE_39_LEADER
	jumpthisopenedtext

.AfterText2:
	text "Hacemos queso y"
	line "yogur con la"
	cont "leche de Miltank."
	done

.IntroText:
	text "¡Oye! ¡No asustes"
	line "a los Miltank!"

	para "…¿Ah, quieres"
	line "combatir?"

	para "Ahora mismo estoy"
	line "con las faenas de"
	cont "la granja…"

	para "Te digo una cosa:"
	line "vence a todos los"

	para "demás de Iris a"
	line "Olivo y combato"
	cont "contigo."

	para "Puede que alguno"
	line "solo quiera"

	para "combatir contigo"
	line "cuando anochezca."
	done

.QuestionText:
	text "Ya terminé mis"
	line "tareas, y tú ya"

	para "limpiaste estas"
	line "rutas."

	para "Bueno, mi equipo"
	line "venció a Morty, y"

	para "creo que podemos"
	line "vencerte a ti."

	para "¿Qué me dices?"
	done

.RefusedText:
	text "Vaya. Pues vuelvo"
	line "a cuidar de los"
	cont "Miltank, entonces."
	done

.SeenText:
	text "¡Te enseñaré lo"
	line "que sabe hacer una"
	cont "vaquera!"
	done

.BeatenText:
	text "Se me derramó la"
	line "leche…"
	done

.AfterText1:
	text "¡Uf! ¡Vaya"
	line "descanso más"
	cont "intenso!"

	para "Gracias por la"
	line "diversión,"
	cont "compañero."

	para "¡Toma esto!"
	done

GenericTrainerSailorEugene:
	generictrainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText

	text "Mis #mon fueron"
	line "atrapados y"
	cont "criados en"
	cont "ultramar."

	para "Son mis"
	line "compañeros en esos"
	cont "largos viajes."
	done

GenericTrainerPsychicNorman:
	generictrainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText

	text "¿Sabes que los"
	line "#mon tienen"
	cont "habilidades"
	cont "distintas?"

	para "Las personas"
	line "somos igual. Cada"
	cont "uno tiene un"
	cont "potencial"
	cont "distinto."
	done

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime 1 << NITE
	iffalsefwd .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftruefwd .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainerwithpal POKEFANF, JAIME, TRAINERPAL_DARK_POKEFANF
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	endtext

.Beaten:
	jumpthisopenedtext

	text "Conocí a mi Meowth"
	line "de noche, aquí"
	cont "mismo en la Ruta"
	cont "39."

	para "No sé por qué,"
	line "pero parece que le"

	para "gusta que entrene"
	line "aquí."

	para "Parece volverse"
	line "más amigable"

	para "entrenando aquí"
	line "que en cualquier"
	cont "otro sitio."
	done

.NotNight:
	jumpthisopenedtext

	text "Ufufufu… espero"
	line "que anochezca"
	cont "pronto."
	done

Route39MiltankText:
	text "Miltank: ¡Muu!"
	done

SailorEugeneSeenText:
	text "Acabo de volver a"
	line "Olivo."

	para "¿Qué tal un"
	line "combate #mon?"
	done

SailorEugeneBeatenText:
	text "¡Aaaargh!"
	done

PokefanmDerek1SeenText:
	text "¡Este es un buen"
	line "momento para"
	cont "presumir de mi"
	cont "Pikachu!"
	done

PokefanmDerek1BeatenText:
	text "No tuve tiempo de"
	line "presumir de"
	cont "Pikachu…"
	done

PokefanMDerekText_NotBragging:
	text "¡No pienso"
	line "escuchar tus"
	cont "fanfarronadas!"

	para "Los Fans #"
	line "tenemos la"

	para "política de no"
	line "escuchar cuando"
	cont "otros presumen."
	done

PokefanfRuthSeenText:
	text "Qué #mon tan"
	line "encantadores."

	para "Mostremos a"
	line "nuestros #mon"
	cont "juntos, a la vez."
	done

PokefanfRuthBeatenText:
	text "No me importa"
	line "perder."
	done


PsychicNormanSeenText:
	text "Déjame ver de qué"
	line "son capaces tus"
	cont "#mon."
	done

PsychicNormanBeatenText:
	text "Vaya, tus #mon"
	line "tienen potencial."
	done


PokefanfJaimeSeenText:
	text "Llegaste en el"
	line "momento justo."

	para "Combatamos."
	done

PokefanfJaimeBeatenText:
	text "Vaya,"
	line "decepcionante…"
	done


Route39BeautyText:
	text "¿Qué es más alta:"
	line "la Torre Campana"
	cont "de Ciudad Iris,"

	para "o el Faro de"
	line "Ciudad Olivo?"

	para "¡La Torre Campana,"
	line "sin duda!"
	done

Route39HikerText:
	text "¡Al norte de"
	line "Olivo está la"
	cont "frontera de"
	cont "Johto!"

	para "Una caminata"
	line "intensa por"

	para "terreno escarpado,"
	line "y luego escalar"
	cont "una montaña"
	cont "helada…"

	para "He oído que"
	line "algunos #mon se"

	para "han adaptado para"
	line "sobrevivir al"
	cont "clima duro."

	para "…Pero sin unas"
	line "Gafas Aislantes"
	cont "de seguridad,"

	para "ni siquiera puedo"
	line "empezar la"
	cont "caminata…"
	done

Route39SignText:
	text "Ruta 39"

	para "Ciudad Olivo -"
	line "Ciudad Iris"
	done

Route39AdvancedTips1Text:
	text "¡Consejos"
	line "avanzados!"

	para "¡La Tormenta de"
	line "Arena aumenta la"
	cont "Defensa Especial"
	cont "de los #mon"
	cont "tipo Roca!"

	para "¡Y el Granizo"
	line "aumenta la"
	cont "Defensa de los"
	cont "#mon tipo"
	cont "Hielo!"
	done

Route39AdvancedTips2Text:
	text "¡Consejos"
	line "avanzados!"

	para "Un #mon con la"
	line "habilidad Ojo"
	cont "Compuesto, o uno"

	para "que lleve una"
	line "Moneda Amuleto,"
	cont "tiene más"
	cont "probabilidad de"

	para "¡encontrar un"
	line "#mon salvaje"
	cont "con un objeto!"
	done

RuggedRoadAheadSignText:
	text "Camino Escarpado"
	line "por delante"

	para "Al norte, Monte"
	line "Nevado"
	done

MoomooFarmSignText:
	text "Granja Mu-mú"

	para "Disfrute Nuestra"
	line "Leche Fresca y"
	cont "Sabrosa"
	done

Route39TrainerTipsText:
	text "Consejos de"
	line "Entrenador"

	para "Usa Golpe Cabeza"
	line "en los árboles"
	cont "para hacer caer"
	cont "#mon."

	para "De los árboles"
	line "caen distintos"
	cont "tipos de #mon."

	para "¡Usa Golpe Cabeza"
	line "en cualquier árbol"
	cont "que veas!"
	done
