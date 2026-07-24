VermilionGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, VermilionGymDoorsScript

	def_warp_events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  5,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  7,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  9,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  1,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  1, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3, 15, BGEVENT_READ, VermilionGymStatue
	bg_event  6, 15, BGEVENT_READ, VermilionGymStatue

	def_object_events
	object_event  4,  5, SPRITE_ELECTRIC_FENCE_LEFT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, VermilionGymElectricFenceText, EVENT_VERMILION_GYM_SWITCH_1
	object_event  5,  5, SPRITE_ELECTRIC_FENCE_RIGHT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, VermilionGymElectricFenceText, EVENT_VERMILION_GYM_SWITCH_1
	object_event  4,  4, SPRITE_ELECTRIC_FENCE_LEFT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, VermilionGymElectricFenceText, EVENT_VERMILION_GYM_SWITCH_2
	object_event  5,  4, SPRITE_ELECTRIC_FENCE_RIGHT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, VermilionGymElectricFenceText, EVENT_VERMILION_GYM_SWITCH_2
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event  8,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGentlemanGregory, -1
	object_event  4,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 3, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGuitaristmVincent, -1
	object_event  0, 10, SPRITE_JUGGLER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerJugglerHorton, -1
	object_event  7, 10, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGuitaristfJanet, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, VermilionGymGuyScript, -1

	object_const_def
	const VERMILIONGYM_FENCE_1_LEFT
	const VERMILIONGYM_FENCE_1_RIGHT
	const VERMILIONGYM_FENCE_2_LEFT
	const VERMILIONGYM_FENCE_2_RIGHT

VermilionGymDoorsScript:
	checkevent EVENT_VERMILION_GYM_SWITCH_2
	iftruefwd .done
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iffalsefwd .resample
	appear VERMILIONGYM_FENCE_1_LEFT
	appear VERMILIONGYM_FENCE_1_RIGHT
.resample
	callasm SampleVermilionGymTrashCans
.done
	endcallback

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftruefwd .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, 0
	loadtrainer LT_SURGE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARISTM_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	setevent EVENT_BEAT_GUITARISTF_JANET
	opentext
	givebadge THUNDERBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM57_WILD_CHARGE
	iftrue_jumpopenedtext LtSurgeFightDoneText
	writetext LtSurgeThunderBadgeText
	promptbutton
	verbosegivetmhm TM_WILD_CHARGE
	setevent EVENT_GOT_TM57_WILD_CHARGE
	jumpthisopenedtext

	text "Ese TM contiene"
	line "Carga Salvaje."

	para "¡Empléalo para ir"
	line "como un rayo!"
	done

GenericTrainerGentlemanGregory:
	generictrainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText

	text "Cuando estaba en"
	line "el ejército, el"

	para "Tte.Surge me salvó"
	line "la vida."
	done

GenericTrainerGuitaristmVincent:
	generictrainer GUITARISTM, VINCENT, EVENT_BEAT_GUITARISTM_VINCENT, GuitaristmVincentSeenText, GuitaristmVincentBeatenText

	text "El Tte.Surge está"
	line "protegido por"

	para "vallas eléctricas"
	line "para que no"
	cont "subestimes su"
	cont "fuerza."
	done

GenericTrainerJugglerHorton:
	generictrainer JUGGLER, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText

	text "No te confíes"
	line "demasiado por"

	para "vencerme… El"
	line "Tte.Surge es duro."
	done

GenericTrainerGuitaristfJanet:
	generictrainer GUITARISTF, JANET, EVENT_BEAT_GUITARISTF_JANET, GuitaristfJanetSeenText, GuitaristfJanetBeatenText

	text "El Tte.Surge"
	line "escondió los dos"

	para "interruptores de"
	line "las vallas"
	cont "eléctricas en la"
	cont "basura."
	done

VermilionGymGuyScript:
	checkevent EVENT_BEAT_LTSURGE
	iftrue_jumptextfaceplayer VermilionGymGuyWinText
	jumpthistextfaceplayer

	text "¡Ey! ¡Futuro"
	line "campeón!"

	para "El Tte.Surge es"
	line "muy cauteloso."

	para "Tiene trampas por"
	line "todo el Gimnasio."

	para "Pero ya se te dan"
	line "bien los"
	cont "rompecabezas de"
	cont "Gimnasio, ¿No?"

	para "No tendrás ningún"
	line "problema en"
	cont "llegar hasta el"
	cont "Tte.Surge."
	done

VermilionGymTrashCanScript:
	checkevent EVENT_VERMILION_GYM_SWITCH_2
	iftruefwd .trash_can
	callasm CheckVermilionGymTrashCan
	iftruefwd .open_lock
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iftruefwd .reset_switches
.trash_can
	jumpstd trashcan

.open_lock
	opentext
	writetext VermilionGymFoundSwitchText
	playsound SFX_PUSH_BUTTON
	promptbutton
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iftruefwd .second_switch
	writetext VermilionGymFoundFirstSwitchText
	playsound SFX_ENTER_DOOR
	disappear VERMILIONGYM_FENCE_1_LEFT
	disappear VERMILIONGYM_FENCE_1_RIGHT
	waitendtext

.second_switch
	writetext VermilionGymFoundSecondSwitchText
	playsound SFX_ENTER_DOOR
	disappear VERMILIONGYM_FENCE_2_LEFT
	disappear VERMILIONGYM_FENCE_2_RIGHT
	waitendtext

.reset_switches
	opentext
	writetext VermilionGymTrashCanText
	promptbutton
	writetext VermilionGymResetSwitchesText
	playsound SFX_WRONG
	waitbutton
	closetext
	callasm SampleVermilionGymTrashCans
	appear VERMILIONGYM_FENCE_1_LEFT
	appear VERMILIONGYM_FENCE_1_RIGHT
	end

VermilionGymStatue:
	gettrainername LT_SURGE, 1, STRING_BUFFER_4
	checkflag ENGINE_THUNDERBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

LtSurgeIntroText:
	text "Surge: ¡Oye,"
	line "renacuajo!"

	para "Tengo que"
	line "reconocerlo. Puede"

	para "que no sea muy"
	line "listo desafiarme,"
	cont "¡pero tienes"
	cont "agallas!"

	para "En cuanto a"
	line "#mon"
	cont "eléctricos, ¡soy"
	cont "el número uno!"

	para "Nunca he perdido"
	line "en el campo de"
	cont "batalla."

	para "¡Te electrocutaré"
	line "igual que hice con"
	cont "mis enemigos en la"
	cont "guerra!"
	done

LtSurgeWinLossText:
	text "Surge: ¡Arrrgh!"
	line "¡Eres fuerte!"

	para "Vale, chaval."
	line "¡Toma la Medalla"
	cont "Trueno!"
	done

LtSurgeThunderBadgeText:
	text "Surge: Considéralo"
	line "prueba de que me"
	cont "derrotaste."

	para "Queda bien en tu"
	line "Tarjeta de"
	cont "Entrenador, ¿Eh?"

	para "Llévala con"
	line "orgullo, ¿Oíste?"

	para "¡Y aquí tienes un"
	line "gran TM!"
	done


LtSurgeFightDoneText:
	text "Surge: ¡Oye,"
	line "chaval! ¿Sigues"
	cont "dándolo todo?"

	para "¡Mis #mon y yo"
	line "seguimos en ello!"
	done

GentlemanGregorySeenText:
	text "¿Vienes a vencer"
	line "al Tte.Surge?"

	para "¡No si puedo"
	line "evitarlo!"
	done

GentlemanGregoryBeatenText:
	text "¡Siento haberle"
	line "fallado, Tte."
	cont "Surge, señor!"
	done

GuitaristmVincentSeenText:
	text "El Tte.Surge"
	line "reconoció mi"
	cont "potencial con"
	cont "#mon"
	cont "eléctricos."

	para "¿Crees que puedes"
	line "vencerme?"
	done

GuitaristmVincentBeatenText:
	text "¡Oh, qué"
	line "impactante!"
	done

JugglerHortonSeenText:
	text "¡Voy a vencerte!"
	line "¡Prepárate para"
	cont "la sacudida!"
	done

JugglerHortonBeatenText:
	text "¡Gwaaah!"
	line "Me superaron…"
	done

GuitaristfJanetSeenText:
	text "Soy ligera, ¡pero"
	line "se me da bien la"
	cont "electricidad!"
	done

GuitaristfJanetBeatenText:
	text "¡Frita!"
	done


VermilionGymGuyWinText:
	text "¡Uf! ¡Vaya combate"
	line "electrizante!"

	para "La verdad es que"
	line "me puso nervioso."
	done

VermilionGymFoundSwitchText:
	text "¿Un interruptor"
	line "secreto bajo la"
	cont "basura?"

	para "Mejor pulsarlo."
	done

VermilionGymFoundFirstSwitchText:
	text "¡La primera valla"
	line "eléctrica se"
	cont "desbloqueó!"
	done

VermilionGymFoundSecondSwitchText:
	text "¡La segunda valla"
	line "eléctrica se"

	para "desbloqueó! ¡El"
	line "camino está"
	cont "libre!"
	done

VermilionGymResetSwitchesText:
	text "Oh no, ¡la valla"
	line "eléctrica se"
	cont "bloqueó de nuevo!"
	done

VermilionGymTrashCanText:
	text "¡Nada! Aquí no hay"
	line "más que basura."
	done

VermilionGymElectricFenceText:
	text "¡Una valla"
	line "eléctrica! ¡No la"
	cont "toques!"
	done

SampleVermilionGymTrashCans:
	ldh a, [rWBK]
	push af
	ld a, BANK(wVermilionGymTrashCan1)
	ldh [rWBK], a
.loop
	call Random
	ld e, a
	swap e
	and $f
	jr z, .loop
	dec a
	ld [wVermilionGymTrashCan1], a
	call .GetSecondTrashCan
	ld [wVermilionGymTrashCan2], a
	pop af
	ldh [rWBK], a
	ret

.GetSecondTrashCan:
	ld hl, .AdjacencyTable
	add a
	add a
	ld c, a
	ld a, e
	and %11
	add c
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ret

.AdjacencyTable:
	; left, right, up, down
	db  1,  1,  5,  5 ;  0 ( 1, 7)
	db  0,  2,  6,  6 ;  1 ( 3, 7)
	db  1,  3,  7,  7 ;  2 ( 5, 7)
	db  2,  4,  8,  8 ;  3 ( 7, 7)
	db  3,  3,  9,  9 ;  4 ( 9, 7)
	db  6,  6,  0, 10 ;  5 ( 1, 9)
	db  5,  7,  1, 11 ;  6 ( 3, 9)
	db  6,  8,  2, 12 ;  7 ( 5, 9)
	db  7,  9,  3, 13 ;  8 ( 7, 9)
	db  8,  8,  4, 14 ;  9 ( 9, 9)
	db 11, 11,  5,  5 ; 10 ( 1,11)
	db 10, 12,  6,  6 ; 11 ( 3,11)
	db 11, 13,  7,  7 ; 12 ( 5,11)
	db 12, 14,  8,  8 ; 13 ( 7,11)
	db 13, 13,  9,  9 ; 14 ( 9,11)

CheckVermilionGymTrashCan:
	ldh a, [rWBK]
	push af
	ld a, BANK(wVermilionGymTrashCan1)
	ldh [rWBK], a
	eventflagcheck EVENT_VERMILION_GYM_SWITCH_1
	jr z, .first
	ld a, [wVermilionGymTrashCan2]
	call .CheckTrashCan
	ld a, TRUE
	jr z, .done
	dec a ; FALSE
.done
	ldh [hScriptVar], a
	pop af
	ldh [rWBK], a
	ret

.first:
	ld a, [wVermilionGymTrashCan1]
	call .CheckTrashCan
	jr z, .yes
	ld a, [wVermilionGymTrashCan2]
	call .CheckTrashCan
	ld a, FALSE ; no-optimize a = 0
	jr nz, .done
	ld a, [wVermilionGymTrashCan1]
	ld [wVermilionGymTrashCan2], a
.yes
	ld a, TRUE
	jr .done

.CheckTrashCan:
	ld c, a
	call GetFacingTileCoord
	call .ConvertCoordsToTrashCan
	cp c
	ret

.ConvertCoordsToTrashCan:
	ld a, d
	sub 5
	srl a
	ld d, a
	ld a, e
	sub 11
	srl a
	ld e, a
	add a
	add a
	add e
	add d
	ret
