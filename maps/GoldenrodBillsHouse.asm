GoldenrodBillsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BillsGrandpa, -1
	object_event  5,  3, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BillsMom, -1
	object_event  5,  4, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSister, -1

BillsGrandpa:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue_jumptextfaceplayer BillsGrandpaComeAgainText
	checkevent EVENT_GOT_SHINY_STONE_FROM_BILLS_GRANDPA
	iftrue_jumptextfaceplayer BillsGrandpaShownAllThePokemonText
	faceplayer
	opentext
	checkevent EVENT_MET_BILLS_GRANDPA
	iftruefwd .MetGrandpa
	writetext BillsGrandpaIntroText
	promptbutton
	setevent EVENT_MET_BILLS_GRANDPA
.MetGrandpa:
	checkevent EVENT_SHOWED_TOGEPI_TO_BILLS_GRANDPA
	iftrue .ShowedTogepi
	checkevent EVENT_SHOWED_MURKROW_TO_BILLS_GRANDPA
	iftrue .ShowedMurkrow
	checkevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	iftrue .ShowedOddish
	checkevent EVENT_SHOWED_JIGGLYPUFF_TO_BILLS_GRANDPA
	iftrue .ShowedJigglypuff
	checkevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	iftrue .ShowedPichu
	checkevent EVENT_SHOWED_GROWLITHE_TO_BILLS_GRANDPA
	iftrue .ShowedGrowlithe
	checkevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	iftrue .ShowedStaryu
	checkevent EVENT_SHOWED_BELLSPROUT_TO_BILLS_GRANDPA
	iftrue .ShowedBellsprout
	checkevent EVENT_SHOWED_SNUBBULL_TO_BILLS_GRANDPA
	iftrue .ShowedSnubbull
	writetext BillsGrandpaSnubbullText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal SNUBBULL, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_SNUBBULL_TO_BILLS_GRANDPA
	sjumpfwd .ShowedSnubbull

.GotEverstone:
	writetext BillsGrandpaBellsproutText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal BELLSPROUT, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_BELLSPROUT_TO_BILLS_GRANDPA
	sjumpfwd .ShowedBellsprout

.GotLeafStone:
	writetext BillsGrandpaStaryuText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal STARYU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	sjumpfwd .ShowedStaryu

.GotWaterStone:
	writetext BillsGrandpaGrowlitheText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal GROWLITHE, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_GROWLITHE_TO_BILLS_GRANDPA
	sjumpfwd .ShowedGrowlithe

.GotFireStone:
	writetext BillsGrandpaPichuText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal PICHU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	sjumpfwd .ShowedPichu

.GotThunderstone:
	writetext BillsGrandpaJigglypuffText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal JIGGLYPUFF, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_JIGGLYPUFF_TO_BILLS_GRANDPA
	sjumpfwd .ShowedJigglypuff

.GotMoonStone:
	writetext BillsGrandpaOddishText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal ODDISH, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	sjumpfwd .ShowedOddish

.GotSunStone:
	writetext BillsGrandpaMurkrowText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal MURKROW, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_MURKROW_TO_BILLS_GRANDPA
	sjumpfwd .ShowedMurkrow

.GotDuskStone:
	writetext BillsGrandpaTogepiText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal TOGEPI, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_TOGEPI_TO_BILLS_GRANDPA
	sjumpfwd .ShowedTogepi

.ShowedSnubbull:
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotEverstone
	scall .ReceiveItem
	verbosegiveitem EVERSTONE
	iffalse_endtext
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedBellsprout:
	checkevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	iftrue .GotLeafStone
	scall .ReceiveItem
	verbosegiveitem LEAF_STONE
	iffalse_endtext
	setevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedStaryu:
	checkevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	iftrue .GotWaterStone
	scall .ReceiveItem
	verbosegiveitem WATER_STONE
	iffalse_endtext
	setevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedGrowlithe:
	checkevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	iftrue .GotFireStone
	scall .ReceiveItem
	verbosegiveitem FIRE_STONE
	iffalse_endtext
	setevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedPichu:
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotThunderstone
	scall .ReceiveItem
	verbosegiveitem THUNDERSTONE
	iffalse_endtext
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedJigglypuff:
	checkevent EVENT_GOT_MOON_STONE_FROM_BILLS_GRANDPA
	iftrue .GotMoonStone
	scall .ReceiveItem
	verbosegiveitem MOON_STONE
	iffalse_endtext
	setevent EVENT_GOT_MOON_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedOddish:
	checkevent EVENT_GOT_SUN_STONE_FROM_BILLS_GRANDPA
	iftrue .GotSunStone
	scall .ReceiveItem
	verbosegiveitem SUN_STONE
	iffalse_endtext
	setevent EVENT_GOT_SUN_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedMurkrow:
	checkevent EVENT_GOT_DUSK_STONE_FROM_BILLS_GRANDPA
	iftrue .GotDuskStone
	scall .ReceiveItem
	verbosegiveitem DUSK_STONE
	iffalse_endtext
	setevent EVENT_GOT_DUSK_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedTogepi:
	scall .ReceiveItem
	verbosegiveitem SHINY_STONE
	iffalse_endtext
	setevent EVENT_GOT_SHINY_STONE_FROM_BILLS_GRANDPA
	endtext

.ExcitedToSee:
	writetext BillsGrandpaExcitedToSeeText
	promptbutton
	end

.CorrectPokemon:
	writetext BillsGrandpaShownPokemonText
	promptbutton
	end

.ReceiveItem:
	writetext BillsGrandpaTokenOfAppreciationText
	promptbutton
	end

.WrongPokemon:
	jumpthisopenedtext

	text "¿Hm?"

	para "Ese no es el"
	line "#mon del que me"
	cont "hablaron."
	done

BillsMom:
	checkevent EVENT_NEVER_MET_BILL
	iffalse_jumptextfaceplayer BillsMomText_AfterEcruteak
	jumpthistextfaceplayer

	text "Oh, ¿coleccionas"
	line "#mon? Mi hijo"
	cont "Bill es un"
	cont "experto."

	para "Le acaban de"
	line "llamar al Centro"

	para "#mon de Ciudad"
	line "Iris."

	para "Mi marido se fue"
	line "a la Sala de"

	para "Juegos sin que le"
	line "llamaran…"
	done

BillsSister:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftruefwd .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequalfwd $1, .NoRoom
	ifequalfwd $2, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
.GotBillsNumber:
	jumpthisopenedtext

	text "Mi hermano mayor"
	line "Bill creó el"

	para "sistema de"
	line "almacenamiento"
	cont "#mon de la PC."
	done

.NoRoom:
	writetext BillsSisterPhoneFullText
	promptbutton
.Refused:
	jumpthisopenedtext

	text "Mi hermano creó el"
	line "sistema de"

	para "almacenamiento"
	line "#mon de la PC."

	para "Te iba a dar el"
	line "número de Bill…"
	done

BillsGrandpaIntroText:
	text "¿Hm? ¿Conoces a"
	line "Bill? Es mi nieto."

	para "Está en Kanto."
	line "Hace algo con"

	para "ordenadores, así"
	line "que cuido su"
	cont "casa."
	done

BillsGrandpaAskToSeeMonText:
	text "Si tienes ese"
	line "#mon, ¿me lo"
	cont "enseñas, por"
	cont "favor?"
	done

BillsGrandpaExcitedToSeeText:
	text "¿Me lo vas a"
	line "enseñar? ¡Qué"
	cont "amable!"
	done

BillsGrandpaYouDontHaveItTextText:
	text "¿No lo tienes?"
	line "Qué pena…"
	done

BillsGrandpaShownPokemonText:
	text "Ah, ¿así que ese"
	line "es "
	text_ram wStringBuffer3
	text "?"

	para "¡Qué mono!"
	line "Qué amable de tu"
	cont "parte."
	done

BillsGrandpaTokenOfAppreciationText:
	text "¡Gracias!"

	para "Esto es una"
	line "muestra de mi"
	cont "agradecimiento."
	done

BillsGrandpaComeAgainText:
	text "Vuelve a visitarme"
	line "algún día."
	done

BillsGrandpaShownAllThePokemonText:
	text "Gracias por"
	line "enseñarme tantos"
	cont "#mon monos."

	para "Lo disfruté"
	line "mucho. Me alegra"

	para "haber vivido una"
	line "vida tan larga."
	done

BillsGrandpaSnubbullText:
	text "Mi nieto Bill me"
	line "habló de un"

	para "#mon canino"
	line "rosa y bajito con"
	cont "lunares azules."
	done

BillsGrandpaTogepiText:
	text "¿Conoces un"
	line "#mon con un"

	para "caparazón cubierto"
	line "de triángulos"
	cont "rojos y azules?"

	para "Se supone que es"
	line "un símbolo de"
	cont "buena suerte."
	done

BillsGrandpaMurkrowText:
	text "¿Conoces un"
	line "#mon pájaro con"

	para "un pico amarillo"
	line "torcido y plumas"
	cont "negras?"

	para "Oí que aparece de"
	line "noche."

	para "Me gustaría"
	line "mucho verlo."
	done

BillsGrandpaOddishText:
	text "Ah, mi nieto"
	line "mencionó un"

	para "#mon azul y"
	line "redondo con hojas"
	cont "en la cabeza."
	done

BillsGrandpaJigglypuffText:
	text "Bill me habló de"
	line "un #mon rosa"

	para "con una voz"
	line "hipnótica al"
	cont "cantar."
	done

BillsGrandpaBellsproutText:
	text "Mi nieto Bill"
	line "mencionó un"

	para "#mon verde que"
	line "camina sobre sus"
	cont "raíces."
	done

BillsGrandpaStaryuText:
	text "¿Conoces un"
	line "#mon marino con"

	para "una esfera roja en"
	line "el cuerpo?"

	para "Ya sabes, el que"
	line "tiene forma de"
	cont "estrella."

	para "Oí que aparece de"
	line "noche."

	para "Me encantaría"
	line "verlo."
	done

BillsGrandpaGrowlitheText:
	text "Bill me habló de"
	line "un #mon muy"
	cont "leal a su"
	cont "entrenador."

	para "Se supone que"
	line "ruge muy bien."
	done

BillsGrandpaPichuText:
	text "¿Conoces ese"
	line "#mon tan"
	cont "popular?"

	para "El #mon de"
	line "cuerpo amarillo y"
	cont "mejillas rojas."

	para "Me encantaría ver"
	line "cómo es antes de"

	para "que evolucione."
	done


BillsMomText_AfterEcruteak:
	text "Mi marido fue"
	line "conocido antes"
	cont "como #Maniac."

	para "Bill debió salir"
	line "a su padre."

	para "Pero ahora mi"
	line "marido no"

	para "trabaja. Solo"
	line "vagabundea todo"
	cont "el día."
	done

BillsSisterUsefulNumberText:
	text "¿Eres entrenador?"

	para "Tengo un número"
	line "de teléfono útil"
	cont "para ti."
	done

RecordedBillsNumberText:
	text "<PLAYER> registró"
	line "el número de"
	cont "Bill."
	done

BillsSisterPhoneFullText:
	text "No puedes"
	line "registrar más"
	cont "números."
	done
