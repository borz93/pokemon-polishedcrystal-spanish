HauntedRadioTower6F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  2, HAUNTED_RADIO_TOWER_5F, 2

	def_coord_events

	def_bg_events
	bg_event  9,  2, BGEVENT_JUMPTEXT, HauntedRadioTower6FShrineText

	def_object_events
	object_event  8, 14, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, MAROWAK, -1, PAL_MON_BROWN, OBJECTTYPE_SCRIPT, NO_FORM, HauntedRadioTower6FMarowakScript, EVENT_EXORCISED_LAV_RADIO_TOWER

	object_const_def
	const HAUNTEDRADIOTOWER6F_MAROWAK

HauntedRadioTower6FMarowakScript:
	checkevent EVENT_HAUNTED_RADIO_TOWER_DIARY_1
	iffalse_jumptextfaceplayer HauntedRadioTower6FNotReadyText
	checkevent EVENT_HAUNTED_RADIO_TOWER_DIARY_2
	iffalse_jumptextfaceplayer HauntedRadioTower6FNotReadyText
	checkevent EVENT_HAUNTED_RADIO_TOWER_DIARY_3
	iffalse_jumptextfaceplayer HauntedRadioTower6FNotReadyText
	faceplayer
	checkkeyitem SILPHSCOPE2
	iftruefwd .Revealed
	checkevent EVENT_HAUNTED_RADIO_TOWER_MET_SHADOW
	iftrue_jumptextfaceplayer HauntedRadioTower6FStillAPresenceText
	setevent EVENT_HAUNTED_RADIO_TOWER_MET_SHADOW
	jumptextfaceplayer HauntedRadioTower6FShadowFleesText

.Revealed:
	opentext
	writetext HauntedRadioTower6FRevealedText
	waitbutton
	closetext
	cry MAROWAK
	loadwildmon MAROWAK, 56
	loadvar VAR_BATTLETYPE, BATTLETYPE_GHOST
	startbattle
	ifequalfwd DRAW, .Fled
	reloadmapafterbattle
	special CheckPartyNotFull
	iffalsefwd .Resolve
	special CheckBattleCaughtResult
	iffalsefwd .Resolve
	special MarkLastCaughtPartymonShiny
	opentext
	writetext HauntedRadioTower6FShinyRevealText
	waitbutton
	closetext
	sjumpfwd .Resolve

.Fled:
	reloadmapafterbattle
	end

.Resolve:
	setflag ENGINE_EXORCISED_LAV_RADIO_TOWER
	setevent EVENT_EXORCISED_LAV_RADIO_TOWER
	clearevent EVENT_LAV_RADIO_TOWER_POPULATION
	disappear HAUNTEDRADIOTOWER6F_MAROWAK
	end

HauntedRadioTower6FNotReadyText:
	text "Sientes que aún"
	line "faltan piezas de"
	cont "esta historia."
	done

HauntedRadioTower6FShadowFleesText:
	text "Una sombra"
	line "gigantesca se"
	cont "abalanza sobre"
	cont "ti…"

	para "…y desaparece"
	line "antes de que"
	cont "puedas verla bien."
	done

HauntedRadioTower6FStillAPresenceText:
	text "Sientes una"
	line "presencia fuerte,"
	cont "pero no logras"
	cont "verla."
	done

HauntedRadioTower6FRevealedText:
	text "A través de la"
	line "Silph Scope 2, la"

	para "sombra se revela"
	line "por fin: es un"
	cont "Marowak."
	done

HauntedRadioTower6FShinyRevealText:
	text "El rencor que la"
	line "consumía parece"

	para "haber teñido sus"
	line "huesos de un"
	cont "color extraño."
	done

HauntedRadioTower6FShrineText:
	text "Un pequeño"
	line "altar improvisado,"
	cont "con huesos"
	cont "pulidos."

	para "Alguien vino aquí"
	line "a rezar, hace"
	cont "mucho tiempo."
	done
