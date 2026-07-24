SECTION "_FruitBearingTreeText", ROMX
_FruitBearingTreeText::
	text "Es un árbol"
	line "frutal."
	done

SECTION "_HeyItsFruitText", ROMX
_HeyItsFruitText::
	text "¡Mira, es"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_ObtainedOneFruitText", ROMX
_ObtainedOneFruitText::
	text "¡Obtienes"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_ObtainedTwoFruitText", ROMX
_ObtainedTwoFruitText::
	text "¡Obtienes dos"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_ObtainedThreeFruitText", ROMX
_ObtainedThreeFruitText::
	text "¡Obtienes tres"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_FruitPackIsFullText", ROMX
_FruitPackIsFullText::
	text "Pero el bolso"
	line "está lleno…"
	done

SECTION "_NoApricornBoxText", ROMX
_NoApricornBoxText::
	text "Pero no hay dónde"
	line "guardarlo…"
	done

SECTION "_ApricornBoxIsFullText", ROMX
_ApricornBoxIsFullText::
	text "La Caja"
	line "Bonguri está"
	cont "llena…"
	done

SECTION "_PutAwayTheApricornText", ROMX
_PutAwayTheApricornText::
	text "<PLAYER> guardó"
	line ""
	text_ram wStringBuffer3
	text " en"
	cont "la Caja"
	cont "Bonguri."
	done

SECTION "_NothingHereText", ROMX
_NothingHereText::
	text "No hay nada"
	line "aquí…"
	done

SECTION "_WantToUseMulchText", ROMX
_WantToUseMulchText::
	text "¿Quieres usar"
	line "Abono?"
	done

SECTION "_UsedMulchText", ROMX
_UsedMulchText::
	text "¡<PLAYER> usó"
	line "Abono!"

	para "¡El árbol se"
	line "fertilizó!"
	done

SECTION "_WhichApricornText", ROMX
_WhichApricornText::
	text "¿Qué Bonguri"
	line "debo usar?"
	done

SECTION "_HowManyShouldIMakeText", ROMX
_HowManyShouldIMakeText::
	text "¿Cuántos debo"
	line "hacer?"
	done

SECTION "_HowManyDoYouWantToSellText", ROMX
_HowManyDoYouWantToSellText::
	text "¿Cuántos quieres"
	line "vender?"
	done

SECTION "_RecoveredSomeHPText", ROMX
_RecoveredSomeHPText::
	text_ram wStringBuffer1
	line "recuperó "
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text "PS!"
	done

SECTION "_CuredOfPoisonText", ROMX
_CuredOfPoisonText::
	text_ram wStringBuffer1
	line "se curó del"
	cont "envenenamiento."
	done

SECTION "_RidOfParalysisText", ROMX
_RidOfParalysisText::
	text_ram wStringBuffer1
	line "se curó de la"
	cont "parálisis."
	done

SECTION "_BurnWasHealedText", ROMX
_BurnWasHealedText::
	text_ram wStringBuffer1
	line "se curó de la"
	cont "quemadura."
	done

SECTION "_WasDefrostedText", ROMX
_WasDefrostedText::
	text_ram wStringBuffer1
	line "se descongeló."
	done

SECTION "_WokeUpText", ROMX
_WokeUpText::
	text_ram wStringBuffer1
	line "se despertó."
	done

SECTION "_HealthReturnedText", ROMX
_HealthReturnedText::
	text_ram wStringBuffer1
	line "recuperó la"
	cont "salud."
	done

SECTION "_RevitalizedText", ROMX
_RevitalizedText::
	text_ram wStringBuffer1
	line "se revitalizó."
	done

SECTION "_GrewToLevelText", ROMX
_GrewToLevelText::
	text_ram wStringBuffer1
	text " subió a"
	line "nivel "
	text_decimal wCurPartyLevel, 1, 3
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_promptbutton
	text_end

SECTION "_CameToItsSensesText", ROMX
_CameToItsSensesText::
	text_ram wStringBuffer1
	line "se curó de la"
	cont "confusión."
	done

SECTION "_OakTimeWokeUpText", ROMX
_OakTimeWokeUpText::
	text "………………………………"
	line "………………………………"

	para "Zzz… ¿Eh? ¿Qué…?"
	line "¡Me despertaste!"

	para "¿Puedes mirar la"
	line "hora por mí?"
	prompt

SECTION "_OakTimeWhatTimeIsItText", ROMX
_OakTimeWhatTimeIsItText::
	text "¿Qué hora es?"
	done

SECTION "_OakTimeHowManyMinutesText", ROMX
_OakTimeHowManyMinutesText::
	text "¿Cuántos minutos?"
	done

SECTION "_OakTimeWhoaText", ROMX
_OakTimeWhoaText::
	text "¡Vaya!"
	done

SECTION "_OakTimeQuestionMarkText", ROMX
_OakTimeQuestionMarkText::
	text "?"
	done

SECTION "_OakTimeOversleptText", ROMX
_OakTimeOversleptText::
	text "!"
	line "¡Me quedé dormido!"
	done

SECTION "_OakTimeYikesText", ROMX
_OakTimeYikesText::
	text "!"
	line "¡Vaya! ¡Me quedé"
	cont "dormido!"
	done

SECTION "ProfElmNappedText", ROMX
ProfElmNappedText::
	text "!"
	line "¡Dormí demasiado"
	cont "tiempo!"
	done

SECTION "_OakTimeSoDarkText", ROMX
_OakTimeSoDarkText::
	text "!"
	line "¡Con razón está"
	cont "tan oscuro!"
	done

SECTION "_OakTimeWhatDayIsItText", ROMX
_OakTimeWhatDayIsItText::
	text "¿Qué día es hoy?"
	done

SECTION "_OakTimeIsItText", ROMX
_OakTimeIsItText::
	text ", ¿Verdad?"
	done

SECTION "_NothingToChooseText", ROMX
_NothingToChooseText::
	text "No hay nada que"
	line "elegir."
	prompt

SECTION "_WhichSidePutOnText", ROMX
_WhichSidePutOnText::
	text "¿En qué lado"
	line "quieres ponerlo?"
	done

SECTION "_WhichSidePutAwayText", ROMX
_WhichSidePutAwayText::
	text "¿De qué lado"
	line "quieres quitarlo?"
	done

SECTION "_PutAwayTheDecoText", ROMX
_PutAwayTheDecoText::
	text "Vas a guardar:"
	line ""
	text_ram wStringBuffer3
	text "."
	prompt

SECTION "_NothingToPutAwayText", ROMX
_NothingToPutAwayText::
	text "No hay nada que"
	line "guardar."
	prompt

SECTION "_SetUpTheDecoText", ROMX
_SetUpTheDecoText::
	text "Vas a colocar:"
	line ""
	text_ram wStringBuffer3
	text "."
	prompt

SECTION "_PutAwayAndSetUpText", ROMX
_PutAwayAndSetUpText::
	text "Vas a guardar:"
	line ""
	text_ram wStringBuffer3

	para "y a colocar:"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt

SECTION "_AlreadySetUpText", ROMX
_AlreadySetUpText::
	text "Eso ya está"
	line "colocado."
	prompt

SECTION "_LookTownMapText", ROMX
_LookTownMapText::
	text "Es el Mapa."
	done

SECTION "_LookPikachuPosterText", ROMX
_LookPikachuPosterText::
	text "Un póster de un"
	line "Pikachu adorable."
	done

SECTION "_LookClefairyPosterText", ROMX
_LookClefairyPosterText::
	text "Un póster de un"
	line "Clefairy adorable."
	done

SECTION "_LookJigglypuffPosterText", ROMX
_LookJigglypuffPosterText::
	text "Un póster de un"
	line "Marill adorable."
	done

SECTION "_LookAdorableDecoText", ROMX
_LookAdorableDecoText::
	text "Es una monada:"
	line ""
	text_ram wStringBuffer3
	text "."
	done

SECTION "DecoConsoleText", ROMX
DecoConsoleText::
	text "Reluce mucho:"
	line ""
	text_ram wStringBuffer3
	text "."
	done

SECTION "_LookGiantDecoText", ROMX
_LookGiantDecoText::
	text "¡Muñeco gigante!"
	line "Es mullido y"
	cont "adorable."
	done

SECTION "_MomHiHowAreYouText", ROMX
_MomHiHowAreYouText::
	text "¡Hola, <PLAYER>!"
	line "¿Cómo estás?"
	prompt

SECTION "_MomFoundAnItemText", ROMX
_MomFoundAnItemText::
	text "Encontré algo útil"
	line "de compras, así"
	prompt

SECTION "_MomBoughtWithYourMoneyText", ROMX
_MomBoughtWithYourMoneyText::
	text "Lo compré con tu"
	line "dinero. ¡Perdón!"
	prompt

SECTION "_MomItsInPCText", ROMX
_MomItsInPCText::
	text "Está en tu PC."
	line "¡Te va a gustar!"
	done

SECTION "_MomFoundADollText", ROMX
_MomFoundADollText::
	text "De compras, vi"
	line "este muñeco tan"
	cont "adorable, así que"
	prompt

SECTION "_MomItsInYourRoomText", ROMX
_MomItsInYourRoomText::
	text "Está en tu cuarto."
	line "¡Te encantará!"
	done

SECTION "_MonWasSentToText", ROMX
_MonWasSentToText::
	text_ram wPlayerTrademonSpeciesName
	text " fue"
	line "enviado a "
	text_ram wOTTrademonSenderName
	text "."
	done

SECTION "_BidsFarewellToMonText", ROMX
_BidsFarewellToMonText::
	text_ram wOTTrademonSenderName
	text " se despide"
	line "de "
	done

SECTION "_MonNameBidsFarewellText", ROMX
_MonNameBidsFarewellText::
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_TakeGoodCareOfMonText", ROMX
_TakeGoodCareOfMonText::
	text "Cuida bien de"
	line ""
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_ForYourMonSendsText", ROMX
_ForYourMonSendsText::
	text "El "
	text_ram wPlayerTrademonSpeciesName
	line "de "
	text_ram wPlayerTrademonSenderName
	text ","
	done

SECTION "_OTSendsText", ROMX
_OTSendsText::
	text_ram wOTTrademonSenderName
	text " envía a"
	line ""
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_WillTradeText", ROMX
_WillTradeText::
	text_ram wOTTrademonSenderName
	text " va a"
	line "dar a "
	text_ram wOTTrademonSpeciesName
	text_end

SECTION "_ForYourMonWillTradeText", ROMX
_ForYourMonWillTradeText::
	text "a cambio de"
	line ""
	text_ram wPlayerTrademonSpeciesName
	text " de"
	cont ""
	text_ram wPlayerTrademonSenderName
	text "."
	done

; Oak's Pokémon Talk

SECTION "_OPT_IntroText1", ROMX
_OPT_IntroText1::
	line "Rosa: ¡El Show"
	done

SECTION "_OPT_IntroText2", ROMX
_OPT_IntroText2::
	line "#mon del Prof."
	done

SECTION "_OPT_IntroText3", ROMX
_OPT_IntroText3::
	line "Oak! ¡Con Rosa!"
	done

SECTION "_OPT_OakText1", ROMX
_OPT_OakText1::
	line "Oak: "
	text_ram wMonOrItemNameBuffer
	done

SECTION "_OPT_OakText2", ROMX
_OPT_OakText2::
	line "se puede ver por"
	done

SECTION "_OPT_OakText3", ROMX
_OPT_OakText3::
	line ""
	text_ram wStringBuffer1
	text "."
	done

SECTION "_OPT_MaryText1", ROMX
_OPT_MaryText1::
	line "Rosa: "
	text_ram wStringBuffer1
	text ","
	done

SECTION "OPT_SweetAdorably", ROMX
OPT_SweetAdorably::
	line "de forma dulce y"
	done

SECTION "OPT_WigglySlickly", ROMX
OPT_WigglySlickly::
	line "vibrante y suave"
	done

SECTION "OPT_AptlyNamed", ROMX
OPT_AptlyNamed::
	line "muy bien llamado y"
	done

SECTION "OPT_UndeniablyKindOf", ROMX
OPT_UndeniablyKindOf::
	line "sin duda, algo"
	done

SECTION "OPT_Unbearably", ROMX
OPT_Unbearably::
	line "insoportablemente"
	done

SECTION "OPT_WowImpressively", ROMX
OPT_WowImpressively::
	line "vaya, qué"
	done

SECTION "OPT_AlmostPoisonously", ROMX
OPT_AlmostPoisonously::
	line "casi venenosamente"
	done

SECTION "OPT_Sensually", ROMX
OPT_Sensually::
	line "tan sensualmente"
	done

SECTION "OPT_Mischievously", ROMX
OPT_Mischievously::
	line "tan traviesamente"
	done

SECTION "OPT_Topically", ROMX
OPT_Topically::
	line "muy tópicamente"
	done

SECTION "OPT_Addictively", ROMX
OPT_Addictively::
	line "de forma adictiva"
	done

SECTION "OPT_LooksInWater", ROMX
OPT_LooksInWater::
	line "se ve en el agua"
	done

SECTION "OPT_EvolutionMustBe", ROMX
OPT_EvolutionMustBe::
	line "su evolución será"
	done

SECTION "OPT_Provocatively", ROMX
OPT_Provocatively::
	line "muy provocativo"
	done

SECTION "OPT_FlippedOut", ROMX
OPT_FlippedOut::
	line "tan fuera de sí y"
	done

SECTION "OPT_HeartMeltingly", ROMX
OPT_HeartMeltingly::
	line "enternecedoramente"
	done

SECTION "OPT_Cute", ROMX
OPT_Cute::
	line "adorable."
	done

SECTION "OPT_Weird", ROMX
OPT_Weird::
	line "raro."
	done

SECTION "OPT_Pleasant", ROMX
OPT_Pleasant::
	line "agradable."
	done

SECTION "OPT_BoldSortOf", ROMX
OPT_BoldSortOf::
	line "algo audaz."
	done

SECTION "OPT_Frightening", ROMX
OPT_Frightening::
	line "aterrador."
	done

SECTION "OPT_SuaveDebonair", ROMX
OPT_SuaveDebonair::
	line "¡Suave y elegante!"
	done

SECTION "OPT_Powerful", ROMX
OPT_Powerful::
	line "poderoso."
	done

SECTION "OPT_Exciting", ROMX
OPT_Exciting::
	line "emocionante."
	done

SECTION "OPT_Groovy", ROMX
OPT_Groovy::
	line "¡Genial!"
	done

SECTION "OPT_Inspiring", ROMX
OPT_Inspiring::
	line "inspirador."
	done

SECTION "OPT_Friendly", ROMX
OPT_Friendly::
	line "amigable."
	done

SECTION "OPT_HotHotHot", ROMX
OPT_HotHotHot::
	line "¡Fuego, fuego!"
	done

SECTION "OPT_Stimulating", ROMX
OPT_Stimulating::
	line "estimulante."
	done

SECTION "OPT_Guarded", ROMX
OPT_Guarded::
	line "reservado."
	done

SECTION "OPT_Lovely", ROMX
OPT_Lovely::
	line "encantador."
	done

SECTION "OPT_Speedy", ROMX
OPT_Speedy::
	line "veloz."
	done

SECTION "_OPT_PokemonChannelText", ROMX
_OPT_PokemonChannelText::
	text "#mon"
	done

; Pokémon Music Channel / Pokémusic

SECTION "_BenIntroText1", ROMX
_BenIntroText1::
	line "Nardo: ¡El Canal"
	done

SECTION "_BenIntroText2", ROMX
_BenIntroText2::
	line "de Música #mon!"
	done

SECTION "_BenIntroText3", ROMX
_BenIntroText3::
	line "¡Soy yo, DJ Nardo!"
	done

SECTION "_FernIntroText1", ROMX
_FernIntroText1::
	line "Floro: #music!"
	done

SECTION "_FernIntroText2", ROMX
_FernIntroText2::
	line "¡Con DJ Floro!"
	done

SECTION "_BenFernText1", ROMX
_BenFernText1::
	line "Hoy es "
	text_today
	text ","
	done

SECTION "_BenFernText2A", ROMX
_BenFernText2A::
	line "¡Vamos a bailar"
	done

SECTION "_BenFernText2B", ROMX
_BenFernText2B::
	line "vamos a relajarnos"
	done

SECTION "_BenFernText3A", ROMX
_BenFernText3A::
	line "la Marcha #mon!"
	done

SECTION "_BenFernText3B", ROMX
_BenFernText3B::
	line "la Nana #mon!"
	done

; Lucky Channel

SECTION "_LC_Text1", ROMX
_LC_Text1::
	line "Salva: ¡Yija!"
	done

SECTION "_LC_Text2", ROMX
_LC_Text2::
	line "¿Cómo os va ahora?"
	done

SECTION "_LC_Text3", ROMX
_LC_Text3::
	line "Ya estéis animados"
	done

SECTION "_LC_Text4", ROMX
_LC_Text4::
	line "o desanimados,"
	done

SECTION "_LC_Text5", ROMX
_LC_Text5::
	line "¡No os perdáis el"
	done

SECTION "_LC_Text6", ROMX
_LC_Text6::
	line "No. de la Suerte!"
	done

SECTION "_LC_Text7", ROMX
_LC_Text7::
	line "El número de esta"
	done

SECTION "_LC_Text8", ROMX
_LC_Text8::
	line "semana es "
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

SECTION "_LC_Text9", ROMX
_LC_Text9::
	line "¡Lo repetiré!"
	done

SECTION "_LC_Text10", ROMX
_LC_Text10::
	line "¡Si coincide, ve a"
	done

SECTION "_LC_Text11", ROMX
_LC_Text11::
	line "la Torre Radio!"
	done

SECTION "_LC_DragText1", ROMX
_LC_DragText1::
	line "…Repetirme tanto"
	done

SECTION "_LC_DragText2", ROMX
_LC_DragText2::
	line "es un rollo…"
	done

; Places and People

SECTION "_PnP_Text1", ROMX
_PnP_Text1::
	line "¡Gente y Lugares!"
	done

SECTION "_PnP_Text2", ROMX
_PnP_Text2::
	line "Presentado por"
	done

SECTION "_PnP_Text3", ROMX
_PnP_Text3::
	line "mí, DJ Lila!"
	done

SECTION "_PnP_Text4", ROMX
_PnP_Text4::
	line ""
	text_ram wStringBuffer2
	text " "
	text_ram wStringBuffer1
	done

SECTION "_PnP_cute", ROMX
_PnP_cute::
	line "es adorable."
	done

SECTION "_PnP_lazy", ROMX
_PnP_lazy::
	line "es algo vago."
	done

SECTION "_PnP_happy", ROMX
_PnP_happy::
	line "siempre es feliz."
	done

SECTION "_PnP_noisy", ROMX
_PnP_noisy::
	line "es muy ruidoso."
	done

SECTION "_PnP_precocious", ROMX
_PnP_precocious::
	line "es inigualable."
	done

SECTION "_PnP_bold", ROMX
_PnP_bold::
	line "es algo audaz."
	done

SECTION "_PnP_picky", ROMX
_PnP_picky::
	line "es muy exigente!"
	done

SECTION "_PnP_sortofok", ROMX
_PnP_sortofok::
	line "está más o menos."
	done

SECTION "_PnP_soso", ROMX
_PnP_soso::
	line "es del montón."
	done

SECTION "_PnP_great", ROMX
_PnP_great::
	line "es genial."
	done

SECTION "_PnP_mytype", ROMX
_PnP_mytype::
	line "es mi tipo."
	done

SECTION "_PnP_cool", ROMX
_PnP_cool::
	line "es tan guay, ¿No?"
	done

SECTION "_PnP_inspiring", ROMX
_PnP_inspiring::
	line "es inspirador!"
	done

SECTION "_PnP_weird", ROMX
_PnP_weird::
	line "es algo raro."
	done

SECTION "_PnP_rightforme", ROMX
_PnP_rightforme::
	line "encaja conmigo"
	done

SECTION "_PnP_odd", ROMX
_PnP_odd::
	line "es raro de verdad!"
	done

SECTION "_PnP_Text5", ROMX
_PnP_Text5::
	line ""
	text_ram wStringBuffer1
	done

SECTION "_RocketRadioText1", ROMX
_RocketRadioText1::
	line "¡Ejem…, somos"
	done

SECTION "_RocketRadioText2", ROMX
_RocketRadioText2::
	line "Team Rocket!"
	done

SECTION "_RocketRadioText3", ROMX
_RocketRadioText3::
	line "Tras tres años"
	done

SECTION "_RocketRadioText4", ROMX
_RocketRadioText4::
	line "de preparativos,"
	done

SECTION "_RocketRadioText5", ROMX
_RocketRadioText5::
	line "¡Hemos resurgido"
	done

SECTION "_RocketRadioText6", ROMX
_RocketRadioText6::
	line "de las cenizas!"
	done

SECTION "_RocketRadioText7", ROMX
_RocketRadioText7::
	line "¡Giovanni! "
	text_pause
	text "¿Nos"
	done

SECTION "_RocketRadioText8", ROMX
_RocketRadioText8::
	line "oyes?"
	text_pause
	text " ¡Lo logramos!"
	done

SECTION "_RocketRadioText9", ROMX
_RocketRadioText9::
	line ""
	text_pause
	text "¿Y nuestro jefe?"
	done

SECTION "_RocketRadioText10", ROMX
_RocketRadioText10::
	line ""
	text_pause
	text "¿Nos oirá?"
	done

SECTION "_BuenaRadioText1", ROMX
_BuenaRadioText1::
	line "Buena: ¡Soy yo!"
	done

SECTION "_BuenaRadioText2", ROMX
_BuenaRadioText2::
	line "¡El código de hoy!"
	done

SECTION "_BuenaRadioText3", ROMX
_BuenaRadioText3::
	line "A ver… ¡Es"
	done

SECTION "_BuenaRadioText4", ROMX
_BuenaRadioText4::
	line ""
	text_ram wStringBuffer1
	text "!"
	done

SECTION "_BuenaRadioText5", ROMX
_BuenaRadioText5::
	line "¡No lo olvidéis!"
	done

SECTION "_BuenaRadioText6", ROMX
_BuenaRadioText6::
	line "Estoy en la Torre"
	done

SECTION "_BuenaRadioText7", ROMX
_BuenaRadioText7::
	line "Radio de Trigal!"
	done

SECTION "_BuenaRadioMidnightText1", ROMX
_BuenaRadioMidnightText1::
	line "Buena: Oh…"
	done

SECTION "_BuenaRadioMidnightText2", ROMX
_BuenaRadioMidnightText2::
	line "¡Es medianoche!"
	done

SECTION "_BuenaRadioMidnightText3", ROMX
_BuenaRadioMidnightText3::
	line "¡Debo acabar!"
	done

SECTION "_BuenaRadioMidnightText4", ROMX
_BuenaRadioMidnightText4::
	line "Gracias por"
	done

SECTION "_BuenaRadioMidnightText5", ROMX
_BuenaRadioMidnightText5::
	line "escuchar hasta el"
	done

SECTION "_BuenaRadioMidnightText6", ROMX
_BuenaRadioMidnightText6::
	line "final. ¡Pero no os"
	done

SECTION "_BuenaRadioMidnightText7", ROMX
_BuenaRadioMidnightText7::
	line "quedéis hasta muy"
	done

SECTION "_BuenaRadioMidnightText8", ROMX
_BuenaRadioMidnightText8::
	line "¡Habla DJ Buena!"
	done

SECTION "_BuenaRadioMidnightText9", ROMX
_BuenaRadioMidnightText9::
	text "¡Me despido!"
	done

SECTION "_BuenaRadioMidnightText10", ROMX
_BuenaRadioMidnightText10::
	text "…"
	done

SECTION "_BuenaOffTheAirText", ROMX
_BuenaOffTheAirText::
	line ""
	done

SECTION "Text_EnemyUsed", ROMX
Text_EnemyUsed::
	text "<ENEMY>"
	line "¡Usó "
	text_ram wMonOrItemNameBuffer
	text "!"
	prompt

SECTION "Text_EnemyUsedOn", ROMX
Text_EnemyUsedOn::
	text "<ENEMY>"
	line "¡Usó "
	text_ram wMonOrItemNameBuffer
	cont "en "
	text_ram wEnemyMonNickname
	text "!"
	prompt

SECTION "_AskFloorElevatorText", ROMX
_AskFloorElevatorText::
	text "¿Qué piso?"
	done

SECTION "_BugCatchingContestTimeUpText", ROMX
_BugCatchingContestTimeUpText::
	text "Locutor: ¡BIP!"

	para "¡Se acabó!"
	done

SECTION "_BugCatchingContestIsOverText", ROMX
_BugCatchingContestIsOverText::
	text "Locutor: ¡El"
	line "Concurso terminó!"
	done

SECTION "_RepelWoreOffText", ROMX
_RepelWoreOffText::
	text "El efecto del"
	line "Repelente acabó."
	done

SECTION "UseAnotherRepelText", ROMX
UseAnotherRepelText::
	text "El efecto del"
	line "Repelente acabó."

	para "¿Usar otro?"
	done

SECTION "_JustSawSomeRareMonText", ROMX
_JustSawSomeRareMonText::
	text "Acabo de ver un"
	line ""
	text_ram wStringBuffer1
	text " raro"
	cont "en "
	text_ram wStringBuffer2
	text "."

	para "Avísame si veo"
	line "otro #mon raro,"
	cont "¿Vale?"
	prompt

SECTION "_SavingRecordText", ROMX
_SavingRecordText::
	text "Guardando…"
	line "¡No apagues!"
	done

SECTION "_NoCoinsText", ROMX
_NoCoinsText::
	text "No tienes monedas."
	prompt

SECTION "_NoCoinCaseText", ROMX
_NoCoinCaseText::
	text "No tienes un"
	line "Monedero."
	prompt

SECTION "_NPCTradeCableText", ROMX
_NPCTradeCableText::
	text "Vale, conecta el"
	line "Cable Link."
	prompt

SECTION "Text_NPCTraded", ROMX
Text_NPCTraded::
	text "<PLAYER> cambió"
	line ""
	text_ram wMonOrItemNameBuffer
	text " por"
	cont ""
	text_ram wStringBuffer2
	text "."
	done

SECTION "_NPCTradeFanfareText", ROMX
_NPCTradeFanfareText::
	text_sound SFX_DEX_FANFARE_80_109
	text_pause
	text_end

SECTION "_NPCTradeIntroText1", ROMX
_NPCTradeIntroText1::
	text "Colecciono #mon"
	line "¿Tienes"
	cont ""
	text_ram wStringBuffer1
	text "?"

	para "¿Lo cambiarías"
	line "por "
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeCancelText1", ROMX
_NPCTradeCancelText1::
	text "¿No quieres"
	line "cambiarlo? Vaya…"
	done

SECTION "_NPCTradeWrongText1", ROMX
_NPCTradeWrongText1::
	text "¿Eh? Ese no es"
	line ""
	text_ram wStringBuffer1
	text "."
	cont "Qué decepción…"
	done

SECTION "_NPCTradeCompleteText1", ROMX
_NPCTradeCompleteText1::
	text "¡Bien! Conseguí"
	line ""
	text_ram wStringBuffer1
	text "!"
	cont "¡Gracias!"
	done

SECTION "_NPCTradeAfterText1", ROMX
_NPCTradeAfterText1::
	text "Hola, ¿Cómo está"
	line "mi "
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeIntroText2", ROMX
_NPCTradeIntroText2::
	text "Hola, busco a"
	line "este #mon."

	para "Si tienes"
	line ""
	text_ram wStringBuffer1
	text ","

	para "¿Lo cambiarías"
	line "por "
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeCancelText2", ROMX
_NPCTradeCancelText2::
	text "¿Tampoco tienes"
	line "uno?"

	para "Vaya, qué"
	line "decepción…"
	done

SECTION "_NPCTradeWrongText2", ROMX
_NPCTradeWrongText2::
	text "¿No tienes"
	line ""
	text_ram wStringBuffer1
	text "?"
	cont "Qué pena, oye."
	done

SECTION "_NPCTradeCompleteText2", ROMX
_NPCTradeCompleteText2::
	text "¡Genial! ¡Gracias!"

	para "Por fin conseguí"
	line ""
	text_ram wStringBuffer1
	text "."
	done

SECTION "_NPCTradeAfterText2", ROMX
_NPCTradeAfterText2::
	text "¡Hola! "
	text_ram wMonOrItemNameBuffer
	line "que me diste"
	cont "está genial!"
	done

SECTION "_NPCTradeIntroText3", ROMX
_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text " mola,"
	line "pero no tengo."

	para "¿Tienes tú"
	line ""
	text_ram wStringBuffer1
	text "?"

	para "¿Lo cambiarías"
	line "por "
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeCancelText3", ROMX
_NPCTradeCancelText3::
	text "¿No quieres"
	line "cambiarlo? Anda…"
	done

SECTION "_NPCTradeWrongText3", ROMX
_NPCTradeWrongText3::
	text "Ese no es"
	line ""
	text_ram wStringBuffer1
	text "."

	para "Cámbiamelo si"
	line "consigues uno."
	done

SECTION "_NPCTradeCompleteText3", ROMX
_NPCTradeCompleteText3::
	text "¡Vaya, gracias!"
	line "Siempre quise"
	cont ""
	text_ram wMonOrItemNameBuffer
	text "!"
	done

SECTION "_NPCTradeAfterText3", ROMX
_NPCTradeAfterText3::
	text "¿Cómo está"
	line ""
	text_ram wStringBuffer2
	text " que"
	cont "te cambié?"

	para "¡Tu "
	text_ram wMonOrItemNameBuffer
	line "es tan mono!"
	done

SECTION "_NPCTradeCompleteText4", ROMX
_NPCTradeCompleteText4::
	text "¿Eh? ¿Qué pasó?"
	done

SECTION "_NPCTradeAfterText4", ROMX
_NPCTradeAfterText4::
	text "Cambiar es raro…"

	para "Aún me queda"
	line "mucho por saber."
	done

SECTION "_MomLeavingText1", ROMX
_MomLeavingText1::
	text "Vaya, qué #mon"
	line "tan mono."

	para "¿De dónde lo"
	line "sacaste?"

	para "…"

	para "Así que te vas"
	line "de aventuras…"

	para "¡Vale!"
	line "Yo también ayudo."

	para "Pero, ¿Qué puedo"
	line "hacer por ti?"

	para "¡Ya sé! Yo te"
	line "guardo el dinero."

	para "En un viaje largo,"
	line "el dinero importa."

	para "¿Quieres que"
	line "guarde tu dinero?"
	done

SECTION "_MomLeavingText2", ROMX
_MomLeavingText2::
	text "Vale, cuidaré de"
	line "tu dinero."

	para "………………"
	prompt

SECTION "_MomLeavingText3", ROMX
_MomLeavingText3::
	text "Ten cuidado."

	para "Los #mon son"
	line "tus amigos. Debes"
	cont "trabajar juntos."

	para "¡Venga, vete ya!"
	done

SECTION "_MomIsThisAboutYourMoneyText", ROMX
_MomIsThisAboutYourMoneyText::
	text "¡Hola! Bienvenido,"
	line "veo que te"
	cont "esfuerzas mucho."

	para "Te mantuve"
	line "el cuarto limpio."

	para "¿O es por tu"
	line "dinero?"
	done

SECTION "_MomBankWhatDoYouWantToDoText", ROMX
_MomBankWhatDoYouWantToDoText::
	text "¿Qué quieres"
	line "hacer?"
	done

SECTION "_MomStoreMoneyText", ROMX
_MomStoreMoneyText::
	text "¿Cuánto quieres"
	line "guardar?"
	done

SECTION "_MomTakeMoneyText", ROMX
_MomTakeMoneyText::
	text "¿Cuánto quieres"
	line "sacar?"
	done

SECTION "_MomSaveMoneyText", ROMX
_MomSaveMoneyText::
	text "¿Quieres guardar"
	line "algo de dinero?"
	done

SECTION "_MomHaventSavedThatMuchText", ROMX
_MomHaventSavedThatMuchText::
	text "No has guardado"
	line "tanto."
	prompt

SECTION "_MomNotEnoughRoomInWalletText", ROMX
_MomNotEnoughRoomInWalletText::
	text "No puedes sacar"
	line "tanto."
	prompt

SECTION "_MomInsufficientFundsInWalletText", ROMX
_MomInsufficientFundsInWalletText::
	text "No tienes"
	line "tanto dinero."
	prompt

SECTION "_MomNotEnoughRoomInBankText", ROMX
_MomNotEnoughRoomInBankText::
	text "No puedes guardar"
	line "tanto."
	prompt

SECTION "_MomStartSavingMoneyText", ROMX
_MomStartSavingMoneyText::
	text "Vale, guardaré tu"
	line "dinero. ¡Confía!"

	para "<PLAYER>, no"
	line "¡te rindas!"
	done

SECTION "_MomStoredMoneyText", ROMX
_MomStoredMoneyText::
	text "Tu dinero está"
	line "seguro. ¡Vamos!"
	done

SECTION "_MomTakenMoneyText", ROMX
_MomTakenMoneyText::
	text "<PLAYER>, no"
	line "te rindas!"
	done

SECTION "_MomJustDoWhatYouCanText", ROMX
_MomJustDoWhatYouCanText::
	text "Haz lo que"
	line "puedas."
	done

SECTION "_DayCareManIntroText", ROMX
_DayCareManIntroText::
	text "Soy el Cuidador."
	line "¿Quieres que"
	cont "cuide un #mon?"
	done

SECTION "_DayCareManIntroEggText", ROMX
_DayCareManIntroEggText::
	text "Soy el Cuidador."
	line "¿Sabes algo de"
	cont "los Huevos?"

	para "Criaba #mon"
	line "con mi esposa,"
	cont "¿Sabes?"

	para "¡Nos sorprendió"
	line "hallar un Huevo!"

	para "¿A que es"
	line "increíble?"

	para "Bueno, ¿Y si"
	line "cuido un #mon?"
	done

SECTION "_DayCareLadyIntroText", ROMX
_DayCareLadyIntroText::
	text "Soy la Cuidadora"
	line "de la Guardería."

	para "¿Cuido un #mon"
	line "para ti?"
	done

SECTION "_DayCareLadyIntroEggText", ROMX
_DayCareLadyIntroEggText::
	text "Soy la Cuidadora."
	line "¿Sabes algo de"
	cont "los Huevos?"

	para "Mi esposo y yo"
	line "criábamos #mon,"
	cont "¿Sabes?"

	para "¡Nos sorprendió"
	line "hallar un Huevo!"

	para "¿A que es"
	line "increíble?"

	para "¿Y si cuido un"
	line "#mon para ti?"
	done

SECTION "_WhatShouldIRaiseText", ROMX
_WhatShouldIRaiseText::
	text "¿Qué debería"
	line "criar para ti?"
	prompt

SECTION "_OnlyOneMonText", ROMX
_OnlyOneMonText::
	text "¿Eh? Pero solo"
	line "tienes un #mon."
	prompt

SECTION "_CantAcceptEggText", ROMX
_CantAcceptEggText::
	text "Lo siento, no"
	line "acepto Huevos."
	prompt

SECTION "_RemoveMailText", ROMX
_RemoveMailText::
	text "Quita el Correo"
	line "antes de venir."
	prompt

SECTION "_LastHealthyMonText", ROMX
_LastHealthyMonText::
	text "Si me lo das,"
	line "¿Con qué"
	cont "vas a luchar?"
	prompt

SECTION "_IllRaiseYourMonText", ROMX
_IllRaiseYourMonText::
	text "Vale. Criaré a"
	line "tu "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_ComeBackLaterText", ROMX
_ComeBackLaterText::
	text "Vuelve más tarde"
	line "a recogerlo."
	done

SECTION "_AreWeGeniusesText", ROMX
_AreWeGeniusesText::
	text "¿Somos o no somos"
	line "genios? ¿Quieres"
	cont "ver a tu"
	cont ""
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_YourMonHasGrownText", ROMX
_YourMonHasGrownText::
	text "Tu "
	text_ram wStringBuffer1
	line "ha crecido mucho."

	para "Subió "
	text_decimal wStringBuffer2 + 1, 1, 3
	text " niveles."

	para "Si quieres tu"
	line "#mon de vuelta,"
	cont "costará ¥"
	text_decimal wStringBuffer2 + 2, 3, 5
	text "."
	done

SECTION "_PerfectHeresYourMonText", ROMX
_PerfectHeresYourMonText::
	text "¡Perfecto! Aquí"
	line "tienes tu #mon."
	prompt

SECTION "_GotBackMonText", ROMX
_GotBackMonText::
	text "<PLAYER> recuperó"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BackAlreadyText", ROMX
_BackAlreadyText::
	text "¿Eh? ¿Has vuelto?"
	line "Tu "

	text_ram wStringBuffer1
	cont "necesita algo"
	cont "más de tiempo."

	para "Si quieres tu"
	line "#mon de vuelta,"
	cont "costará ¥100."
	done

SECTION "_HaveNoRoomText", ROMX
_HaveNoRoomText::
	text "No tienes sitio"
	line "para eso."
	prompt

SECTION "_NotEnoughMoneyText", ROMX
_NotEnoughMoneyText::
	text "No tienes"
	line "suficiente dinero."
	prompt

SECTION "_OhFineThenText", ROMX
_OhFineThenText::
	text "Bueno, vale."
	prompt

SECTION "_ComeAgainText", ROMX
_ComeAgainText::
	text "Vuelve pronto."
	done

SECTION "_NotYetText", ROMX
_NotYetText::
	text "Aún no…"
	done

SECTION "_FoundAnEggAgainText", ROMX
_FoundAnEggAgainText::
	text "¡Ah, eres tú!"

	para "Tu #mon tuvo"
	line "¡otro Huevo!"

	para "¿Lo quieres?"
	done

SECTION "_FoundAnEggText", ROMX
_FoundAnEggText::
	text "¡Ah, eres tú!"

	para "Estábamos criando"
	line "a tu #mon, y"

	para "vaya sorpresa"
	line "¡nos llevamos!"

	para "¡Tu #mon tuvo"
	line "un Huevo!"

	para "No sabemos cómo"
	line "llegó ahí, pero"

	para "tu #mon lo"
	line "tenía. ¿Quieres?"
	done

SECTION "_ReceivedEggText", ROMX
_ReceivedEggText::
	text "<PLAYER> recibió"
	line "¡el Huevo!"
	done

SECTION "_TakeGoodCareOfEggText", ROMX
_TakeGoodCareOfEggText::
	text "Cuida bien de él."
	done

SECTION "_IllKeepItThanksText", ROMX
_IllKeepItThanksText::
	text "Bueno, me lo"
	line "quedo. ¡Gracias!"
	done

SECTION "_NoRoomForEggText", ROMX
_NoRoomForEggText::
	text "No tienes sitio en"
	line "tu equipo ni"
	cont "en tu PC."
	cont "Vuelve más tarde."
	done

SECTION "_NameRaterHelloText", ROMX
_NameRaterHelloText::
	text "¡Hola, hola! Soy"
	line "el experto en"
	cont "nombres."

	para "Valoro los"
	line "nombres de los"
	cont "#mon."

	para "¿Quieres que"
	line "valore alguno?"
	done

SECTION "_NameRaterWhichMonText", ROMX
_NameRaterWhichMonText::
	text "¿De qué #mon"
	line "quieres que"
	cont "valore el apodo?"
	prompt

SECTION "_NameRaterBetterNameText", ROMX
_NameRaterBetterNameText::
	text "Mmm… "
	text_ram wStringBuffer1
	text "…"
	line "Es un nombre"
	cont "bastante decente."

	para "Pero, ¿Qué tal"
	line "uno un poco"
	cont "mejor?"

	para "¿Quieres que le"
	line "dé uno mejor?"
	done

SECTION "_NameRaterWhatNameText", ROMX
_NameRaterWhatNameText::
	text "Vale. ¿Qué nombre"
	line "le ponemos,"
	cont "entonces?"
	prompt

SECTION "_NameRaterFinishedText", ROMX
_NameRaterFinishedText::
	text "¡Es un nombre"
	line "mejor que el de"
	cont "antes!"

	para "¡Bien hecho!"
	done

SECTION "_NameRaterComeAgainText", ROMX
_NameRaterComeAgainText::
	text "Vale, pues. Vuelve"
	line "en otro momento."
	done

SECTION "_NameRaterPerfectNameText", ROMX
_NameRaterPerfectNameText::
	text "Mmm… ¿"
	text_ram wStringBuffer1
	text "?"
	line "¡Qué nombre tan"
	cont "genial!"
	cont "Es perfecto."

	para "Trata a "
	text_ram wStringBuffer1
	line "con mucho cariño."
	done

SECTION "_NameRaterEggText", ROMX
_NameRaterEggText::
	text "Vaya… Eso es solo"
	line "un Huevo."
	done

SECTION "_NameRaterSameNameText", ROMX
_NameRaterSameNameText::
	text "Puede que parezca"
	line "igual que antes,"

	para "pero este nombre"
	line "¡Es mucho mejor!"

	para "¡Bien hecho!"
	done

SECTION "_NameRaterNamedText", ROMX
_NameRaterNamedText::
	text "Vale. Este #mon"
	line "ahora se llama"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "Text_Gained", ROMX
Text_Gained::
	text_ram wStringBuffer1
	text " ganó@"
	text_end

SECTION "Text_ABoostedStringBuffer2ExpPoints", ROMX
Text_ABoostedStringBuffer2ExpPoints::
	line "un impulso de"
	cont ""
	text_decimal wStringBuffer2, 3, 6
	text " Pts.Exp.!"
	prompt

SECTION "Text_StringBuffer2ExpPoints", ROMX
Text_StringBuffer2ExpPoints::
	line ""
	text_decimal wStringBuffer2, 3, 6
	text " Pts.Exp.!"
	prompt

SECTION "Text_GoPkmn", ROMX
Text_GoPkmn::
	text "¡Adelante,"
	line "@"
	text_end

SECTION "Text_DoItPkmn", ROMX
Text_DoItPkmn::
	text "¡Hazlo,"
	line "@"
	text_end

SECTION "Text_GoForItPkmn", ROMX
Text_GoForItPkmn::
	text "¡A por ello,"
	line "@"
	text_end

SECTION "Text_YourFoesWeakGetmPkmn", ROMX
Text_YourFoesWeakGetmPkmn::
	text "¡Tu enemigo está"
	line "débil! ¡A por él, "
	cont "@"
	text_end

SECTION "Text_BattleMonNick01", ROMX
Text_BattleMonNick01::
	text_ram wBattleMonNickname
	text "!"
	done

SECTION "Text_BattleMonNickComma", ROMX
Text_BattleMonNickComma::
	text_ram wBattleMonNickname
	text ",@"
	text_end

SECTION "Text_ThatsEnoughComeBack", ROMX
Text_ThatsEnoughComeBack::
	text " bien"
	line "hecho! ¡Vuelve!@"
	text_end

SECTION "Text_OKComeBack", ROMX
Text_OKComeBack::
	text " ok!"
	line "¡Vuelve!@"
	text_end

SECTION "Text_GoodComeBack", ROMX
Text_GoodComeBack::
	text " bien!"
	line "¡Vuelve!@"
	text_end

SECTION "Text_ComeBack", ROMX
Text_ComeBack::
	text " bien!"
	line "¡Vuelve!@"
	text_end

SECTION "_BootedTMText", ROMX
_BootedTMText::
	text "Se activó un MT."
	done

SECTION "_BootedHMText", ROMX
_BootedHMText::
	text "Se activó una MO."
	done

SECTION "_ContainedMoveText", ROMX
_ContainedMoveText::
	text "Contiene"
	line ""
	text_ram wStringBuffer2
	text "."

	para "¿Enseñas"
	line ""
	text_ram wStringBuffer2
	cont "a un #mon?"
	done

SECTION "_TMHMNotCompatibleText", ROMX
_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " no es"
	line "compatible con"
	cont ""
	text_ram wStringBuffer1
	text "."

	para "No puede"
	line "aprender"
	cont ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_BadgeRequiredText", ROMX
_BadgeRequiredText::
	text "Lo siento, hace"
	line "falta una Medalla."
	prompt

SECTION "_CantUseItemText", ROMX
_CantUseItemText::
	text "No puedes usar"
	line "eso aquí."
	prompt

SECTION "_UseCutText", ROMX
_UseCutText::
	text "¡"
	text_ram wStringBuffer2
	text_start
	line "usó Corte!"
	prompt

SECTION "_CutNothingText", ROMX
_CutNothingText::
	text "No hay nada que"
	line "cortar aquí."
	prompt

SECTION "_AskFlashText", ROMX
_AskFlashText::
	text "Está muy oscuro."
	line "¿Usar Destello?"
	done

SECTION "_BlindingFlashText", ROMX
_BlindingFlashText::
	text "¡Un Destello"
	line "ilumina la zona!"
	text_promptbutton
	text_end

SECTION "_UsedSurfText", ROMX
_UsedSurfText::
	text "¡"
	text_ram wStringBuffer2
	text_start
	line "usó SURF!"
	done

SECTION "_CantSurfText", ROMX
_CantSurfText::
	text "No puedes usar"
	line "Surf aquí."
	prompt

SECTION "_AlreadySurfingText", ROMX
_AlreadySurfingText::
	text "Ya estás"
	line "usando Surf."
	prompt

SECTION "_AskSurfText", ROMX
_AskSurfText::
	text "El agua está en"
	line "calma. ¿Quieres"
	cont "usar Surf?"
	done

SECTION "_UseWaterfallText", ROMX
_UseWaterfallText::
	text "¡"
	text_ram wStringBuffer2
	text_start
	line "usó Cascada!"
	done

SECTION "_HugeWaterfallText", ROMX
_HugeWaterfallText::
	text "¡Uauu! Es una"
	line "enorme cascada."
	done

SECTION "_AskWaterfallText", ROMX
_AskWaterfallText::
	text "¿Quieres usar"
	line "Cascada?"
	done

SECTION "_UseDigText", ROMX
_UseDigText::
	text "¡"
	text_ram wStringBuffer2
	text_start
	line "usó Excavar!"
	done

SECTION "_UseEscapeRopeText", ROMX
_UseEscapeRopeText::
	text "<PLAYER> usó una"
	line "Cuerda Huida."
	done

SECTION "_CantUseDigText", ROMX
_CantUseDigText::
	text "No puedes usar"
	line "eso aquí."
	done

SECTION "_CantUseTeleportText", ROMX
_CantUseTeleportText::
	text "No puedes usar"
	line "eso aquí."

	para ""
	done

SECTION "_UseStrengthText", ROMX
_UseStrengthText::
	text "¡"
	text_ram wStringBuffer2
	text_start
	line "usó Fuerza!"
	done

SECTION "_MoveBoulderText", ROMX
_MoveBoulderText::
	text_ram wStringBuffer1
	text " puede"
	line "mover rocas."
	prompt

SECTION "_AskStrengthText", ROMX
_AskStrengthText::
	text "Un #mon quizá"
	line "pueda mover esto."

	para "¿Quieres usar"
	line "Fuerza?"
	done

SECTION "_BouldersMoveText", ROMX
_BouldersMoveText::
	text "¡Las rocas ya"
	line "se pueden mover!"
	done

SECTION "_BouldersMayMoveText", ROMX
_BouldersMayMoveText::
	text "Un #mon quizá"
	line "pueda mover esto."
	done

SECTION "_UseWhirlpoolText", ROMX
_UseWhirlpoolText::
	text "¡"
	text_ram wStringBuffer2
	text_start
	line "usó Torbellino!"
	prompt

SECTION "_MayPassWhirlpoolText", ROMX
_MayPassWhirlpoolText::
	text "¡Un horrible"
	line "torbellino!"

	para "Un #mon quizá"
	line "pueda pasarlo."
	done

SECTION "_AskWhirlpoolText", ROMX
_AskWhirlpoolText::
	text "Hay un remolino"
	line "en el camino."

	para "¿Quieres usar"
	line "Remolino?"
	done

SECTION "_UseHeadbuttText", ROMX
_UseHeadbuttText::
	text "¡"
	text_ram wStringBuffer2
	text_start
	line "usó Golpe Cabeza!"
	prompt

SECTION "_HeadbuttNothingText", ROMX
_HeadbuttNothingText::
	text "No hay nada…"
	done

SECTION "_AskHeadbuttText", ROMX
_AskHeadbuttText::
	text "Podría haber un"
	line "#mon ahí."

	para "¿Usar Golpe"
	line "Cabeza?"
	done

SECTION "_UseRockSmashText", ROMX
_UseRockSmashText::
	text_ram wStringBuffer2
	text " usó"
if DEF(FAITHFUL)
	line "¡Golpe Roca!"
else
	line "¡Demolición!"
endc
	prompt

SECTION "_MaySmashText", ROMX
_MaySmashText::
	text "Quizá un #mon"
	line "pueda romper esto."
	done

SECTION "_AskRockSmashText", ROMX
_AskRockSmashText::
	text "Esta roca parece"
	line "rompible."

if DEF(FAITHFUL)
	para "¿Usar Golpe"
	line "Roca?"
else
	para "¿Usar"
	line "Demolición?"
endc
	done

SECTION "_RodBiteText", ROMX
_RodBiteText::
	text "¡Anda!"
	line "¡Ha picado!"
	prompt

SECTION "_RodNothingText", ROMX
_RodNothingText::
	text "¡No pican!"

	para "¿Seguir pescando?"
	done

SECTION "_CantGetOffBikeText", ROMX
_CantGetOffBikeText::
	text "¡No puedes bajarte"
	line "aquí!"
	done

SECTION "_GotOnBikeText", ROMX
_GotOnBikeText::
	text "<PLAYER> subió a"
	line ""
	text_ram wStringBuffer2
	text "."
	done

SECTION "_GotOffBikeText", ROMX
_GotOffBikeText::
	text "<PLAYER> bajó de"
	line ""
	text_ram wStringBuffer2
	text "."
	done

SECTION "_AskCutText", ROMX
_AskCutText::
	text "¡Este árbol se"
	line "puede cortar!"
	done

	para "¿Usar Corte?"
	done

SECTION "_CanCutText", ROMX
_CanCutText::
	text "¡Este árbol se"
	line "puede cortar!"
	done

SECTION "_FoundItemText", ROMX
_FoundItemText::
	text "<PLAYER> encontró"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_GotTheItemText", ROMX
_GotTheItemText:
	text "<PLAYER> consiguió"
	line ""
	text_ram wStringBuffer4
	text "."
	done

SECTION "_ReceivedTheBadgeText", ROMX
_ReceivedTheBadgeText:
	text "<PLAYER> consiguió"
	line "Medalla "
	text_ram wStringBuffer4
	text "."
	done

SECTION "WhiteoutText", ROMX
WhiteoutText::
	text "¡<PLAYER> no tiene"
	line "#mon útiles!"

	para "¡<PLAYER> se"
	line "desmayó!"
	done

SECTION "WhiteoutToWildText", ROMX
WhiteoutToWildText::
	text "¡<PLAYER> no tiene"
	line "#mon útiles!"

	para "¡<PLAYER> entró"
	line "en pánico y"
	cont "perdió ¥"
	text_decimal hMoneyTemp, 3, 7
	text "…"

	para "………………"
	line "………………"

	para "¡<PLAYER> perdió"
	line "el conocimiento!"
	done

SECTION "WhiteoutToTrainerText", ROMX
WhiteoutToTrainerText::
	text "¡<PLAYER> no tiene"
	line "#mon útiles!"

	para "<PLAYER> pagó"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text " al"
	cont "ganador…"

	para "………………"
	line "………………"

	para "¡<PLAYER> se"
	line "desmayó!"
	done

SECTION "ForfeitToTrainerText", ROMX
ForfeitToTrainerText::
	text "<PLAYER> se rindió"
	line "en la batalla…"

	para "<PLAYER> pagó"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text " al"
	cont "ganador…"

	para "………………"
	line "………………"

	para "¡<PLAYER> se"
	line "desmayó!"
	done

SECTION "_PoisonFaintText", ROMX
_PoisonFaintText::
	text_ram wStringBuffer3
	line "se curó del"
	cont "veneno."
	prompt

SECTION "_UseSweetHoneyText", ROMX
_UseSweetHoneyText::
	text "<PLAYER> untó"
if DEF(FAITHFUL)
	line "¡Miel!"
else
	line "¡Miel Dulce!"
endc
	done

SECTION "_SweetHoneyNothingText", ROMX
_SweetHoneyNothingText::
	text "Parece que no hay"
	line "nada aquí…"
	done

SECTION "_SquirtbottleNothingText", ROMX
_SquirtbottleNothingText::
	text "<PLAYER> roció"
	line "agua."

	para "Pero no pasó"
	line "nada…"
	done

SECTION "_UseSacredAshText", ROMX
_UseSacredAshText::
	text "¡Todos los #mon"
	line "de <PLAYER> fueron"
	cont "curados!"
	done

SECTION "Text_AnEGGCantHoldAnItem", ROMX
Text_AnEGGCantHoldAnItem::
	text "Un Huevo no puede"
	line "llevar objetos."
	prompt

SECTION "_AskThrowAwayText", ROMX
_AskThrowAwayText::
	text "¿Cuántos quieres"
	line "tirar?"
	done

SECTION "_AskQuantityThrowAwayText", ROMX
_AskQuantityThrowAwayText::
	text "¿Tirar "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line ""
	text_ram wStringBuffer2
	text_plural
	text "?"
	done

SECTION "_ThrewAwayText", ROMX
_ThrewAwayText::
	text "Tiraste"
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	prompt

SECTION "_OakThisIsntTheTimeText", ROMX
_OakThisIsntTheTimeText::
	text "Oak: ¡<PLAYER>!"
	line "¡No es momento"
	cont "de usar esto!"
	prompt

SECTION "Text_YouDontHaveAPkmn", ROMX
Text_YouDontHaveAPkmn::
	text "¡No tienes ningún"
	line "#mon!"
	prompt

SECTION "_RegisteredItemText", ROMX
_RegisteredItemText::
	text "Registraste"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "UnregisteredItemText", ROMX
UnregisteredItemText::
	text "Quitaste el"
	line "registro de"
	cont ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_CantRegisterText", ROMX
_CantRegisterText::
	text "No puedes"
	line "registrar eso."
	prompt

SECTION "_AskItemMoveText", ROMX
_AskItemMoveText::
	text "¿A dónde quieres"
	line "moverlo?"
	done

SECTION "Text_AreYouABoyOrAreYouAGirl", ROMX
Text_AreYouABoyOrAreYouAGirl::
	text "¿Qué foto hay en"
	line "tu Tarjeta?"
	done

SECTION "Text_SoThisIsYou", ROMX
Text_SoThisIsYou::
	text "¿Así que eres tú?"
	done

SECTION "Text_BattleUser", ROMX
Text_BattleUser::
	text "<USER>@"
	text_end

SECTION "_BattleTookSunlightText", ROMX
_BattleTookSunlightText::
	line "¡Absorbe el sol!"
	prompt

SECTION "_BattleFlewText", ROMX
_BattleFlewText::
	line "¡Voló muy alto!"
	prompt

SECTION "_BattleDugText", ROMX
_BattleDugText::
	line "¡Cavó un hoyo!"
	prompt

SECTION "Text_BreedHuh", ROMX
Text_BreedHuh::
	text "¿Eh?"
	para "@"
	text_end

SECTION "_BreedEggHatchText", ROMX
_BreedEggHatchText::
	text_ram wStringBuffer1
	text " salió"
	line "de su Huevo!"
	text_sound SFX_CAUGHT_MON
	text_promptbutton
	text_end

SECTION "_BreedAskNicknameText", ROMX
_BreedAskNicknameText::
	text "¿Poner un mote a"
	line ""
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_LeftWithDayCareLadyText", ROMX
_LeftWithDayCareLadyText::
	text_ram wBreedMon2Nickname
	line "se quedó con"
	cont "la Cuidadora."
	done

SECTION "_LeftWithDayCareManText", ROMX
_LeftWithDayCareManText::
	text_ram wBreedMon1Nickname
	line "se quedó con"
	cont "el Cuidador."
	done

SECTION "_BreedNoInterestText", ROMX
_BreedNoInterestText::
	text "No muestra"
	line "interés en"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BreedAppearsToCareForText", ROMX
_BreedAppearsToCareForText::
	text "Parece que le"
	line "importa"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BreedFriendlyText", ROMX
_BreedFriendlyText::
	text "Es amigable con"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BreedShowsInterestText", ROMX
_BreedShowsInterestText::
	text "Muestra interés"
	line "en "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_EmptyMailboxText", ROMX
_EmptyMailboxText::
	text "No hay Carta"
	line "aquí."
	prompt

SECTION "ClearedMailPutAwayText", ROMX
ClearedMailPutAwayText::
	text "La carta borrado"
	line "se guardó."
	prompt

SECTION "MailPackFullText", ROMX
MailPackFullText::
	text "El bolso está"
	line "lleno."
	prompt

SECTION "MailMessageLostText", ROMX
MailMessageLostText::
	text "Se perderá el"
	line "mensaje. ¿Vale?"
	done

SECTION "MailAlreadyHoldingItemText", ROMX
MailAlreadyHoldingItemText::
	text "Ya lleva un"
	line "objeto encima."
	prompt

SECTION "MailEggText", ROMX
MailEggText::
	text "Un Huevo no puede"
	line "llevar Carta."
	prompt

SECTION "MailMovedFromBoxText", ROMX
MailMovedFromBoxText::
	text "La carta se movió"
	line "del Buzón."
	prompt

SECTION "_ReceivedGiftMonText", ROMX
_ReceivedGiftMonText::
	text "¡<PLAYER> recibió"
	line "a"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

SECTION "_EggSentToPCText", ROMX
_EggSentToPCText::
	text "El Huevo fue"
	line "enviado a"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_PCGottaHavePokemonText", ROMX
_PCGottaHavePokemonText::
	text "¡Necesitas un"
	line "#mon para"
	cont "llamar!"
	prompt

SECTION "_ContestCaughtMonText", ROMX
_ContestCaughtMonText::
	text "¡Capturaste a"
	line ""
	text_ram wStringBuffer1
	text "!"
	prompt

SECTION "_ContestAskSwitchText", ROMX
_ContestAskSwitchText::
	text "¿Cambiar #mon?"
	done

SECTION "_ContestAlreadyCaughtText", ROMX
_ContestAlreadyCaughtText::
	text "Ya has"
	line "capturado a"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "ContestJudging_FirstPlaceText", ROMX
ContestJudging_FirstPlaceText::
	text "El ganador del"
	line "Concurso de"
	cont "Captura es"
	text_pause
	text "…"

	para ""
	text_ram wBugContestWinnerName
	text ","
	line "que capturó a"
	cont ""
	text_ram wStringBuffer1
	text "!@"
	text_end

SECTION "ContestJudging_FirstPlaceScoreText", ROMX
ContestJudging_FirstPlaceScoreText::
	para "La puntuación"
	line "ganadora fue"
	cont ""
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " puntos!"
	prompt

SECTION "ContestJudging_SecondPlaceText", ROMX
ContestJudging_SecondPlaceText::
	text "En segundo lugar,"
	line ""
	text_ram wBugContestWinnerName
	text ","
	para "que capturó a"
	line ""
	text_ram wStringBuffer1
	text "!@"
	text_end

SECTION "ContestJudging_SecondPlaceScoreText", ROMX
ContestJudging_SecondPlaceScoreText::
	para "La puntuación"
	line "fue de"
	cont ""
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " puntos!"
	prompt

SECTION "ContestJudging_ThirdPlaceText", ROMX
ContestJudging_ThirdPlaceText::
	text "En tercer lugar,"
	line ""
	text_ram wBugContestWinnerName
	text ","
	para "que capturó a"
	line ""
	text_ram wStringBuffer1
	text "!@"
	text_end

SECTION "ContestJudging_ThirdPlaceScoreText", ROMX
ContestJudging_ThirdPlaceScoreText::
	para "La puntuación"
	line "fue de"
	cont ""
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " puntos!"
	prompt

SECTION "_MagikarpGuruMeasureText", ROMX
_MagikarpGuruMeasureText::
	text "Déjame medir"
	line "ese Magikarp."

	para "…Mmm, mide"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_KarpGuruRecordText", ROMX
_KarpGuruRecordText::
	text "Récord Actual"
	para ""
	text_ram wStringBuffer1
	text ", de"
	line ""
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

SECTION "_LuckyNumberMatchPartyText", ROMX
_LuckyNumberMatchPartyText::
	text "¡Felicidades!"

	para "Hay una"
	line "coincidencia con"
	cont "el número de ID"

	para ""
	text_ram wStringBuffer2
	text " en"
	line "tu equipo."
	prompt

SECTION "_LuckyNumberMatchPCText", ROMX
_LuckyNumberMatchPCText::
	text "¡Felicidades!"

	para "Hay una"
	line "coincidencia con"
	cont "el número de ID"

	para ""
	text_ram wStringBuffer2
	text " en la"
	line "Caja “"
	text_ram wStringBuffer1
	text "”."
	prompt

SECTION "_CaughtAskNicknameText", ROMX
_CaughtAskNicknameText::
	text "¿Poner un mote al"
	line ""
	text_ram wStringBuffer1
	text " que"
	cont "recibiste?"
	done

SECTION "_PokecenterPCCantUseText", ROMX
_PokecenterPCCantUseText::
	text "¡Bzzzt! ¡Necesitas"
	line "un #mon para"
	cont "usar esto!"
	prompt

SECTION "_PlayersPCTurnOnText", ROMX
_PlayersPCTurnOnText::
	text "<PLAYER> encendió"
	line "el PC."
	prompt

SECTION "_PlayersPCAskWhatDoText", ROMX
_PlayersPCAskWhatDoText::
	text "¿Qué quieres"
	line "hacer?"
	done

SECTION "_PlayersPCHowManyWithdrawText", ROMX
_PlayersPCHowManyWithdrawText::
	text "¿Cuántos quieres"
	line "retirar?"
	done

SECTION "_PlayersPCWithdrewItemsText", ROMX
_PlayersPCWithdrewItemsText::
	text "Retiraste "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	prompt

SECTION "_PlayersPCNoRoomWithdrawText", ROMX
_PlayersPCNoRoomWithdrawText::
	text "No hay sitio"
	line "para más objetos."
	prompt

SECTION "_PlayersPCNoItemsText", ROMX
_PlayersPCNoItemsText::
	text "¡No hay objetos!"
	prompt

SECTION "_PlayersPCCantDepositItemText", ROMX
_PlayersPCCantDepositItemText::
	text "Ese objeto no se"
	line "puede guardar."
	prompt

SECTION "_PlayersPCHowManyDepositText", ROMX
_PlayersPCHowManyDepositText::
	text "¿Cuántos quieres"
	line "guardar?"
	done

SECTION "_PlayersPCDepositItemsText", ROMX
_PlayersPCDepositItemsText::
	text "Guardaste "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	prompt

SECTION "_PlayersPCNoRoomDepositText", ROMX
_PlayersPCNoRoomDepositText::
	text "No hay sitio para"
	line "guardar objetos."
	prompt

SECTION "_PokecenterPCTurnOnText", ROMX
_PokecenterPCTurnOnText::
	text "<PLAYER> encendió"
	line "el PC."
	prompt

SECTION "_PokecenterPCWhoseText", ROMX
_PokecenterPCWhoseText::
	text "¿A qué PC"
	line "quieres acceder?"
	done

SECTION "_PokecenterBillsPCText", ROMX
_PokecenterBillsPCText::
	text "PC de Bill"
	line "accedido."

	para "Sistema de"
	line "Almacén #mon"
	cont "abierto."
	prompt

SECTION "_PokecenterPlayersPCText", ROMX
_PokecenterPlayersPCText::
	text "PC propio"
	line "accedido."

	para "Sistema de"
	line "objetos"
	cont "abierto."
	prompt

SECTION "_PokecenterOaksPCText", ROMX
_PokecenterOaksPCText::
	text "Accedido al PC"
	line "del Prof.Oak."

	para "Sistema de"
	line "puntuación"
	cont "#dex abierto."
	prompt

SECTION "_PokecenterPCOaksClosedText", ROMX
_PokecenterPCOaksClosedText::
	text "…"
	line "Conexión cerrada…"
	done

SECTION "_OakPCText1", ROMX
_OakPCText1::
	text "¿Quieres que"
	line "valore tu #dex?"
	done

SECTION "_OakPCText2", ROMX
_OakPCText2::
	text "Nivel actual de"
	line "tu #dex:"
	prompt

SECTION "_OakPCText3", ROMX
_OakPCText3::
	text_decimal wTempDexSeen, 2, 3
	text " vistos"
	line ""
	text_decimal wTempDexOwn, 2, 3
	text " tuyos"

	para "Puntuación del"
	line "Prof.Oak:"
	done

SECTION "_OakRating01", ROMX
_OakRating01::
	text "¡Busca #mon en"
	line "zonas con hierba!"
	done

SECTION "_OakRating02", ROMX
_OakRating02::
	text "Bien. Veo que"
	line "sabes usar"
	cont "las # Ball."
	done

SECTION "_OakRating03", ROMX
_OakRating03::
	text "Se te da cada"
	line "vez mejor."

	para "Pero aún te"
	line "queda mucho."
	done

SECTION "_OakRating04", ROMX
_OakRating04::
	text "Debes completar"
	line "tu #dex."

	para "¡Atrapa #mon"
	line "de todo tipo!"
	done

SECTION "_OakRating05", ROMX
_OakRating05::
	text "Lo intentas, ya"
	line "lo veo."

	para "Tu #dex va"
	line "tomando forma."
	done

SECTION "_OakRating06", ROMX
_OakRating06::
	text "Para evolucionar,"
	line "algunos #mon"

	para "crecen, otros"
	line "usan Piedras."
	done

SECTION "_OakRating07", ROMX
_OakRating07::
	text "¿Tienes ya una"
	line "Caña? Puedes"

	para "pescar #mon"
	line "con ella."
	done

SECTION "_OakRating08", ROMX
_OakRating08::
	text "¡Excelente! ¡Se"
	line "ve que te gusta"
	cont "coleccionar cosas!"
	done

SECTION "_OakRating09", ROMX
_OakRating09::
	text "Algunos #mon"
	line "solo aparecen"

	para "a ciertas horas"
	line "del día."
	done

SECTION "_OakRating10", ROMX
_OakRating10::
	text "Tu #dex se va"
	line "llenando. ¡Sigue"
	cont "así!"
	done

SECTION "_OakRating11", ROMX
_OakRating11::
	text "Me impresionas."
	line "Haces evolucionar"

	para "#mon, no solo"
	line "los atrapas."
	done

SECTION "_OakRating12", ROMX
_OakRating12::
	text "¿Conoces a Kurt?"
	line "Sus Balls"
	cont "personalizadas"
	cont "ayudan mucho."
	done

SECTION "_OakRating13", ROMX
_OakRating13::
	text "Vaya. Encontraste"
	line "más #mon que"

	para "el último"
	line "estudio #dex."
	done

SECTION "_OakRating14", ROMX
_OakRating14::
	text "¿Intercambias tus"
	line "#mon?"

	para "¡Es duro hacerlo"
	line "solo!"
	done

SECTION "_OakRating15", ROMX
_OakRating15::
	text "¡Vaya! ¡Llegaste"
	line "a 200! Tu #dex"
	cont "va genial!"
	done

SECTION "_OakRating16", ROMX
_OakRating16::
	text "¡Has encontrado"
	line "muchos #mon!"

	para "¡De verdad me"
	line "ayudaste mucho!"
	done

SECTION "_OakRating17", ROMX
_OakRating17::
	text "¡Magnífico!"
	line "¡Podrías ser"

	para "profesor #mon"
	line "ahora mismo!"
	done

SECTION "_OakRating18", ROMX
_OakRating18::
	text "Tu #dex es"
	line "increíble. Estás"

	para "listo para ser"
	line "profesional!"
	done

SECTION "_OakRating19", ROMX
_OakRating19::
	text "¡Vaya! ¡Un #dex"
	line "perfecto! Con"

	para "esto soñaba yo."
	line "¡Felicidades!"
	done

SECTION "_OakPCText4", ROMX
_OakPCText4::
	text "Se cerró conexión"
	line "con el PC"
	cont "del Prof.Oak."
	done

SECTION "_MemoryGameYeahText", ROMX
_MemoryGameYeahText::
	text ", ¡Bien!"
	done

SECTION "_MemoryGameDarnText", ROMX
_MemoryGameDarnText::
	text "Vaya…"
	done

SECTION "_StartMenuContestEndText", ROMX
_StartMenuContestEndText::
	text "¿Quieres terminar"
	line "el Concurso?"
	done

SECTION "_ItemsTossOutHowManyText", ROMX
_ItemsTossOutHowManyText::
	text "¿Cuántos tiras de"
	line ""
	text_ram wStringBuffer2
	text_plural
	text "?"
	done

SECTION "_ItemsDiscardedText", ROMX
_ItemsDiscardedText::
	text "Tiraste"
	line ""
	text_ram wStringBuffer1
	text_plural
	text "."
	prompt

SECTION "_ItemsOakWarningText", ROMX
_ItemsOakWarningText::
	text "Oak: ¡<PLAYER>!"
	line "¡No es momento"
	cont "de usar esto!"
	done

SECTION "_PokemonSwapItemText", ROMX
_PokemonSwapItemText::
	text "Le quitaste"
	line ""
	text_ram wStringBuffer1
	text " a"
	cont ""
	text_ram wMonOrItemNameBuffer

	para "y le diste"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_PokemonHoldItemText", ROMX
_PokemonHoldItemText::
	text_ram wMonOrItemNameBuffer
	line "ahora lleva"
	cont ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_PokemonRemoveMailText", ROMX
_PokemonRemoveMailText::
	text "Quita el Correo"
	line "primero."
	prompt

SECTION "_PokemonNotHoldingText", ROMX
_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text " no"
	line "lleva nada."
	prompt

SECTION "_ItemStorageFullText", ROMX
_ItemStorageFullText::
	text "El almacén de"
	line "objetos está lleno"
	prompt

SECTION "_PokemonTookItemText", ROMX
_PokemonTookItemText::
	text "Le quitaste"
	line ""
	text_ram wStringBuffer1
	text " a"
	cont ""
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

SECTION "_PokemonAskSwapItemText", ROMX
_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text " ya"
	line "lleva"

	para ""
	text_ram wStringBuffer1
	text "."
	line "¿Lo cambias?"
	done

SECTION "_ItemCantHeldText", ROMX
_ItemCantHeldText::
	text "Ese objeto no se"
	line "puede llevar."
	prompt

SECTION "_MailLoseMessageText", ROMX
_MailLoseMessageText::
	text "El Correo perderá"
	line "su mensaje. ¿Vale?"
	done

SECTION "_MailDetachedText", ROMX
_MailDetachedText::
	text "Correo separado"
	line "de "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_MailNoSpaceText", ROMX
_MailNoSpaceText::
	text "No hay sitio para"
	line "quitar el Correo."
	prompt

SECTION "_MailAskSendToPCText", ROMX
_MailAskSendToPCText::
	text "¿Enviar el Correo"
	line "quitado a tu PC?"
	done

SECTION "_MailboxFullText", ROMX
_MailboxFullText::
	text "El Buzón de tu PC"
	line "está lleno."
	prompt

SECTION "_MailSentToPCText", ROMX
_MailSentToPCText::
	text "El Correo se envió"
	line "a tu PC."
	prompt

SECTION "_PokemonNotEnoughHPText", ROMX
_PokemonNotEnoughHPText::
	text "¡PS insuficientes!"
	prompt

SECTION "_MayRegisterItemText", ROMX
_MayRegisterItemText::
	text "Un objeto de tu"
	line "Bolso se puede"

	para "registrar para"
	line "usar con Select."
	done

SECTION "_InitialOptionsText", ROMX
_InitialOptionsText::
	text "Elige cómo quieres"
	line "jugar a Polished"
	cont "Crystal."
	prompt

SECTION "_ElmText1", ROMX
_ElmText1::
	text "¡Hola! Siento"
	line "haberte hecho"
	cont "esperar."

if !DEF(DEBUG)
	para "¡Bienvenido al"
	line "mundo #mon!"

	para "Me llamo Elm."

	para "La gente me llama"
	line "el Prof. #mon."
endc
	prompt

SECTION "_ElmText2", ROMX
_ElmText2::
	text "Este mundo está"
	line "habitado por"
	cont "criaturas a las"
	cont "que llamamos"
	cont "#mon.@"
	text_end

SECTION "_ElmText4", ROMX
_ElmText4::
	text "Personas y #mon"
	line "conviven"

	para "ayudándose"
	line "mutuamente."

	para "Algunos juegan"
	line "con #mon, otros"
	cont "luchan con ellos."
	prompt

SECTION "_ElmText5", ROMX
_ElmText5::
	text "Pero aún no lo"
	line "sabemos todo"
	cont "sobre los #mon."

	para "Aún quedan"
	line "muchos misterios"
	cont "por resolver."

	para "Por eso estudio"
	line "#mon cada día."
	prompt

SECTION "_ElmText6", ROMX
_ElmText6::
	text "Dime, por favor,"
	line "tu nombre."
	prompt

SECTION "_ElmText7", ROMX
_ElmText7::
	text "<PLAYER>, ¿Ya"
	line "podemos empezar?"

if !DEF(DEBUG)
	para "Tu propia historia"
	line "#mon está a"
	cont "punto de empezar."

	para "Vivirás momentos"
	line "divertidos y"
	cont "retos duros."

	para "Un mundo de sueños"
	line "y aventuras"

	para "con #mon"
	line "te espera. ¡Vamos!"
endc

	para "¡Nos vemos"
	line "luego!"
	done

SECTION "_WarnVBAText", ROMX
_WarnVBAText::
if !DEF(DEBUG)
	text "¡Aviso!"

	para "Este emulador de"
	line "Game Boy tiene"
	cont "fallos que pueden"
	cont "hacer fallar a"
	cont "Polished Crystal."

	para "Usa un emulador"
	line "más preciso, como"
	cont "BGB, mGBA o"
	cont "Gambatte."
	prompt
else
	text "Prueba de emulador"
	line "fallida."
	prompt
endc

SECTION "_ClockTimeMayBeWrongText", ROMX
_ClockTimeMayBeWrongText::
	text "La hora del reloj"
	line "puede ser errónea."

	para "Por favor,"
	line "ajusta la hora."
	prompt

SECTION "_ClockSetWithControlPadText", ROMX
_ClockSetWithControlPadText::
	text "Ajústala con"
	line "la Cruceta."

	para "Confirmar: A"
	line "Cancelar:  B"
	done

SECTION "_ClockIsThisOKText", ROMX
_ClockIsThisOKText::
	text "¿Está bien así?"
	done

SECTION "_ClockHasResetText", ROMX
_ClockHasResetText::
	text "El reloj se ha"
	line "reiniciado."
	done

SECTION "_LinkTimeoutText", ROMX
_LinkTimeoutText::
	text "Ha pasado"
	line "demasiado tiempo."
	cont "Vuelve a intentar."
	prompt

SECTION "_LinkTradeCantBattleText", ROMX
_LinkTradeCantBattleText::
	text "Si cambias ese"
	line "#mon, no podrás"
	cont "luchar con él."
	prompt

SECTION "_LinkAbnormalMonText", ROMX
_LinkAbnormalMonText::
	text "¡El "
	text_ram wStringBuffer1
	line "de tu amigo"
	cont "parece anormal!"
	prompt

SECTION "_LinkAskTradeForText", ROMX
_LinkAskTradeForText::
	text "¿Cambiar"
	line ""
	text_ram wBufferTrademonNickname
	cont "por "
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_WouldYouLikeToSaveTheGameText", ROMX
_WouldYouLikeToSaveTheGameText::
	text "¿Quieres guardar"
	line "la partida?"
	done

SECTION "_SavedTheGameText", ROMX
_SavedTheGameText::
	text "<PLAYER> guardó"
	line "la partida."
	done

SECTION "_AnotherSaveFileText", ROMX
_AnotherSaveFileText::
	text "¡Aviso! Hay una"
	line "partida guardada"
	cont "de otro juego."

	para "¿Quieres"
	line "sobrescribir esa"
	cont "partida?"
	done

SECTION "_SaveFileCorruptedText", ROMX
_SaveFileCorruptedText::
	text "¡La partida está"
	line "corrupta!"
	prompt

SECTION "_GainedItemText", ROMX
_GainedItemText::
	text "<PLAYER> consiguió"
	line ""
	text_ram wStringBuffer4
	text "."
	done

SECTION "_GainedMultipleItemsText", ROMX
_GainedMultipleItemsText::
	text "<PLAYER> consiguió"
	line ""
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer4
	text "."
	done

SECTION "_PutItemInPocketText", ROMX
_PutItemInPocketText::
	text "<PLAYER> guardó"
	line ""
	text_ram wStringBuffer1
	text " en"
	cont ""
	text_ram wStringBuffer3
	text "."
	prompt

SECTION "_PocketIsFullText", ROMX
_PocketIsFullText::
	text ""
	text_ram wStringBuffer3
	line "está lleno…"
	prompt

SECTION "_FoundWingsText", ROMX
_FoundWingsText::
	text "<PLAYER> consiguió"
	line ""
	text_decimal wCurWingQuantity, 1, 2
	text " "
	text_ram wStringBuffer4
	text "."
	done

SECTION "_CongratulationsYourPokemonText", ROMX
_CongratulationsYourPokemonText::
	text "¡Felicidades! Tu"
	line ""
	text_ram wStringBuffer2
	text_end

SECTION "_EvolvedIntoText", ROMX
_EvolvedIntoText::
	para "evolucionó a"
	line ""
	text_ram wStringBuffer1
	text "!"
	done

SECTION "_StoppedEvolvingText", ROMX
_StoppedEvolvingText::
	text "¿Eh? "
	text_ram wStringBuffer2
	line "dejó de"
	cont "¡evolucionar!"
	prompt

SECTION "_EvolvingText", ROMX
_EvolvingText::
	text "¿Qué? "
	text_ram wStringBuffer2
	line "¡Está"
	cont "evolucionando!"
	done

SECTION "_MartHowManyText", ROMX
_MartHowManyText::
	text "¿Cuántos?"
	done

SECTION "_MartFinalPriceText", ROMX
_MartFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "costará ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done

SECTION "_HerbShopLadyIntroText", ROMX
_HerbShopLadyIntroText::
	text "Hola, cielo."

	para "Vendo medicina"
	line "herbal barata."

	para "Es buena, aunque"
	line "algo amarga."

	para "A tu #mon quizá"
	line "no le guste."

	para "Jejejeje…"
	done

SECTION "_HerbalLadyFinalPriceText", ROMX
_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "costará ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done

SECTION "_HerbalLadyThanksText", ROMX
_HerbalLadyThanksText::
	text "Gracias, cielo."
	line "Jejejeje…"
	done

SECTION "_HerbalLadyPackFullText", ROMX
_HerbalLadyPackFullText::
	text "¿Eh? Tu Bolso"
	line "está lleno, cielo."
	done

SECTION "_HerbalLadyNoMoneyText", ROMX
_HerbalLadyNoMoneyText::
	text "Jeje… No tienes"
	line "el dinero."
	done

SECTION "_HerbalLadyComeAgainText", ROMX
_HerbalLadyComeAgainText::
	text "Vuelve, cielo."
	line "Jejejeje…"
	done

SECTION "_BargainShopIntroText", ROMX
_BargainShopIntroText::
	text "¡Hola! ¿Quieres"
	line "ver ofertas?"

	para "Vendo objetos"
	line "raros que nadie"

	para "más tiene, pero"
	line "solo uno de cada."
	done

SECTION "_BargainShopFinalPriceText", ROMX
_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text " vale"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	cont "¿Lo quieres?"
	done

SECTION "_BargainShopThanksText", ROMX
_BargainShopThanksText::
	text "Gracias."
	done

SECTION "_BargainShopPackFullText", ROMX
_BargainShopPackFullText::
	text "Vaya, tu Bolso"
	line "está a tope."
	done

SECTION "_BargainShopSoldOutText", ROMX
_BargainShopSoldOutText::
	text "Ya compraste eso."
	line "Se me acabaron"
	cont "las existencias."
	done

SECTION "_BargainShopNoFundsText", ROMX
_BargainShopNoFundsText::
	text "Vaya, te falta"
	line "dinero."
	done

SECTION "_BargainShopComeAgainText", ROMX
_BargainShopComeAgainText::
	text "Vuelve por"
	line "aquí algún día."
	done

SECTION "_PharmacyIntroText", ROMX
_PharmacyIntroText::
	text "¿Necesitas alguna"
	line "medicina?"
	done

SECTION "_HowManyText", ROMX
_HowManyText::
	text "¿Cuántos?"
	done

SECTION "_PharmacyFinalPriceText", ROMX
_PharmacyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "costará ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done

SECTION "_PharmacyThanksText", ROMX
_PharmacyThanksText::
	text "¡Muchas gracias!"
	done

SECTION "_PharmacyPackFullText", ROMX
_PharmacyPackFullText::
	text "Ya no tienes"
	line "más espacio."
	done

SECTION "_PharmacyNoMoneyText", ROMX
_PharmacyNoMoneyText::
	text "¿Eh? No tienes"
	line "suficiente dinero."
	done

SECTION "_PharmacyComeAgainText", ROMX
_PharmacyComeAgainText::
	text "Vale."
	line "Hasta pronto."
	done

SECTION "_MartSellHowManyText", ROMX
_MartSellHowManyText::
	text "¿Cuántos?"
	done

SECTION "_MartSellPriceText", ROMX
_MartSellPriceText::
	text "Te puedo pagar"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text "."

	para "¿Está bien?"
	done

SECTION "_MartWelcomeText", ROMX
_MartWelcomeText::
	text "¡Bienvenido! ¿En"
	line "qué puedo ayudar?"
	done

SECTION "_MartThanksText", ROMX
_MartThanksText::
	text "Aquí tienes."
	line "¡Gracias!"
	done

SECTION "_MartNoMoneyText", ROMX
_MartNoMoneyText::
	text "No tienes"
	line "suficiente dinero."
	done

SECTION "_MartPackFullText", ROMX
_MartPackFullText::
	text "No puedes llevar"
	line "más objetos."
	done

SECTION "_MartCantBuyText", ROMX
_MartCantBuyText::
	text "Lo siento, no te"
	line "compro eso."
	prompt

SECTION "_MartComeAgainText", ROMX
_MartComeAgainText::
	text "¡Vuelve pronto!"
	done

SECTION "_MartAskMoreText", ROMX
_MartAskMoreText::
	text "¿Necesitas algo"
	line "más?"
	done

SECTION "_MartBoughtText", ROMX
_MartBoughtText::
	text "Gané ¥"
	text_decimal hMoneyTemp, 3, 7
	text " por"
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	done

SECTION "_SlotsBetHowManyCoinsText", ROMX
_SlotsBetHowManyCoinsText::
	text "¿Cuántas monedas"
	line "apuestas?"
	done

SECTION "TMMartCostsThisMuchText", ROMX
TMMartCostsThisMuchText::
	text_ram wStringBuffer2
	text " "
	text_ram wStringBuffer1
	line "costará ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done

SECTION "BTMartHowMayIHelpYouText", ROMX
BTMartHowMayIHelpYouText::
	text "¡Bienvenido al"
	line "Puesto de"
	cont "Intercambios!"

	para "Puedes cambiar tus"
	line "PB por premios."
	done

SECTION "BTMartCostsThisMuchText", ROMX
BTMartCostsThisMuchText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer1
	text_plural
	line "costará "
	text_decimal hMoneyTemp+1, 2, 4
	text " PB."
	done

SECTION "BTMartInsufficientFundsText", ROMX
BTMartInsufficientFundsText::
	text "Lo siento, te"
	line "faltan PB."
	done

SECTION "BTMartBagFullText", ROMX
BTMartBagFullText::
	text "Lo siento, tu"
	line "Bolso está lleno."
	done

SECTION "BTMartComeAgainText", ROMX
BTMartComeAgainText::
	text "¡Vuelve cuando"
	line "quieras!"
	done

SECTION "_SlotsStartText", ROMX
_SlotsStartText::
	text "¡Empieza!"
	done

SECTION "_SlotsNotEnoughCoinsText", ROMX
_SlotsNotEnoughCoinsText::
	text "No tienes"
	line "monedas bastantes."
	prompt

SECTION "_SlotsRanOutOfCoinsText", ROMX
_SlotsRanOutOfCoinsText::
	text "Vaya… Se acabaron"
	line "las monedas…"
	done

SECTION "_SlotsPlayAgainText", ROMX
_SlotsPlayAgainText::
	text "¿Jugar de nuevo?"
	done

SECTION "_SlotsLinedUpText", ROMX
_SlotsLinedUpText::
	text "alineados!"
	line "¡Ganaste "
	cont ""
	text_ram wStringBuffer2
	text " monedas!"
	done

SECTION "_SlotsDarnText", ROMX
_SlotsDarnText::
	text "¡Vaya!"
	done

SECTION "_PhoneWrongNumberText", ROMX
_PhoneWrongNumberText::
	text "¿Eh? Perdona,"
	line "te equivocaste."
	done

SECTION "_PhoneClickText", ROMX
_PhoneClickText::
	text "¡Clic!"
	done

SECTION "_PhoneEllipseText", ROMX
_PhoneEllipseText::
	text "……"
	done

SECTION "_PhoneOutOfAreaText", ROMX
_PhoneOutOfAreaText::
	text "Ese número está"
	line "fuera de zona."
	done

SECTION "_PhoneJustTalkToThemText", ROMX
_PhoneJustTalkToThemText::
	text "¡Ve a hablar con"
	line "esa persona!"
	done

SECTION "_PasswordAskResetText", ROMX
_PasswordAskResetText::
	text "Elige Continuar"
	line "para ajustar hora."
	prompt

SECTION "_PasswordAskResetClockText", ROMX
_PasswordAskResetClockText::
	text "¿Reiniciar reloj?"
	done

SECTION "_ClearAllSaveDataText", ROMX
_ClearAllSaveDataText::
	text "¿Borrar toda la"
	line "partida?"
	done

SECTION "ResetInitialOptionsText", ROMX
ResetInitialOptionsText::
	text "¿Restablecer las"
	line "opciones de"
	cont "inicio?"
	done

SECTION "_LearnedMoveText", ROMX
_LearnedMoveText::
	text_ram wMonOrItemNameBuffer
	line "aprendió"
	cont ""
	text_ram wStringBuffer2
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_promptbutton
	text_end

SECTION "_MoveAskForgetText", ROMX
_MoveAskForgetText::
	text "¿Qué movimiento"
	next "olvidamos?"

	para ""
	done

SECTION "_StopLearningMoveText", ROMX
_StopLearningMoveText::
	text "¿Dejar de aprender"
	line ""
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_DidNotLearnMoveText", ROMX
_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	line "no aprendió"
	cont ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_AskForgetMoveText", ROMX
_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	line "quiere aprender"
	cont ""
	text_ram wStringBuffer2
	text "!"

	para "¿Debe olvidar un"
	line "movimiento por"
	cont ""
	text_ram wStringBuffer2
	text "?"
	done

SECTION "Text_MoveForgetCount", ROMX
Text_MoveForgetCount::
	text "1, 2 y…"
	text_pause
	text_end

SECTION "_MoveForgotText", ROMX
_MoveForgotText::
	text " ¡Puf!"
	text_pause

	para ""
	text_ram wMonOrItemNameBuffer
	text " olvidó"
	line ""
	text_ram wStringBuffer1
	text "."

	para "Y…"
	prompt

SECTION "_MoveCantForgetHMText", ROMX
_MoveCantForgetHMText::
	text "No puedes olvidar"
	line "movimientos MO."
	prompt

SECTION "_CardFlipPlayWithThreeCoinsText", ROMX
_CardFlipPlayWithThreeCoinsText::
	text "¿Jugar con tres"
	line "monedas?"
	done

SECTION "_CardFlipNotEnoughCoinsText", ROMX
_CardFlipNotEnoughCoinsText::
	text "No hay monedas…"
	prompt

SECTION "_CardFlipChooseACardText", ROMX
_CardFlipChooseACardText::
	text "Elige una carta."
	done

SECTION "_CardFlipPlaceYourBetText", ROMX
_CardFlipPlaceYourBetText::
	text "Haz tu apuesta."
	done

SECTION "_CardFlipPlayAgainText", ROMX
_CardFlipPlayAgainText::
	text "¿Jugar de nuevo?"
	done

SECTION "_CardFlipShuffledText", ROMX
_CardFlipShuffledText::
	text "Las cartas se"
	line "barajaron."
	prompt

SECTION "_CardFlipYeahText", ROMX
_CardFlipYeahText::
	text "¡Sí!"
	done

SECTION "_CardFlipDarnText", ROMX
_CardFlipDarnText::
	text "Vaya…"
	done

SECTION "_GearTodayText", ROMX
_GearTodayText::
	text_today
	text_end

SECTION "_GearEllipseText", ROMX
_GearEllipseText::
	text "……"
	done

SECTION "_GearOutOfServiceText", ROMX
_GearOutOfServiceText::
	text "Estás fuera de"
	line "cobertura."
	prompt

SECTION "_PokegearAskWhoCallText", ROMX
_PokegearAskWhoCallText::
	text "¿A quién quieres"
	line "llamar?"
	done

SECTION "_PokegearPressButtonText", ROMX
_PokegearPressButtonText::
	text "Pulsa un botón"
	line "para salir."
	done

SECTION "_PokegearAskDeleteText", ROMX
_PokegearAskDeleteText::
	text "¿Borrar este"
	line "número guardado?"
	done

SECTION "_BuenaAskWhichPrizeText", ROMX
_BuenaAskWhichPrizeText::
	text "¡Puedes canjear"
	line "tus puntos"

	para "por un premio"
	line "a tu elección!"

	para "¿Qué premio"
	line "quieres?"
	done

SECTION "_BuenaIsThatRightText", ROMX
_BuenaIsThatRightText::
	text "¿"
	text_ram wStringBuffer1
	text "?"
	line "¿Es correcto?"
	done

SECTION "_BuenaHereYouGoText", ROMX
_BuenaHereYouGoText::
	text "¡Aquí tienes!"
	done

SECTION "_BuenaNotEnoughPointsText", ROMX
_BuenaNotEnoughPointsText::
	text "No tienes"
	line "tantos puntos."
	done

SECTION "_BuenaNoRoomText", ROMX
_BuenaNoRoomText::
	text "No tienes sitio"
	line "para eso."
	done

SECTION "_BuenaComeAgainText", ROMX
_BuenaComeAgainText::
	text "Vaya. ¡Vuelve"
	line "de vez en cuando!"
	done

SECTION "_BallBrokeFreeText", ROMX
_BallBrokeFreeText::
	text "¡No! ¡El #mon"
	line "escapó!"
	prompt

SECTION "_BallAppearedCaughtText", ROMX
_BallAppearedCaughtText::
	text "¡Parecía que lo"
	line "habías atrapado!"
	prompt

SECTION "_BallAlmostHadItText", ROMX
_BallAlmostHadItText::
	text "¡Vaya!"
	line "¡Te faltó poco!"
	prompt

SECTION "_BallSoCloseText", ROMX
_BallSoCloseText::
	text "¡Caray! ¡Casi"
	line "lo consigues!"
	prompt

SECTION "Text_BallCaught", ROMX
Text_BallCaught::
	text "¡Toma ya!"
	line "¡"
	text_ram wEnemyMonNickname
	cont "atrapado!"
	text_sound SFX_CAUGHT_MON
	text_end

SECTION "Text_Waitbutton_2", ROMX
Text_Waitbutton_2::
	text_promptbutton
	text_end

SECTION "_CurBoxFullText", ROMX
_CurBoxFullText::
	text_ram wStringBuffer1
	text " está"
	line "llena."
	prompt

SECTION "_MonSentToPCText", ROMX
_MonSentToPCText::
	text_ram wMonOrItemNameBuffer
	text " fue"
	line "enviado a"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_NewDexDataText", ROMX
_NewDexDataText::
	text "Se añadieron"
	line "datos de"
	cont ""
	text_ram wEnemyMonNickname
	cont "al #dex."
	text_sound SFX_SLOT_MACHINE_START
	text_promptbutton
	text_end

SECTION "_AskGiveNicknameText", ROMX
_AskGiveNicknameText::
	text "¿Poner un apodo a"
	line ""
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_ItemHappinessRoseButStatFellText", ROMX
_ItemHappinessRoseButStatFellText::
	text_ram wStringBuffer1
	text " se hizo"
	line "más cariñoso."
	para "Pero su"
	line ""
	text_ram wStringBuffer2
	text " bajó!"
	prompt

SECTION "_ItemStatRoseText", ROMX
_ItemStatRoseText::
	text ""
	text_ram wStringBuffer1
	line "subió su"
	cont ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_ItemCantUseOnMonText", ROMX
_ItemCantUseOnMonText::
	text "Eso no se puede"
	line "usar en este"
	cont "#mon."
	prompt

SECTION "Text_RepelUsedEarlierIsStillInEffect", ROMX
Text_RepelUsedEarlierIsStillInEffect::
	text "El Repelente usado"
	line "antes sigue"
	cont "en efecto."
	prompt

SECTION "_BlueCardBalanceText", ROMX
_BlueCardBalanceText::
	text "Ahora tienes"
	line ""
	text_decimal wBlueCardBalance, 1, 2
	text " puntos."
	done

SECTION "_CoinCaseCountText", ROMX
_CoinCaseCountText::
	text "Monedas:"
	line ""
	text_decimal wCoins, 2, 5
	text_end

SECTION "Text_RaiseThePPOfWhichMove", ROMX
Text_RaiseThePPOfWhichMove::
	text "¿A qué movimiento"
	line "le subo los PP?"
	done

SECTION "Text_RestoreThePPOfWhichMove", ROMX
Text_RestoreThePPOfWhichMove::
	text "¿A qué movimiento"
	line "le restauro PP?"
	done

SECTION "Text_PPIsMaxedOut", ROMX
Text_PPIsMaxedOut::
	text "El PP de"
	line ""
	text_ram wStringBuffer2
	cont "está al máximo."
	prompt

SECTION "Text_PPsIncreased", ROMX
Text_PPsIncreased::
	text "El PP de"
	line ""
	text_ram wStringBuffer2
	cont "aumentó."
	prompt

SECTION "Text_PPsMaximized", ROMX
Text_PPsMaximized::
	text "El PP de"
	line ""
	text_ram wStringBuffer2
	cont "está al máximo."
	prompt

SECTION "_PPRestoredText", ROMX
_PPRestoredText::
	text "Se restauró el PP."
	prompt

SECTION "_ItemLooksBitterText", ROMX
_ItemLooksBitterText::
	text "Parece amargo…"
	prompt

SECTION "_ItemCantUseOnEggText", ROMX
_ItemCantUseOnEggText::
	text "Eso no se puede"
	line "usar en un Huevo."
	prompt

SECTION "_ItemOakWarningText", ROMX
_ItemOakWarningText::
	text "Oak: ¡<PLAYER>!"
	line "¡No es momento"
	cont "de usar esto!"
	prompt

SECTION "_ItemWontHaveEffectText", ROMX
_ItemWontHaveEffectText::
	text "No tendrá ningún"
	line "efecto."
	prompt

SECTION "_BallBlockedText", ROMX
_BallBlockedText::
	text "El Entrenador"
	line "¡bloqueó la Ball!"
	prompt

SECTION "_BallDontBeAThiefText", ROMX
_BallDontBeAThiefText::
	text "¡No seas ladrón!"
	prompt

SECTION "_BallStorageFullText", ROMX
_BallStorageFullText::
	text "El sistema de"
	line "almacenamiento"
	cont "está lleno. No se"
	cont "puede usar ahora."
	prompt

SECTION "_BallDatabaseFullText", ROMX
_BallDatabaseFullText::
	text "La base de datos"
	line "del PC está"
	cont "saturada. Guarda"
	cont "la partida."
	prompt

SECTION "Text_MonIsHiddenFromBall", ROMX
Text_MonIsHiddenFromBall::
	text "El #mon no se"
	line "¡puede ver!"
	prompt

SECTION "Text_MonCantBeCaught", ROMX
Text_MonCantBeCaught::
	text "El #mon no se"
	line "¡puede atrapar!"
	prompt

SECTION "_ItemUsedText", ROMX
_ItemUsedText::
	text "<PLAYER> usó"
	line ""
	text_ram wStringBuffer2
	text "."
	done

SECTION "_KnowsMoveText", ROMX
_KnowsMoveText::
	text_ram wStringBuffer1
	text " sabe"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_MoveKnowsOneText", ROMX
_MoveKnowsOneText::
	text "Ese #mon solo"
	line "sabe 1 movimiento."
	done

SECTION "_AskDeleteMoveText", ROMX
_AskDeleteMoveText::
	text "¿Que olvide"
	line ""
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_DeleterForgotMoveText", ROMX
_DeleterForgotMoveText::
	text "¡Listo! Tu #mon"
	line "lo olvidó."
	done

SECTION "_DeleterEggText", ROMX
_DeleterEggText::
	text "¡Un Huevo no sabe"
	line "movimientos!"
	done

SECTION "_DeleterNoComeAgainText", ROMX
_DeleterNoComeAgainText::
	text "¿No? Vuelve a"
	line "visitarme."
	done

SECTION "_DeleterAskWhichMoveText", ROMX
_DeleterAskWhichMoveText::
	text "¿Qué movimiento"
	line "olvida, entonces?"
	prompt

SECTION "_DeleterIntroText", ROMX
_DeleterIntroText::
	text "Mmm… Ah, sí, soy"
	line "quien borra"
	cont "movimientos."

	para "Puedo hacer que"
	line "un #mon olvide"
	cont "movimientos."

	para "¿Hago que un"
	line "#mon olvide?"
	done

SECTION "_DeleterAskWhichMonText", ROMX
_DeleterAskWhichMonText::
	text "¿Qué #mon?"
	prompt

SECTION "Text_DSTIsThatOK", ROMX
Text_DSTIsThatOK::
	text " (verano),"
	line "¿Está bien?"
	done

SECTION "_TimeAskOkayText", ROMX
_TimeAskOkayText::
	text ","
	line "¿Está bien?"
	done

SECTION "_TimesetAskDSTText", ROMX
_TimesetAskDSTText::
	text "¿Quieres cambiar"
	line "al horario de"
	cont "verano?"
	done

SECTION "_TimesetDSTText", ROMX
_TimesetDSTText::
	text "Adelanté el reloj"
	line "una hora."
	prompt

SECTION "_TimesetAskNotDSTText", ROMX
_TimesetAskNotDSTText::
	text "¿Terminó el"
	line "horario de verano?"
	done

SECTION "_TimesetNotDSTText", ROMX
_TimesetNotDSTText::
	text "Atrasé el reloj"
	line "una hora."
	prompt

SECTION "_TimesetAskAdjustDSTText", ROMX
_TimesetAskAdjustDSTText::
	text "¿Quieres ajustar"
	line "tu reloj para el"

	para "horario de"
	line "verano?"
	done

SECTION "_MomLostGearBookletText", ROMX
_MomLostGearBookletText::
	text "Perdí el manual"
	line "de instrucciones"
	cont "del #gear."

	para "Vuelve dentro de"
	line "un tiempo."
	prompt

SECTION "WonderTradeQuestionText", ROMX
WonderTradeQuestionText::
	text "¿Quieres"
	line "intercambiar?"
	done

SECTION "WonderTradePromptText", ROMX
WonderTradePromptText::
	text "¿Qué #mon"
	line "quieres cambiar?"
	prompt

SECTION "WonderTradeCantTradeSpikyEaredPichuText", ROMX
WonderTradeCantTradeSpikyEaredPichuText::
	text "Este Pichu parece"
	line "haber viajado"
	cont "por el tiempo."

	para "Sería arriesgado"
	line "transferirlo,"

	para "así que es mejor"
	line "que Pichu se"
	cont "quede donde está."
	prompt

;SECTION "WonderTradeCantTradeEggText", ROMX
;WonderTradeCantTradeEggText::
;	text "Sorry. We can't"
;	line "accept an Egg."
;	prompt

;SECTION "WonderTradeCantAcceptAbnormalMonText", ROMX
;WonderTradeCantAcceptAbnormalMonText::
;	text "Sorry, but your"
;	line "#mon appears to"
;
;	para "be abnormal. We"
;	line "can't accept it."
;	prompt

SECTION "WonderTradeConfirmText", ROMX
WonderTradeConfirmText::
	text "¿Ofrecer"
	line ""
	text_ram wStringBuffer1
	text "?"
	done

SECTION "WonderTradeSetupText", ROMX
WonderTradeSetupText::
	text "Buscando"
	line "compañero…"
	prompt

SECTION "WonderTradeReadyText", ROMX
WonderTradeReadyText::
	text "Se encontró un"
	line "compañero."
	prompt

SECTION "SilphMartIntroText", ROMX
SilphMartIntroText::
	text "Los empleados"
	line "tenemos acceso a"
	cont "¡merchandising!"

	para "¿Quieres comprar?"
	done

SECTION "SilphMartComeAgainText", ROMX
SilphMartComeAgainText::
	text "¡Vuelve! Me"
	line "vendría bien"
	cont "un ingreso extra."
	done

SECTION "AdventurerMartIntroText", ROMX
AdventurerMartIntroText::
	text "¡Traje objetos"
	line "raros de fuera!"
	done

SECTION "AdventurerMartComeAgainText", ROMX
AdventurerMartComeAgainText::
	text "¡Vuelve pronto!"
	done

SECTION "InformalMartIntroText", ROMX
InformalMartIntroText::
	text "¿Necesitas"
	line "suministros?"
	done

SECTION "BazaarMartIntroText", ROMX
BazaarMartIntroText::
	text "¡Ven a ver"
	line "mis productos!"
	done

SECTION "AlreadyHaveTMText", ROMX
AlreadyHaveTMText::
	text "Ya tienes"
	line "esa MT."
	done

SECTION "MartPremierBallText", ROMX
MartPremierBallText::
	text "También te llevas"
	line "una Honor Ball"
	text_sound SFX_TRANSACTION
	cont "de regalo."
	done

SECTION "ItemCantBeSelectedText", ROMX
ItemCantBeSelectedText::
	text "Ese objeto no se"
	line "puede elegir."
	prompt

SECTION "AlreadyInThatBallTextData", ROMX
AlreadyInThatBallTextData::
	text "Tu #mon ya está"
	line "en esa Ball."
	prompt

SECTION "CantChangeTradedMonBallTextData", ROMX
CantChangeTradedMonBallTextData::
	text "No puedes cambiar"
	line "la Ball de un"
	cont "#mon cambiado."
	prompt
