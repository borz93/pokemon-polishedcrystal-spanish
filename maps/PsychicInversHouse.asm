PsychicInversHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_16_WEST, 1
	warp_event  3,  7, ROUTE_16_WEST, 1

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  2,  2, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PsychicInverScript, -1
	object_event  6,  3, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PsychicInversHouseHexManiacText, -1

	object_const_def
	const PSYCHICINVERSHOUSE_INVER

PsychicInverScript:
	checkflag ENGINE_FOUGHT_PSYCHIC_INVER
	iftrue_jumptextfaceplayer PsychicInverTomorrowText
	faceplayer
	opentext
	writetext PsychicInverGreetingText
	yesorno
	iffalse_jumpopenedtext PsychicInverNoText
	writetext PsychicInverYesText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_PSYCHIC_INVER
	winlosstext PsychicInverBeatenText, 0
	setlasttalked PSYCHICINVERSHOUSE_INVER
	special PickPsychicInverParty
	loadtrainer INVER, 1
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	opentext
	readmem wInverseBattleScore
	ifequalfwd 0, .Score0
	ifgreater 127, .Score0 ; negative
	ifless 4, .Score1_3
	ifless 7, .Score4_6
	ifless 10, .Score7_9
	writetext InverseBattle10PointRewardText
	setval RARE_CANDY
.Reward
	waitbutton
	writetext PsychicInverRewardText
.GiveReward
	promptbutton
	verbosegiveitem ITEM_FROM_MEM
	endtext

.Score0
	writetext InverseBattle0PointRewardText
	waitbutton
	writetext PsychicInverZeroRewardText
	setval ORAN_BERRY
	sjump .GiveReward

.Score1_3
	writetext InverseBattle1_3PointRewardText
	setval SITRUS_BERRY
	sjump .Reward

.Score4_6
	writetext InverseBattle4_6PointRewardText
	random MARANGABERRY - LUM_BERRY + 1 ; excludes early common berries
	addval LUM_BERRY
	sjump .Reward

.Score7_9
	writetext InverseBattle7_9PointRewardText
	random NUM_STONES
	addval FIRST_STONE
	sjump .Reward

PsychicInverGreetingText:
	text "Oh. No esperaba"
	line "visita aquí."
	cont "Hmm…"

	para "¿Tenemos un"
	line "combate algo"
	cont "extraño?"

	para "¡Yo lo llamo un"
	line "Combate Inverso!"

	para "¿Qué opinas?"
	line "¿Te apetece"
	cont "probar un Combate"
	cont "Inverso?"
	done

PsychicInverNoText:
	text "Oh, ya veo… Qué"
	line "pena."

	para "Si cambias de"
	line "opinión, vuelve."
	done

PsychicInverYesText:
	text "Los movimientos"
	line "supereficaces no"
	cont "serán muy"
	cont "eficaces, y"
	cont "viceversa."
	done

PsychicInverBeatenText:
	text "Ese combate quizá"
	line "me haya cansado"

	para "más que a mis"
	line "#mon…"
	done

InverseBattle0PointRewardText:
	text "No estoy seguro de"
	line "que entiendas los"
	cont "Combates Inversos…"
	done

InverseBattle1_3PointRewardText:
	text "Entiendes los"
	line "Combates"
	cont "Inversos…"
	done

InverseBattle4_6PointRewardText:
	text "Entiendes los"
	line "Combates Inversos"
	cont "bastante bien."
	done

InverseBattle7_9PointRewardText:
	text "¡Entiendes los"
	line "Combates Inversos"
	cont "perfectamente!"
	done

InverseBattle10PointRewardText:
	text "Eres un experto en"
	line "Combates Inversos."

	para "No soy rival para"
	line "ti."
	done

PsychicInverZeroRewardText:
	text "¡Aun así, te daré"
	line "algo pequeño, así"
	cont "que asegúrate de"
	cont "volver a intentar-"
	cont "lo!"
	done

PsychicInverRewardText:
	text "¡Tengo algo"
	line "pequeño para un"
	cont "rival como tú!"

	para "Toma, ¡cógelo!"
	done

PsychicInverTomorrowText:
	text "Este extraño poder"
	line "que invierte los"
	cont "enfrentamientos de"
	cont "tipo…"

	para "No puedo usarlo"
	line "muy a menudo."

	para "Por favor, vuelve"
	line "mañana."
	done

PsychicInversHouseHexManiacText:
	text "¡Mi hermano tiene"
	line "un poder"
	cont "misterioso!"

	para "¡Puede invertir"
	line "los"
	cont "enfrentamientos de"
	cont "tipo! ¡Es una"
	cont "locura!"

	para "Los movimientos"
	line "supereficaces y"
	cont "poco eficaces se"
	cont "intercambian!"
	done
