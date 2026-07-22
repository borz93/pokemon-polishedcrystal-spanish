Route39Barn_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  7, ROUTE_39, 1
	warp_event  7,  7, ROUTE_39, 4

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_ITEM + MOOMOO_MILK, EVENT_MOOMOO_FARM_HIDDEN_MOOMOO_MILK
	bg_event  0,  1, BGEVENT_JUMPTEXT, Route39BarnBucketText
	bg_event  5,  1, BGEVENT_JUMPTEXT, Route39BarnBucketText
	bg_event 10,  1, BGEVENT_JUMPTEXT, Route39BarnBucketText

	def_object_events
	object_event  6,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MILTANK, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, NO_FORM, MooMoo, -1
	object_event  5,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route39BarnTwin1Script, -1
	object_event  7,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route39BarnTwin2Script, -1
	pokemon_event  2,  2, MILTANK, SPRITEMOVEDATA_POKEMON, (1 << EVE) | (1 << NITE), PAL_MON_PINK, MoomooHappyMooText, -1
	pokemon_event 11,  2, MILTANK, SPRITEMOVEDATA_POKEMON, (1 << EVE) | (1 << NITE), PAL_MON_AZURE, MoomooHappyMooText, -1

	object_const_def
	const ROUTE39BARN_MOOMOO

Route39BarnTwin1Script:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftruefwd .FeedingMooMoo
	writetext Text_MoomooIsSick
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end

.FeedingMooMoo:
	writetext Text_WereFeedingMoomoo
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end

Route39BarnTwin2Script:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftruefwd .FeedingMooMoo
	writetext Text_MoomooIsSick
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.FeedingMooMoo:
	writetext Text_WereFeedingMoomoo
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

MooMoo:
	checkevent EVENT_HEALED_MOOMOO
	iftruefwd .HappyCow
	opentext
	writetext Text_WeakMoo
	setmonval MILTANK
	special PlaySlowCry
	promptbutton
	writetext Text_ItsCryIsWeak
	checkevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	iftruefwd .GiveBerry
	waitendtext

.GiveBerry:
	promptbutton
	writetext Text_AskGiveBerry
	yesorno
	iffalse_jumpopenedtext Text_RefusedToGiveBerry
	checkitem ORAN_BERRY
	iffalsefwd .MaybeSitrusBerry
	takeitem ORAN_BERRY
	readmem wMooMooBerries
	addval 1
	writemem wMooMooBerries
	ifequalfwd 3, .ThreeOranBerries
	ifequalfwd 5, .FiveOranBerries
	ifequalfwd 7, .SevenOranBerries
	jumpopenedtext Text_GaveOranBerry

.MaybeSitrusBerry:
	checkitem SITRUS_BERRY
	iffalse_jumpopenedtext Text_NoBerries
	takeitem SITRUS_BERRY
	readmem wMooMooBerries
	addval 2
	writemem wMooMooBerries
	ifgreater 6, .SevenSitrusBerries
	ifgreater 4, .FiveSitrusBerries
	ifgreater 2, .ThreeSitrusBerries
	jumpopenedtext Text_GaveSitrusBerry

.ThreeOranBerries:
	writetext Text_GaveOranBerry
	promptbutton
	jumpopenedtext Text_LittleHealthier

.FiveOranBerries:
	writetext Text_GaveOranBerry
	promptbutton
	jumpopenedtext Text_QuiteHealthy

.SevenOranBerries:
	writetext Text_GaveOranBerry
	waitbutton
	closetext
	pause 15
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	pause 15
	showcrytext MoomooHappyMooText, MILTANK
	showemote EMOTE_HAPPY, ROUTE39BARN_MOOMOO, 15
	setevent EVENT_HEALED_MOOMOO
	jumptext Text_TotallyHealthy

.ThreeSitrusBerries:
	writetext Text_GaveSitrusBerry
	promptbutton
	jumpopenedtext Text_LittleHealthier

.FiveSitrusBerries:
	writetext Text_GaveSitrusBerry
	promptbutton
	jumpopenedtext Text_QuiteHealthy

.SevenSitrusBerries:
	playmusic MUSIC_HEAL
	writetext Text_GaveSitrusBerry
	pause 60
	promptbutton
	special RestartMapMusic
	setevent EVENT_HEALED_MOOMOO
	jumpopenedtext Text_TotallyHealthy

.HappyCow:
	showcrytext MoomooHappyMooText, MILTANK
	end

Text_MoomooIsSick:
	text "Mu-mú está"
	line "enferma…"

	para "Necesita muchas"
	line "Bayas sanas."
	done

Text_WereFeedingMoomoo:
	text "¡Estamos"
	line "alimentando a"
	cont "Mu-mú!"
	done

Text_WeakMoo:
	text "Miltank: …Muu…"
	done

Text_ItsCryIsWeak:
	text "Su grito es"
	line "débil…"
	done

MoomooHappyMooText:
	text "Miltank: ¡Muuu!"
	done

Text_AskGiveBerry:
	text "¿Dar una Baya"
	line "Aranja o Zidra a"
	cont "Miltank?"
	done

Text_GaveOranBerry:
	text "<PLAYER> dio una"
	line "Baya Aranja a"
	cont "Miltank."
	done

Text_GaveSitrusBerry:
	text "<PLAYER> dio una"
	line "Baya Zidra a"
	cont "Miltank."
	done

Text_LittleHealthier:
	text "¡Miltank se puso"
	line "un poco más sana!"
	done

Text_QuiteHealthy:
	text "¡Miltank se puso"
	line "bastante sana!"
	done

Text_TotallyHealthy:
	text "¡Miltank se puso"
	line "totalmente sana!"
	done

Text_NoBerries:
	text "<PLAYER> no tiene"
	line "Baya Aranja ni"
	cont "Baya Zidra…"
	done

Text_RefusedToGiveBerry:
	text "<PLAYER> no quiso"
	line "dar una Baya."

	para "Miltank se ve"
	line "triste."
	done

Route39BarnBucketText:
	text "Es un balde."
	done
