Route21_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 12, 37, BGEVENT_ITEM + STARDUST, EVENT_ROUTE_21_HIDDEN_STARDUST_1
	bg_event  5, 66, BGEVENT_ITEM + STARDUST, EVENT_ROUTE_21_HIDDEN_STARDUST_2

	def_object_events
	object_event  8, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfNikki, -1
	object_event  3, 29, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfChelan, -1
	object_event  5, 45, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfKendra, -1
	object_event 16, 72, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSwimmermEsteban, -1
	object_event 15, 85, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermDuane, -1
	object_event  2, 89, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmermSeth, -1
	object_event  5, 21, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherMurphy, -1
	object_event 15, 25, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherArnold, -1
	object_event  7, 36, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherLiam, -1
	object_event  5, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherGideon, -1
	object_event 15, 62, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperKinsley, -1
	object_event  7, 83, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperEaston, -1
	itemball_event 13, 26, STAR_PIECE, 1, EVENT_ROUTE_21_STAR_PIECE
	fruittree_event 12,  3, FRUITTREE_ROUTE_21, ENIGMA_BERRY, PAL_NPC_BLACK

GenericTrainerSwimmerfNikki:
	generictrainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText

	text "Tengo que vigilar"
	line "las manchas que"
	cont "causa el sol."
	done

SwimmerfNikkiSeenText:
	text "¡Si gano,"
	line "tendrás que"
	cont "ayudarme con mi"
	cont "bronceador!"
	done

SwimmerfNikkiBeatenText:
	text "Me preocupan las"
	line "quemaduras"
	cont "solares…"
	done

GenericTrainerSwimmerfChelan:
	generictrainer SWIMMERF, CHELAN, EVENT_BEAT_SWIMMERF_CHELAN, .SeenText, .BeatenText

	text "¡Supongo que un"
	line "bikini eléctrico"
	cont "te daría un"
	cont "calambre!"
	done

.SeenText:
	text "¡Me encantan los"
	line "bikinis!"

	para "¡Si tuviera un"
	line "bikini eléctrico,"

	para "podría llevarlo"
	line "incluso en"
	cont "invierno!"
	done

.BeatenText:
	text "Awww…"
	done

GenericTrainerSwimmerfKendra:
	generictrainer SWIMMERF, KENDRA, EVENT_BEAT_SWIMMERF_KENDRA, .SeenText, .BeatenText

	text "Me pregunto si"
	line "algún sitio vende"
	cont "trajes de baño"
	cont "para #mon."
	done

.SeenText:
	text "¡Eh, entrenador!"
	line "¿Qué tal si tú"
	cont "también te pones"
	cont "un traje de baño?"
	done

.BeatenText:
	text "No quería"
	line "perder…"
	done

GenericTrainerSwimmermEsteban:
	generictrainer SWIMMERM, ESTEBAN, EVENT_BEAT_SWIMMERM_ESTEBAN, .SeenText, .BeatenText

	text "¡Llamábamos a"
	line "nuestro profesor"
	cont "Profesor"
	cont "Poliwhirl!"
	done

.SeenText:
	text "Mi profesor de"
	line "natación tenía una"
	cont "cara igual a la de"
	cont "un Poliwhirl."
	done

.BeatenText:
	text "Lo siento,"
	line "Profesor…"
	done

GenericTrainerSwimmermDuane:
	generictrainer SWIMMERM, DUANE, EVENT_BEAT_SWIMMERM_DUANE, .SeenText, .BeatenText

	text "Para ganar más,"
	line "necesito trabajar"
	cont "mi resistencia."
	done

.SeenText:
	text "Nadar es ejercicio"
	line "de cuerpo entero."

	para "¡Fortalece mucho!"
	done

.BeatenText:
	text "Mis #mon y yo"
	line "no tenemos"
	cont "fuerza…"
	done

GenericTrainerSwimmermSeth:
	generictrainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText

	text "Este tipo"
	line "arrogante estaba"
	cont "en el volcán de"
	cont "Isla Canela."
	done

SwimmermSethSeenText:
	text "¡Tierra a la"
	line "vista! ¡Hay que"
	cont "seguir!"
	done

SwimmermSethBeatenText:
	text "Glu, glu…"
	done

GenericTrainerFisherMurphy:
	generictrainer FISHER, MURPHY, EVENT_BEAT_FISHER_MURPHY, .SeenText, .BeatenText

	text "El #mon que se"
	line "me escapó era"
	cont "enorme."

	para "¡Es la verdad!"
	done

.SeenText:
	text "¿Eh? ¡He pescado"
	line "un entrenador en"
	cont "vez de un #mon!"
	done

.BeatenText:
	text "¡Se me cortó el"
	line "sedal!"
	done

GenericTrainerFisherArnold:
	generictrainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText

	text "Volveré a pescar…"
	done

FisherArnoldSeenText:
	text "Me aburre pescar."
	line "¡Combatamos!"
	done

FisherArnoldBeatenText:
	text "Un fracaso total…"
	done

GenericTrainerFisherLiam:
	generictrainer FISHER, LIAM, EVENT_BEAT_FISHER_LIAM, .SeenText, .BeatenText

	text "Debería haberte"
	line "pedido que"
	cont "esperaras hasta"

	para "que sacara ese"
	line "#mon…"
	done

.SeenText:
	text "¡Vaya! ¡Un"
	line "mordisco!"

	para "…¿Eh?"
	line "¿Un combate?"

	para "Vale, ¡vamos!"
	done

.BeatenText:
	text "Si persigues dos"
	line "#mon a la vez,"

	para "¡no atraparás"
	line "ninguno!"
	done

GenericTrainerFisherGideon:
	generictrainer FISHER, GIDEON, EVENT_BEAT_FISHER_GIDEON, .SeenText, .BeatenText

	text "¿Cuál es la razón"
	line "por la que te"
	cont "hiciste entrenador"
	cont "#mon?"
	done

.SeenText:
	text "¿Me hice pescador"
	line "por ser paciente,"
	cont "o me volví más"

	para "paciente por ser"
	line "pescador?"
	done

.BeatenText:
	text "Ummm… Hmmm…"
	done

GenericTrainerBird_keeperKinsley:
	generictrainer BIRD_KEEPER, KINSLEY, EVENT_BEAT_BIRD_KEEPER_KINSLEY, .SeenText, .BeatenText

	text "¡Solo necesito"
	line "practicar más el"
	cont "aleteo!"
	done

.SeenText:
	text "¡Algún día podré"
	line "volar como mis"
	cont "#mon ave!"
	done

.BeatenText:
	text "No pude volar…"
	done

GenericTrainerBird_keeperEaston:
	generictrainer BIRD_KEEPER, EASTON, EVENT_BEAT_BIRD_KEEPER_EASTON, .SeenText, .BeatenText

	text "Pensamos que"
	line "usamos a los"
	cont "#mon."

	para "Pero en algún"
	line "momento, los"
	cont "#mon empezaron"
	cont "a usarnos a"
	cont "nosotros…"
	done

.SeenText:
	text "¡Los Guardas de"
	line "Aves son"
	cont "maravillosos con"
	cont "sus #mon ave!"
	done

.BeatenText:
	text "No pude"
	line "manejarlo…"
	done
