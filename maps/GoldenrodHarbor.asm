GoldenrodHarbor_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 31, 16, GOLDENROD_HARBOR_GATE, 1
	warp_event 31, 17, GOLDENROD_HARBOR_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 29, 19, BGEVENT_JUMPTEXT, GoldenrodHarborSignText
	bg_event 20, 19, BGEVENT_JUMPTEXT, GoldenrodHarborAdvancedTipsSignText
	bg_event 28, 15, BGEVENT_JUMPTEXT, GoldenrodHarborCrateSignText
	bg_event 22, 21, BGEVENT_ITEM + REVIVE, EVENT_GOLDENROD_HARBOR_HIDDEN_REVIVE

	def_object_events
	object_event 17,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHarborFisherScript, -1
	object_event 13,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherPaton, -1
	itemball_event 13,  3, STAR_PIECE, 1, EVENT_GOLDENROD_HARBOR_STAR_PIECE
	object_event 27, 15, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_ADVENTURER, MART_GOLDENROD_HARBOR, -1
	object_event 22, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHarborPokefanmScript, -1
	object_event 21, 15, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, MAGIKARP, -1, PAL_MON_ORANGE, OBJECTTYPE_SCRIPT, PLAIN_FORM, GoldenrodHarborMagikarpScript, -1
	object_event 16, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHarborYoungsterScript, -1
	object_event 16, 20, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, trade, NPC_TRADE_JACQUES, -1
	object_event 40, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	object_event  6, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_DARK_GREEN, OBJECTTYPE_TRAINER, 5, TrainerSwimmerfKatie, -1
	object_event 23, 28, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermJames, -1
	object_event 23, 19, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodHarborLass2Text, -1
	object_event  6, 26, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT_SILENT, 0, GoldenrodHarborSailboatScript, -1
	object_event  6, 26, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_BOTTOM, 0, 0, -1, 0, OBJECTTYPE_SCRIPT_SILENT, 0, GoldenrodHarborSailboatScript, -1

GoldenrodHarborFisherScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_HYPER_VOICE_INTRO
	iftruefwd GoldenrodHarborTutorHyperVoiceScript
	writetext GoldenrodHarborFisherText
	waitbutton
	setevent EVENT_LISTENED_TO_HYPER_VOICE_INTRO
GoldenrodHarborTutorHyperVoiceScript:
	writetext Text_GoldenrodHarborTutorHyperVoice
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_GoldenrodHarborTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval HYPER_VOICE
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Vale, entonces."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "¡No tienes una"
	line "Hoja Plateada!"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Tu #mon ya"
	line "sabe usar Voz"
	cont "Cautivadora!"
	done

GenericTrainerFisherPaton:
	generictrainer FISHER, PATON, EVENT_BEAT_FISHER_PATON, FisherPatonSeenText, FisherPatonBeatenText

	text "¿Estás trabajando"
	line "en una #dex?"
	cont "¡Qué bien!"
	done

TrainerSwimmerfKatie:
	trainer SWIMMERF, KATIE, EVENT_BEAT_SWIMMERF_KATIE, SwimmerfKatieSeenText, SwimmerfKatieBeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERF

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "¿Por qué el mar es"
	line "azul?"

	para "Oí que refleja el"
	line "cielo…"

	para "¿Pero entonces por"
	line "qué el cielo es"
	cont "azul?"
	done

GenericTrainerSwimmermJames:
	generictrainer SWIMMERM, JAMES, EVENT_BEAT_SWIMMERM_JAMES, SwimmermJamesSeenText, SwimmermJamesBeatenText

	text "¿Un Nadador no"
	line "puede usar un"
	cont "bote a veces?"
	done


GoldenrodHarborMagikarpScript:
	jumpthistext

	text "¡Es un #mon"
	line "pez! ¿Eh?"

	para "Es solo un"
	line "muñeco…"
	done

GoldenrodHarborPokefanmScript:
	faceplayer
	opentext
	writetext GoldenrodHarborDollVendorText
	special PlaceMoneyTopRight
.Start:
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .MagikarpDoll
	ifequalfwd $2, .MarillDoll
	ifequalfwd $3, .OctilleryDoll
	endtext

.MagikarpDoll:
	checkmoney YOUR_MONEY, 1400
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_MAGIKARP_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 1400
	setevent EVENT_DECO_MAGIKARP_DOLL
	writetext GoldenrodHarborMagikarpDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborMagikarpDollSentText
	waitbutton
	sjump .Start

.MarillDoll:
	checkmoney YOUR_MONEY, 5600
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_MARILL_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 5600
	setevent EVENT_DECO_MARILL_DOLL
	writetext GoldenrodHarborMarillDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborMarillDollSentText
	waitbutton
	sjump .Start

.OctilleryDoll:
	checkmoney YOUR_MONEY, 11200
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_OCTILLERY_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 11200
	setevent EVENT_DECO_OCTILLERY_DOLL
	writetext GoldenrodHarborOctilleryDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborOctilleryDollSentText
	waitbutton
	sjump .Start

.NotEnoughMoney:
	writetext GoldenrodHarborNoMoneyText
	waitbutton
	sjump .Start

.AlreadyBought:
	writetext GoldenrodHarborAlreadyBoughtText
	waitbutton
	sjump .Start

.MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 19, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Magikarp    ¥1400@"
	db "Marill      ¥5600@"
	db "Octillery  ¥11200@"
	db "Salir@"

GoldenrodHarborYoungsterScript:
	faceplayer
	opentext
	writetext GoldenrodHarborPlantVendorText
	special PlaceMoneyTopRight
.Start:
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .MagnaPlant
	ifequalfwd $2, .TropicPlant
	ifequalfwd $3, .JumboPlant
	endtext

.MagnaPlant:
	checkmoney YOUR_MONEY, 6400
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_1
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 6400
	setevent EVENT_DECO_PLANT_1
	writetext GoldenrodHarborMagnaPlantText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborMagnaPlantSentText
	waitbutton
	sjump .Start

.TropicPlant:
	checkmoney YOUR_MONEY, 9600
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_2
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 9600
	setevent EVENT_DECO_PLANT_2
	writetext GoldenrodHarborTropicPlantText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborTropicPlantSentText
	waitbutton
	sjump .Start

.JumboPlant:
	checkmoney YOUR_MONEY, 12800
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_3
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 12800
	setevent EVENT_DECO_PLANT_3
	writetext GoldenrodHarborJumboPlantText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborJumboPlantSentText
	waitbutton
	sjump .Start

.NotEnoughMoney:
	writetext GoldenrodHarborNoMoneyText
	waitbutton
	sjump .Start

.AlreadyBought:
	writetext GoldenrodHarborAlreadyBoughtText
	waitbutton
	sjump .Start

.MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 19, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Magna       ¥6400@"
	db "Tropical    ¥9600@"
	db "Gigante    ¥12800@"
	db "Salir@"

GoldenrodHarborSailboatScript:
	readvar VAR_FACING
	ifnotequal DOWN, .show_text
	end
.show_text
	playsound SFX_READ_TEXT_2
	waitsfx
	jumpthistext

	text "Es un velero"
	line "llamado SeaKing."
	done

GoldenrodHarborFisherText:
	text "Si pescas, tienes"
	line "que estar"

	para "callado para no"
	line "asustar a los"
	cont "#mon."

	para "Pero para que te"
	line "oigan sobre las"

	para "olas, ¡tienes que"
	line "hablar FUERTE!"
	done

Text_GoldenrodHarborTutorHyperVoice:
	text "Puedo enseñarle a"
	line "tu #mon a usar"

	para "Vozarrón"
	line "por una Hoja"
	cont "Plateada."
	done


Text_GoldenrodHarborTutorQuestion:
	text "¿Le enseño"
	line "Vozarrón a tu"
	cont "#mon?"
	done



FisherPatonSeenText:
	text "¡El pez que"
	line "atrapé venía"
	cont "pegado a otro"
	cont "#mon!"
	done

FisherPatonBeatenText:
	text "¿No son"
	line "interesantes los"
	cont "#mon?"
	done

SwimmerfKatieSeenText:
	text "¡Nadar en el"
	line "profundo mar azul"
	cont "se siente"
	cont "maravilloso!"
	done

SwimmerfKatieBeatenText:
	text "Perdí…"
	line "Ahora me siento"
	cont "triste…"
	done

SwimmermJamesSeenText:
	text "¡Sé nadar, pero"
	line "también sé remar!"
	done

SwimmermJamesBeatenText:
	text "Quizás no sepa"
	line "combatir…"
	done

GoldenrodHarborDollVendorText:
	text "¡Bienvenido! Tengo"
	line "adorables muñecos"
	cont "acuáticos a la"
	cont "venta."
	done

GoldenrodHarborMagikarpDollText:
	text "<PLAYER> compró"
	line "un Muñeco"
	cont "Magikarp."
	done

GoldenrodHarborMagikarpDollSentText:
	text "El Muñeco"
	line "Magikarp se envió"
	cont "a casa."
	done

GoldenrodHarborMarillDollText:
	text "<PLAYER> compró"
	line "un Muñeco Marill."
	done

GoldenrodHarborMarillDollSentText:
	text "El Muñeco Marill"
	line "se envió a casa."
	done

GoldenrodHarborOctilleryDollText:
	text "<PLAYER> compró"
	line "un Muñeco"
	cont "Octillery."
	done

GoldenrodHarborOctilleryDollSentText:
	text "El Muñeco"
	line "Octillery se envió"
	cont "a casa."
	done

GoldenrodHarborNoMoneyText:
	text "¡No puedes pagar"
	line "eso!"
	done

GoldenrodHarborAlreadyBoughtText:
	text "¡Ya tienes eso!"
	done

GoldenrodHarborPlantVendorText:
	text "¡Bienvenido! Tengo"
	line "una selección de"

	para "plantas exóticas"
	line "para decorar tu"
	cont "casa."
	done

GoldenrodHarborMagnaPlantText:
	text "<PLAYER> compró"
	line "una Planta Magna."
	done

GoldenrodHarborMagnaPlantSentText:
	text "La Planta Magna"
	line "se envió a casa."
	done

GoldenrodHarborTropicPlantText:
	text "<PLAYER> compró"
	line "una Planta"
	cont "Tropical."
	done

GoldenrodHarborTropicPlantSentText:
	text "La Planta Tropical"
	line "se envió a casa."
	done

GoldenrodHarborJumboPlantText:
	text "<PLAYER> compró"
	line "una Planta"
	cont "Gigante."
	done

GoldenrodHarborJumboPlantSentText:
	text "La Planta Gigante"
	line "se envió a casa."
	done

GoldenrodHarborLass2Text:
	text "Toda esta agua,"
	line "es totalmente…"

	para "gluglú, gluglú,"
	line "chof-chof."

	para "¿No crees?"
	done

GoldenrodHarborSignText:
	text "Puerto Trigal"
	done

GoldenrodHarborAdvancedTipsSignText:
	text "¡Consejos"
	line "avanzados!"

	para "¡A veces tendrás"
	line "suerte con una"

	para "máquina"
	line "expendedora y"
	cont "conseguirás dos"

	para "bebidas por el"
	line "precio de una!"
	done

GoldenrodHarborCrateSignText:
	text "¡Un cajón lleno de"
	line "objetos raros!"
	done
