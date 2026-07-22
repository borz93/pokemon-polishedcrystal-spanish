RadioTower4F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  9,  0, RADIO_TOWER_3F, 2
	warp_event 12,  0, RADIO_TOWER_5F, 2
	warp_event 17,  0, RADIO_TOWER_3F, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_JUMPTEXT, RadioTower4FProductionSignText
	bg_event 15,  0, BGEVENT_JUMPTEXT, RadioTower4FStudio2SignText

	def_object_events
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  4, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower4FFisherText, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 14,  6, SPRITE_MARY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FDJMaryScript, -1
	pokemon_event 12,  7, MEOWTH, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, RadioTowerMeowthText, -1
	object_event 14,  1, SPRITE_PROTON, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerProton1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerRocketScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

	object_const_def
	const RADIOTOWER4F_ROCKET

RadioTower4FDJMaryScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_FAIRYFEATHER_FROM_MARY
	iftrue_jumpopenedtext RadioTower4FDJMaryText_After
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .ClearedRockets
	jumpthisopenedtext

	text "Mary: ¿Por qué?"
	line "¿Por qué tengo que"
	cont "sufrir esto?"

	para "¡Meowth, ayúdame!"
	done

.ClearedRockets:
	writetext RadioTower4FDJMaryText_ClearedRockets
	promptbutton
	verbosegiveitem FAIRYFEATHER
	iffalse_endtext
	setevent EVENT_GOT_FAIRYFEATHER_FROM_MARY
	jumpthisopenedtext

	text "Mary: Es perfecta"
	line "para #mon que"

	para "conocen"
	line "movimientos de"
	cont "tipo Hada."
	done

GenericTrainerGruntM10:
	generictrainer GRUNTM, 10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText

	text "¡No me lo creo!"
	line "¡Me vencieron!"
	done

GenericTrainerProton1:
	generictrainer PROTON, PROTON1, EVENT_BEAT_PROTON_1, Proton1SeenText, Proton1BeatenText

	text "Te has ganado mi"
	line "respeto, así que"
	cont "un consejo."

	para "No es tarde. Aún"
	line "puedes dar marcha"
	cont "atrás."
	done

GenericTrainerGruntF4:
	generictrainer GRUNTF, 4, EVENT_BEAT_ROCKET_GRUNTF_4, GruntF4SeenText, GruntF4BeatenText

	text "¡Adoro lo bella"
	line "que soy!"

	para "¿A quién le"
	line "importan los"
	cont "#mon?"
	done

GenericTrainerRocketScientistRich:
	generictrainer ROCKET_SCIENTIST, RICH, EVENT_BEAT_ROCKET_SCIENTIST_RICH, RocketScientistRichSeenText, RocketScientistRichBeatenText

	text "¿De verdad crees"
	line "que puedes detener"
	cont "al Team Rocket?"
	done

RadioTower4FFisherText:
	text "Escuché la radio"
	line "mientras estaba en"
	cont "las ruinas."

	para "Oí una transmisión"
	line "extraña ahí."
	done

RadioTower4FDJMaryText_ClearedRockets:
	text "Mary: ¡Oh! ¡Eres"
	line "mi pequeño"
	cont "salvador!"

	para "¿Aceptas esto"
	line "como mi"
	cont "agradecimiento?"
	done

RadioTower4FDJMaryText_After:
	text "Mary: Sintoniza"
	line "mi programa en el"

	para "Show #mon del"
	line "Prof. Oak."
	done

RadioTowerMeowthText:
	text "Meowth: ¡Meowth!"
	done

GruntM10SeenText:
	text "¿Planeas rescatar"
	line "al Director?"

	para "¡Eso no será"
	line "posible porque"
	cont "voy a vencerte!"
	done

GruntM10BeatenText:
	text "¡No! ¡No puede"
	line "ser!"
	done

Proton1SeenText:
	text "¡Alto! ¡Se me"
	line "conoce como la"
	cont "fortaleza del Team"
	cont "Rocket!"

	para "¡No darás ni un"
	line "paso más!"
	done

Proton1BeatenText:
	text "¡La fortaleza"
	line "cayó!"
	done

GruntF4SeenText:
	text "¿No crees que mis"
	line "#mon son"
	cont "monos?"

	para "Pensaré que mis"
	line "#mon son"
	cont "monos…"

	para "¡después de que"
	line "venzan a los"
	cont "tuyos!"
	done

GruntF4BeatenText:
	text "¡Oh, no! ¡Son tan"
	line "inútiles!"
	done

RocketScientistRichSeenText:
	text "Excelente."

	para "Esta Torre Radio"
	line "cumplirá nuestro"
	cont "gran diseño."
	done

RocketScientistRichBeatenText:
	text "Hmmm…"

	para "Todo gran plan"
	line "tiene sus"
	cont "tropiezos."
	done

RadioTower4FProductionSignText:
	text "4F Producción"
	done

RadioTower4FStudio2SignText:
	text "4F Estudio 2"
	done
