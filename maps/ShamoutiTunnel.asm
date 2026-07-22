ShamoutiTunnel_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 33,  9, SHAMOUTI_ISLAND, 3
	warp_event  5, 17, WARM_BEACH, 2

	def_coord_events

	def_bg_events
	bg_event 21,  5, BGEVENT_ITEM + NUGGET, EVENT_SHAMOUTI_TUNNEL_HIDDEN_NUGGET
	bg_event 32,  4, BGEVENT_ITEM + LEAF_STONE, EVENT_SHAMOUTI_TUNNEL_HIDDEN_LEAF_STONE

	def_object_events
	object_event 15, 17, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OreManiacScript, -1
	object_event 24, 14, SPRITE_TAMER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerTamerOswald, -1
	object_event 24,  5, SPRITE_FIREBREATHER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerFirebreatherTala, -1
	object_event  6,  7, SPRITE_LADY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSightseerfNoelle, -1
	object_event  3, 16, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSightseermChester, -1
	itemball_event  3,  4, X_SPEED, 1, EVENT_SHAMOUTI_TUNNEL_X_SPEED
	itemball_event 12, 17, SMOOTH_ROCK, 1, EVENT_SHAMOUTI_TUNNEL_SMOOTH_ROCK

OreManiacScript:
	faceplayer
	opentext
	writetext .GreetingText
	promptbutton
	special Special_ChooseItem
	iffalse_jumpopenedtext .NoItemText
	special GetOreManiacPrice
	iffalse_jumpopenedtext .WrongItemText
	special ItemManiac_SelectQuantity
	iffalse_jumpopenedtext .NoItemText
	special MultiplyMoneyByQuantity
	writetext .OfferText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .NoItemText
	special TakeItemFromMemWithQuantity
	waitsfx
	playsound SFX_TRANSACTION
	special Give_hMoneyTemp
	special PlaceMoneyTopRight
	jumpthisopenedtext

	text "¡Trato hecho!"
	line "¡Conseguí un mine-"
	cont "ral que adoro!"
	done

.GreetingText:
	text "Mineral, mineral…"
	line "¡Minerales que"
	cont "adoro!"

	para "Te pagaré bien"
	line "por minerales"
	cont "raros."

	para "¿No tienes un"
	line "mineral adorable"
	cont "que estremezca mi"
	cont "corazón?"
	done

.OfferText:
	text "¡Ese mineral me"
	line "estremece!"

	para "¿Me lo vendes"
	line "por ¥"
	text_decimal hMoneyTemp, 3, 7
	text "?"
	done

.WrongItemText:
	text "¿Eh? ¿Qué"
	line "diantres es esto?"

	para "¡No puedes"
	line "estremecer mi"
	cont "corazón con un"
	cont "mineral tan"
	cont "pobre!"
	done

.NoItemText:
	text "Hmmm. Mi corazón"
	line "no cambia."

	para "Espero que me"
	line "vendas uno algún"
	cont "día."
	done

GenericTrainerTamerOswald:
	generictrainer TAMER, OSWALD, EVENT_BEAT_TAMER_OSWALD, .SeenText, .BeatenText

	text "Ahora soy Domador,"
	line "pero cuando"

	para "empecé en el"
	line "circo, hacía el"

	para "número de trapecio"
	line "#mon."
	done

.SeenText:
	text "Nací hombre de"
	line "circo."

	para "Ahora también soy"
	line "un feroz luchador."
	done

.BeatenText:
	text "No pude domar a"
	line "tus #mon…"
	done

GenericTrainerFirebreatherTala:
	generictrainer FIREBREATHER, TALA, EVENT_BEAT_FIREBREATHER_TALA, .SeenText, .BeatenText

	text "Mi número de"
	line "escupefuego es muy"
	cont "popular entre los"
	cont "turistas."

	para "¡Algunos hasta"
	line "dejan donativos!"
	done

.SeenText:
	text "¡Pasen, pasen, a"
	line "mi espectacular"
	cont "número de"
	cont "escupefuego!"
	done

.BeatenText:
	text "¡Ya me quemé del"
	line "todo!"
	done

GenericTrainerSightseerfNoelle:
	generictrainer SIGHTSEERF, NOELLE, EVENT_BEAT_SIGHTSEERF_NOELLE, .SeenText, .BeatenText

	text "Hago un álbum de"
	line "fotos para"
	cont "enseñarles a mis"
	cont "padres."

	para "¡Eh, no mires!"
	line "¡Es privado!"
	done

.SeenText:
	text "¡Madre mía!"
	line "¡Tienes #mon"

	para "que nunca había"
	line "visto!"

	para "¿Puedo tomar una"
	line "foto?"
	done

.BeatenText:
	text "Aww… ¿Perdí?"
	line "¡No hay problema!"

	para "¡Selfie! ♥"
	line "¡Clic!"
	done

GenericTrainerSightseermChester:
	generictrainer SIGHTSEERM, CHESTER, EVENT_BEAT_SIGHTSEERM_CHESTER, .SeenText, .BeatenText

	text "¿Así que eres de"
	line "Johto? ¡Nunca he"
	cont "estado ahí!"

	para "Quizá te vea en la"
	line "Torre Batalla."
	done

.SeenText:
	text "Viajo por todo el"
	line "mundo."

	para "¿Qué región"
	line "debería visitar"
	cont "después?"
	done

.BeatenText:
	text "¡Qué gran"
	line "experiencia!"
	done
