Route6_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 21, 11, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event 12,  1, ROUTE_6_SAFFRON_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 23, 12, BGEVENT_JUMPTEXT, Route6UndergroundPathSignText
	bg_event  7, 11, BGEVENT_JUMPTEXT, Route6AdvancedTipsSignText

	def_object_events
	object_event 21, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route6PokefanMText, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 10, 26, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerPokefanmRex, -1
	object_event 11, 26, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerPokefanmAllan, -1
	object_event 14, 19, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsDayanddani1, -1
	object_event 15, 19, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsDayanddani2, -1
	object_event 22, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterChaz, -1
	object_event  6, 15, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGuitaristfWanda, -1
	object_event  9,  7, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 1, OfficerfJennyScript, -1
	fruittree_event 17,  3, FRUITTREE_ROUTE_6, STARF_BERRY, PAL_NPC_GREEN

GenericTrainerPokefanmRex:
	generictrainer POKEFANM, REX, EVENT_BEAT_POKEFANM_REX, PokefanmRexSeenText, PokefanmRexBeatenText

	text "¡Mira qué"
	line "adorable actúa mi"
	cont "Phanpy!"

	para "¿No es tan mono"
	line "que derrite"
	cont "corazones?"
	done

PokefanmRexSeenText:
	text "Mi Phanpy es el"
	line "más mono del"
	cont "mundo."
	done

PokefanmRexBeatenText:
	text "¡Mi Phanpy!"
	done

GenericTrainerPokefanmAllan:
	generictrainer POKEFANM, ALLAN, EVENT_BEAT_POKEFANM_ALLAN, PokefanmAllanSeenText, PokefanmAllanBeatenText

	text "¡Mira qué"
	line "adorable actúa mi"
	cont "Teddiursa!"

	para "¿No es tan mono"
	line "que derrite"
	cont "corazones?"
	done

PokefanmAllanSeenText:
	text "Mi Teddiursa es"
	line "el más mono del"
	cont "mundo."
	done

PokefanmAllanBeatenText:
	text "¡Mi Teddiursa!"
	done

GenericTrainerTwinsDayanddani1:
	generictrainer TWINS, DAYANDDANI1, EVENT_BEAT_TWINS_DAY_AND_DANI, TwinsDayanddani1SeenText, TwinsDayanddani1BeatenText

	text "Day: Nos"
	line "venciste…"
	done

TwinsDayanddani1SeenText:
	text "Day: ¿Vas a"
	line "vencernos?"
	done

TwinsDayanddani1BeatenText:
	text "Day: ¡Uaaah!"
	done

GenericTrainerTwinsDayanddani2:
	generictrainer TWINS, DAYANDDANI2, EVENT_BEAT_TWINS_DAY_AND_DANI, TwinsDayanddani2SeenText, TwinsDayanddani2BeatenText

	text "Dani: Parece que"
	line "nos rebotaron."
	done

TwinsDayanddani2SeenText:
	text "Dani: ¡Te"
	line "tumbaremos!"
	done

TwinsDayanddani2BeatenText:
	text "Dani: ¡Eeeeh!"
	done

GenericTrainerYoungsterChaz:
	generictrainer YOUNGSTER, CHAZ, EVENT_BEAT_YOUNGSTER_CHAZ, .SeenText, .BeatenText

	text "Yo y mi bocaza…"
	done

.SeenText:
	text "¿Veo a un"
	line "entrenador"
	cont "fuerte?"

	para "¡No, aquí solo hay"
	line "basura!"
	done

.BeatenText:
	text "La basura era yo…"
	done

GenericTrainerGuitaristfWanda:
	generictrainer GUITARISTF, WANDA, EVENT_BEAT_GUITARISTF_WANDA, .SeenText, .BeatenText

	text "Solo sigue tu"
	line "camino…"
	done

.SeenText:
	text "¡Mejor dispérsate"
	line "y corre!"
	done

.BeatenText:
	text "El combate se"
	line "perdió, no se"
	cont "ganó…"
	done

OfficerfJennyScript:
	checktime 1 << NITE
	iffalse_jumptextfaceplayer .DaytimeText
	checkevent EVENT_BEAT_OFFICERF_JENNY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	special SaveMusic
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer OFFICERF, JENNY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICERF_JENNY
	endtext

.DaytimeText:
	text "Los Oficiales"
	line "estamos aquí para"
	cont "mantener la paz."
	done

.SeenText:
	text "No te reconozco."

	para "¡Escuadrón"
	line "Squirtle, al"
	cont "ataque!"
	done

.BeatenText:
	text "Escuadrón"
	line "Squirtle,"
	cont "retirada…"
	done

.AfterText:
	text "Perdona la"
	line "molestia, chaval."

	para "Me pongo nerviosa"
	line "de noche."
	done

Route6PokefanMText:
	text "La carretera está"
	line "cerrada hasta que"

	para "se resuelva el"
	line "problema de la"
	cont "Central"
	cont "Eléctrica."
	done

Route6UndergroundPathSignText:
	text "Camino"
	line "Subterráneo"

	para "Ciudad Celeste -"
	line "Ciudad Carmín"
	done

Route6AdvancedTipsSignText:
	text "¡Consejo"
	line "avanzado!"

	para "Algunos objetos"
	line "pueden parecer"
	cont "dañinos para el"
	cont "portador, como"

	para "una Bola Hierro o"
	line "una Buf. Elecc."

	para "Pero con el"
	line "movimiento Truco,"

	para "¡el portador puede"
	line "intercambiar su"
	cont "objeto con el"
	cont "rival!"
	done
