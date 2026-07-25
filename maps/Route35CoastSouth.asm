Route35CoastSouth_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 35, 14, BGEVENT_ITEM + STAR_PIECE, EVENT_ROUTE_35_COAST_SOUTH_HIDDEN_STAR_PIECE

	def_object_events
	object_event 26,  7, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSwimmermWalter, -1
	object_event 24, 23, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfLisa, -1
	object_event 13, 18, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfJill, -1
	object_event 35, 12, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperBryan, -1
	object_event 39, 16, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrBeaandmay1, -1
	object_event 39, 17, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrBeaandmay2, -1
	object_event 16, 10, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSailorHarvey, -1
	object_event 38,  6, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerLassRose, -1
	object_event 33,  6, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_ITEMBALL, PLAYEREVENT_ITEMBALL, BIG_PEARL, 1, EVENT_ROUTE_35_COAST_SOUTH_BIG_PEARL
	object_event  6, 15, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, PAL_NPC_ENV_GREEN, OBJECTTYPE_ITEMBALL, PLAYEREVENT_KEYITEMBALL, GO_GOGGLES, EVENT_OLIVINE_PORT_GO_GOGGLES
	itemball_event 13, 31, STAR_PIECE, 1, EVENT_GOLDENROD_HARBOR_STAR_PIECE
	object_event 17, 31, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1

GenericTrainerSwimmermWalter:
	generictrainer SWIMMERM, WALTER, EVENT_BEAT_SWIMMERM_WALTER, SwimmermWalterSeenText, SwimmermWalterBeatenText

	text "El sol se refleja"
	line "en el agua"

	para "¡Y aun así me"
	line "quemé!"
	done

GenericTrainerSwimmerfLisa:
	generictrainer SWIMMERF, LISA, EVENT_BEAT_SWIMMERF_LISA, SwimmerfLisaSeenText, SwimmerfLisaBeatenText

	text "Hay sitio de"
	line "sobra en el mar"

	para "para pescar y"
	line "combatir."
	done

GenericTrainerSwimmerfJill:
	generictrainer SWIMMERF, JILL, EVENT_BEAT_SWIMMERF_JILL, SwimmerfJillSeenText, SwimmerfJillBeatenText

	text "Olvidaré mi"
	line "derrota nadando."
	done

GenericTrainerBird_keeperBryan:
	generictrainer BIRD_KEEPER, BRYAN, EVENT_BEAT_BIRD_KEEPER_BRYAN, Bird_keeperBryanSeenText, Bird_keeperBryanBeatenText

	text "Algunos #mon"
	line "huyen enseguida."

	para "Intenta atraparlos"
	line "con la Veloz Ball"
	cont "de Kurt."

	para "Cuando encuentro"
	line "un Bonguri Blanco,"
	cont "se la llevo a"
	cont "Kurt."

	para "Él lo convierte en"
	line "una Ball"
	cont "personalizada."
	done

GenericTrainerSrandjrBeaandmay1:
	generictrainer SR_AND_JR, BEAANDMAY1, EVENT_BEAT_SR_AND_JR_BEA_AND_MAY, SrandjrBeaandmay1SeenText, SrandjrBeaandmay1BeatenText

	text "Bea: Le enseñaré"
	line "a May a hacerse"
	cont "más fuerte."
	done

GenericTrainerSrandjrBeaandmay2:
	generictrainer SR_AND_JR, BEAANDMAY2, EVENT_BEAT_SR_AND_JR_BEA_AND_MAY, SrandjrBeaandmay2SeenText, SrandjrBeaandmay2BeatenText

	text "May: Le pediré a"
	line "Bea cómo hacerme"
	cont "más fuerte."
	done

GenericTrainerSailorHarvey:
	generictrainer SAILOR, HARVEY, EVENT_BEAT_SAILOR_HARVEY, SailorHarveySeenText, SailorHarveyBeatenText

	text "En el mar, lo"
	line "único en lo que"

	para "¡puedes confiar es"
	line "en ti mismo!"

	para "¡Estoy muy"
	line "orgulloso de mi"
	cont "cuerpazo!"
	done

GenericTrainerLassRose:
	generictrainer LASS, ROSE, EVENT_BEAT_LASS_ROSE, LassRoseSeenText, LassRoseBeatenText

	text "¡Heriste a mis"
	line "pobres #mon"
	cont "mundanos!"

	para "¡Exijo que los"
	line "cures en un"
	cont "Centro #mon!"
	done

SwimmermWalterSeenText:
	text "Olvidé ponerme"
	line "protector solar,"

	para "así que me"
	line "escondo junto a"
	cont "estas rocas con"
	cont "sombra."
	done

SwimmermWalterBeatenText:
	text "¡Ay!"
	done

SwimmerfLisaSeenText:
	text "Los pescadores me"
	line "gritaron por"
	cont "molestarlos…"
	done

SwimmerfLisaBeatenText:
	text "Solo quería"
	line "combatir…"
	done

SwimmerfJillSeenText:
	text "¿No me veo bien"
	line "en este bikini?"
	done

SwimmerfJillBeatenText:
	text "¡Já!"
	done

Bird_keeperBryanSeenText:
	text "¿Qué tipo de Ball"
	line "usas?"
	done

Bird_keeperBryanBeatenText:
	text "¡Vaya! ¡No fui"
	line "bastante rápido!"
	done

SrandjrBeaandmay1SeenText:
	text "Bea: Prefiero los"
	line "#mon fuertes"

	para "antes que los"
	line "monos."

	para "¡Pero juntas"
	line "tenemos #mon"
	cont "monos y fuertes!"
	done

SrandjrBeaandmay1BeatenText:
	text "Bea: ¡La fuerza y"
	line "lo mono no"
	cont "bastaron!"
	done

SrandjrBeaandmay2SeenText:
	text "May: Prefiero los"
	line "#mon monos"

	para "antes que los"
	line "fuertes."

	para "¡Pero juntas"
	line "tenemos #mon"
	cont "fuertes y monos!"
	done

SrandjrBeaandmay2BeatenText:
	text "May: ¡Lo mono y la"
	line "fuerza no"
	cont "bastaron!"
	done

SailorHarveySeenText:
	text "¡Já! ¡Tus #mon"
	line "parecen"
	cont "livianos!"
	done

SailorHarveyBeatenText:
	text "¡Qué poder!"
	line "¿Qué tal si"

	para "navegas los mares"
	line "conmigo?"
	done

LassRoseSeenText:
	text "¡Reuní estos"
	line "#mon de todo el"
	cont "mundo!"
	done

LassRoseBeatenText:
	text "¡Oh, no!"
	line "¡Recorrí el mundo"
	cont "por ellos!"
	done
