CeladonHotelRoom2_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, CELADON_HOTEL_2F, 3
	warp_event  4,  5, CELADON_HOTEL_2F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, MrHyperScript, -1

MrHyperScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MR_HYPER
	iftruefwd .IntroDone
	writetext .TextIntro
	waitbutton
	setevent EVENT_TALKED_TO_MR_HYPER
	; fallthrough
.IntroDone:
	writetext .TextAskTrain
	yesorno
	iffalse_jumpopenedtext .TextComeBackAnytime
.CheckBottleCaps:
	checkitem BOTTLE_CAP
	iffalse_jumpopenedtext .TextNoBottleCaps
	writetext .TextTrainWho
	waitbutton
	special Special_HyperTrain
	iffalse_jumpopenedtext .TextComeBackAnytime
	takeitem BOTTLE_CAP
	writetext .TextGotStronger
	waitbutton
	writetext .TextTrainSomeMore
	yesorno
	iftrue .CheckBottleCaps
	jumpthisopenedtext

.TextComeBackAnytime:
	text "¡Vuelve cuando"
	line "quieras!"
	cont "Mr. Hyper"
	cont "siempre estará"
	cont "encantado de"
	cont "verte!"
	done

.TextIntro:
	text "¡Soy Mr. Hyper!"
	line "¿Sabes por qué?"

	para "Porque ayudo a"
	line "los #mon a"
	cont "entrenar al"
	cont "máximo!"

	para "¡Esto permite que"
	line "un #mon que ya"
	cont "maximizó su"
	cont "esfuerzo se vuelva"
	cont "aún más fuerte!"

	para "Este entrenamiento"
	line "ayuda a mejorar"
	cont "sus estadísticas."

	para "Si quieres que"
	line "entrene a tu"
	cont "#mon, tráeme"
	cont "algunas Chapas."
	done

.TextAskTrain:
	text "¿Qué me dices?"
	line "¿Quieres probar"
	cont "mi entrenamiento?"
	done

.TextNoBottleCaps:
	text "¿No tienes"
	line "Chapas?"

	para "Sé que a veces"
	line "los Pescadores"
	cont "consiguen…"
	done

.TextTrainWho:
	text "¿A qué #mon"
	line "entreno?"
	done

.TextGotStronger:
	text "¡Listo! Mi"
	line "entrenamiento"
	cont "mejoró las"
	cont "estadísticas de"
	cont ""
	text_ram wStringBuffer1
	text "!"
	done

.TextTrainSomeMore:
	text "¿Entreno a otro"
	line "#mon?"
	done
