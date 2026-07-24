RockyBeach_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 25, 20, ROCKY_BEACH_HOUSE, 1
	warp_event 29, 10, NOISY_FOREST, 1
	warp_event 29, 11, NOISY_FOREST, 2

	def_coord_events

	def_bg_events
	bg_event 22, 24, BGEVENT_JUMPTEXT, RockyBeachSign1Text
	bg_event 24, 10, BGEVENT_JUMPTEXT, RockyBeachSign2Text

	def_object_events
	object_event 21, 21, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSightseermBlaise, -1
	object_event 11, 22, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBeautyIoana, -1
	object_event  2, 21, SPRITE_LADY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSightseerfKamila, -1
	object_event 15, 18, SPRITE_AROMA_LADY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerAromaLadyHeather, -1
	object_event 15, 13, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBreederBrenda, -1
	object_event 14,  7, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSwimmermEzra, -1
	object_event 23, 10, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 1, RockyBeachWilhomenaScript, EVENT_NOISY_FOREST_PIKABLU
	itemball_event 21,  5, FULL_HEAL, 1, EVENT_ROCKY_BEACH_FULL_HEAL
	itemball_event 32,  3, PEARL_STRING, 1, EVENT_ROCKY_BEACH_PEARL_STRING
	object_event 20, 32, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, (1 << DAY), PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiIslandFisherText, -1
	object_event 23, 32, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, (1 << DAY), PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiIslandFisherText, -1

RockyBeachSign1Text:
	text "Playa Rocosa"
	done

RockyBeachSign2Text:
	text "Bosque Ruidoso"
	line "próximo"

	para "Hacia las Ruinas"
	line "del Santuario"
	done

GenericTrainerSightseermBlaise:
	generictrainer SIGHTSEERM, BLAISE, EVENT_BEAT_SIGHTSEERM_BLAISE, .SeenText, .BeatenText

	text "Je fais le tour"
	line "du monde avec mon"
	cont "#mon."
	done

.SeenText:
	text "Allons-y!"
	done

.BeatenText:
	text "Sacre bleu!"
	done

GenericTrainerBeautyIoana:
	generictrainer BEAUTY, IOANA, EVENT_BEAT_BEAUTY_IOANA, .SeenText, .BeatenText

	text "Tengo la piel"
	line "pálida por"
	cont "naturaleza,"

	para "así que debo tener"
	line "cuidado con el"
	cont "sol."
	done

.SeenText:
	text "Vengo aquí cada"
	line "año a broncearme."
	done

.BeatenText:
	text "¡Me acabo de"
	line "quemar!"
	done

GenericTrainerSightseerfKamila:
	generictrainer SIGHTSEERF, KAMILA, EVENT_BEAT_SIGHTSEERF_KAMILA, .SeenText, .BeatenText

	text "Alola es un"
	line "archipiélago muy"
	cont "lejos de aquí."

	para "¡Deberías"
	line "visitarlo algún"
	cont "día!"
	done

.SeenText:
	text "¡Alola!"

	para "Así nos saludamos"
	line "en mi región."
	done

.BeatenText:
	text "¡Cheehoo! ¡Eres"
	line "bastante bueno!"
	done

GenericTrainerAromaLadyHeather:
	generictrainer AROMA_LADY, HEATHER, EVENT_BEAT_AROMA_LADY_HEATHER, .SeenText, .BeatenText

	text "Estudié"
	line "arreglos florales"
	cont "con Erika en la"

	para "Universidad de"
	line "Azulona."

	para "Ella elogió esta"
	line "isla por su fauna"
	cont "local."
	done

.SeenText:
	text "Una flor rojo"
	line "intenso crece por"
	cont "toda la isla."

	para "¿Te has fijado?"
	done

.BeatenText:
	text "Un combate"
	line "precioso, ¿Pero"
	cont "qué hay de las"
	cont "flores?"
	done

GenericTrainerBreederBrenda:
	generictrainer BREEDER, BRENDA, EVENT_BEAT_BREEDER_BRENDA, .SeenText, .BeatenText

	text "Para eclosionar un"
	line "Huevo, hay que"
	cont "caminar mucho."

	para "¿Qué mejor lugar"
	line "que la soleada"
	cont "Shamouti?"
	done

.SeenText:
	text "La clave para"
	line "criar buenos"
	cont "#mon"

	para "es un buen"
	line "entorno."

	para "¡No hay lugar"
	line "mejor que este!"
	done

.BeatenText:
	text "Tus #mon están"
	line "bien criados."
	done

GenericTrainerSwimmermEzra:
	generictrainer SWIMMERM, EZRA, EVENT_BEAT_SWIMMERM_EZRA, .SeenText, .BeatenText

	text "Me gusta bucear"
	line "aquí."

	para "¡Es increíble"
	line "poder respirar"
	cont "bajo el agua!"
	done

.SeenText:
	text "¿Alguna vez te has"
	line "preguntado cómo"

	para "es respirar bajo"
	line "el agua?"
	done

.BeatenText:
	text "¡Se me acabó el"
	line "aire!"
	done

RockyBeachWilhomenaScript:
	generictrainer 0, 0, EVENT_TOLD_ABOUT_PIKABLU, .Text1, 0

.Text1
	text "Oh, no. Oh, no…"

	para "Mi pobre Pikablu"
	line "desapareció."

	para "No… No pudo haber"
	line "ido al Bosque"
	cont "Ruidoso."

	para "Nunca lo"
	line "encontraré entre"
	cont "los árboles…"

	para "Oh, ¿Qué debería"
	line "hacer…?"
	done
