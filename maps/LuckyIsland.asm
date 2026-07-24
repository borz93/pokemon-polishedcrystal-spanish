LuckyIsland_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, Script_ChangeLuckyIslandMap

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 33, 18, SPRITE_BALL_CUT_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_ENV_RED, OBJECTTYPE_SCRIPT, 0, LuckyIslandLuckyEgg, EVENT_LUCKY_ISLAND_LUCKY_EGG
	object_event 35,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherHall, EVENT_LUCKY_ISLAND_CIVILIANS
	object_event 27, 16, SPRITE_BAKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBakerMargaret, EVENT_LUCKY_ISLAND_CIVILIANS
	object_event 38, 23, SPRITE_BAKER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBakerOlga, EVENT_LUCKY_ISLAND_CIVILIANS
	object_event 26, 21, SPRITE_ARTIST, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerArtistReina, EVENT_LUCKY_ISLAND_CIVILIANS
	object_event 42, 16, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerArtistAlina, EVENT_LUCKY_ISLAND_CIVILIANS
	object_event 29, 11, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseersLiandsu1, EVENT_LUCKY_ISLAND_CIVILIANS
	object_event 29, 12, SPRITE_LADY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseersLiandsu2, EVENT_LUCKY_ISLAND_CIVILIANS
	fruittree_event 31, 16, FRUITTREE_LUCKY_ISLAND, JABOCA_BERRY, PAL_NPC_ENV_YELLOW, MORN, EVENT_LUCKY_ISLAND_CIVILIANS
	fruittree_event 31, 16, FRUITTREE_LUCKY_ISLAND, ROWAP_BERRY, PAL_NPC_TEAL, DAY, EVENT_LUCKY_ISLAND_CIVILIANS
	fruittree_event 31, 16, FRUITTREE_LUCKY_ISLAND, KEE_BERRY, PAL_NPC_PINK, EVE, EVENT_LUCKY_ISLAND_CIVILIANS
	fruittree_event 31, 16, FRUITTREE_LUCKY_ISLAND, MARANGABERRY, PAL_NPC_BROWN, NITE, EVENT_LUCKY_ISLAND_CIVILIANS
	object_event -3, 15, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1

	object_const_def
	const LUCKYISLAND_POKE_BALL

Script_ChangeLuckyIslandMap:
	special CheckIfTrendyPhraseIsLucky
	iftruefwd .show
	changemapblocks LuckyIslandHidden_BlockData
	setevent EVENT_LUCKY_ISLAND_CIVILIANS
.hide_poke_ball
	setevent EVENT_LUCKY_ISLAND_LUCKY_EGG
	endcallback

.show
	changemapblocks LuckyIsland_BlockData
	clearevent EVENT_LUCKY_ISLAND_CIVILIANS
	checkevent EVENT_GOT_LUCKY_EGG_FROM_LUCKY_ISLAND
	iftrue .hide_poke_ball
	clearevent EVENT_LUCKY_ISLAND_LUCKY_EGG
	endcallback

GenericTrainerFisherHall:
	generictrainer FISHER, HALL, EVENT_BEAT_FISHER_HALL, .SeenText, .BeatenText

	text "Simplemente no"
	line "aprecias mi"
	cont "sentido del humor."
	done

.SeenText:
	text "¡Dopefish vive!"
	done

.BeatenText:
	text "Nada nada hambre,"
	line "¡nada nada"
	cont "hambre!"
	done

GenericTrainerBakerMargaret:
	generictrainer BAKER, MARGARET, EVENT_BEAT_BAKER_MARGARET, .SeenText, .BeatenText

	text "Estoy huevo-"
	line "exhausta."
	done

.SeenText:
	text "Si un huevo rueda"
	line "cuesta abajo,"

	para "¿Se convierte en"
	line "huevo frito?"
	done

.BeatenText:
	text "Supongo que ahora"
	line "soy yo el huevo"
	cont "frito."
	done

GenericTrainerBakerOlga:
	generictrainer BAKER, OLGA, EVENT_BEAT_BAKER_OLGA, .SeenText, .BeatenText

	text "El primer paso"
	line "para vivir sano"

	para "es comer un buen"
	line "desayuno."
	done

.SeenText:
	text "¡Oye, tú!"
	line "¿Comes un buen"
	cont "desayuno todos"
	cont "los días?"
	done

.BeatenText:
	text "¡Vaya! Parece que"
	line "sí."
	done

GenericTrainerArtistReina:
	generictrainer ARTIST, REINA, EVENT_BEAT_ARTIST_REINA, .SeenText, .BeatenText

	text "Añadiré un árbol"
	line "feliz para"
	cont "taparlo."
	done

.SeenText:
	text "¡Esta pradera"
	line "soleada será una"
	cont "pintura preciosa!"
	done

.BeatenText:
	text "¡Se me resbaló el"
	line "pincel!"
	done

GenericTrainerArtistAlina:
	generictrainer ARTIST, ALINA, EVENT_BEAT_ARTIST_ALINA, .SeenText, .BeatenText

	text "Me pregunto qué"
	line "hizo aparecer esta"
	cont "isla."
	done

.SeenText:
	text "Esta isla casi"
	line "nunca aparece."

	para "¡Tuve mucha suerte"
	line "de encontrarla!"
	done

.BeatenText:
	text "Se me acabó la"
	line "suerte…"
	done

GenericTrainerSightseersLiandsu1:
	generictrainer SIGHTSEERS, LIANDSU1, EVENT_BEAT_SIGHTSEERS_LI_AND_SU, .SeenText, .BeatenText

	text "Li: Su y yo"
	line "seguimos"
	cont "discutiendo esto."
	done

.SeenText:
	text "Li: ¿Qué fue"
	line "primero?"

	para "¿El #mon o el"
	line "Huevo?"
	done

.BeatenText:
	text "Li: ¡Yo digo que"
	line "el #mon!"
	done

GenericTrainerSightseersLiandsu2:
	generictrainer SIGHTSEERS, LIANDSU2, EVENT_BEAT_SIGHTSEERS_LI_AND_SU, .SeenText, .BeatenText

	text "Su: ¿Hay algún"
	line "#mon que no"
	cont "venga de Huevos?"
	done

.SeenText:
	text "Su: ¿Qué fue"
	line "primero?"

	para "¿El #mon o el"
	line "Huevo?"
	done

.BeatenText:
	text "Su: ¡Creo que el"
	line "Huevo fue primero!"
	done

LuckyIslandLuckyEgg:
	giveitem LUCKY_EGG
	iffalsefwd .NoRoom
	disappear LUCKYISLAND_POKE_BALL
	setevent EVENT_GOT_LUCKY_EGG_FROM_LUCKY_ISLAND
	opentext
	writetext .Text
	special ShowItemIcon
	playsound SFX_ITEM
	pause 60
	itemnotify
	endtext

.NoRoom:
	opentext
	writetext .Text
	waitbutton
	pocketisfull
	endtext

.Text:
	text "<PLAYER> encontró"
	line "¡un Huevo Suerte!"
	done
