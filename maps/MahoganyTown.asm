MahoganyTown_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_MAHOGANYTOWN_TRY_RAGECANDYBAR
	scene_const SCENE_MAHOGANYTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, MahoganyTownFlyPoint

	def_warp_events
	warp_event 11,  7, MAHOGANY_MART_1F, 1
	warp_event 17,  7, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, 1
	warp_event  6, 13, MAHOGANY_GYM, 1
	warp_event 15, 13, MAHOGANY_POKECENTER_1F, 1
	warp_event  9,  1, ROUTE_43_MAHOGANY_GATE, 3

	def_coord_events
	coord_event 19,  8, SCENE_MAHOGANYTOWN_TRY_RAGECANDYBAR, MahoganyTownTryARageCandyBarScript
	coord_event 19,  9, SCENE_MAHOGANYTOWN_TRY_RAGECANDYBAR, MahoganyTownTryARageCandyBarScript

	def_bg_events
	bg_event  1,  5, BGEVENT_JUMPTEXT, MahoganyTownSignText
	bg_event  9,  7, BGEVENT_READ, MahoganyTownSouvenirShopSign
	bg_event  3, 13, BGEVENT_JUMPTEXT, MahoganyGymSignText

	def_object_events
	object_event 19,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyTownPokefanMScript, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	object_event  6,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrampsScript, -1
	object_event  6, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyTownFisherText, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event 12,  8, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyTownLassText, EVENT_MAHOGANY_MART_OWNERS

	object_const_def
	const MAHOGANYTOWN_POKEFAN_M

MahoganyTownFlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	endcallback

MahoganyTownTryARageCandyBarScript:
	showemote EMOTE_SHOCK, MAHOGANYTOWN_POKEFAN_M, 15
	applymovement MAHOGANYTOWN_POKEFAN_M, MahoganyTownRageCandyBarMerchantBlocksYouMovement
	follow PLAYER, MAHOGANYTOWN_POKEFAN_M
	applyonemovement PLAYER, step_left
	stopfollow
	turnobject PLAYER, RIGHT
	scall RageCandyBarMerchantScript
	applymovement MAHOGANYTOWN_POKEFAN_M, MahoganyTownRageCandyBarMerchantReturnsMovement
	end

MahoganyTownPokefanMScript:
	faceplayer
RageCandyBarMerchantScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue_jumptext RageCandyBarMerchantSoldOutText
	opentext
	writetext RageCandyBarMerchantTryOneText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext RageCandyBarMerchantRefusedText
	checkmoney YOUR_MONEY, 300
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem RAGECANDYBAR
	iffalse_jumpopenedtext RageCandyBarMerchantNoRoomText
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 300
	special PlaceMoneyTopRight
	jumpthisopenedtext

	text "¡Bien! ¡Saboréala!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "No tienes"
	line "suficiente dinero."
	done

MahoganyTownGrampsScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue_jumptextfaceplayer MahoganyTownGrampsText_ClearedRocketHideout
	jumpthistextfaceplayer

	text "¿Vas a ver al"
	line "Gyarados"
	cont "enfurecido en el"
	cont "lago?"
	done

MahoganyTownSouvenirShopSign:
	checkevent EVENT_MAHOGANY_MART_OWNERS
	iftrue_jumptext MahoganyTownSouvenirShopSignText1
	jumpthistext

	text "Tienda de"
	line "Recuerdos de la"
	cont "Abuela"
	done

MahoganyTownRageCandyBarMerchantBlocksYouMovement:
	step_right
	step_down
	turn_head_left
	step_end

MahoganyTownRageCandyBarMerchantReturnsMovement:
	step_up
	turn_head_down
	step_end

RageCandyBarMerchantTryOneText:
	text "¡Hola, chaval!"

	para "Veo que eres nuevo"
	line "en Pueblo Caoba."

	para "¡Ya que eres"
	line "nuevo, deberías"
	cont "probar"

if DEF(FAITHFUL)
	cont "una deliciosa"
	cont "RageCandyBar!"
else
	cont "una deliciosa"
	cont "Tarta de Furia!"
endc

	para "Ahora mismo puede"
	line "ser tuya por solo"
	cont "¥300! ¿Quieres"
	cont "una?"
	done

RageCandyBarMerchantRefusedText:
	text "Oh, vale,"
	line "entonces…"
	done

RageCandyBarMerchantNoRoomText:
	text "No tienes sitio"
	line "para esto."
	done

RageCandyBarMerchantSoldOutText:
if DEF(FAITHFUL)
	text "Las RageCandyBar"
	line "se agotaron."
else
	text "Las Tartas de"
	line "Furia se"
	cont "agotaron."
endc

	para "Estoy recogiendo."
	line "No me molestes,"
	cont "chaval."
	done


MahoganyTownGrampsText_ClearedRocketHideout:
	text "Los Magikarp"
	line "volvieron al Lago"
	cont "de la Furia."

	para "Eso debería ser"
	line "buena noticia para"
	cont "los pescadores de"
	cont "ahí."
	done

MahoganyTownFisherText:
	text "Ya que llegaste"
	line "hasta aquí, tómate"

	para "un tiempo para"
	line "hacer turismo."

	para "Deberías ir al"
	line "norte y visitar"

	para "el Lago de la"
	line "Furia ahora mismo."
	done

MahoganyTownLassText:
	text "Visita la tienda"
	line "de la Abuela."
	cont "Vende cosas que"
	cont "nadie más tiene."
	done

MahoganyTownSignText:
	text "Pueblo Caoba"

	para "Bienvenido al"
	line "Hogar del Ninja"
	done

MahoganyTownSouvenirShopSignText1:
	text "Solo una Tienda"
	line "de Recuerdos"

	para "Nada Sospechoso"
	line "en Ella"

	para "No Hay Necesidad"
	line "de Alarmarse"
	done

MahoganyGymSignText:
	text "Pueblo Caoba"
	line "Gimnasio #mon"
	cont "Líder: Pryce"

	para "El Maestro de la"
	line "Dureza del"
	cont "Invierno"
	done
