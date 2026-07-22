OlivineCafe_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, OLIVINE_CITY, 6
	warp_event  5,  7, OLIVINE_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_BAKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  4,  4, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeLyraScript, EVENT_GOT_AMULET_COIN_FROM_LYRA
	object_event  9,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCafeFishingGuruText, -1
	object_event  9,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCafeSailorText, -1
	object_event  7,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, (1 << MORN), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCafeOfficerText, -1
	object_event  7,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCafeYoungsterText, -1
	object_event  3,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCafeFisherText, -1

	object_const_def
	const OLIVINECAFE_BAKER
	const OLIVINECAFE_LYRA

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BAKER_CHELSIE
	iftrue_jumpopenedtext BakerChelsieAfterText
	writetext BakerChelsieGreetingText
	yesorno
	iffalse_jumpopenedtext BakerChelsieNoBattleText
	writetext BakerChelsieSeenText
	waitbutton
	closetext
	winlosstext BakerChelsieBeatenText, 0
	setlasttalked OLIVINECAFE_BAKER
	loadtrainer BAKER, CHELSIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BAKER_CHELSIE
	opentext
	jumpthisopenedtext

BakerChelsieAfterText:
	text "Siempre añado"
	line "vitaminas a mi"
	cont "pan."

	para "Hacen a mis"
	line "#mon más"
	cont "fuertes."
	done

OlivineCafeLyraScript:
	faceplayer
	opentext
	writetext OlivineCafeLyraText1
	promptbutton
	verbosegiveitem AMULET_COIN
	iffalse_endtext
	writetext OlivineCafeLyraText2
	waitbutton
	closetext
	readvar VAR_FACING
	ifnotequal UP, .GoStraightDown
	applyonemovement OLIVINECAFE_LYRA, step_right
.GoStraightDown
	applymovement OLIVINECAFE_LYRA, OlivineCafeMovementData_LyraLeaves
	playsound SFX_EXIT_BUILDING
	disappear OLIVINECAFE_LYRA
	setevent EVENT_GOT_AMULET_COIN_FROM_LYRA
	waitsfx
	end

OlivineCafeMovementData_LyraLeaves:
	step_down
	step_down
	step_down
	step_end

OlivineCafeFishingGuruText:
	text "El menú del Café"
	line "Olivo está repleto"

	para "de platos"
	line "contundentes para"
	cont "marineros"
	cont "fornidos!"
	done

OlivineCafeSailorText:
	text "Cada vez que"
	line "vengo a este"
	cont "pueblo, siempre"

	para "visito el Café"
	line "Olivo."

	para "Todo en el menú me"
	line "hace sentir más"

	para "fuerte. ¡No puedo"
	line "dejar de comer!"
	done

BakerChelsieGreetingText:
	text "¡Mis #mon están"
	line "en racha!"

	para "¡Los crié con mi"
	line "pan especial de"
	cont "levadura!"

	para "¿Quieres"
	line "combatirlos?"
	done

BakerChelsieSeenText:
	text "¡Verás lo que mi"
	line "pan puede hacer!"
	done

BakerChelsieBeatenText:
	text "Eres fuerte."
	line "¿Comes mi pan"
	cont "especial?"
	done

BakerChelsieNoBattleText:
	text "¡Mis #mon"
	line "criados con pan"
	cont "son invencibles!"
	done

OlivineCafeLyraText1:
	text "Lyra: ¡Hola,"
	line "<PLAYER>! Deberías"
	cont "probar la comida"
	cont "de aquí. ¡Está muy"
	cont "buena!"

	para "Aunque no quiero"
	line "comer demasiado…"

	para "¡Ah, es verdad!"
	line "Encontré un"

	para "objeto que quizá"
	line "te guste. ¡Toma!"
	done

OlivineCafeLyraText2:
	text "¿A que es bonito?"
	line "Y útil, también."

	para "Bueno, debería"
	line "irme."

	para "Quiero ver el"
	line "Bosque Amarillo"
	cont "en Ciudad Orquídea"
	cont "antes de volver a"
	cont "casa."

	para "¡Nos vemos,"
	line "<PLAYER>!"
	done

OlivineCafeOfficerText:
	text "Sé que es un"
	line "tópico, pero"
	cont "siempre vengo a"
	cont "este sitio por"
	cont "dónuts."

	para "¡No me canso de"
	line "ellos!"
	done

OlivineCafeYoungsterText:
	text "Estos dónuts son"
	line "geniales."

	para "¡Los de mermelada"
	line "son mis favoritos!"

	para "Nada supera a un"
	line "dónut de"
	cont "mermelada."
	done

OlivineCafeFisherText:
	text "Iría a correr,"
	line "pero no querría"

	para "arruinar mi"
	line "físico."
	done
