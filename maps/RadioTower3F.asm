RadioTower3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, CardKeyShutterCallback

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2
	warp_event 17,  0, RADIO_TOWER_4F, 4

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, RadioTower3FPersonnelSignText
	bg_event  9,  0, BGEVENT_JUMPTEXT, RadioTower3FPokemonMusicSignText
	bg_event 14,  2, BGEVENT_UP, CardKeySlotScript

	def_object_events
	object_event  7,  4, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower3FSuperNerdText, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  3,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower3FGymGuideScript, -1
	object_event 11,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3FCooltrainerFScript, -1
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGruntM7, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM8, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 16,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM9, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  9,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerRocketScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

CardKeyShutterCallback:
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftruefwd .Change
	endcallback

.Change:
	changeblock 14, 2, $2a
	changeblock 14, 4, $1
	endcallback

RadioTower3FGymGuideScript:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower3FGymGuideText
	jumpthistextfaceplayer

	text "Para los"
	line "entrenadores, los"
	cont "#mon son sus"
	cont "compañeros"
	cont "queridos."

	para "Es terrible cómo"
	line "el Team Rocket"

	para "intenta controlar"
	line "a los #mon."
	done

RadioTower3FCooltrainerFScript:
	checkevent EVENT_GOT_GBC_SOUNDS_FROM_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower3FCooltrainerFYouWereMarvelousText
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .NoRockets
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower3FCooltrainerFIsDirectorSafeText
	jumpthistextfaceplayer

	text "El jefe del Team"
	line "Rocket se ha"
	cont "encerrado dentro."

	para "Pero el Director"
	line "puede abrirlo."

	para "Está arriba, en el"
	line "quinto piso."

	para "¡Por favor,"
	line "sálvalo!"
	done

.NoRockets:
	faceplayer
	opentext
	writetext RadioTower3FCooltrainerFYoureMyHeroText
	promptbutton
	verbosegivekeyitem GBC_SOUNDS
	iffalse_endtext
	writetext RadioTower3FCooltrainerFItsAGBCSoundsText
	waitbutton
	closetext
	setevent EVENT_GOT_GBC_SOUNDS_FROM_RADIO_TOWER
	end

GenericTrainerGruntM7:
	generictrainer GRUNTM, 7, EVENT_BEAT_ROCKET_GRUNTM_7, GruntM7SeenText, GruntM7BeatenText

	text "Fallé en mis"
	line "deberes…"

	para "Me descontarán la"
	line "paga por esto…"
	done

GenericTrainerGruntM8:
	generictrainer GRUNTM, 8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText

	text "¡Me siento fatal"
	line "por perder!"

	para "¡Rayos! ¡Odio los"
	line "#mon inútiles!"
	done

GenericTrainerGruntM9:
	generictrainer GRUNTM, 9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText

	text "¡¿Qué?! ¿Pasaste a"
	line "nuestros hombres"
	cont "del Subsuelo?"

	para "¿Cómo pudiste?"
	done

GenericTrainerRocketScientistMarc:
	generictrainer ROCKET_SCIENTIST, MARC, EVENT_BEAT_ROCKET_SCIENTIST_MARC, RocketScientistMarcSeenText, RocketScientistMarcBeatenText

	text "Bwahahaha…"

	para "Puedo transmitir"
	line "desde aquí una"
	cont "señal tan fuerte"
	cont "como necesite."
	done

CardKeySlotScript::
	opentext
	writetext RadioTower3FCardKeySlotText
	waitbutton
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftruefwd .UsedCardKey
	checkkeyitem CARD_KEY
	iftruefwd .HaveCardKey
.UsedCardKey:
	endtext

.HaveCardKey:
	writetext InsertedTheCardKeyText
	waitbutton
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	playsound SFX_ENTER_DOOR
	changeblock 14, 2, $2a
	changeblock 14, 4, $1
	refreshmap
	closetext
	waitsfx
	end

RadioTower3FSuperNerdText:
	text "Tenemos"
	line "grabaciones de los"
	cont "gritos de todos"
	cont "los #mon"
	cont "encontrados."

	para "Debemos tener unos"
	line "200 tipos."
	done


RadioTower3FGymGuideText:
	text "Emitimos las 24"
	line "horas del día"
	cont "programas"
	cont "entretenidos."

	para "¡Haré lo posible"
	line "por correr sin"
	cont "parar también!"
	done

RadioTower3FCooltrainerFIsDirectorSafeText:
	text "¿Está a salvo el"
	line "Director?"
	done

RadioTower3FCooltrainerFYoureMyHeroText:
	text "¡Gracias! ¡Eres"
	line "mi héroe!"

	para "Esto es una"
	line "muestra de mi"
	cont "gratitud."
	done

RadioTower3FCooltrainerFItsAGBCSoundsText:
	text "Eso es GBC"
	line "Sounds."

	para "Está repleto de"
	line "canciones que"

	para "puedes escuchar"
	line "donde sea, incluso"
	cont "en combates."

	para "Tiene funciones"
	line "especiales para"
	cont "ajustar el tono o"
	cont "el tempo,"

	para "pero los controles"
	line "son un poco"
	cont "delicados."

	para "¡Simplemente"
	line "juega con ello!"
	done

RadioTower3FCooltrainerFYouWereMarvelousText:
	text "¡Fuiste"
	line "simplemente"
	cont "maravilloso!"
	done

GruntM7SeenText:
	text "Me han dado"
	line "órdenes estrictas."

	para "¡Debo aplastar a"
	line "quien desafíe al"
	cont "Team Rocket!"
	done

GruntM7BeatenText:
	text "¡¿Qué?!"
	done

GruntM8SeenText:
	text "Se siente genial"
	line "ordenar a los"
	cont "#mon cometer"
	cont "crímenes."
	done

GruntM8BeatenText:
	text "¡No puede ser!"
	done

GruntM9SeenText:
	text "¿Por qué se abrió"
	line "el cierre?"
	cont "¿Tuviste algo que"
	cont "ver con esto?"
	done

GruntM9BeatenText:
	text "¡Estoy acabado!"
	done

RocketScientistMarcSeenText:
	text "¿Un niño"
	line "desconocido"
	cont "vagando aquí?"

	para "¿Quién eres?"
	done

RocketScientistMarcBeatenText:
	text "¡Tch! ¡Te"
	line "subestimé!"
	done

RadioTower3FCardKeySlotText:
	text "Es la ranura de la"
	line "Tarjeta Azul."
	done

InsertedTheCardKeyText:
	text "<PLAYER> insertó"
	line "la Tarjeta Azul."
	done

RadioTower3FPersonnelSignText:
	text "Personal de la"
	line "3. planta"
	done

RadioTower3FPokemonMusicSignText:
	text "Música #mon con"
	line "el DJ Ben"
	done
