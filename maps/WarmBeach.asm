WarmBeach_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 15, 13, WARM_BEACH_SHACK, 1
	warp_event  8,  5, SHAMOUTI_TUNNEL, 2
	warp_event  3,  8, WARM_BEACH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 17, 14, BGEVENT_JUMPTEXT, WarmBeachShackSignText
	bg_event 18, 20, BGEVENT_JUMPTEXT, WarmBeachShrineText
	bg_event 19, 20, BGEVENT_JUMPTEXT, WarmBeachShrineText
	bg_event  7, 20, BGEVENT_ITEM + PEARL, EVENT_WARM_BEACH_HIDDEN_PEARL

	def_object_events
	object_event 11,  8, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSightseermGareth, -1
	object_event  4, 12, SPRITE_AROMA_LADY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerAromaLadyHolly, -1
	object_event 11, 14, SPRITE_COOL_DUDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachCooltrainermText, -1
	object_event 22, 20, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachCooltrainerfText, -1
	object_event 17, 21, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWKING, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, WarmBeachSlowkingScript, -1
	object_event 11, 20, SPRITE_PICNICKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, WarmBeachLassScript, -1
	object_event  6, 23, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachLadyText, -1

GenericTrainerSightseermGareth:
	generictrainer SIGHTSEERM, GARETH, EVENT_BEAT_SIGHTSEERM_GARETH, .SeenText, .BeatenText

	text "Incluso fuera de"
	line "combate, estos"

	para "objetos son"
	line "recuerdos"
	cont "memorables."
	done

.SeenText:
	text "Acabo de comprar"
	line "objetos útiles"

	para "en el mercado al"
	line "aire libre!"
	done

.BeatenText:
	text "Mis objetos no"
	line "bastaron…"
	done

GenericTrainerAromaLadyHolly:
	generictrainer AROMA_LADY, HOLLY, EVENT_BEAT_AROMA_LADY_HOLLY, .SeenText, .BeatenText

	text "El sentido del"
	line "olfato es vital"
	cont "en la naturaleza."
	done

.SeenText:
	text "Soy uno con los"
	line "aromas de la"
	cont "naturaleza."
	done

.BeatenText:
	text "La derrota tiene"
	line "su propio olor…"
	done

WarmBeachCooltrainermText:
	text "¡Hay un #mon"
	line "aquí que habla!"

	para "Nunca lo habría"
	line "creído si no lo"

	para "hubiera visto con"
	line "mis propios ojos!"
	done

WarmBeachCooltrainerfText:
	text "Me eligieron como"
	line "doncella del"
	cont "festival este año,"

	para "así que debo tocar"
	line "la melodía del"
	cont "Elegido."

	para "Estoy muy"
	line "nerviosa, así que"
	cont "vine a practicar."
	done

WarmBeachSlowkingScript:
	jumpthistext

	text "Me vendrían bien"
	line "unos pantalones…"
	done

WarmBeachLassScript:
	faceplayer
	opentext
	checkflag ENGINE_SEASHORE_SHELL_BELL
	iftrue_jumpopenedtext .Text3
	writetext .Text1
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .Text4
	checkmoney YOUR_MONEY, 4000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem SHELL_BELL
	iffalse_jumpopenedtext .Text6
	setflag ENGINE_SEASHORE_SHELL_BELL
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 4000
	special PlaceMoneyTopRight
	jumpthisopenedtext

	text "Una Camp. Concha,"
	line "solo para ti!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "No tienes"
	line "suficiente dinero…"
	done

.Text1:
	text "Recojo conchas de"
	line "la playa y las"

	para "convierto en"
	line "Camp. Concha."

	para "Dicen que su"
	line "tañido cura."

	para "Cuestan ¥4000"
	line "cada una. ¿Quieres"
	cont "una?"
	done

.Text3:
	text "Solo hice una"
	line "Camp. Concha hoy…"
	done

.Text4:
	text "¡Vale, no pasa"
	line "nada!"
	done

.Text6:
	text "No tienes"
	line "suficiente sitio…"
	done

WarmBeachLadyText:
	text "Esas islas al otro"
	line "lado del agua"

	para "son conocidas como"
	line "los templos del"
	cont "Fuego, el Hielo y"
	cont "el Relámpago."

	para "Eso es lo que dice"
	line "este folleto,"

	para "¿pero para qué"
	line "sirven?"
	done

WarmBeachShackSignText:
	text "Choza de Playa"
	done

WarmBeachShrineText:
	text "Es un santuario"
	line "dedicado al"

	para "Guardián de los"
	line "Mares."
	done
