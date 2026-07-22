BlackthornPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, BLACKTHORN_CITY, 5
	warp_event  6,  7, BLACKTHORN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalClairScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  8,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ProfOaksAide4Script, -1
	object_event 11,  6, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumpstd, happinesschecknpc, -1
	object_event  8,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornPokeCenter1FGentlemanText, -1
	object_event  1,  4, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornPokeCenter1FTwinText, -1

PokemonJournalClairScript:
	setflag ENGINE_READ_CLAIR_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje"
	line "especial: ¡la"
	cont "Líder Débora!"

	para "El atuendo azul"
	line "brillante y la"
	cont "capa de Débora la"
	cont "han hecho la"
	cont "última moda."
	done

ProfOaksAide4Script:
	checkevent EVENT_GOT_LUCKY_EGG_FROM_PROF_OAKS_AIDE
	iftrue_jumptextfaceplayer .ExplainText
	faceplayer
	opentext
	writetext .HiText
	waitbutton
	setval16 60
	special CountCaught
	iftruefwd .HereYouGo
	jumpthisopenedtext

	text "A ver…"
	line "¡Ay! Solo has"
	cont "atrapado"

	para ""
	text_decimal wTempDexOwn, 2, 3
	text " tipos"
	line "de #mon."

	para "Vuelve a verme"
	line "cuando atrapes"
	cont "60 tipos."
	done

.HereYouGo
	writetext .HereYouGoText
	waitbutton
	verbosegiveitem LUCKY_EGG
	iffalse_jumpopenedtext .NoRoomText
	setevent EVENT_GOT_LUCKY_EGG_FROM_PROF_OAKS_AIDE
	jumpthisopenedtext

.ExplainText:
	text "El Huevo Suerte"
	line "ayuda a un #mon"

	para "a ganar más"
	line "experiencia de lo"
	cont "normal."

	para "Puedes usarlo"
	line "para completar"
	cont "la #dex!"
	done

.HiText:
	text "¡Hola! Soy"
	line "ayudante del"
	cont "Prof. Oak."

	para "Si atrapaste 60"
	line "tipos de #mon,"

	para "se supone que debo"
	line "darte un objeto."

	para "Así que, <PLAYER>,"
	line "¿atrapaste al"

	para "menos 60 tipos de"
	line "#mon?"
	done

.HereYouGoText:
	text "A ver… ¡Buen"
	line "trabajo! Has"
	cont "atrapado"

	para ""
	text_decimal wTempDexOwn, 2, 3
	text " tipos"
	line "de #mon."

	para "¡Felicidades!"
	line "¡Aquí tienes!"
	done

.NoRoomText:
	text "¡Ah! Veo que no"
	line "tienes espacio"
	cont "para esto."
	done

BlackthornPokeCenter1FGentlemanText:
	text "En lo profundo de"
	line "la lejana Meseta"
	cont "Añil"

	para "está la Liga"
	line "#mon."

	para "Dicen que los"
	line "mejores"
	cont "entrenadores se"
	cont "reúnen ahí desde"
	cont "todo el país."
	done

BlackthornPokeCenter1FTwinText:
	text "Había un"
	line "movimiento que"
	cont "tenía que"
	cont "enseñarle a mi"
	cont "#mon."

	para "Así que fui al"
	line "Borrador de"
	cont "Movimientos para"
	cont "que olvidara un"
	cont "movimiento MO."
	done
