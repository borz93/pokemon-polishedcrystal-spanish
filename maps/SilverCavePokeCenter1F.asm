SilverCavePokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  6,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalLanceScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  9,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 1, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCavePokeCenterGrampsScript, -1
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 1, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilverCavePokeCenter1FGrannyText, -1

PokemonJournalLanceScript:
	setflag ENGINE_READ_LANCE_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: ¡el"
	cont "Campeón Lance!"

	para "Han visto a Lance"
	line "comprando sus"
	cont "capas en los"
	cont "Grandes Almacenes"
	cont "de Azulona."
	done

SilverCavePokeCenterGrampsScript:
	checkevent EVENT_GOT_EXPERT_BELT
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writetext .GreetingText
	waitbutton
	readvar VAR_PKMN_JOURNALS
	ifequalfwd 0, .ReadNone
	ifequalfwd NUM_POKEMON_JOURNALS, .ReadThemAll
	jumpthisopenedtext

	text "Ah, ¿Leíste "
	text_decimal hScriptVar, 1, 2
	line "de ellos?"

	para "Nada mal, pero yo"
	line "leí los {d:NUM_POKEMON_JOURNALS}!"
	done

.ReadNone:
	jumpthisopenedtext

	text "¿No has leído"
	line "ninguno? Qué"
	cont "lástima."

	para "Los Centros"
	line "#mon tienen la"
	cont "mayoría en sus"
	cont "estantes,"

	para "pero los fans de"
	line "verdad buscamos"
	cont "los números"
	cont "raros."
	done

.ReadThemAll:
	writetext .ReadAllText
	promptbutton
	verbosegiveitem EXPERT_BELT
	iffalse_endtext
	setevent EVENT_GOT_EXPERT_BELT
	jumpthisopenedtext

.AfterText:
	text "Esa cinta no es"
	line "solo decorativa."

	para "Potencia a tu"
	line "#mon si la"
	cont "lleva puesta."
	done

.GreetingText:
	text "De joven yo"
	line "también era un"
	cont "entrenador con"
	cont "talento."

	para "Ahora solo leo"
	line "sobre otros en"
	cont "Diario #mon."

	para "¿Tú también lees"
	line "el Diario?"
	done

.ReadAllText:
	text "¿Los leíste"
	line "todos? ¡Entonces"
	cont "eres un experto"
	cont "como yo!"

	para "¡Toma esto para"
	line "demostrar que eres"
	cont "fan!"
	done

SilverCavePokeCenter1FGrannyText:
	text "Quien busca poder"
	line "sube al Monte"
	cont "Plateado pese a"
	cont "sus peligros…"

	para "Con sus #mon de"
	line "confianza, deben"
	cont "sentir que pueden"
	cont "ir a cualquier"
	cont "lugar…"
	done
