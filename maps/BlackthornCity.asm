BlackthornCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, BlackthornCityFlypointCallback
	callback MAPCALLBACK_OBJECTS, BlackthornCitySantosCallback

	def_warp_events
	warp_event 18, 11, BLACKTHORN_GYM_1F, 1
	warp_event 13, 21, BLACKTHORN_DRAGON_SPEECH_HOUSE, 1
	warp_event 29, 23, BLACKTHORN_EMYS_HOUSE, 1
	warp_event 15, 29, BLACKTHORN_MART, 2
	warp_event 21, 29, BLACKTHORN_POKECENTER_1F, 1
	warp_event  9, 29, MOVE_DELETERS_HOUSE, 1
	warp_event 36,  9, ICE_PATH_1F, 2
	warp_event 20,  1, DRAGONS_DEN_1F, 1

	def_coord_events

	def_bg_events
	bg_event 34, 24, BGEVENT_JUMPTEXT, BlackthornCitySignText
	bg_event 17, 13, BGEVENT_JUMPTEXT, BlackthornGymSignText
	bg_event  7, 29, BGEVENT_JUMPTEXT, MoveDeletersHouseSignText
	bg_event 21,  3, BGEVENT_JUMPTEXT, DragonDensSignText
	bg_event  9, 19, BGEVENT_JUMPTEXT, BlackthornCityTrainerTipsText

	def_object_events
	object_event 22, 20, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	object_event 18, 12, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornDragonTamer1Script, EVENT_BLACKTHORN_CITY_DRAGON_TAMER_BLOCKS_GYM
	object_event 19, 12, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornDragonTamer1Script, EVENT_BLACKTHORN_CITY_DRAGON_TAMER_DOES_NOT_BLOCK_GYM
	object_event 24, 31, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornBlackbeltScript, -1
	object_event 20,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornGramps1Text, EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	object_event 21,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornGramps2Text, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	object_event  9, 25, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornLassText, -1
	object_event 13, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornYoungsterText, -1
	object_event 35, 19, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornCooltrainerF1Text, -1
	object_event  3, 29, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornCooltrainerF2Text, -1
	object_event 31, 26, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornDragonTamer2Text, -1
	object_event 27, 25, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornDragonTamer3Text, -1

	object_const_def
	const BLACKTHORNCITY_SANTOS

BlackthornCityFlypointCallback:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	endcallback

BlackthornCitySantosCallback:
	readvar VAR_WEEKDAY
	ifequalfwd SATURDAY, .SantosAppears
	disappear BLACKTHORNCITY_SANTOS
	endcallback

.SantosAppears:
	appear BLACKTHORNCITY_SANTOS
	endcallback

BlackthornCitySignText:
	text "Ciudad Endrino"

	para "Un Tranquilo"
	line "Retiro de Montaña"
	done

BlackthornGymSignText:
	text "Gimnasio #mon"
	line "de Ciudad Endrino"
	cont "Líder: Débora"

	para "La Bendecida"
	line "Usuaria de #mon"
	cont "Dragón"
	done

MoveDeletersHouseSignText:
	text "Casa del"
	line "Eliminamovimientos"
	done

DragonDensSignText:
	text "Guarida Dragón"
	line "Adelante"
	done

BlackthornCityTrainerTipsText:
	text "Consejos de"
	line "entrenador"

	para "Un #mon que"
	line "lleve una Baya"
	cont "Ziuela se curará"

	para "de cualquier"
	line "problema de"
	cont "estado."
	done

SantosScript:
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue_jumptextfaceplayer .SaturdayText
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	faceplayer
	opentext
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftruefwd .MetSantos
	writetext .MeetText
	promptbutton
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext .GivesGiftText
	promptbutton
	verbosegiveitem SPELL_TAG
	iffalse_endtext
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	jumpthisopenedtext

	text "Sabas: …"

	para "Mote Espíritu…"

	para "Los movimientos"
	line "de tipo Fantasma"
	cont "se fortalecen…"

	para "Te asustará…"
	done

.NotSaturday:
	jumpthistextfaceplayer

	text "Sabas: Hoy no es"
	line "sábado…"
	done

.MeetText:
	text "Sabas: …"

	para "Es sábado…"

	para "Soy Sabas del"
	line "sábado…"
	done

.GivesGiftText:
	text "Puedes quedarte"
	line "esto…"
	done

.SaturdayText:
	text "Sabas: …"

	para "Nos vemos otro"
	line "sábado…"

	para "No tendré más"
	line "regalos…"
	done

BlackthornDragonTamer1Script:
	checkevent EVENT_BEAT_CLAIR
	iftrue_jumptextfaceplayer .ClairIsBeatenText
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue_jumptextfaceplayer .ClairIsInText
	jumpthistextfaceplayer

	text "Lo siento."

	para "Débora, nuestra"
	line "Líder de"
	cont "Gimnasio, entró"

	para "en la Guarida"
	line "Dragón detrás del"
	cont "Gimnasio."

	para "No tengo idea de"
	line "cuándo volverá"
	cont "nuestra Líder."
	done

.ClairIsInText:
	text "Débora, nuestra"
	line "Líder de"
	cont "Gimnasio, te está"
	cont "esperando."

	para "Sin embargo, sería"
	line "imposible que un"

	para "entrenador"
	line "corriente ganara."
	done

.ClairIsBeatenText:
	text "¿Venciste a"
	line "Débora?"

	para "¡Eso es"
	line "asombroso!"

	para "Nunca la había"
	line "oído perder contra"

	para "nadie más que su"
	line "primo Lance."
	done

BlackthornBlackbeltScript:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "¿Se rompió mi"
	line "radio? Solo capto"
	cont "esta extraña señal"
	cont "últimamente."
	done

.Text2:
	text "¡Arooo! ¡Voces en"
	line "mi cabeza!"

	para "¿Eh? ¡Estoy"
	line "escuchando mi"
	cont "radio!"
	done

BlackthornGramps1Text:
	text "No. Solo los"
	line "entrenadores"
	cont "elegidos pueden"
	cont "entrenar aquí."

	para "Por favor, vete."
	done

BlackthornGramps2Text:
	text "Si Débora lo"
	line "permite, su"
	cont "abuelo, nuestro"
	cont "Maestro, también"
	cont "lo hará."

	para "Puedes entrar."
	done

BlackthornLassText:
	text "¿Vas a hacer"
	line "que tus #mon"
	cont "olviden algunos"
	cont "movimientos?"
	done

BlackthornYoungsterText:
	text "Todos los maestros"
	line "Dragón vienen de"
	cont "Ciudad Endrino."
	done

BlackthornCooltrainerF1Text:
	text "Vaya, ¿viniste por"
	line "la Ruta Helada?"

	para "¡Debes ser una"
	line "entrenadora de"
	cont "verdad!"
	done

BlackthornCooltrainerF2Text:
	text "El tipo Hada se"
	line "descubrió hace"
	cont "poco."

	para "Anula por completo"
	line "a los tipos"
	cont "Dragón."
	done

BlackthornDragonTamer2Text:
	text "Cuando nuestra"
	line "Líder de Gimnasio"

	para "era joven, solía"
	line "entrenar sin parar"
	cont "en la Guarida"
	cont "Dragón."
	done

BlackthornDragonTamer3Text:
	text "Ciudad Endrino es"
	line "el hogar de muchos"

	para "domadores de"
	line "dragones famosos,"
	cont "incluido Lance."

	para "¡Es el primo de"
	line "nuestra Líder de"
	cont "Gimnasio, ya"
	cont "sabes!"
	done
