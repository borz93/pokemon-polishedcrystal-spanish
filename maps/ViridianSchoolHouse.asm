ViridianSchoolHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  9, VIRIDIAN_CITY, 8
	warp_event  3,  9, VIRIDIAN_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, ViridianSchoolHouseBlackboardText
	bg_event  6,  1, BGEVENT_READ, PokemonJournalKiyoScript
	bg_event  7,  1, BGEVENT_READ, PokemonJournalKiyoScript

	def_object_events
	object_event  4,  1, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianSchoolHouseTeacherText, -1
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, ViridianSchoolHouseNotesText, -1
	object_event  3,  4, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianSchoolHouseLass1Text, -1
	object_event  5,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ViridianSchoolHouseYoungsterScript, -1
	object_event  2,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianSchoolHouseLass2Text, -1
	object_event  3,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianSchoolHouseGameBoyKidScript, -1

ViridianSchoolHouseTeacherText:
	text "Sé que es mucho"
	line "contenido, pero"

	para "¡prestad"
	line "atención, por"
	cont "favor!"
	done

ViridianSchoolHouseNotesText:
	text "La página está"
	line "llena de"
	cont "garabatos."
	para "Un laberinto,"
	line "flores, la letra"
	cont "S…"
	done

ViridianSchoolHouseLass1Text:
	text "¡Espera! Pensaba"
	line "que, tipo, todos"

	para "los movimientos de"
	line "tipo Fuego eran"
	cont "especiales?"
	done

ViridianSchoolHouseYoungsterScript:
	checkevent EVENT_GOT_WEAK_POLICY_FROM_VIRIDIAN
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem WEAK_POLICY
	iffalse_endtext
	setevent EVENT_GOT_WEAK_POLICY_FROM_VIRIDIAN
	jumpthisopenedtext

.Text2:
	text "“Lo que no deja"
	line "K.O. a un #mon"
	cont "lo hace más"
	cont "fuerte.”"

	para "Ese es el efecto"
	line "del Seguro Débil."
	done

.Text1:
	text "La profesora me"
	line "dio copias extra"

	para "de esto. Ten,"
	line "toma una."
	done

ViridianSchoolHouseGameBoyKidScript:
	showtextfaceplayer ViridianSchoolHouseGameBoyKidText
	turnobject LAST_TALKED, DOWN
	end

ViridianSchoolHouseGameBoyKidText:
	text "¡Tomo notas en"
	line "mi teléfono!"

	para "¡No estoy"
	line "vagueando! ¡De"
	cont "verdad!"
	done

ViridianSchoolHouseLass2Text:
	text "¡Estoy en el"
	line "asiento de la"
	cont "protagonista!"

	para "¿Por qué mi vida"
	line "es tan aburrida?"
	done

ViridianSchoolHouseBlackboardText:
	text "Los movimientos"
	line "físicos usan"
	cont "Ataque y Defensa."

	para "Los especiales"
	line "usan At. Esp. y"
	cont "Def. Esp."

	para "Los de estado no"
	line "hacen daño"
	cont "directo."
	done

PokemonJournalKiyoScript:
	setflag ENGINE_READ_KIYO_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: ¡el"
	cont "Rey del Kárate"
	cont "Kiyo!"

	para "Dicen que Kiyo"
	line "estudió con"
	cont "Aníbal, de Ciudad"
	cont "Orquídea."

	para "Se rumorea que"
	line "sigue"
	cont "entrenando en"
	cont "algún lugar de"
	cont "Johto."
	done
