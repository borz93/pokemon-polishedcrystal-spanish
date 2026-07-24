FastShipCabins_SW_SSW_NW_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  0, FAST_SHIP_1F, 5
	warp_event  2, 19, FAST_SHIP_1F, 6
	warp_event  3, 19, FAST_SHIP_1F, 6
	warp_event  2, 31, FAST_SHIP_1F, 7
	warp_event  3, 31, FAST_SHIP_1F, 7

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_READ, FastShipBed
	bg_event  7,  2, BGEVENT_READ, FastShipBed

	def_object_events
	object_event  1, 15, SPRITE_FIREBREATHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerFirebreatherLyle, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBug_catcherKen, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5, 27, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRichBoyWinston, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  1, 26, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyCassie, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  3, 28, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGuitaristmClyde, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND

GenericTrainerFirebreatherLyle:
	generictrainer FIREBREATHER, LYLE, EVENT_BEAT_FIREBREATHER_LYLE, FirebreatherLyleSeenText, FirebreatherLyleBeatenText

	text "Supongo que el"
	line "fuego es débil en"
	cont "el mar."

	para "¿No importa?"
	line "¿En serio?"
	done

GenericTrainerBug_catcherKen:
	generictrainer BUG_CATCHER, KEN, EVENT_BEAT_BUG_CATCHER_KEN, Bug_catcherKenSeenText, Bug_catcherKenBeatenText

	text "¡Puedes encontrar"
	line "muchos #mon en"
	cont "los árboles de"
	cont "Johto!"
	done

GenericTrainerRichBoyWinston:
	generictrainer RICH_BOY, WINSTON, EVENT_BEAT_RICH_BOY_WINSTON, RichBoyWinstonSeenText, RichBoyWinstonBeatenText

	text "Este barco es tan"
	line "aburrido."
	done

GenericTrainerBeautyCassie:
	generictrainer BEAUTY, CASSIE, EVENT_BEAT_BEAUTY_CASSIE, BeautyCassieSeenText, BeautyCassieBeatenText

	text "Un viaje es lo"
	line "mejor para"
	cont "superar un"
	cont "corazón roto."

	para "Pero un viaje en"
	line "el Barco Rápido es"
	cont "muy corto para"
	cont "eso."
	done

TrainerGuitaristmClyde:
	trainer GUITARISTM, CLYDE, EVENT_BEAT_GUITARISTM_CLYDE, GuitaristmClydeSeenText, GuitaristmClydeBeatenText, 0, GuitaristmClydeScript

GuitaristmClydeScript:
	endifjustbattled
	opentext
	checkbp 0
	iffalsefwd .BattleTower
	jumpthisopenedtext

	text "Hablando de la"
	line "Emisora de Radio,"

	para "¿Cuál es el número"
	line "de la suerte de"
	cont "esta semana?"
	done

.BattleTower:
	jumpthisopenedtext

	text "Iba a debutar en"
	line "la Torre Batalla…"

	para "Debería volver a"
	line "Ciudad Carmín y"
	cont "reentrenar…"
	done

FastShipBed:
	showtext FastShipBedText1
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	turnobject PLAYER, LEFT
	special RestartMapMusic
	special Special_FadeInQuickly
	showtext FastShipBedText2
	checkevent EVENT_FAST_SHIP_HAS_ARRIVED
	iftruefwd .AlreadyArrived
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iftruefwd .CanArrive
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftruefwd .CanArrive
.AlreadyArrived:
	end

.CanArrive:
	playsound SFX_ELEVATOR_END
	pause 30
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftruefwd .ArrivedOlivine
	showtext FastShipArrivedVermilionText
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

.ArrivedOlivine:
	showtext FastShipArrivedOlivineText
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

FirebreatherLyleSeenText:
	text "¡Voy a Kanto a"
	line "hacer espectáculos"
	cont "de fuego!"
	done

FirebreatherLyleBeatenText:
	text "Fiuu… La llama"
	line "es diminuta…"
	done

Bug_catcherKenSeenText:
	text "¡Visito a mi"
	line "abuela para"
	cont "atrapar bichos!"
	done

Bug_catcherKenBeatenText:
	text "Ooh, vaya."
	line "¡Eres fuerte!"
	done

RichBoyWinstonSeenText:
	text "No hay forma de"
	line "que pudieras"
	cont "pagar un billete."

	para "¡Parece que"
	line "tenemos un"
	cont "polizón!"
	done

RichBoyWinstonBeatenText:
	text "¡Vaya! ¿A quién le"
	line "compraste tus"
	cont "#mon?"
	done

BeautyCassieSeenText:
	text "Intento olvidar"
	line "mis penas."
	cont "¡Combatamos!"
	done

BeautyCassieBeatenText:
	text "Mi corazón llora…"
	done

GuitaristmClydeSeenText:
	text "Voy a probar mis"
	line "canciones en la"

	para "Emisora de Radio"
	line "de Trigal."
	done

GuitaristmClydeBeatenText:
	text "¡Yowza!"
	line "¡Distorsión total!"
	done



FastShipBedText1:
	text "¡Una cama cómoda!"
	line "Hora de dormir…"
	done

FastShipBedText2:
	text "¡Ah, renovado y"
	line "restaurado!"
	done

FastShipArrivedOlivineText:
	text "El Barco Rápido"
	line "S.S.Aqua llegó a"
	cont "Ciudad Olivo."
	done

FastShipArrivedVermilionText:
	text "El Barco Rápido"
	line "S.S.Aqua llegó a"
	cont "Ciudad Carmín."
	done
