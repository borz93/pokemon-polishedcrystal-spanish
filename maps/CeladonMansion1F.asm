CeladonMansion1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  9, CELADON_CITY, 2
	warp_event  7,  9, CELADON_CITY, 2
	warp_event  3,  0, CELADON_CITY, 3
	warp_event  0,  0, CELADON_MANSION_2F, 1
	warp_event  7,  0, CELADON_MANSION_2F, 4

	def_coord_events

	def_bg_events
	bg_event  5,  8, BGEVENT_UP, CeladonMansionManagersSuiteSign
	bg_event  0,  3, BGEVENT_JUMPSTD, picturebookshelf
	bg_event  2,  3, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansionManagerScript, -1
	pokemon_event  2,  6, MEOWTH, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, CeladonMansion1FMeowthText, -1
	pokemon_event  3,  4, CLEFAIRY, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, CeladonMansion1FClefairyText, -1
	pokemon_event  4,  4, NIDORAN_F, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_TEAL, CeladonMansion1FNidoranFText, -1

CeladonMansionManagersSuiteSign:
	jumpthistext

	text "Suite del"
	line "Encargado"
	done

CeladonMansionManagerScript:
	checkitem MINT_LEAF
	iffalse_jumptextfaceplayer .NoMintLeafText
	faceplayer
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .AcceptedText
	promptbutton
	special Special_MintTeaPickMon
	iffalse_jumpopenedtext .RefusedText
	ifequalfwd $1, .Egg
	writetext .LikedFlavorText
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	iffalse_jumpopenedtext .RefusedText
	writemem wMintTeaLikedFlavor
	writetext .DislikedFlavorText
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	iffalse_jumpopenedtext .RefusedText
	writemem wMintTeaDislikedFlavor
	special Special_MintTeaChangeNature
	iffalsefwd .Neutral
	writetext .TeaIsReadyText
	sjumpfwd .Done
.Neutral
	writetext .NeutralTeaText
.Done
	waitbutton
	closetext
	takeitem MINT_LEAF
	readmem wCurPartySpecies
	pokepic 0
	cry 0
	waitsfx
	closepokepic
	opentext
	writetext .MonLooksDifferentText
	special PlayCurMonCry
	waitbutton
	jumpthisopenedtext

	text "No hay nada como"
	line "el té de menta"
	cont "caliente."

	para "¡Puede cambiar la"
	line "naturaleza misma"
	cont "de un #mon!"
	done

.Egg:
	jumpthisopenedtext

	text "¿Esperas que"
	line "convierta eso en"
	cont "un huevo de té?"
	done

.NoMintLeafText:
	text "Oh, hola,"
	line "querido."

	para "Estoy tomando té"
	line "con mi querido"
	cont "#mon."

	para "Si tuvieras una"
	line "Hoja Menta,"

	para "te invitaría a"
	line "unirte."

	para "A los #mon les"
	line "encanta la menta"
	cont "en su té."

	para "¡Tiene un efecto"
	line "duradero en su"
	cont "propia naturaleza!"
	done

.QuestionText:
	text "Oh, hola,"
	line "querido."

	para "Veo que tienes una"
	line "Hoja Menta."

	para "¿Quieres que la"
	line "prepare en té"

	para "para tu #mon?"
	done

.RefusedText:
	text "¡No te llenes de"
	line "Limonada y"
	cont "Refresco, ahora!"
	done

.AcceptedText:
	text "¿Cuál de tus"
	line "#mon quiere té?"
	done

.LikedFlavorText:
	text "Ahora, ¿Qué sabor"
	line "le gusta a "
	text_ram wStringBuffer1
	cont "?"
	done

.DislikedFlavorText:
	text "¿Y qué sabor le"
	line "disgusta?"
	done

.NeutralTeaText:
	text "Es una preferencia"
	line "poco común, ¡pero"
	cont "puedo prepararlo!"

	para "Una taza para ti,"
	line "y una taza para"
	cont ""
	text_ram wStringBuffer1
	text "!"
	done

.TeaIsReadyText:
	text "¡Vale! Aquí"
	line "tienes tu té."

	para "Una taza para ti,"
	line "y una taza para"
	cont ""
	text_ram wStringBuffer1
	text "!"
	done

.MonLooksDifferentText:
	text_ram wStringBuffer1
	text " se ve"
	line "diferente de algún"
	cont "modo."
	done

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 0, 9, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 5 ; items
	; this order is meaningful to calculate the new nature
	db "Picante@" ; atk
	db "Agrio@" ; def
	db "Dulce@" ; spe
	db "Seco@" ; sat
	db "Amargo@" ; sdf

CeladonMansion1FMeowthText:
	text "Meowth: Meow!"
	done

CeladonMansion1FClefairyText:
	text "Clefairy: Clef"
	line "cleff!"
	done

CeladonMansion1FNidoranFText:
	text "Nidoran: Kya"
	line "kyaoo!"
	done
